#!/bin/zsh

function handle_error {
    source ./notificator --title "🚨 Error" --message "An error occurred! Exiting script.." --sound "$sound"
    exit 1
}

trap "handle_error" ERR

(source ./notificator --title "⏳ Please wait..." --message "The workflow is generating icons" --sound "$sound") &
declare -A info_scheme
info_scheme=([""]="Auto 🌓" ["--color-scheme dark"]="Dark 🌑" ["--color-scheme light"]="Light 🌕")
echo "🎨 Color scheme : $(echo $info_scheme[$color_scheme])"
declare -A info_margins
info_margins=([""]="Yes 👍" ["--no-trim"]="No 👎")
echo "✂️ Trim margins : $(echo $info_margins[$trim_margins])"
declare -A info_output
info_output=([""]="Simple 🔭" ["--verbose"]="Detailed 🔬")
echo "📃 Output format : $(echo $info_output[$verbose])"

FOLDERS=(${(s/	/)_folders_list}) # split by tab
PARAMS=$(awk '{$1=$1};NF' <<< "$folder_icon_style $color_scheme $trim_margins $verbose")

for FOLDER in "${FOLDERS[@]}"; do
    if [[ -d "$FOLDER" ]]; then
        echo "\nfolderify $PARAMS \"$1\" \"$FOLDER\""
        2>&1 eval "folderify $PARAMS \"$1\" \"$FOLDER\""
    fi
done

if [[ $workflow_action = "_notif" ]];then
    source ./notificator --title "⌛ Finished" --message "Process completed. You can check the log file" --sound "$sound"
fi