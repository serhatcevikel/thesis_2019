# notebooks
FROM gesiscss/binder-serhatcevikel-2dthesis-5f2019-0aa27c:b66a74e3e5d3996e1a97a2aa3a28bf387b8c08ee
LABEL maintainer="serhatcevikel@yahoo.com"

ENV datadir ${HOME}/data
 
# Make sure the contents of our repo are in ${HOME}
COPY --chown=jovyan:jovyan . ${HOME}

USER ${NB_USER}

RUN \
    #echo "[[ \$TERM != \"screen\" ]] && exec screen -q" >> ${HOME}/.bashrc;\
    rm -r ${HOME}/binder;

# Specify the default command to run
WORKDIR ${HOME}
