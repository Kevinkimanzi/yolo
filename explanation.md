# Choice of image selection
 I used Alpine since it is a lightweight base image. It's known for its small footprint and security features. Many official images have Alpine Linux variants.

# Dockerfile directives used
FROM: To define base image used

WORKDIR: Show working directory

COPY: copy file from a certain folder to desired folder

RUN: Run command issued

EXPOSE: To expose port

CMD: specify the default command and/or parameters that should be executed when a container based on that image is run.

# Docker-compose Networking
Docker networking is a fundamental aspect of containerization, enabling containers to interact with each other and the external world.

The Port was mapped to allow the application to be viewed outside the container

Custom bridge networks were implemented connecting the containers.

# Docker-compose volume definition and usage
Docker volumes are a way to persistently store and manage data in Docker containers.

They provide a mechanism for sharing data between containers and between the host machine and containers.

Docker-compose volume defines the volume for the application

# Git workflow 
forking: The project was forked and a copy was made.

cloning: I cloned the forked repo to create a copy of a remote Git repository on my local machine.

commits: Have included all the commits while adding and modifying the docker files and docker-compose file

pushing: I pushed my local branch and its associated commits to a remote repository

# running the applications
docker-compose up was used to start the services




# Image tagging
I tagged my built image from yolo_client:latest to yolo_client:v1.0.0.1   and yolo_backend:latest to yolo_backend:v1.0.0.2

a command used is:  docker tag oldimage:oldversion newimage:newversion


# Deploying image on DockerHub
First I logged in to my docker hub using the docker login command

I tagged my images with my Docker Hub username and the desired repository name

Push the Docker Image
link: kevinkimanzi4/backend   and kevinkimanzi4/client

# IP3 

# Vagrant and Ansible Project

A brief introduction to your Vagrant and Ansible project. Describe the purpose of the project and what it does.

## Table of Contents

- [Prerequisites](#prerequisites)
- [set up Vagrant](#getting-started)
  - [Configuration](#configuration)
  - [Usage](#usage)
- [start the Vagrant environment](#project-structure)
- [initiate the play](#contributing)

## Prerequisites
Install Prerequisites:
I Ensured I have the necessary tools installed on my host machine:

Vagrant

VirtualBox 

Ansible

## Set Up Vagrant:
I Created a Vagrantfile that defines the VM needed for my microservices.

### Configuration

Explain the configuration options and files used in your project. Include details about environment variables, configuration files, or Ansible variables.


# Command to start the Vagrant environment
Run vagrant up to create and provision your VMs.

# Command to initiate the play
vagrant provision

