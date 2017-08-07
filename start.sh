#!/bin/bash
cd /opt/minecraft/home && java -Xms$MC_MEMORY_INIT -Xmx$MC_MEMORY_MAX -XX:MaxPermSize=128M -XX:+UseConcMarkSweepGC -jar /opt/minecraft/bin/spigot.jar
