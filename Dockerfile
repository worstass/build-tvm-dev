FROM condaforge/miniforge3:22.9.0-3
RUN pip install apache-tvm==${TVM_VERSION}
