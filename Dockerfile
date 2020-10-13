FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y gnupg2 && apt-get install -y python-pip python-dev



RUN pip install Flask

#USER coder
WORKDIR /home/coder



COPY . ./src

RUN export FLASK_APP=src/app.py

EXPOSE 80
EXPOSE 5000

ENTRYPOINT ["./interview/ops/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
