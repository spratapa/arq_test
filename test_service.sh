#!/bin/bash
curl -i -H "Content-Type: application/json" POST http://0.0.0.0:5000/prediction -d @pos.json
curl -i -H "Content-Type: application/json" POST http://0.0.0.0:5000/prediction -d @neg.json