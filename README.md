
## Setup

I have a folder `$HOME/bin` which is on my patch so I link the scripts into that folder so I can use them anywhere:
```
ln -f git-switch ~/bin/git-switch 
ln -f re-apply.sh ~/bin/re-apply.sh 
ln -f merge-rej.sh ~/bin/merge-rej.sh 
```

To use the `re-apply.sh` script you need to edit the parameters at the top to configure it correctly.

## Scripts

 - `git-switch` - Just sets up a mirror remote
 - `re-apply.sh` - Runs through all the commits that need to be applied to another folder.
 - `merge-reh.sh` - Looks for all the `.rej` files and attempts to merge the changes in

## TODO

Need to fi re-apply so it accepts command line arguments for SHA, project and Sakai 11 base.

