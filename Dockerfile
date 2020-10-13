FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y gnupg2



#USER coder
WORKDIR /home/coder



COPY . ./interview

EXPOSE 80

ENTRYPOINT ["./interview/ops/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
