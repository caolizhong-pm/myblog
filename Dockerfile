FROM registry.cn-hangzhou.aliyuncs.com/link-cloud/python-27-hcaas:v1.0.1
COPY ./ /opt/app-root/src
WORKDIR /opt/app-root/src
RUN chmod 755 /opt/app-root/src/app-trigger-file.sh
#CMD ["/opt/app-root/src/app-trigger-file.sh"]
