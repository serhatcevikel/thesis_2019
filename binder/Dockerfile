# quiltdata 
FROM gesiscss/binder-serhatcevikel-2dthesis-5f2019-0aa27c:2c661660846bd6b6bc80634340b37e9ad825a911
LABEL maintainer="serhatcevikel@yahoo.com"

USER ${NB_USER}

RUN \
    # quilt
    quilt install serhatcevikel/thesis_data; \
    quilt export serhatcevikel/thesis_data ${HOME}/data;

USER ${NB_USER}
WORKDIR ${HOME}
