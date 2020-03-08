# r packages
FROM gesiscss/binder-serhatcevikel-2dthesis-5f2019-0aa27c:1f25aab18ea05be37b169bf07bae2689f7b8dc3c
LABEL maintainer="serhatcevikel@yahoo.com"

# Make sure the contents of our repo are in ${HOME}
COPY ./binder ${HOME}/binder

#USER ${NB_USER}
USER root

RUN \
    ## install R kernel for jupyter
    Rscript ${HOME}/binder/rpack.R && \
    rm -r ${HOME}/binder;
 
USER ${NB_USER}
WORKDIR ${HOME}
