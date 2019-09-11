FROM akakou/ctf-kujira
RUN apt-get install -y zsh 
WORKDIR /root
RUN curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh | sh \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; \
    return 0;
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime \
    && sh ~/.vim_runtime/install_awesome_vimrc.sh
WORKDIR /root/volume
CMD ["zsh", "--version"]

