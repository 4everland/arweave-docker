FROM erlang:alpine AS builder
LABEL stage=arweave-builder

RUN apk update --no-cache
RUN apk add --no-cache build-base linux-headers cmake
RUN apk add --no-cache bash gmp-dev openssl-dev
RUN apk add --no-cache clang llvm12 llvm12-dev
RUN apk add --no-cache git

#use clang compile
#ENV CC=clang CXX=clang++ AR=llvm-ar

WORKDIR /build
RUN git clone --recursive https://github.com/ArweaveTeam/arweave
WORKDIR /build/arweave
RUN git checkout feature/testnet
RUN ./rebar3 as testnet tar

RUN mkdir /app && tar -xzvf _build/testnet/rel/arweave/arweave-*.tar.gz -C /app
RUN echo "MlV6DeOtRmakDOf6vgOBlif795tcWimgyPsYYNQ8q1Y,10000000" > /app/data/genesis_wallets.csv


FROM erlang:alpine

RUN apk update --no-cache
RUN apk add --no-cache coreutils bash gmp-dev curl
WORKDIR /app
COPY --from=builder /app /app
ADD ./start.sh ./start.sh

CMD ["./start.sh"]