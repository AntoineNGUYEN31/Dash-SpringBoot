#start the back end
java -jar dash-springboot-demo-0.0.1-SNAPSHOT.jar > back.log &
sleep 20
#start the front end
python3 app.py
