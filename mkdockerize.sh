#!/bin/bash

# define token and gitlab registry image
read -p "DEPLOY USER: " DEPLOYUSER
read -p "DEPLOY TOKEN: " DEPLOYTOKEN
read -p "GITLAB IMAGE: " GITLABIMAGE

# LOGIN
echo "$DEPLOYTOKEN" | docker login registry.gitlab.com -u $DEPLOYUSER --password-stdin

# variables for mkdocs input
echo "========================================"
echo "Building site with Mkdocs.."
read -p "Mkdocs project name: " myprojectname
read -p "Mkdocs project directory: " myprojectdir
read -p "Build output (existing directory): " buildoutputdir
read -p "Output name (filename.tar.gz): " buildoutputname

# run image and create mkdocs project
docker run -v $myprojectdir:/docs $GITLABIMAGE new $myprojectname

# run image, build mkdocs project, and compress project output (.tar.gz) in the specified directory
docker run -v "$myprojectdir/$myprojectname":/docs $GITLABIMAGE build
cd $buildoutputdir
tar -zcvf $buildoutputname --directory=$myprojectdir $myprojectname

# variable for mkdocs input
echo "========================================"
echo "Serving site with Mkdocs.."
echo "Extracting output $buildoutputname.."
read -p "Extracted files (existing directory): " serveinputdir

# use previous project output (.tar.gz) and extract to specified directory, and serve website
tar -xvf $buildoutputname -C "$serveinputdir"
cd "$serveinputdir/$myprojectname"
docker run -p 8000:8000 -v "$serveinputdir/$myprojectname":/docs $GITLABIMAGE serve

# LOGOUT
docker logout registry.gitlab.com
