# cdpp #

cdpp, a shell function supporting one keystroke to change directory to parent path.

cdpp is light and portable. It has only one dependency for querying terminfo database: tput.
This means no demand for sed, awk, and so on.

## Ordinary Mode ##

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
	sed -e '/^\s\+read/s/-n/-k/' -e 's/${!idpath\[@\]}/${(k)idpath}/' \
	-e 's/\(\${#idpath\[@\]}\) - 1/\1/' cdpp.sh >> ~/.zshrc
	source ~/.zshrc

## FAQ ##

Q: How to quit cdpp immediately and keep current working directory?

A: Press <kbd>Ctrl-C</kbd>.

Q: How to combine cdpp with other command temporarily and Don't change current working directory?

A: Place cdpp in subshell. For example: `(cdpp; touch something)`

## Other Resource ##

If you want to go back to a parent directory by typing directory name, I recommend
[bd](https://github.com/vigneshwaranr/bd).

If you want to quickly access to files and directories, I recommend [fasd](https://github.com/clvv/fasd)
or [autojump](https://github.com/wting/autojump).
