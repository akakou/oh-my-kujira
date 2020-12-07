FROM akakou/ctf-kujira:latest

# vscode
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y code

# firefox
RUN apt-get install -y firefox

# zsh and bash
RUN apt-get install -y zsh 
WORKDIR /root
RUN curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh | sh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime \
    && sh ~/.vim_runtime/install_awesome_vimrc.sh
WORKDIR /root/volume
CMD ["zsh", "--version"]

