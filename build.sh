docker pull registry.cn-shenzhen.aliyuncs.com/lllxy/cloudshell:centos
docker tag registry.cn-shenzhen.aliyuncs.com/lllxy/cloudshell:centos lixinyang/cloudshell:centos
docker rmi registry.cn-shenzhen.aliyuncs.com/lllxy/cloudshell:centos
docker images  | grep none | awk '{print $3}' | xargs docker rmi