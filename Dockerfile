FROM registry.cn-hangzhou.aliyuncs.com/link-cloud/python-27-hcaas:v1.0.1
ENV MYSQL_DB_NAME myblog
ENV MYSQL_HOST mysql-service
ENV MYSQL_PASSWORD root
ENV MYSQL_USER root
COPY ./ /opt/app-root/src
WORKDIR /opt/app-root/src
RUN pip install -r /opt/app-root/src/requirements.txt
RUN chmod 755 /opt/app-root/src/app-trigger-file.sh
CMD ["/opt/app-root/src/app-trigger-file.sh"]
