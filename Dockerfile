FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y fuse imagemagick wget sed file desktop-file-utils binutils libglib2.0-dev
