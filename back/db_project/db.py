import sqlite3
from flask import g, current_app
from flask.cli import with_appcontext
import click

DATABASE = "./database.db"


def get_db():
    db = getattr(g, "_database", None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    db.row_factory = sqlite3.Row
    return db


def init_db():
    with current_app.app_context():
        db = get_db()
        with current_app.open_resource("./schema.sql", mode="r") as f:
            db.cursor().executescript(f.read())
        db.commit()


def close_connection(exception):
    db = getattr(g, "_database", None)
    if db is not None:
        db.close()


@click.command("init-db")
@with_appcontext
def init_db_command():
    """Create new tables."""
    init_db()
    click.echo("Initialized the database.")

def init_app(app):
    app.teardown_appcontext(close_connection)
    app.cli.add_command(init_db_command)
