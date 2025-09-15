# 只镜像构建之前执行 chmod -R 777 ./views

FROM klausmeyer/docker-registry-browser:1.8.5

COPY views /app/app/views

# docker build -t firfe/drb_zh-cn:1.8.5 .
