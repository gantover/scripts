#!/bin/sh
# Depends on [xclip, maim, libnotify]

# Defining the path accordingly to the last modified file the any "courses" folder
folder=`ls -lt ~/documents/courses | sed -n "2p" | cut -d" " -f9`

# Setting the new path to /screenshots (creates the folder if necessary)
path="/home/damian/documents/courses/$folder"
if [[ ! -d "$path/screenshots" ]]; then
  mkdir $path/screenshots
fi
path="$path/screenshots"

filename="$(date +"%Y-%m-%dT%H-%M-%SZ").png"
file="${path}/${filename}"
# Takes the screenshot
#maim -s -r crosshair "$file"
maim -s -c 0.41,0.62,0.42,0.2 -l -u "$file"
if [ -f "$file" ]; then
  # Copies the image to your clipboard (ctrl + v)
  xclip -selection clipboard -target image/png -i "$file"
  # Copies the filename to primary selection (shift + insert or middle mouse)
  echo -n "$file" | xclip -selection primary
  # Creates notification with file name
  notify-send "New Screenshot" "$file"
fi

# copy latex insert to clipboard
echo "\begin{figure}[H]" $'\n\t' "\centering" $'\n\t' "\includegraphics[width=4in]{screenshots/$filename}" $'\n\t' "\caption{}" $'\n' "\end{figure}" | xclip -selection c
