FROM python:3.9-alpine3.13

COPY requirements.txt /tmp/requirements.txt
RUN apk add --no-cache libstdc++
RUN apk add --no-cache --virtual .build-deps gcc g++ musl-dev \
    &&  pip install --no-cache-dir -r /tmp/requirements.txt \
    && apk del .build-deps \
    && rm -rf /tmp/*

WORKDIR /mkdocs

EXPOSE 8000

ENTRYPOINT ["mkdocs"]
CMD ["serve", "-a", "0.0.0.0:8000"]
