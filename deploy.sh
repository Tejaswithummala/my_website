#!/bin/bash

echo "Starting Deployment..."

echo "Pulling latest code from GitHub"
git pull origin main

echo "Building Docker Image"
docker build -t mywebsite .

echo "Stopping old container"
docker stop mywebsite

echo "Removing old container"
docker rm mywebsite

echo "Running new container"
docker run -d -p 8080:80 --name mywebsite mywebsite

echo "Deployment Completed"
