if [ `id | cut -c 5` -eq 0 ]; then
	typeset +x PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W #\[\033[00m\] '
else
	typeset +x PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi
