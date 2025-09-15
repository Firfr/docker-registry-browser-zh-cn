# Docker Registry Browser 中文版

Docker Registry Browser 是基于 Ruby 和 Rails 编写的 [Docker Registry HTTP API V2](https://docs.docker.com/registry/spec/api/) 的网页界面。给自建docker仓库提供浏览、删除镜像的功能。

## 汉化说明

当前汉化仅适用于 版本：1.8.5

首先感谢原作者的开源。[原项目地址](https://github.com/klausmeyer/docker-registry-browser)

具体汉化了那些内容，请参考[翻译说明](./翻译说明.md)。

我看不懂代码，所以只做汉化，有问题，请到原作者仓库处反馈。

这里汉化的不是源码，是从 docker 镜像中导出来的文件！

本人提供这个项目及`registry`在 NAS、服务器等的有偿远程部署服务。有需要可联系。  
微信号 `E-0_0-`  
闲鱼搜索用户 `明月人间`  
或者邮箱 `firfe163@163.com`  
如果这个项目有帮到你。欢迎 start。

有其他的项目的汉化需求，欢迎提 issue。或其他方式联系通知。


> 部署这个项目的前提是要部署好`registry`这个镜像才可以！！！

### 镜像

从阿里云或华为云镜像仓库拉取镜像，注意填写镜像标签，镜像仓库中没有`latest`标签

容器内部端口`8080`。

```bash
docker pull swr.cn-north-4.myhuaweicloud.com/firfe/drb_zh-cn:1.8.5
```

项目更多配置，请参考原项目配置。

### docker run 命令部署

```bash
docker run -d \
--name drb_zh-cn \
--network bridge \
--restart always \
--log-opt max-size=1m \
--log-opt max-file=1 \
-p 8080:8080 \
swr.cn-north-4.myhuaweicloud.com/firfe/drb_zh-cn:1.8.5
```

### compose 文件部署 👍推荐

```yaml
#version: '3'
name: drb_zh-cn
services:
  drb_zh-cn:
    container_name: drb_zh-cn
    image: swr.cn-north-4.myhuaweicloud.com/firfe/drb_zh-cn:1.8.5
    network_mode: bridge
    restart: always
    logging:
      options:
        max-size: 1m
        max-file: '1'
    environment:
      TZ: Asia/Shanghai
      TIME_ZONE: Asia/Shanghai
      SECRET_KEY_BASE: docker-registry-browser
      ENABLE_DELETE_IMAGES: true
      ENABLE_COLLAPSE_NAMESPACES: true
      DOCKER_REGISTRY_URL: 私有仓库完整地址，例如 https://192.168.1.1:5000
      PUBLIC_REGISTRY_URL: 私有仓库拉取前缀，例如 192.168.1.1:5000
    ports:
      - 8080:8080
```


### 汉化效果截图

仓库概览

![仓库概览](图片/仓库概览.png)

标签概览

![标签概览](图片/标签概览.png)

标签详情

![标签详情](图片/标签详情.png)

删除标签

![删除标签](图片/删除标签.png)


