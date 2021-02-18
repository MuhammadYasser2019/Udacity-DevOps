[![CircleCI](https://circleci.com/gh/MuhammadYasser2019/DevOps_Microservices.svg?style=svg)](https://app.circleci.com/pipelines/github/MuhammadYasser2019/DevOps_Microservices)

## Project Overview

In this project, I applied the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:

* Working with AWS
* Using CircleCI to implement Continuous Integration and Continuous Deployment
* Building CircleCI pipelines
* Building Docker containers in the pipelines
* Working with eksctl and kubectl to build and deploy Kubernetes clusters
As a capstone project, the directions are rather more open-ended than they were in the previous projects in the program. I developed a CI/CD pipeline for micro services applications with rolling deployment.

---
## Pre-Requisites

* CicleCI Account to run pipelines.
* AWS Account


## Setup the Environment

* After Initializing the CircleCI CircleCI account, all needed ENV should be but manually in CircleCI ENV like:
    * AWS Credentials.
    * Database Credentials for the App.
    * Dockerhub Credentials.
    * App ENV.

## Use CirleCI to build a Declarative Pipeline
* Stages:
    * Build
    * Lint
    * Migrate
    * Deploy K8S Cluster "If it doesn't exist"
    * Application Deployment



### Importnant Files
1. Screenshoot Dir.
2. Deployment.yml "For K8S Deployment"
3. Dockerfile "For Building Docker Image"