#!/bin/bash

# DevOntheRun Deploy Script

echo "#############################################"
echo "                   DEPLOY                   "
echo "#############################################"
echo "# [Optional] param: --tag-msg \"TAG_MESSAGE_HERE\""
echo "---------------------------------------------"

TAG_MSG=$2
GIT_BRANCH=$(git branch --show-current)
TAG_NAME=$(echo "$GIT_BRANCH" | tr -d -)


confirm() {
    read -r -p "Are you sure? [Y/n] " response
    response=${response,,} # tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        echo "TAG"
    else
        exit 0;
    fi

    # call with a prompt string or use a default
    # read -r -p "${1:-Are you sure? [Y/n]} " response
    # case "$response" in
    #     [yY][eE][sS]|[yY][\n][]) 
    #         true
    #         ;;
    #     *)
    #         false
    #         ;;
    # esac
}

echo "Deploying branch: $GIT_BRANCH ..."


# if arguments [ $# -eq 0 ]
if [ $# -eq 0 ]; then
    read -r -p "Do you want to tag? [Y/n] " response
    response=${response,,} # tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        echo "# TAG MESSAGE"
        echo "# Example: \"$(git tag -n9 | head -n 1 | awk '{for(i=2;i<=NF;++i)printf $i FS}')\""
        tagMsgPrefixSuggestion="$(tr '[:lower:]' '[:upper:]' <<< ${TAG_NAME:0:1})${TAG_NAME:1}"
        echo "Type the tag message prefix [$tagMsgPrefixSuggestion - ]:"
        read -e tagMsgPrefix
        if [ -z "$tagMsgPrefix"  -a "$tagMsgPrefix" != " " ]; then
            tagMsgPrefix=$tagMsgPrefixSuggestion
        fi

        echo "Type the tag message:"
        read -e tagmsg
        if [ ! -z "$tagmsg"  -a "$tagmsg" != " " ]; then
            TAG_MSG="$tagMsgPrefix - $tagmsg"
        else
            echo "Tag message missing"
            exit 0
        fi
        git tag -a $TAG_NAME -m "$TAG_MSG"
    fi
else
    # Verify if param --tag-msg is set && message param is not empty
    if [ $1 != "--tag-msg" ] && [ -z "$2" ]; then
        echo "Wrong tag param"
        exit 0
    fi
    git tag -a $TAG_NAME -m "$TAG_MSG"
fi

echo "---------------------------------------------"
echo "Branch: \"$GIT_BRANCH\""
echo "---------------------------------------------"
echo "Tag:    [name]= \"$TAG_NAME\" || [msg]= \"$TAG_MSG\""
echo "---------------------------------------------"

read -r -p "Are you sure? [Y/n] " response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    echo "---------------------------------------------"
    echo "Deploying..."
    git add notes.md && git commit -m "docs: update notes"
    git push origin $GIT_BRANCH && git push origin $GIT_BRANCH --tags && git checkout main
    confirm "Pull from repo? [y/N]" && git pl
    echo "Deploy completed!"
else
    echo "Bye =)"
    exit 0
fi
