FROM docker.eureka.ai/spark:2.4.0-hadoop2.7-python3.7.11-barespark

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 9999
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 9999 7077 6066

CMD ["/bin/bash", "/master.sh"]