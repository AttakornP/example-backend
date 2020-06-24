FROM python:3.8.3-buster as builder

WORKDIR /usr/src/app

ADD requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.8.3-slim-buster

WORKDIR /usr/src/app

RUN addgroup --gid 1000 appgroup && \
    useradd -u 1000 -G appgroup -g 1000 -d /usr/src/ appuser

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && \
    chown appuser:appgroup /entrypoint.sh

COPY --from=builder /root/.local /usr/src/.local

ADD hello_world/ .

RUN apt-get update && \
    apt-get install -y libxml2 && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN chown -R appuser:appgroup /usr/src/

ENV PATH=/usr/src/.local/bin:$PATH
USER appuser

ENTRYPOINT ["/entrypoint.sh"]