FROM ubuntu:18.04

# System packages 
RUN apt-get update && apt-get install -y curl

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

WORKDIR /app
COPY . /app

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml


# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "test", "/bin/bash", "-c"]


# The code to run when container is started:
COPY app.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "test", "python", "app.py"]

