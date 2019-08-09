import os
from flask import Flask, redirect, url_for, flash, make_response
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import login_required, LoginManager, current_user, AnonymousUserMixin
from flask_mail import Mail
from flask_admin import Admin, AdminIndexView, expose
from flask_admin.contrib.sqla import ModelView


app = Flask(__name__)
app.config['SECRET_KEY'] = '5791628bb0b13ce0c676dfde280ba245'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db'
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)
login_manager.login_view = 'login'
login_manager.login_message_category = 'info'
app.config['MAIL_SERVER'] = 'smtp.googlemail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = os.environ.get('EMAIL_USER')
app.config['MAIL_PASSWORD'] = os.environ.get('EMAIL_PASS')
mail = Mail(app)


from flaskblog.models import User, Post


class MyModelView(ModelView):

    def is_accessible(self):
        return current_user.is_authenticated


class MyAdminIndexView(AdminIndexView):

    @expose('/')
    def index(self):
        if current_user.is_authenticated and current_user.role == 'ADMIN':
            flash('You are logged in as admin', 'success')
            return super(MyAdminIndexView, self).index()
        elif current_user.is_authenticated:
            flash('You do not have access to view admin panel', 'warning')
            return redirect('/post')
        else:
            flash('Please login','warning')
            return redirect('/home')


admin = Admin(app, index_view=MyAdminIndexView())

admin.add_view(ModelView(User, db.session))
admin.add_view(ModelView(Post, db.session))


from flaskblog import routes
