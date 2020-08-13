# smads18's docker hand-in

mail: smads18@student.sdu.dk
github: 

## Exercise 1 - The multi-color TOIlet

The configured Dockerfile can be found in this repository.

Link to my toilet image:
https://hub.docker.com/repository/docker/simonmdsn/toilet

Describe what you could do in order to:

* Minimize the layers in the image

Reduce the number of uses of the keywords ADD, COPY and RUN. These keywords create layers.

* Minimize the overall image size. You are allowed to change everything, as long as the following command `docker run <yourusername>/toilet hello world` successfully displays a colorful variation of `hello world`

One option could be to use another distribution of Linux. Alpine Linux comes to mind as its size is about 5 MB.

Another option could be to strip your OS image of all functionality except the abilites to download the toilet package and execute it. 

A third option, but not suitable for our use case, is do to multiple stage builds.

## Exercise 2 - Wordpress with proxy

The docker-compose.yml is found in this repository.

* Describe what kind of commands you would use to delete the containers and create new ones.

You should use `docker-compose down` in order to stop and remove the composed services. (this does not remove volumes, append `-v` if you wanna remove declared volumes)

You COULD also use `docker-compose rm` if you wanna remove stopped service containers. If you wanna remove services that are running append a `-s` in the end of the commmand to stop the containers before removing. 

For creating new ones you can use `docker-compose up`. This builds, (re)creates, starts, and attaches to containers for a service. This will only work it is not currently running, so make sure your services are offline, i.e. with `docker-compose down`.

* Describe where you would define what exact version of mysql docker should use?

In the db service after mysql, like this `image: mysql:<VERSION>`, where you swap `<VERSION>` with something from the offical mysql docker hub, i.e. `LATEST`, `8`, `5.7.31` etc.

* What commands will give you the ip addresses of the containers in the described network.

`docker network inspect <network-id>` will display all information about your containers including your ip addresses of containers in that network.

Could use `docker network inspect <network-id> | grep IPv4` to only display the addresses.

## Exercise 3 - Finding base images on Docker Hub

The chain of images that nextcloud with tag 19 depends on are:

1. `nextcloud:19` is based on `php:7.4-apache-buster` - https://github.com/nextcloud/docker/blob/1e6d0620af955df9430046570ed23817f381dba5/19.0/apache/Dockerfile

2. `php:7.4-apache-buster` is based on `debian:buster-slim` - https://github.com/docker-library/php/blob/master/7.4/buster/apache/Dockerfile

3. `debian:buster-slim` is based on `scratch` which is the base image of Docker images.
