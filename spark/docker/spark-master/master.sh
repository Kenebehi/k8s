#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

export SPARK_MASTER_PORT=7077
export SPARK_MASTER_WEBUI_PORT=9999
export SPARK_MASTER_LOG=/spark/logs

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

cd /spark/bin && /spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out