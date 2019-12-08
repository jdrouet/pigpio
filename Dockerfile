FROM debian:buster-slim

RUN apt-get update \
  && apt-get install -y make gcc \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir
COPY . /workdir
RUN make install

ENTRYPOINT ["/usr/local/bin/pigpiod"]
CMD ["-g"]
