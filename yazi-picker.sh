#!/bin/bash
echo "INPUT: $1" >> /tmp/yazi-debug.log
path="$1"
# search: 버퍼면 실제 경로만 추출 (search:/검색어:줄:열/경로 -> /경로)
if [[ "$path" == search:* ]]; then
  path=$(echo "$path" | sed 's|^search:[^:]*:[0-9]*:[0-9]*||')
fi
echo "OUTPUT: $path" >> /tmp/yazi-debug.log
yazi "$path" --chooser-file=/tmp/yazi-chooser
