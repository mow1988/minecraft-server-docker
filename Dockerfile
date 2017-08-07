##########################
# Docker Minecraft Server
# Based on Spigot
# sebseib, 06.08.2017
##########################

FROM ubuntu:16.04

RUN mkdir /opt/minecraft
WORKDIR /opt/minecraft
RUN mkdir build && mkdir home

RUN apt-get update
RUN apt-get install -y openjdk-8-jre wget git net-tools

RUN cd build && wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN cd build && java -jar BuildTools.jar --rev 1.12.1

RUN ln -s build/spigot*jar build/spigot.jar
RUN echo "eula=true" > /opt/minecraft/home/eula.txt

ENV MC_HEAP=512MM
ENV MC_MEMORY=1024M

COPY ./start.sh start.sh
RUN chmod 775 start.sh
CMD /opt/minecraft/start.sh
