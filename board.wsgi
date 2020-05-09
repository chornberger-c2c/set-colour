#!/usr/bin/python3

from flask import Flask, request, jsonify, render_template
from flask_restful import Resource, Api
from sqlalchemy import create_engine
from json import dumps
from uptime import uptime
from uptime import boottime

db_connect  = create_engine('sqlite:///var/www/html/python/colour.db')
application = Flask(__name__)
api         = Api(application)

class Background(Resource):
    def get(self):
        conn  = db_connect.connect()
        query = conn.execute("select background from colour")
        return { 'background': [i[0] for i in query.cursor.fetchall()]}

    def post(self):
        conn       = db_connect.connect()
        print(request.json)
        background = request.json['background']
        query      = conn.execute("insert into colour (background) values('{0}')".format(background))
        return { 'status': 'success'}

class Uptime(Resource):
    def get(self):
        boot=uptime.boottime()
        #print uptime()
        print(boot)

api.add_resource(Background, '/background')
api.add_resource(Uptime, '/uptime')

@application.route('/')
def index():
    conn  = db_connect.connect()
    query = conn.execute("SELECT * FROM colour ORDER BY id DESC LIMIT 1")
    bgc   = query.cursor.fetchall()
    for colour in bgc:
        c = colour[1]
        print(c)
    return render_template('index.html', background=c)

if __name__ == "__main__":
    application.run()

