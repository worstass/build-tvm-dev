FROM condaforge/miniforge3:22.9.0-3
ENV TVM_VERSION 0.11.1
ENV TVM_HOME /usr/share/tvm
RUN pip install apache-tvm==${TVM_VERSION}
RUN cd /tmp && git clone --recursive --depth 1 -b v${TVM_VERSION} https://github.com/apache/tvm.git
RUN mkdir -p ${TVM_HOME} && \
    cd /tmp/tvm && \
    cp -r include ${TVM_HOME} && \
    cp -r 3rdparty/dlpack/include ${TVM_HOME} && \
    mkdir -p ${TVM_HOME}/lib && \
    cd /opt/conda/lib/python3.10/site-packages/tvm && \
    cp libtvm_runtime.so ${TVM_HOME}/lib && \
    cp libtvm.so ${TVM_HOME}/lib
RUN cd /tmp/tvm && cp -r rust ${TVM_HOME}
