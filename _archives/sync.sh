#!/bin/sh
# sync everything outside /files/, and move everything inside /files/ to the server. 
PATHNAME="`dirname "$0"`"
echo "You are at the directory $PATHNAME"
echo "Here are the files it contains:"
echo
cd "$PATHNAME"
ls
echo
echo "Make sure you are at the right location. Put the files to be uploaded in /files/, and rename them properly. Continue? [y/n] "
read REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit
fi
rsync -avu --exclude "*.html~" --exclude "*.sh" --exclude "*.sh~" --exclude ".DS_Store" --exclude "README.md" --exclude ".git/*" --exclude ".git/" --exclude ".gitignore" --exclude "./" --delete ./ huangyf@login.itd.umich.edu:~/Public/html/
# Use the following version to avoid keeping a local copy in ./files/
# rsync -avu --exclude "*.html~" --exclude "*.sh" --exclude "*.sh~" --exclude ".DS_Store" --exclude "README.md" --exclude ".git/*" --exclude ".git/" --exclude ".gitignore" --exclude "./" --delete --filter="protect files/*" ./ huangyf@login.itd.umich.edu:~/Public/html/ && rm -r ./files/*