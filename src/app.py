from flask import Flask, request

#========= Mocks
class DB():
    def __init__(self):
        self.users = []

    def save(self, username, password):
        self.users.append(username)
        return True

# ======== Main
db = DB()
app = Flask(__name__)

# ===== Web App
@app.route('/')
def index():
    return 'login here'

@app.route('/authenticated')
def authenticated():
    return 'authenticated'

# ===== API

@app.route('/login', methods=['GET'])
def login():
    username = request.args.get('username')
    password = request.args.get('password')
    db.save(username, password)
    return username + " registered"
