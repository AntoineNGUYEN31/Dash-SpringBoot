cd BACK
mvn -DskipTests=true clean install
cd ..
java -jar BACK/target/dash-springboot-demo-0.0.1-SNAPSHOT.jar
curl http://localhost:8080/database/
curl --header "Content-Type: application/json" --request POST --data '{"userLogin":"mylogin","userData":"myJson"}' http://localhost:8080/database/
docker build -t my-dash .
docker run -p 80:8050 -p 8080:8080 my-dash

