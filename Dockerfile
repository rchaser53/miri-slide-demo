FROM ubuntu:18.04

ENV PATH /root/.cargo/bin:$PATH

WORKDIR /home/app

RUN apt-get update && \
    apt-get install curl -y && \
    apt install gcc-multilib -y && \
    rm -rf /var/cache/apt/* && \
    RUST_TOOLCHAIN=nightly && \
    curl https://build.travis-ci.org/files/rustup-init.sh -sSf | sh -s -- -y --default-toolchain "$RUST_TOOLCHAIN" && \
    export PATH=$HOME/.cargo/bin:$PATH && \
    cargo install xargo --force && \
    cargo +nightly install --force --git https://github.com/rust-lang/miri miri