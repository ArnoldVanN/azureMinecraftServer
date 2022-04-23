#!/bin/bash
echo "installing lastest java"
dnf install java-latest-openjdk
echo "installing screen"
dnf install screen 

mkdir minecraft

cd minecraft
echo "downloading minecraft server.jar"
wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar

mv server.jar minecraft-server-1.18.2.jar
echo "initializing server for the first time"
java -jar minecraft-server-1.18.2.jar
