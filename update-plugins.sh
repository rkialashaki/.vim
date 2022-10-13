#!/bin/bash
bundldir="$HOME/.vim/plugins-available"

for i in `ls $bundldir`; do 
    echo $i
    if [ -d $bundldir/$i ]; then
        cd $bundldir/$i && 
        git pull --recurse-submodules && 
        cd ../
    else
        echo "no $bundldir found"
    fi
done
