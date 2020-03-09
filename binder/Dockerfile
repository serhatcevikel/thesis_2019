# install create users, apt dependencies, make sudoers

#FROM debian:buster-20190910
FROM debian:buster-20181112


LABEL maintainer="serhatcevikel@yahoo.com"

# environment variables
ENV JAVA_HOME /usr/lib/jvm/default-java

# create jovyan user
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
ENV SHELL /bin/bash

USER root
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER} && \
    echo "jovyan:jovyan" | chpasswd && \
    usermod -aG sudo ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY ./binder ${HOME}/binder

RUN apt update && \
    apt upgrade -y && \
    apt dist-upgrade -y && \
    apt autoremove -y && \
    apt install -y \
    bc \
    ca-certificates-java \
    csvkit \
    curl \
    default-jdk \
    expect \
    git \
    gnupg \
    htop \
    iptables \
    less \
    libcairo2-dev \
    libcurl4-gnutls-dev \
    libpq-dev \
    libsasl2-dev \
    libssl-dev \
    libudunits2-dev \
    libunwind-dev \
    libxml2-dev \
    libxml2-utils \
    man \
    manpages \
    moreutils \
    net-tools \
    nmap \
    openssh-server \
    pandoc \
    parallel \
    python3-pip \
    screen \
    software-properties-common \
    sudo \
    texlive-xetex \
    tidy \
    unixodbc-dev \
    vim \
    wget; \
    \
    apt-key add ${HOME}/binder/rkey.asc && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/debian buster-cran35/' && \
    #echo 'deb http://cloud.r-project.org/bin/linux/debian buster-cran35/' >> /etc/apt/sources.list && \ 
    apt update && \
    apt upgrade -y && \
    apt dist-upgrade -y && \
    apt autoremove -y && \
    apt install -y \
    r-base; \
    \
    # screenrc configuration
    echo "startup_message off" >> /etc/screenrc; \
    \
    # make jovyan sudoer with no password prompt
    echo "jovyan ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/jovyan; \
    \
    # take care of sh symlink
    if [ -e /usr/bin/sh ]; \
    then \
        rm /usr/bin/sh; \
    fi; \
    \
    ln -s /usr/bin/bash /usr/bin/sh;

RUN \
    # install pip packages
    pip3 install --no-cache \
        bash_kernel \
        jupyter_contrib_nbextensions \
        jupyter-nbextensions-configurator \
        nbpresent \
        notebook \
        py4j \
        quilt==2.9.15 \
        sos \
        sos-notebook;
    
RUN \
    # own home directory by user
    chown -R ${NB_UID} ${HOME};

USER ${NB_USER}

# nbpresent
RUN python3 -m bash_kernel.install; \
    python3 -m sos_notebook.install; \
    jupyter contrib nbextension install --user; \
    jupyter nbextensions_configurator enable --user; \
    jupyter nbextension install nbpresent --py --overwrite --user; \
    jupyter nbextension enable nbpresent --py --user; \
    jupyter serverextension enable nbpresent --py --user; \
    jupyter-nbextension enable codefolding/main --user; \
    jupyter-nbextension install rise --py --user; \
    jupyter-nbextension enable splitcell/splitcell --user; \
    jupyter-nbextension enable hide_input/main --user; \
    jupyter-nbextension enable nbextensions_configurator/tree_tab/main --user; \
    jupyter-nbextension enable nbextensions_configurator/config_menu/main --user; \
    jupyter-nbextension enable contrib_nbextensions_help_item/main  --user; \
    jupyter-nbextension enable scroll_down/main --user; \
    jupyter-nbextension enable toc2/main --user; \
    jupyter-nbextension enable autoscroll/main  --user; \
    jupyter-nbextension enable rubberband/main --user; \
    jupyter-nbextension enable exercise2/main --user; \
    cp ${HOME}/binder/common.json ${HOME}/.jupyter/nbconfig/common.json; \
    \
    # screenrc
    printf "hardstatus on\nhardstatus alwayslastline\nhardstatus string \"%%w\"\n" >> ${HOME}/.screenrc; \
    \
    # bashrc
    #echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> $HOME/.bashrc; \
    echo "export LC_ALL=C.UTF-8" >> ${HOME}/.bashrc; \
    echo "export LANG=C.UTF-8" >> ${HOME}/.bashrc; \
    echo "export EDITOR=vim" >> ${HOME}/.bashrc; \
    #echo "[[ \$TERM != \"screen\" ]] && exec screen -q" >> ${HOME}/.bashrc; \
    \
        # remove files
    rm -r ${HOME}/binder;

USER ${NB_USER}
WORKDIR ${HOME}

