#! /bin/bash

set -euo pipefail

for d in $(ls)
do
  test -d "$d" || continue
	echo ""
	echo ">>>>>>>>>>>>>>>>> Building $d <<<<<<<<<<<<<<<<<"
	echo ""
	IMAGE="victorbjelkholm/$d:latest"
  ( cd $d && docker build -t $IMAGE . && docker push $IMAGE  )
done

