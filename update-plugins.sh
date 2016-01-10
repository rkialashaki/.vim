#!/bin/bash
bundldir="$HOME/.vim/bundle"

for i in `ls $bundldir`; do 
    echo $i
    if [ -d $bundldir/$i ]; then
        cd $bundldir/$i && 
        git pull && 
        cd ../
    else
        echo "no $bundldir found"
    fi
done
