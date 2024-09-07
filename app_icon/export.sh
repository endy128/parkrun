#!/usr/bin/env bash
set -e

if [ $# -eq 0 ]; then
    >&2 echo "No argumant provided"
    exit 1
fi

FILE=$(realpath "${1}")
OUTDIR=$(realpath "${2}")
IM=$(which magick)
SIZES=("1024" "120" "152" "167" "180" "40" "40" "58" "60" "76" "80" "87")

if [ ! -f "$FILE" ]; then
    echo "File $FILE doesn't exists"
    exit 1
elif [ ! -d "$OUTDIR" ]; then
    echo "Directory $OUTDIR doesn't exist"
    exit 1
fi

echo "Using: $FILE"
echo "Saving output to: $OUTDIR"

for size in "${SIZES[@]}"
do
    ${IM} ${FILE} -resize ${size}x${size} ${OUTDIR}/ios_${size}x${size}.png
done

 
