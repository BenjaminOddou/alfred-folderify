#!/bin/zsh

declare -A info_os
info_os=([""]="Auto 🍏" ["--macOS 11.0"]="Big Sur 🍌" ["--macOS 10.10"]="Yosemite 🍒" ["--macOS 10.5"]="Leopard 🍊")
echo "🖼️ Folder icon style : $(echo $info_os[$folder_icon_style])"
declare -A info_scheme
info_scheme=([""]="Auto 🌓" ["--color-scheme dark"]="Dark 🌑" ["--color-scheme light"]="Light 🌕")
echo "🎨 Color scheme : $(echo $info_scheme[$color_scheme])"
declare -A info_margins
info_margins=([""]="Yes 👍" ["--no-trim"]="No 👎")
echo "✂️ Trim margins : $(echo $info_margins[$trim_margins])"
declare -A info_output
info_output=([""]="Simple 🔭" ["--verbose"]="Detailed 🔬")
echo "📃 Ouput format : $(echo $info_output[$verbose])"

FOLDERS=(${(s/	/)_folders_list}) # split by tab
PARAMS=$(awk '{$1=$1};NF' <<< "$folder_icon_style $color_scheme $trim_margins $verbose")

for FOLDER in "${FOLDERS[@]}"; do
    if [[ -d "$FOLDER" ]]; then
        echo "\nfolderify $PARAMS \"$1\" \"$FOLDER\""
        2>&1 eval "folderify $PARAMS \"$1\" \"$FOLDER\""
    fi
done