FROM nano/docker-base

MAINTAINER nanosec
ENV ZK_VER="zookeeper-3.4.7"

RUN wget -q -O /tmp/${ZK_VER}.tar.gz http://mirror.vorboss.net/apache/zookeeper/${ZK_VER}/${ZK_VER}.tar.gz
RUN tar xzf /tmp/${ZK_VER}.tar.gz -C /opt

#RUN mv /opt/${ZK_VER}/conf/zoo_sample.cfg /opt/${ZK_VER}/conf/zoo.cfg

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV ZK_HOME /opt/${ZK_VER}
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir -p $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh 
EXPOSE 2181 2888 3888

WORKDIR /opt/${ZK_VER}
VOLUME ["/opt/${ZK_VER}/conf", "/opt/${ZK_VER}/data"]

CMD /usr/sbin/sshd && start-zk.sh
