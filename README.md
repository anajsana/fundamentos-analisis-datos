# Welcome to Data Science 101! 
***
This repo has been created by Data Science students for academic purposes. Please remember to:

* Set a call via [Slack](https://slack.com/signin) channel before uploading a new file
* Make sure you have read "how to subbmit changes procedure" before adding changes to this repository (you need to submmit a PR, never make changes to master branch directly!!
* Relax, Grab a coffe (or tea) and have fun coding! :)


**Main contributors**: Gerardo, Ana, David

**Language used**: R and Python

***

## How to subbmit changes: Forking repos and using PR

**Main steps**: Fork https://github.com/anajsana/fundamentos-analisis-datos repository to our account, clone the fork locally, commit our changes to `master`, and push it back upstream to GitHub to submit for approval (Send a `Pull Request`)

A `fork` is a copy of a repository that will appear your personal account. Forking a repository allows you to make any changes without affecting the original project.

**1. In the top-right corner of the page, click Fork**

**2. Fork a repo and create a clone of your fork locally on your computer**

A fork will create an exact copy of the repository (and all of its branches) under your own username.

  * Under the repository name, click Clone or download.
  * Open Terminal and paste de URL
  
  ```
  $ git clone https://github.com/YOUR-USERNAME/fundamentos-analisis-datos
  ```
**3. Track the original repository as a remote of yout fork**

Once you’ve forked a repository, changes to the `original` (or `upstream`) repository are not pushed to your fork. We need to tell the new repository to follow changes made upstream to keep it updated via something called a `remote`

Switch directories to your forked repository you just cloned and run the following commands:

```
git remote add --track master upstream https://github.com/anajsana/fundamentos-analisis-datos
git fetch upstream

```

This links the fork back to the original repository as a remote, which we’ll name upstream, and then fetch it.

**4. Add, commit, and push the changes**

* Add the files you’ve changed and commit them with a descriptive message.
```
$ git add .
$ git commit -m
```
* push to `master`
```
git push -u origin master
```


**5. Push commits to a Pull Request**

*What are Pull Requests?*

> Pull requests let you tell others about changes you wish to push to a branch (in our case, to `master` branch) in a repository on GitHub

Head over to the original repository (https://github.com/anajsana/fundamentos-analisis-datos) Pull Requests tab, and you will see an automatic suggestion from GitHub to create a pull request from your new branch. Once you've done this, wait for your PR to be merged :) 
