#!/bin/bash

# Exit immediately if a command exits with a non-zero status
#set -e

# Run the docker-compose file in the current directory
echo "Running docker-compose for inji web and oidc client in the current directory..."

docker-compose up --build -d

# Run the docker-compose file in sunbirds /docs/docker-compose/
echo "Running docker-compose in esignet and subbirds RC/injicertify version 0.8.x  directory..."
cd inji-certify/
sudo chmod +x install.sh
sudo ./install.sh

echo "Both docker-compose files have been executed."

#cd ..
# Navigate to the project directory
cd ./mimoto/mimoto

# Install maven
#sudo apt install maven -y

sudo mvn -version

# Build the project using Maven
echo "Building the project with Maven..."

sudo mvn clean install  -Dgpg.skip

# Check if the build was successful
if [ $? -ne 0 ]; then
  echo "Maven build failed!"
  exit 1
fi
cd ..
# Run the application with PM2 and set the environment variable
echo "Running the application with PM2..."

pm2 start mimoto.sh --interpreter bash --name mimoto

# Check if the application started successfully
if [ $? -ne 0 ]; then
  echo "Failed to start the application with PM2!"
  exit 1
fi

echo "Application is running with PM2."

cd ..
# Navigate to the Node.js project directory

#cd ./mimoto/inji-web/inji-web

# Install the dependencies using npm
#echo "Installing dependencies with npm..."
#sudo npm install

# Check if npm install was successful
#if [ $? -ne 0 ]; then
#  echo "npm install failed!"
#  exit 1
#fi

# Start the application with PM2
#echo "Starting the application with PM2..."

#pm2 start npm --name "inji-web" -- start
# Check if the application started successfully
#if [ $? -ne 0 ]; then
 # echo "Failed to start the application with PM2!"
 # exit 1
#fi
# inji-verify

#cd ../../..

cd ./inji-verify/inji-verify

# Install the dependencies using npm
echo "Installing dependencies with npm..."
sudo npm install

# Check if npm install was successful
if [ $? -ne 0 ]; then
  echo "npm install failed!"
  exit 1
fi

# Start the application with PM2
echo "Starting the application with PM2..."
pm2 start npm --name "injiverify" -- start

# Check if the application started successfully
if [ $? -ne 0 ]; then
  echo "Failed to start the application with PM2!"
  exit 1
fi

echo "Node.js application is running with PM2."
