FROM alpine:latest
LABEL name="terraform"
LABEL version=0.11.11
ENV TERRAFORM_VERSION=0.11.11
VOLUME ["/data"]
WORKDIR /data
RUN apk update && \
  apk add ca-certificates bash wget && \
  update-ca-certificates
RUN apk --update --no-cache add openssl && \
  wget -O terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
  unzip terraform.zip -d /bin && \
  rm -rf terraform.zip /var/cache/apk/*