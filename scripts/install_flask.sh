#!/bin/bash
apt update && apt install -y python3-pip
pip3 install flask
pip3 install azure-storage-blob

cat <<EOF > /home/azureuser/app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Flask running on Azure VM!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
EOF

nohup python3 /home/azureuser/app.py > /home/azureuser/flask.log 2>&1 &
