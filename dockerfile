FROM ubuntu:20.04
WORKDIR /app
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    netcat \
    fortune-mod \
    cowsay \
    && rm -rf /var/lib/apt/lists/*
COPY . /app
EXPOSE 4499
ENV NAME=Wisecow
CMD ["bash", "wisecow.sh"]

