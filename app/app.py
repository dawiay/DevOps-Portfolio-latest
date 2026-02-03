from flask import Flask
import os
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/')
def hello():
    return f"Hello from DevOps Portfolio! Host: {os.uname().nodename if hasattr(os, 'uname') else 'Windows'}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
