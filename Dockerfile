FROM alpine:latest

ARG PB_VERSION=0.38.2

RUN apk add --no-cache unzip ca-certificates wget

RUN mkdir -p /pb/pb_data && \
    wget -q -O /tmp/pb.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip && \
    unzip /tmp/pb.zip -d /pb && \
    rm /tmp/pb.zip && \
    chmod +x /pb/pocketbase

EXPOSE 8080

# Startup script: cria superusuário se não existir, depois sobe o servidor
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
