set -e
#kubectl create secret generic delme --from-file=id_rsa=$HOME/.ssh/id_ed25519 --from-file=known_hosts=$HOME/.ssh/known_hosts

dir=$(dirname "${BASH_SOURCE[0]}")
gitrepo=unit-finance\\/cima
gitref=refs\\/pull\\/1\\/head
gitref=refs\\/heads\\/master
gitsha=6f8d84c2bc0820525ff3c975283a18eabe33d9f1

uploadserver=$(cat $dir/uploadserver.go | base64)
blocker=$(cat $dir/blocker.go | base64)

sed \
  -e "s/{NAME}/1/" \
  -e "s/{GIT_REPO}/$gitrepo/" \
  -e "s/{GIT_REF}/$gitref/" \
  -e "s/{GIT_SHA}/$gitsha/" \
  -e "s/{UPLOAD_SERVER}/$uploadserver/" \
  -e "s/{BLOCKER}/$blocker/" \
  $dir/injeest.yaml | kubectl apply -f -
