FROM debian:testing

LABEL maintainer Diego Diez <diego10ruiz@gmail.com>

RUN apt-get update -y && \
    apt-get install -y \
      git \
      python \
      cython \
      python-numpy \
      python-scipy \
      python-pysam \
      python-cvxopt && \
    cd tmp && git clone https://github.com/rajanil/msCentipede && \
    cd msCentipede && \
    python setup.py build_ext --inplace && \
    python setup.py install && \
    mkdir -p /opt/bin && \
    mkdir -p /opt/lib/centipede-ms && \
    cp /tmp/msCentipede/call_binding.py /opt/lib/centipede-ms/ && \
    cp /tmp/msCentipede/load_data.py /opt/lib/centipede-ms/

COPY centipede-ms /opt/bin
RUN chmod +x /opt/bin/centipede-ms
ENV PATH /opt/bin:$PATH

RUN useradd -ms /bin/bash biodev
RUN echo 'biodev:biodev' | chpasswd
USER biodev
WORKDIR /home/biodev
