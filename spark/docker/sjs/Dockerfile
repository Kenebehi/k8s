#
# Stage 1 : Build
#
FROM openjdk:8-jdk-alpine AS build

# Dependency/environment versions
ARG SBT_VERSION=1.2.8
ARG SCALA_VERSION=2.11.12
ARG SPARK_VERSION=2.4.0
ARG HADOOP_VERSION=2.7

# Install dependencies
RUN apk add --no-cache bash curl

# Download sbt
RUN curl -sL "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | gunzip | tar -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
    chmod 0755 /usr/local/bin/sbt

RUN mkdir -p /tmp/spark && \
    mkdir -p /tmp/sparkjobserver

# Install spark
RUN curl -L -o /tmp/spark.tgz http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xvzf /tmp/spark.tgz -C /tmp/spark --strip-components 1

# # Build jobserver
# COPY . /tmp/sparkjobserver
# WORKDIR /tmp/sparkjobserver
# RUN echo "Building job server..." && SPARK_VERSION=2.4.0 sbt job-server-extras/assembly