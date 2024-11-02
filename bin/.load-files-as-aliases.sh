### How to use this alias:
### Add to ~/.bashrc:
## if [ -f /c/apps/bin/.load-files-as-aliases.sh ]; then
##     . /c/apps/bin/.load-files-as-aliases.sh
## fi

_alf() {
    alias $1=${2}
}

for file in $(find /c/apps/bin/ -type f -name '*.bat'); do
    cmd=$(basename ${file/\.bat/});
    _alf $cmd $file;
done

for file in $(find /c/apps/bin/ -type f -name '*.sh'); do
    cmd=$(basename ${file/\.sh/});
    _alf $cmd $file;
done
