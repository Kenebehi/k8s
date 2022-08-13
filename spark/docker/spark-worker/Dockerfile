FROM docker.eureka.ai/spark:2.4.0-hadoop2.7-python3.7.11-barespark

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 9080
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 9080

CMD ["/bin/bash", "/worker.sh"]