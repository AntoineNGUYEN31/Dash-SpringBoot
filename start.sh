#start the back end
java -jar dash-springboot-demo-0.0.1-SNAPSHOT.jar > back.log &
#start the front end
python app.py > front.log &
