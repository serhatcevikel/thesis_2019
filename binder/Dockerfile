# quiltdata 
FROM gesiscss/binder-serhatcevikel-2dthesis-5f2019-0aa27c:9dbd933073bc3f85ee19ac4f3738aba7f9fb50c5
LABEL maintainer="serhatcevikel@yahoo.com"

USER ${NB_USER}

RUN \
    # quilt
    quilt install serhatcevikel/thesis_data; \
    quilt export serhatcevikel/thesis_data ${HOME}/data;

USER ${NB_USER}
WORKDIR ${HOME}
