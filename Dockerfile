FROM python:3.8.2-slim as base
FROM base
COPY . /
WORKDIR /
EXPOSE 8000

RUN apt-get -y update --fix-missing && \
apt-get -y --no-install-recommends install libgomp1 && \
pip install -q --no-cache-dir -r requirements.txt && \
rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "python" ]
CMD ["prueba.py" ]