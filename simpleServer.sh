#!/bin/bash
useradd minecraft
usermod -s /bin/bash minecraft
mkdir /home/minecraft
chown -R minecraft:minecraft /home/minecraft
su minecraft
echo "installing lastest java"
dnf install java-latest-openjdk
sleep 1
echo "installing screen"
dnf install screen 
sleep1
mkdir minecraft
cd minecraft
echo "downloading minecraft server.jar"
wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
sleep 1
mv server.jar minecraft-server-1.18.2.jar
echo "initializing server for the first time"
java -jar minecraft-server-1.18.2.jar
sleep 1
echo "accepting eula"
sed -i 's/eula=false/eula=true/g' eula.txt
screen
./start.sh
