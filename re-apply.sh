#!/bin/bash

# This needs curl, jq, git
# Script is written for bash specifically
# You need to have setup authentication for Jira in ~/.netrc

base_sha=972dd811179d271ae3ba5e25a1e35a680091252b
sakai_11=~/Documents/oxford/11/checkout/
submodule=access

git rev-list HEAD ^${base_sha} --reverse | while read sha
do
    git log $sha^!
    if git log $sha^! | grep -q git-svn-id; then
       echo You should skip this it is from 10.x
    else
       echo Take this one.
       git log $sha^! | sed  -n 's/^.*\(WL-[0-9]*\).*/\1/p' | sort -n | uniq | while read issue
       do
           echo $issue
           curl -s -n "https://jira.oucs.ox.ac.uk/rest/api/2/issue/$issue" | jq -rj '"Merged: ", .fields.customfield_10030.value // "Unknown", "\n"'
       done
       echo "Apply this patch?"
       (select yn in "Yes" "No" ; do
           case $yn in
	       Yes )
			 author=$(git  show -s --format='%an <%ae>' $sha)
			 msg=$(git  show -s --format='%B' $sha)
			 git diff $sha^! | (cd $sakai_11 ; git apply --directory=$submodule --reject  - )
			# This is so that we have the commit and can just append to it.
			(cd $sakai_11 ; git commit --allow-empty -m "$msg" --author "$author" )
			 echo Applied. Do you want to apply the patch again
			 continue;;
	       No ) break;;
	   esac
       done) < /dev/tty
    fi
    
done

