gitsy
=====

gitsy is a small program written in bash wich perform convenient synchronization tasks between
git remote repositories.

gitsy source code has few lines but the program comes with autocompletion facilities.
(relog into the shell session on first install time)

```
 # with a single GIT command, gitsy synchronize remote repositories
 $ git spush origin master


 [ local repository ]
       |
       |   PUSH COMMITS
       |-----------------> [ master remote repository ]
                                         |
       <---------------------------------|
       |
       |   PUSH COMMITS
       |-----------------> [ upsync remote repository 1 ]
                                         |
       <---------------------------------|
       |
       |   PUSH COMMITS
       |-----------------> [ upsync remote repository 2 ]
                                         |
       <---------------------------------|
       |
       |   BYPASS
       |-x-x-x-x-x-x-x-x-> [ upsync remote repository 3 ]
                                         |
       <-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-|
       |
       ...
       |
       |   PUSH COMMITS
       |-----------------> [ upsync remote repository n ]
```

### Installation

the easiest way ton install gisty is from command line :

```shell
wget https://git.pluie.org/pluie/gitsy/raw/latest/bin/gitsy; sudo bash gitsy install; rm gitsy
```
you can update gitsy with the same command

### Removing gitsy

```shell
sudo gitsy uninstall
```

### Getting Help

```shell
gitsy
```

### Usage

say we have a git project _myproject_ host in a personal gog server (or gitlab or whatever).

* chdir to your local repo

```shell
cd /home/repo/myproject
```

we want to add a clone repo host on another server (on github or bitbucket for example)

* adding a remote repository

```shell
gitsy add github https:://username@github.com/username/myproject.git
```

you now have an upsync remote repository define in gitsy.
gitsy store these upsync remote repositories for your git project in a .gitsy file at your root directory.
you can add a line in .gitignore with : 
```
.gitsy
```
to avoid this file to appears in your git status output

you can enabling or disabling these upsync repositories at any time with command ```gitsy add REPO_NAME``` or```gitsy remove REPO_NAME```

now you are ready to use _git_ !
do your stuff in your repo project
commit as usual with git
and push your work with the git spush alias
``
git spush origin master
``

then git do a push commit in your host gog repository, then push your commit to all your defined upsync repositories (github/bitbucket whatever)

if you dont want that the push propagate to the (or a particular) upsync repository, simply use
git push or disable an upsync repo with the command gitsy remove REPO_NAME
