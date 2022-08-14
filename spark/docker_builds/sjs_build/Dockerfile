# base image
FROM openjdk:8-jdk-alpine

# define spark and hadoop versions
ENV SPARK_HOME=/opt/spark
ENV SPARK_VERSION=2.4.4
ENV HADOOP_VERSION=2.7.0
ENV SPARK_JOBSERVER_MEMORY=1G \
    LOGGING_OPTS="-Dlog4j.configuration=file:/opt/sparkjobserver/config/log4j.properties" \
    # JobManager settings
    MANAGER_JAR_FILE=/opt/sparkjobserver/bin/spark-job-server.jar \
    MANAGER_CONF_FILE=/opt/sparkjobserver/config/jobserver.conf
ARG SBT_VERSION=1.2.8
ARG SCALA_VERSION=2.11.12

WORKDIR /opt


# Install dependencies
RUN apk add --no-cache bash curl git


# download and install hadoop
RUN mkdir -p /opt && \
    cd /opt && \
    curl http://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | \
        tar -zx hadoop-${HADOOP_VERSION}/lib/native && \
    ln -s hadoop-${HADOOP_VERSION} hadoop && \
    echo Hadoop ${HADOOP_VERSION} native libraries installed in /opt/hadoop/lib/native

# download and install spark
RUN mkdir -p /opt && \
    cd /opt && \
    curl http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz | \
        tar -zx && \
    ln -s spark-${SPARK_VERSION}-bin-hadoop2.7 spark && \
    echo Spark ${SPARK_VERSION} installed in /opt


# Download sbt
RUN curl -sL "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | gunzip | tar -x -C /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt && \
    chmod 0755 /usr/local/bin/sbt

RUN git clone https://github.com/spark-jobserver/spark-jobserver.git && cd spark-jobserver &&\
    SPARK_VERSION=2.4.4 sbt job-server-extras/assembly && mkdir -p /opt/sparkjobserver/bin/ && \
    cp /opt/spark-jobserver/job-server-extras/target/scala-2.*/spark-job-server.jar  /opt/sparkjobserver/bin/spark-job-server.jar

RUN git clone https://kenodumah:xxx@bitbucket.org/eurekaanalytics/ai_feature_engine.git
    git clone https://kenodumah:xxx@bitbucket.org/eurekaanalytics/ai_data_profiler.git



# add scripts and update spark default configcurl 
ADD common.sh spark-master.sh spark-worker.sh /
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf
ENV PATH $PATH:/opt/spark/bin