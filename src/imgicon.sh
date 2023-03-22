#!/bin/zsh

function handle_error {
    source ./notificator --title "🚨 Error" --message "An error occurred! Exiting script.." --sound "$sound"
    exit 1
}

trap "handle_error" ERR

(source ./notificator --title "⏳ Please wait..." --message "The workflow is generating icons" --sound "$sound") &
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

MASKS=(${(s/	/)_masks_list}) # split by tab
PARAMS=$(awk '{$1=$1};NF' <<< "$folder_icon_style $color_scheme $trim_margins $verbose")

for MASK in "${MASKS[@]}"; do
    if [[ $MASK = *.png ]]; then
        echo "\nfolderify $PARAMS \"$MASK\""
        2>&1 eval "folderify $PARAMS \"$MASK\""
    fi
done

if [[ $workflow_action = "_notif" ]];then
    source ./notificator --title "⌛ Finished" --message "Process completed. You can check the log file" --sound "$sound"
fi