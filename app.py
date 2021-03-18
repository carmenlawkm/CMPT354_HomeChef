from flask import Flask, redirect, render_template

app = Flask(__name__)


@app.route('/')
def home_load():
    return render_template("home_page.html")

@app.route('/login')
def login_load():
    return render_template("login.html")

@app.route('/register')
def register_load():
    return render_template("register.html")

@app.route('/profile')
def profile_load():
    return render_template("profile.html")


if __name__ == '__main__':
    app.run(debug=True)