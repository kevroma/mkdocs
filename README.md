GitLab website is used for this project

# Git Clone

**(read-access only)**  
$git clone https://gitlab.com/kevzor/mkdocs.git
user: <assigned_user>  
pass: <assigned_token>

# Repository Files

.gitlab-ci.yml	- for build / test image in GitLab website  
Dockerfile - used for creating mkdocs image  
README.md - instructions  
mkdockerize.sh - bash script for using mkdocs

# mkdocs (docker image)

**Running mkdockerize.sh**  

$bash mkdockerize.sh  

**Access input:**

_Deploy token credentials for repository/container registry access:_ **(read-access only)**  

DEPLOY USER: <assigned_user>  
DEPLOY TOKEN: <assigned_token>

_(use this sample image.. display in source code to see the full sha/hash tag)_  
GITLAB IMAGE: registry.gitlab.com/kevzor/tri-ad:5e0807106678bfc7efd14427fda15998bdb1b44a


**User input example:**

Mkdocs project name: kevin  
Mkdocs project directory: /root/test

Build output (existing directory): /root/test/buildoutput  
_(make sure /buildoutput directory is existing)_

Output name (filename.tar.gz): output1.tar.gz

Extracted files (existing directory): /root/test/serveinput  
_(make sure /serveinput directory is existing)_
