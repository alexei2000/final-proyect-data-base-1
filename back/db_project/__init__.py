import os

from flask import Flask, json, request


def create_app():
    app = Flask(__name__)

    from . import db

    @app.route("/medicamentos", methods=["GET"])
    def hello():
        c = db.get_db().cursor()
        data = c.execute("select * from medicamento").fetchall()
        return json.jsonify(items=data)

    db.init_app(app)

    return app
