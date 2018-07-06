# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#=======================================================================================================
#=======================================================================================================
#=======================================================================================================

function stdbuild(){
	echo "==========================="
	echo Compiling: $NAME
	g++ -std=c++14 -O2 $NAME.cpp -o $NAME
	echo ===RUNNING===
	./$NAME
	echo
	echo "==========================="
}

function jinit(){
	mkdir $1
	cd $1
	mkdir bin
	mkdir doc
}

function jname(){
	JNAME=$1
}

function jbuild(){
	echo ==COMPILING==
	javac -d out/ *.java
	echo ===RUNNING===
	java -cp out $JNAME
	echo ===FINISHED===
}

function comp(){
	echo "==========================="
	echo Compiling: $NAME
	time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 $NAME.cpp -o $NAME 2>&1 | tee $NAME.cerr
	printf "\n"
}

function build(){
	echo "==========================="
	echo Compiling: $NAME
	time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 $NAME.cpp -o $NAME 2>&1 | tee $NAME.cerr
	echo Excecution Time:
	time ./$NAME < $NAME.in > $NAME.out 2> $NAME.err
	echo "==========================="
}

function solve(){
	NAME=$1
	vim $NAME.cpp
}

function init(){
	NAME=$1
	if [ -f $NAME.cpp ]; then
		echo "File already exists."
		return
	fi
	cp ~/template.cpp $NAME.cpp
	touch $NAME.cpp
	touch $NAME.in
	touch $NAME.out
	touch $NAME.err
	touch $NAME.cerr
	cp ~/gen.cpp $NAME.cc
	vim $NAME.cpp
}

function search(){
	ls -a | grep -i $1
}

function gs(){
	python ~/GSgen.py < $1.java > $1.txt
}

function mkcdir(){
	mkdir $1 && cd $1
}

function mk(){
	mkdir $1 && cd $1
}

function gc(){
	google-chrome $1 &
}

function gping(){
	ping -c $1 8.8.8.8
}

function tkill(){
	pkill $1 --sig kill
}

function judgeinit(){
	mkdir in
	mkdir out
	mkdir ans
	cd in

	for i in `seq 1 10`;
	do
		touch $i.in
	done

	cd ../ans

	for i in `seq 1 10`;
	do
		touch $i.ans
	done
	cd ..
	cp ~/gen.cpp .
	vim gen.cpp ans.cpp -p &
}

function judge(){
	javac $1.java 2> error.txt
	if [ $? -eq 0 ]
	then
		rm log.txt

		for i in `seq 1 10`;
		do
			rm out/$i.out
		done

		for i in `seq 1 10`;
		do
			echo "Judging Case #$i..."
			timeout $2 java $1 < in/$i.in > out/$i.out
			err=$?

			if [ $err -ge 124 ]
			then
				echo "Case #$i: TLE"
				echo "Case #$i: TLE" >> log.txt
			elif [ $err -eq 0 ]
			then
				python ../judge.py $i
			else
				echo "Case #$i: RTE"
				echo "Case #$i: RTE" >> log.txt
			fi
		done

		python ../verdict.py
		cat verdict.txt
	else
		echo "Compile Error"
		cat error.txt
	fi
}

function ans(){
	g++ -std=c++14 -Wall -Wextra -Werror -Wno-unused-result -O2 -D LOCAL ans.cpp -o answer
	if [ $? -eq 0 ]
	then
		for i in `seq 1 10`
		do
			echo "Answering Case $i"
			./answer < in/$i.in > ans/$i.ans
		done
	fi
}

function gen(){
	g++ -std=c++14 -Wall -Wextra -Werror -Wno-unused-result -O2 gen.cpp -o gen
	if [ $? -eq 0 ]
	then
		for i in `seq $1 $2`
		do
			./gen > in/$i.in $i
		done
	fi
}
export LFTP_PASS=`cat ~/.lftp_pass`
alias cd..='cd ..' #lol
alias cls='printf "\033c"'
alias ref='source ~/.bashrc'
alias vedit='vim ~/.vimrc'
alias edit='vim ~/.bashrc'
alias name='echo $NAME'
alias jvim='vim *.java -p'
alias jdoc='rm doc/* -r && javadoc -quiet -d doc/ -author -version -private *.java'
alias rmswp='sudo rm .*.swp'
alias rm='trash'
alias nuke='trash *'
alias dmoj='cd ~/Comp/DMOJ'
alias timus='cat ~/Comp/Timus/judge.txt'
alias fuck='eval "sudo $(fc -ln -1)"'
alias options='echo download-data upload-data upload-code'
alias download-data='cd ~/Dev/mactimetable/ && lftp -c "lftp files.000webhost.com && lftp -u timetables,$LFTP_PASS && mirror data/ --exclude-glob verify.py"'
alias upload-data='cd ~/Dev/mactimetable/ && lftp -c "lftp files.000webhost.com && lftp -u timetables,$LFTP_PASS && mirror data/ --reverse --delete --exclude-glob .git/ --exclude-glob .*.swp --exclude-glob log.txt --exclude-glob verify.py"'
alias upload-code='echo "Remember to commit/push!" && cd ~/Dev/mactimetable/ && lftp -c "lftp files.000webhost.com && lftp -u timetables,$LFTP_PASS && mirror --reverse --delete --exclude-glob data/ --exclude-glob .git/ --exclude-glob .*.swp"'
alias php-serve='php -S localhost:8000'
alias verify='download-data && cd data/ && python verify.py'
alias check-data='cd ~/Dev/mactimetable/ && lftp -c "lftp files.000webhost.com && lftp -u timetables,$LFTP_PASS && cd data && cat temp.txt"'
alias db='comp && gdb -q $NAME'

export USB=/media/richard/RICHARD
ulimit -c 1048576
ulimit -s 1048576
export TERM='xterm-256color'
export COLORTERM='gnome-terminal'
