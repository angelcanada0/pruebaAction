
FROM python:3-slim AS builder
ADD . /
WORKDIR /

# We are installing a dependency here directly into our app source dir
RUN pip install --target=/ requests

# A distroless container image with Python and some basics like SSL certificates
FROM gcr.io/distroless/python3-debian10
COPY --from=builder / /
WORKDIR /app
ENV PYTHONPATH /
CMD ["/prueba.py"]