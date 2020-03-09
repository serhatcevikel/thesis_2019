# r packages
FROM gesiscss/binder-serhatcevikel-2dthesis-5f2019-0aa27c:5ecbf28565026f219ba93ab671a366adc2681958
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
