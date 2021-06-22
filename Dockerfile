FROM lfedge/eve-alpine:6.6.0 AS build
ENV BUILD_PKGS go git
RUN eve-alpine-deploy.sh

ENV CGO_ENABLED=0
ENV GO111MODULE=on

RUN mkdir -p /src
WORKDIR /src
COPY pkg .

ARG GOOS=linux

RUN go build -ldflags "-s -w" -o /out/local_manager main.go

FROM scratch

COPY --from=build /out/local_manager /root/

EXPOSE 22
CMD ["/root/local_manager"]
