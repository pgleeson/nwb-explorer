FROM metacell/jupyter-neuron:development

ENV FOLDER=nwb-explorer

USER root
RUN apt-get update -qq &&\
    apt-get install python3-tk vim nano unzip -qq
USER $NB_UID

RUN jupyter labextension disable @jupyterlab/hub-extension

COPY --chown=1000:1000 . ${FOLDER}

RUN python $FOLDER/utilities/install.py

WORKDIR $HOME/$FOLDER

EXPOSE 8000

CMD ./NWBE