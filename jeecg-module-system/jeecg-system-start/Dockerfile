FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER chenchao@163.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#RUN mkdir -p /jeecg-boot/config/jeecg/

WORKDIR /app/jeecg-boot

EXPOSE 9090

#ADD ./src/main/resources/jeecg ./config/jeecg
ADD ../../jars/jeecg-system-start-3.5.5.jar ./

CMD sleep 60;java -Djava.security.egd=file:/dev/./urandom -jar -Xms256m -Xmx256m -Duser.timezone=GMT+08 jeecg-system-start-3.5.5.jar