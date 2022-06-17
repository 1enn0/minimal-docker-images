#! /bin/bash -

DOCKER_BUILDKIT=1 docker build --ssh default --tag jupyterlab:cp310 .
