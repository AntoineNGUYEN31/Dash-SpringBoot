#FROM python:3.7-alpine
FROM alpine:3.11
LABEL maintainer="nguyen.ensma@gmail.com"
RUN apk add openjdk8-jre
RUN apk add python3
RUN pip3 install Flask &&\
    pip3 install Dash &&\
    pip3 install requests
#COPY src des
#ADD src des/
#EXPOSE 80
#ENV PATH /opt/anaconda3/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR /app
ADD FRONT/app.py /app
ADD FRONT/core.py /app
ADD BACK/target/dash-springboot-demo-0.0.1-SNAPSHOT.jar /app
ADD start.sh /app
#Dash port (front)
EXPOSE 8050
#Sringboot port (back)
EXPOSE 8080
CMD ["sh","start.sh"]
