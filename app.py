# app.py
# A simple Flask web application for the DevSecOps Fortress project.
# This app will serve as the payload for our secure CI/CD pipeline.

from flask import Flask

# Initialize the Flask application
app = Flask(__name__)

@app.route('/')
def hello_world():
    """
    Main route for the application.
    Returns a simple greeting message.
    """
    return '<h1>DevSecOps Fortress: The Sentinel is Online.</h1><p>This application was deployed through a secure, automated pipeline.</p>'

if __name__ == '__main__':
    # Run the app on all available network interfaces
    # Port 5000 is used by default.
    app.run(host='0.0.0.0', port=5000)