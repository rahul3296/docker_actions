FROM alpine:latest
RUN echo $GIT_R_VERSION > /tmp/test.txt
