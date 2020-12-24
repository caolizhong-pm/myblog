FROM registry.cn-hangzhou.aliyuncs.com/link-cloud/python-27-hcaas:v1.0.1
COPY ./ /opt/app-root/src
WORKDIR /opt/app-root/src
CMD ["exec app-trigger-file.sh"]