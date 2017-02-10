# cd parent path ON SPEED! #

![demonstration](https://raw.githubusercontent.com/rydesun/cdpp/master/demo/demo.gif)

## Compact Mode ##

![demonstration](https://raw.githubusercontent.com/rydesun/cdpp/master/demo/demo-cm.gif)

enable method:

	sed -i 's/echo ${PWD/echo -n ${PWD/' cdpp.sh

## Install ##

### bash user ###
	cat cdpp.sh >> ~/.bashrc
	source ~/.bashrc

### zsh user ###
	sed -e '/^\s\+read/s/-n/-k/' -e 's/${!idpath\[@\]}/${(k)idpath}/' -e 's/\(\${#idpath\[@\]}\) - 1/\1/' cdpp.sh >> ~/.zshrc
	source ~/.zshrc
