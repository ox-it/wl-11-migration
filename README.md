
## Setup

I have a folder `$HOME/bin` which is on my patch so I link the scripts into that folder so I can use them anywhere:
```
ln -f git-switch ~/bin/git-switch 
ln -f re-apply.sh ~/bin/re-apply.sh 
```

## Scripts

 - `git-switch` - Just sets up a mirror remote
 - `re-apply.sh` - Runs through all the commits that need to be applied to another folder.

## TODO

Need to fi re-apply so it accepts command line arguments for SHA, project and Sakai 11 base.

