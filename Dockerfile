FROM ubuntu:latest
RUN apt-get update && apt-get install curl -y 
COPY ./metrics.sh /metrics.sh
RUN chmod +x /metrics.sh

CMD ["/bin/sh", "-c", "/metrics.sh"]