FROM ubuntu:18.04
MAINTAINER t0921328@u.nus.edu
EXPOSE 8080
EXPOSE 3306
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Singapore

RUN apt-get update
RUN apt-get install -y nodejs npm
ENV USER root
RUN npm install -g express-generator
RUN npm install express --save
RUN npm install --save mysql body-parser cors dotenv
RUN useradd -ms /bin/bash user
#COPY app.js /home/user/app.js
COPY main.js /home/user/main.js
COPY database.js /home/user/database.js
COPY aggregator.js /home/user/aggregator.js
COPY start.sh /home/user/start.sh
RUN chmod a+x /home/user/start.sh
USER user
WORKDIR /home/user

CMD ["sh","/home/user/start.sh"]
