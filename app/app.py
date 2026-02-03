from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return f"Hello from DevOps Portfolio! Host: {os.uname().nodename if hasattr(os, 'uname') else 'Windows'}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
