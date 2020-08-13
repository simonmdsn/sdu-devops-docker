FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y \
    toilet 

ENTRYPOINT [ "toilet", "-F", "border", "--gay" ]

CMD [ "hello", "world" ]