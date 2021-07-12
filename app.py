#import transformers
from transformers import pipeline

import pickle
with open('./model.pkl', 'rb') as model_pkl:
    model = pickle.load(model_pkl)

        
# Import Flask for creating API
from flask import Flask, request,jsonify

# Initialise a Flask object
app = Flask(__name__)

# Create an API endpoint for predicting
@app.route('/predict')

def predict():
# return the result back
    return  "predict"
    
@app.route('/prediction', methods=['POST'])
def prediction():
    data = request.get_json(force=True)
    s1=data['s']
    result = model(s1)[0]
    final = {"Label:": result['label'],
                 "Confidence Score:":result['score']
           }
    return jsonify(final)

if __name__ == '__main__':
     app.run(host='0.0.0.0', port=5000)
     
