#!/bin/bash
#
# Watches the notes folder and rebuilds the html files whenever a .rst file changed

NOTES_FOLDER=/home/razius/Desktop/notes
TIME_FORMAT='%F %H:%M'
OUTPUT_FORMAT='%T Event(s): %e fired for file: %w. Refreshing.'

RST_FILES=()
while IFS= read -d $'\0' -r file ; do
    RST_FILES=("${RST_FILES[@]}" "$file")
done < <(find $NOTES_FOLDER -name '*.rst' -print0)

pushd $NOTES_FOLDER

make clean
make html

while inotifywait -q -r --timefmt "${TIME_FORMAT}" --format "${OUTPUT_FORMAT}" "${RST_FILES[@]}"; do
    make clean
    make html
done
