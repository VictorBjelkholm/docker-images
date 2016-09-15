#! /bin/bash

set -euxo pipefail

for d in $(ls)
do
  test -d "$d" || continue
  echo "Building $d"
	IMAGE="victorbjelkholm/$d:latest"
  ( cd $d && docker build -t $IMAGE . && docker push $IMAGE  )
done

