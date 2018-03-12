clock()
{
	[ $# -gt 0 ] && echo "Show Clock"
	while true;do
		clear;
		echo -e "\033[0;32m=============\033[0;31m";
		echo -n " "; date +"%r";
		echo -e "\033[0;32m=============\033[0;00m";
		sleep 1;
    done;
}

run()
{
    number=$1;
    shift;
    for n in $(seq $number); do
        $@
    done
}

bu()
{
	if [ "$#" -lt 1 ]; then
		echo -e "Backup a file (append date to name)"
		echo -e "${RED}usage:${BLUE} bu() <filepath>" && return;
    fi
		cp $1 ${1}-`date +%Y%m%d%H%M`.backup ;
}

extract ()
{
	if [ -f $1 ] ; then
		case $1 in
		*.tar.bz2) tar xjvf $1 ;;
		*.tar.gz) tar xzvf $1 ;;
		*.tar.xz) tar xJvf $1 ;;
		*.bz2) bunzip2 -v $1 ;;
		*.rar) unrar x $1 ;;
		*.gz) gunzip -v $1 ;;
		*.tar) tar xvf $1 ;;
		*.tbz2) tar xjvf $1 ;;
		*.tgz) tar xzvf $1 ;;
		*.zip) unzip $1 ;;
		*.Z) uncompress -v $1 ;;
		*.7z) 7z x $1 ;;
		*.arj) unarj $1 ;;
		*.lzma) unlzma -v $1 ;;
		*.lzop) tar --lzop xvf $1 ;;
		*.lzip) tar --lzip xvf $1 ;;
		*) echo -e "${red} extract() does not know the extension of ${blue}$1" ;;
		esac
		else
			echo -e "\n${red}'$1' ${RED}usage:${BLUE} extract() <archive>"
			fi
}

man() {
    env \
    LESS_TERMCAP_mb=$${BRed} \
    LESS_TERMCAP_md=$${BRed} \
    LESS_TERMCAP_me=$${NC} \
    LESS_TERMCAP_se=$${NC} \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$${NC} \
    LESS_TERMCAP_us=$${BGreen} \
    man "$@"
}

exitstatus()
{
    if [[ $? == 0  ]]; then
        #echo -e "${BGreen}:)${NC}"
        echo 'x'
    else
        echo -e "${BRed}:(${NC}"
    fi

}
