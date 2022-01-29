# .vim

```bash
cd && git clone --recurse-submodules https://github.com/Hritik14/.vim
```
And install plugin YouCompleteMe afterwards

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

# Screencast
[![asciicast](https://asciinema.org/a/465384.svg)](https://asciinema.org/a/465384)

# License
GPLv2
Author: Hritik V (@MrHritik)
