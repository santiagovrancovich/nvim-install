# Santiago Vrancovich - 2023
#!/usr/bin/env bash

NVIM_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
RIPGREP_URL="https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz"

#Nvim install
if ! nvim -v &> /dev/null; 
  then
    echo "nvim not found, dowloading from source."
    mkdir -p $HOME/nvim
    wget $NVIM_URL -P $HOME/nvim -q --show-progress
    tar -xf $HOME/nvim/nvim-linux64.tar.gz --strip-components 1 -C $HOME/nvim
    chmod +x $HOME/nvim/bin/nvim

    #Add to PATH if it does not exist already
    if ! grep -Fxq "export PATH=$PATH:$HOME/nvim/bin" $HOME/.bashrc; then
        export PATH=$PATH:$HOME/nvim/bin
    fi

    echo "Installed nvim."

  else
    echo "nvim already installed"
fi

#Ripgrep install
if ! rg -V &> /dev/null; 
  then
    echo "ripgrep not found, dowloading from source."
    mkdir -p $HOME/ripgrep
    wget $RIPGREP_URL -P $HOME/ripgrep -q --show-progress
    tar -xf $HOME/ripgrep/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz --strip-components 1 -C $HOME/ripgrep
    chmod +x $HOME/ripgrep/rg
 
    #Add to PATH if it does not exist already
    if ! grep -Fxq "export PATH=$PATH:$HOME/ripgrep" $HOME/.bashrc; then
      export PATH=$PATH:$HOME/ripgrep
    fi

    echo "Installed ripgrep"

  else
    echo "ripgrep already installed"
fi

#Adding path to .bashrc
echo >> $HOME/.bashrc
echo "export PATH=$PATH" >> $HOME/.bashrc 

#Nvim config download
echo "Dowloading config files"
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.config/nvim
git clone https://github.com/NvChad/NvChad $HOME/.config/nvim
cp -r ./custom $HOME/.config/nvim/lua/custom

echo "Instalation finished"
