#!/bin/bash

curl http://localhost:5001/

curl -H "Content-Type: application/json" \
     -X POST \
     -d '{"teamA": "Golden State Warriors", "teamB": "Boston Celtics", "season": "2014-15"}' \
     http://localhost:5001/predict_win_rate

