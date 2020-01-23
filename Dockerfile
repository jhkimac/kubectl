FROM gcr.io/cloud-builders/kubectl

LABEL version="1.0.0"
LABEL name="eks-kubectl"
LABEL repository="https://github.com/jhkimac/eks-kubectl"
LABEL homepage="https://github.com/jhkimac/eks-kubectl"

LABEL maintainer="Jung Hong Kim <jhkimac@connect.ust.hk>"
LABEL com.github.actions.name="EKS kubectl"
LABEL com.github.actions.description="Runs kubectl with AWS-Authenticator for EKS Deployment. Config with secret KUBE_CONFIG_DATA, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY or use aws-actions/configure-aws-credentials@v1 for AWS secrets config."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/local/bin/aws-iam-authenticator

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]