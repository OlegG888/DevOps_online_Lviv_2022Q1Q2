# Module 1 DevOps Introduction <br/>
### Task 1.1. <br/>

1. Try training https://learngitbranching.js.org/<br/>
2. Install GIT on your workstation.<br/>
```text
ubuntu@ip-172-31-84-252:~$ sudo apt-get install git
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
git is already the newest version (1:2.34.1-1ubuntu1.2).
git set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 16 not upgraded.

```
3. Setup git: change your global configs (add name and email, setup core text
   editor). 
```text
ubuntu@ip-172-31-84-252:~$ git config --global --edit

# This is Git's per-user configuration file.
[user]
# Please adapt and uncomment the following lines:
        name = Oleh H.
        email = oleh*****@gmail.com
```

4. Create account on GitHub.
```text
Done.
```
<br/><br/>
5. Create new private repo on GitHub.
   Repo name: DevOps_online_<City>_<year><quarter>
   Example: DevOps_online_Dnipro_2022Q1Q2 
```text
Done.
```

6. You can see example repository structure.
   /
   m1/
   task1.1/
   m2/
   task2.1/
   task2.2/
   …
   …
   m8/
   task8.1/
   task8.2/
   … 
```text
Done.
```
7. Clone repo to your workstation.
```text
Done.
```
8. Open git console in root directory of your project and make next steps.
```text
Done.
```
9. Do all your experiments in folder “task1.1”.
```text
Done.
```
10. Create empty readme.txt file.
```text
ubuntu@ip-172-31-84-252:~/git$ touch readme.txt
```
11. Make init commit.
```text
ubuntu@ip-172-31-84-252:~/git$ git init commit
Reinitialized existing Git repository in /home/ubuntu/git/commit/.git/
```
12. Create develop branch and checkout on it.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git checkout develop
M       m1/task1.1/index.html

```
13. Create index.html empty file. Commit.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ echo "">index.html
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git add .
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git commit -m "First commit"
[develop a9f3628] First commit
 1 file changed, 1 insertion(+), 1 deletion(-)
```
14. Create branch with name “images”. Checkout on it. Add images folder with
    some images inside it. Commit.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git branch images
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git checkout images
Switched to branch 'images'
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git add .
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git commit -m "add image"
[images 1f6597b] add image
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename m1/task1.1/{ => images}/devops.png (100%)
```
15. Change your index.html. Add images source inside it. Commit.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ nano index.html
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git branch
* images
  main
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git status
On branch images
Your branch is up to date with 'origin/images'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   index.html

no changes added to commit (use "git add" and/or "git commit -a")
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git add .
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git commit -m "update index"
[images efb2e1d] update index
 1 file changed, 1 insertion(+), 1 deletion(-)

```
16. Go back to develop branch.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git checkout develop
Switched to branch 'develop'
```
17. Create branch with name “styles”. Checkout on it. Add styles folder with
    styles source inside it. Commit.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ mkdir styles
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ cd styles/
ubuntu@ip-172-31-84-252:~/git/m1/task1.1/styles$ nano styles.css
ubuntu@ip-172-31-84-252:~/git/m1/task1.1/styles$ git add .
ubuntu@ip-172-31-84-252:~/git/m1/task1.1/styles$ git commit -m "created styles.css"
[styles 51e7c63] created styles.css
 1 file changed, 4 insertions(+)
 create mode 100644 m1/task1.1/styles/styles.css

```
18. Change your index.html. Commit.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ nano index.html
```
19. Go to develop branch.
```text
ubuntu@ip-172-31-84-252:~/git/m1/task1.1$ git checkout develop
M       m1/task1.1/index.html
Switched to branch 'develop'
```
20. Merge two new branches into develop using git merge command. Resolve
    conflict if it appear. Do it in next sequence:
    •merge “images” into “develop”
    •merge “styles” into “develop”
```text
Done.
```

22. Do not delete any branches!
```text
Done.
```
23. Merge develop into master.
```text
ubuntu@ip-172-31-84-252:~/git$ git checkout main
Already on 'main'
Your branch is up to date with 'origin/main'.
ubuntu@ip-172-31-84-252:~/git$ git merge develop
Already up to date.

```
24. Try to inspect your repository with git log command. Use different options
    with this command (git log --help).
```text
ubuntu@ip-172-31-84-252:~/git$ git log
commit 3fab3daecfb48bc357b78803a2a7b34d80f85dab (HEAD -> develop, styles, main)
Author: OlegO777 <*********@gmail.com>
Date:   Sat Jun 25 21:43:59 2022 +0000

    update

commit 51e7c637376f0c891e42f14494f5d13ef8a271de
Author: OlegO777 <*********@gmail.com>
Date:   Sat Jun 25 20:51:16 2022 +0000

    created styles.css

commit efb2e1da0e0bcaed0002f03f68f68ae9a24235e3 (images)
Author: OlegO777 <*********@gmail.com>
Date:   Sat Jun 25 20:34:00 2022 +0000

    update index

commit 467e410ed4c5f853922e5bfdd2b4f5a4eb5cc1ee (origin/images)
Author: OlegO777 <*********@gmail.com>
Date:   Sat Jun 25 20:23:26 2022 +0000

    Add devops.png and readme.txt

commit a13e8f424ef29d7e71751065d9993d1aa6f8b829 (origin/main)
Author: OlegO777 <*********@gmail.com>
Date:   Fri Jun 24 11:28:34 2022 +0000

    2

commit 65e535a1d8c5b47baeb175555d2ec1e7b69e8cd9
Author: OlegO777 <*********@gmail.com>
Date:   Fri Jun 24 10:52:02 2022 +0000


```
25. Push all your changes with all your branches to origin (git push origin --all).
```text
ubuntu@ip-172-31-84-252:~/git$ git push origin --all
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/OlegO777/DevOps_online_Lviv_2022Q1Q2
   467e410..efb2e1d  images -> images
 * [new branch]      develop -> develop
 * [new branch]      styles -> styles

```
26. Execute command “git reflog“ and save it content somewhere (not in
    repository) with filename “task1.1_GIT.txt”.
```text
ubuntu@ip-172-31-84-252:~/git$ git reflog > /home/ubuntu/task1.1_GIT.txt
```
27. Add task1.1_GIT.txt to your local repo in then Push it in GitHub repo.
```text
ubuntu@ip-172-31-84-252:~/git$ mv task1.1_GIT.txt /home/ubuntu/git/m1/task1.1/
ubuntu@ip-172-31-84-252:~/git$ git add .
ubuntu@ip-172-31-84-252:~/git$ git commit -m "new file"
[main da6c651] new file
 2 files changed, 36 insertions(+)
 create mode 100644 log.txt
 create mode 100644 m1/task1.1/task1.1_GIT.txt
ubuntu@ip-172-31-84-252:~/git$ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (5/5), 730 bytes | 730.00 KiB/s, done.
Total 5 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/OlegO777/DevOps_online_Lviv_2022Q1Q2
   3fab3da..da6c651  main -> main

```
28. Make file readme.md in folder task1.1 and describe results of your work
    with Git.
```text
Done.
```
29. Describe in your own words what DevOps is. Try to use not more 50 words.
    Do not use ctrl-C/ctrl-V.
```text
Девопс це методика  різних систем, яка значно полегшує взаємодію між командами розробників<br/>
та експлуатації. В обов'язки  Девопс фахівців входить розробка, тестування, архітектура<br/>
продукту, оцінка захисту, підтримка.  Вважаю Девопс професією майбутнього, так як зараз всі <br/>
галузі максимально комп'ютеризуються і автоматизуються, а хто як не Девопси будуть займатись<br/>
оптимізацією і підтримкою цих процесів? Питання риторичне.
```
30. Insert your text about DevOps in readme.md.
```text
Done.
```