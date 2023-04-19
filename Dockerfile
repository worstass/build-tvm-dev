FROM condaforge/miniforge3:22.9.0-3
ENV TVM_VERSION 0.11.1
RUN pip install apache-tvm==${TVM_VERSION}
