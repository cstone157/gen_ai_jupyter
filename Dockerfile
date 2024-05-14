# Use the jupyter datascience-notebook
#FROM jupyter/tensorflow-notebook

# Install the NLTK (Natural-Language-Tool-Kit)
#RUN pip install nltk svgling dython tensorflow plotly spacy

ARG BASE_IMG="jupyter/tensorflow-notebook"
FROM $BASE_IMG

# install - conda packages
# NOTE: we use mamba to speed things up
RUN mamba install -y -q \
    bokeh==3.2.2 \
    cloudpickle==2.2.1 \
    dill==0.3.7 \
    ipympl==0.9.3 \
    matplotlib==3.8.0 \
    numpy==1.24.3 \
    pandas==2.1.1 \
    scikit-image==0.22.0 \
    scikit-learn==1.3.1 \
    scipy==1.11.3 \
    seaborn==0.13.0 \
    xgboost==1.7.6 \
 && mamba clean -a -f -y

# install - requirements.txt
COPY --chown=${NB_USER}:users requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt --quiet --no-cache-dir \
 && rm -f /tmp/requirements.txt