from flask import Flask, request, jsonify
import os

app = Flask(__name__)
FLAG_FILE = os.environ.get("FLAG_FILE", "/host_flags/flag.txt")
SECRET = os.environ.get("SECRET_TOKEN", "changeme")

@app.route("/get-flag", methods=["POST"])
def get_flag():
    data = request.get_json(silent=True) or {}
    token = data.get("token")
    if token != SECRET:
        return jsonify({"error":"invalid token"}), 403
    try:
        with open(FLAG_FILE, "r") as f:
            flag = f.read().strip()
        return jsonify({"flag": flag})
    except Exception:
        return jsonify({"error":"cannot read flag"}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
