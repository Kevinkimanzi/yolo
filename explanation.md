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

The project uses vagrant virtual machine with the latest ubuntu server to deploy microservices application.

## Prerequisites
Install Prerequisites:
I Ensured I have the necessary tools installed on my host machine:

Vagrant

VirtualBox 

Ansible


## Set Up Vagrant:
I Created a Vagrantfile that defines the VM needed for my microservices.

playbook.yml - YAML that defines a series of tasks and order in which they should be executed.

roles - roles are a way to organize and structure your automation code and tasks in a reusable and modular manner. Roles help break down your automation into smaller, more manageable components, making it easier to develop, maintain, and share your Ansible playbooks

hosts- It is the inventory.. it contain list of servers.

# Command to initiate roles
 To initiate an Ansible role, you can use the ansible-galaxy command, which is the standard tool for managing Ansible roles and collections
 command:
 ansible-galaxy init role_name


# Command to start the Vagrant environment
Run vagrant up to create and provision your VMs.

# Command to initiate the play
vagrant provision


# IP 4 Orchestration
Kubernetes is an open-source system for automating deployment, scaling and management of containerized application.

For our database we will use StatefulSet .A stateful app is a program that saves client data from the activities of one session for use in the next session.All databases, such as MySQL, Oracle, and PostgreSQL, are examples of stateful applications therefore our database (Mongo) will use a stateful set and I will attach persistent volume claim and persistent volume because I need a storage that doesn't depend on the pod lifecycle.

For our backend and client we will use deployment to orchestrate our application.stateless applications don’t “store” data


Once you have a pod running, you can create a deployment to manage the life cycle of the pod. A deployment ensures that the desired number of replicas of the pod are running at all times and provides features like rolling updates and rollbacks