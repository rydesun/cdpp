# cd parent path ON SPEED! #

![demonstration](https://raw.githubusercontent.com/rydesun/cdpp/master/demo/demo.gif)

## Install ##

### bash user ###
	cat cdpp.sh >> ~/.bashrc
	source ~/.bashrc

### zsh user ###
	sed -e '/^\s\+read/s/-n/-k/' -e 's/${!idpath\[@\]}/${(k)idpath}/' cdpp.sh >> ~/.zshrc
	source ~/.zshrc
