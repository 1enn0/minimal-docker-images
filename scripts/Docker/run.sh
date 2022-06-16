#! /bin/bash -

mkdir -p $PWD/notebooks
docker run --rm -p 8888:8888 -v $PWD/notebooks:/workspace/notebooks jupyterlab-cp310