FROM centos

EXPOSE 7681

RUN dnf upgrade -y

RUN dnf install curl wget vim git openssh mc tmux gcc make -y

# install spacevim
RUN curl -sLf https://spacevim.org/cn/install.sh | bash

RUN cd ~/.SpaceVim/bundle/vimproc.vim && make 

#install starship
RUN wget https://starship.rs/install.sh && bash ./install.sh -y && rm ./install.sh

RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc

WORKDIR /usr/bin

RUN wget https://github.com/tsl0922/ttyd/releases/download/1.6.1/ttyd_linux.x86_64

RUN mv ./ttyd_linux.x86_64 ./ttyd

RUN chmod +x ./ttyd

WORKDIR /

CMD ["ttyd", "bash"]