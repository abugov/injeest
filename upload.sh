# run portfw.sh first

#TODO: handle delete and mkdir

set -e
echo uploading:
git diff --name-only 6f8d84c2bc0820525ff3c975283a18eabe33d9f1

# TODO: change to single call
git diff --name-only 6f8d84c2bc0820525ff3c975283a18eabe33d9f1 | xargs -I % curl -F '%=@%' localhost:4500/upload