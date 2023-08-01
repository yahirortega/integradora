from flask import Blueprint, render_template

home_views = Blueprint('home',__name__)

@home_views.route('/')
def index():
    return render_template('home/index.html')

@home_views.route('/loan/')
def loan():
    return render_template('home/loan.html')

@home_views.route('/about/')
def about():
    return render_template('home/about.html')