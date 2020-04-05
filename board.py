#!/usr/bin/python3

from flask import Flask, request, jsonify
from flask_restful import Resource, Api
from sqlalchemy import create_engine
from json import dumps

db_connect = create_engine('sqlite:///colour.db')
app        = Flask(__name__)
api        = Api(app)

class Background(Resource):
    def get(self):
        conn  = db_connect.connect()
        query = conn.execute("select background from colour")
        return { 'background': [i[0] for i in query.cursor.fetchall()]}

    def post(self):
        conn       = db_connect.connect()
        print(request.json)
        background = request.json['background']
        query      = conn.execute("insert into colour values('{0}')".format(background))
        return { 'status': 'success'}

api.add_resource(Background, '/background')

if __name__ == "__main__":
    app.run()

