#!/bin/bash

LIST_URL="https://adaway.org/hosts.txt"
LIST_FNAME="adaway_list.txt"

echo "[*] Fetching list: ${LIST_URL} -> ${LIST_FNAME}"
curl -s "$LIST_URL" -o "$LIST_FNAME"

echo "[*] Sorting list..."
sort -u -o $LIST_FNAME $LIST_FNAME

echo "[*] Removing comments..."
grep -o '^[^#]*' $LIST_FNAME > temp.txt
mv temp.txt $LIST_FNAME

echo "[*] Extracting domains..."
cat $LIST_FNAME | awk '{ print $2 }' > temp.txt
mv temp.txt $LIST_FNAME

echo "[*] Removing localhost from list..."
sed -i '' '/localhost/d' $LIST_FNAME
sed -i '' '/127.0.0.1/d' $LIST_FNAME
sed -i ''  '/^$/d' $LIST_FNAME

# echo $LIST_FNAME
/bin/cat "$LIST_FNAME" | sort | uniq > temp.txt
mv temp.txt $LIST_FNAME
mv $LIST_FNAME ./assets/$LIST_FNAME
