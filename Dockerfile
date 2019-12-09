FROM alpine:latest

RUN apk add --no-cache wget

RUN apk add --no-cache \
    musl \
    musl-utils \
    musl-dev \
    gcc

RUN apk add --no-cache \
    mosquitto \
    mosquitto-dev \
    mosquitto-libs \
    mosquitto-clients

WORKDIR /home/andrei/

RUN wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-musl/rustup-init -O rustup-init && \
    chmod +x rustup-init

RUN ln -s /lib/ld-musl-x86_64.so.1 /lib/ld64.so.1

RUN ./rustup-init -y

CMD ["/bin/ash", "--login"]