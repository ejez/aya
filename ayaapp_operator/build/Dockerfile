# https://quay.io/repository/operator-framework/ansible-operator?tab=tags
ARG ansible_operator_version=0.10.0

FROM quay.io/operator-framework/ansible-operator:v$ansible_operator_version

USER root

# https://github.com/kubernetes/kubernetes/releases
ARG kubectl_version=1.15.3

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v$kubectl_version/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# 'psycopg2-binary' needed for postgres ansible modules
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir psycopg2-binary

USER ${USER_UID}

COPY watches.yaml ${HOME}/watches.yaml

COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks
