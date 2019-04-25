#https://docs.docker.com/get-started/part2/

# FROM ubuntu:18.04

# # add your mantainer
# MAINTAINER  phongdk <phongdk@coccoc.com>

# ADD environment.yml /tmp
# # install miniconda and create virtual environment
# RUN apt-get update && apt-get install -y wget && apt-get install -y gcc

# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
# RUN bash ~/miniconda.sh -b -p /miniconda
# ENV PATH="/miniconda/bin:$PATH"
# RUN echo 'export PATH="/miniconda/bin:$PATH"' >> ~/.bashrc 
# # RUN conda env create -f "${projectPath}/config/environment.yml"
# RUN conda env create -n demographic-ml -f /tmp/environment.yml
# RUN echo "source activate demographic-ml" >> ~/.bashrc
# # RUN /bin/bash -c "source ~/.bashrc"


FROM conda/miniconda3

# add your mantainer
MAINTAINER  phongdk <phongdk@coccoc.com>

ADD environment.yml /tmp
RUN apt-get update  && apt-get install nano && apt-get install -y gcc

RUN conda env create -n demographic-ml -f /tmp/environment.yml
RUN echo "source activate demographic-ml" >> ~/.bashrc
