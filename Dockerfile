FROM centos:7
MAINTAINER Hank Preston <hank.preston@gmail.com>

RUN yum -y update && \
    yum clean all && \
    yum -y install wget

WORKDIR /root

RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc && \
    chmod +x mc

ENV minio_access_id="" \
    minio_secret="" \
    minio_server=""

#RUN ./mc config host add myhero $minio_server $minio_access_id $minio_secret S3v4

ADD ./images /images
ADD setup_object.sh /root
RUN chmod +x ./setup_object.sh

CMD ["/root/setup_object.sh"]

