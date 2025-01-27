FROM confluentinc/cp-kafka-connect-base:5.3.0

RUN curl -O -L "https://downloads.datastax.com/kafka/kafka-connect-cassandra-sink.tar.gz" \
    && mkdir datastax-connector \
    && tar xzf kafka-connect-cassandra-sink.tar.gz -C datastax-connector --strip-components=1 \
    && mv datastax-connector/kafka-connect* datastax-connector/kafka-connect-cassandra.jar

ENV CONNECT_PLUGIN_PATH="/usr/share/java,/datastax-connector/kafka-connect-cassandra.jar"

WORKDIR /usr/app

# Execute sink connector
COPY connect/ .
USER root
RUN chmod +x *.sh

CMD [ "/bin/bash", "-c", "echo \"Launching Kafka Connect worker\" & \
        /etc/confluent/docker/run & /usr/app/start-and-wait.sh"]