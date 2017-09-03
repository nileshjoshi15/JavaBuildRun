#!/bin/bash

targetDir="target"

Build(){
    #location of java and  class files 
    directory=$(find . -name "*.java" | head -1)
    srcDir=$(echo "$directory" | cut -d "/" -f2)
    classDir="./$targetDir"
    java_file_loc="*/*.java"
    
    #if directory exist, delete and re-create
    if [ -d "$classDir" ]; then
        Clean
    fi

    mkdir $classDir

    #Create the java class files
    find . -name "*.java" >sources.txt
    javac -d $classDir -cp . @sources.txt
    rm sources.txt
}


Run(){
    #Run java class files
    cd $targetDir
    mainClassPath=$(grep -Ril "main" ./)
    java  ${mainClassPath:2:${#mainClassPath}-8}
}

Clean(){
    rm -r target
}

if [ "$1" == --buildandrun ]; then
    Build
    Run
elif [ "$1" == --run ]; then 
    Run
elif [ "$1" == --build ]; then
    Build
elif [ "$1" == --clean ]; then
    Clean
else 
    echo -e "\n command not found"
    echo -e "Please use on of these command"
    echo -e "\t ./run.sh --build"
    echo -e "\t ./run.sh --buildandrun"
    echo -e "\t ./run.sh --run"
    echo -e "\t ./run.sh --clean"
fi
