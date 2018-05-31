FROM registry.centos.org/centos/python-36-centos7

ENV SUMMARY="Platform for building and running Python $PYTHON_VERSION applications" \
    DESCRIPTION="Python $PYTHON_VERSION available as ... this is based on https://github.com/sclorg/s2i-python-container \
    and simply has the git binary added."

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="Python 3.6+git" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,python,python36,rh-python36" \
      com.redhat.component="python36-docker" \
      name="aicoe/python-36-centos7" \
      version="1" \
      usage="s2i build https://github.com/sclorg/s2i-python-container.git --context-dir=3.6/test/setup-test-app/ centos/python-36-centos7 python-sample-app" \
      maintainer="Christoph Görn <goern@redhat.com>"

# we need to be root as we want to install stuff
USER 0

RUN yum install -y --setopt=tsflags=nodocs epel-release && \
    yum install -y --setopt=tsflags=nodocs --enablerepo=epel rh-git29 which

# fall back to S2I user
# see https://github.com/sclorg/s2i-python-container/blob/master/3.6/Dockerfile#L64
USER 1001