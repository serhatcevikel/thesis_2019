# bash, sql, nosql and hadoop sessions
FROM gesiscss/binder-serhatcevikel-2dthesis-5f2019-0aa27c:d7f30ea9ff10991629f0ae52adbc40b5c9f45b9c
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
