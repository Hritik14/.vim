# .vim

`cd && git clone --recursive https://github.com/Hritik14/.vim`     
Install plugin YouCompleteMe afterwards

Here's an example pacman hook for regular YCM updates:

```
[Trigger]
Operation = Upgrade
Operation = Install
Type = Package
Target = linux
Target = linux-lts

[Action]
Depends = vim
When = PostTransaction
Exec = /usr/bin/su - hritik -c "/usr/bin/python /home/hritik/.vim/pack/my_plugins/start/YouCompleteMe/install.py --go-completer --ts-completer --java-completer --system-libclang --clang-completer"
```

# Requirements:
Vim >= 8

# Screenshots
[![screencast](https://imgur.com/download/AA7vVVw)](https://youtu.be/1vh6KLKTg8I)
