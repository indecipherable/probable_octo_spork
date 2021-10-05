#!/usr/bin/env bash

username_chars=$(git config --global user.name | wc -c)
usermail_chars=$(git config --global user.email | wc -c)

if [ "$username_chars" -eq "0" ];
  then
    echo "username is not set; set:"
    read myusername 
    git config --global user.name "$myusername"
  else
    echo "username appears to be set: $(git config --global user.name)"
fi
if [ "$usermail_chars" -eq "0" ];
  then
    echo "usermail is not set; set:"
    read myuseremail
    git config --global user.email "$myuseremail"
  else
    echo "usermail appears to be set: $(git config --global user.email)"
fi
