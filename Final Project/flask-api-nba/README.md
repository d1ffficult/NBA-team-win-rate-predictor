To run this API, change your directory to the docker folder and run:

`docker compose up -d`

If it has created the localhost server correctly you will not get your prompt back. You will need to open a new terminal (be in the same directory) and run the following curl command to get a response

`curl http://localhost:5001/`

Use the following to test locally

'curl -H "Content-Type: application/json" \
     -X POST \
     -d '{"teamA": "Golden State Warriors", "teamB": "Boston Celtics", "season": "2014-15"}' \
     http://localhost:5001/predict_win_rate'

You can change the name of NBA teams to see the prediction change.  Both of the curl commands can be found in the file `curl_test.sh`. As usual, check to see if you have any docker containers running using `docker container ls` and stop them through `docker compose down -v`

Then create a Docker hub repo, change the tag of the image to match the repository name and push the new image to docker hub repository and then deploy it in Google Cloud Run.

Use 

'curl https://flask-app-nba-895074510468.us-central1.run.app'

to test if deployed successfully

Now send the JSON test data through the test curl command to the endpoint.

curl -H "Content-Type: application/json" \
     -X POST \
     -d '{"teamA": "Golden State Warriors", "teamB": "Boston Celtics", "season": "2014-15"}' \
     https://flask-app-nba-895074510468.us-central1.run.app/predict_win_rate
