<img src="public/icon_dark_mode.webp#gh-dark-mode-only" alt="logo-dark" height="55"/>
<img src="public/icon_light_mode.webp#gh-light-mode-only" alt="logo-light" height="55"/>

[![made with heart by Benjamin Oddou](https://img.shields.io/badge/made%20with%20%E2%99%A5%20by-benjamin%20oddou-3FAEFF.svg?style=flat)](https://github.com/BenjaminOddou)
[![saythanks](https://img.shields.io/badge/say-thanks-0182E5.svg?style=flat)](https://saythanks.io/to/BenjaminOddou)

Welcome to the Alfred Folderify repository: **An Alfred Workflow** ✨

## ✅ Prerequisites

* MacOS
* Alfred 5. Note that the [Alfred Powerpack](https://www.alfredapp.com/powerpack/) is required to use workflows.

## ⬇️ Installation

1. [Download the workflow](https://github.com/BenjaminOddou/alfred-folderify/releases/latest)
2. Double click the `.alfredworkflow` file to install

## 🏎️ Folderify

Under the hood, the icon generation is made with [folderify](https://github.com/lgarron/folderify) made by [Lucas Garron](https://github.com/lgarron).

## 🧰 Setup the workflow

### Install dependencies

#### Open the Terminal of you Mac and run the following commands

1. Install Homebrew.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install folderify.

```shell
brew install folderify
```

> Note that you have [other installation options](https://github.com/lgarron/folderify#other-installation-options) for folderify

## 🧙‍♂️ Invoke the Workflow

There is 2 flows in this workflow :

1. The first one allows you to assign an generated icon to one or multiple folder(s). It can be triggered by writing `foldicon` keyword.
2. The second allows you to generate `mask.icns` and `mask.iconset` files from one or multiple mask(s). You can invoke this flow with the `imgicon` keyword.

You can edit these triggers (flagged with a `🕹️` symbol) in the user configuration panel.

## 🤖 Usage of the workflow

### Setup variables

1. `📂 Data Folder`. Set the folder path that will host output logs generated by folderify.

> Note that if you change the `Data folder` location after generating logs, you should probably move the file created along in the new folder.

2. `🖼️ Folder icon style` correspond to the `--macOS VERSION` folderify argument and allows you to change the style of the icon folder. Here are the current available styles from all macOS versions :

`Auto 🍏` : will detect your system version and apply the correct settings.

`Big Sur 🍌` : --macOS 11.0 and above.

![big_sur_light](public/big_sur_light.webp)

`Yosemite 🍒` : --macOS ["10.10", "10.11", "10.12", "10.13", "10.14", "10.15"].

![yosemite](public/yosemite.webp)

`Leopard 🍊` : --macOS ["10.5", "10.6", "10.7", "10.8", "10.9"].

![leopard](public/leopard.webp)

3. `🎨 Color scheme` correspond to the `--color-scheme COLOR_SCHEME` folderify argument and allows you to change the color of the icon folder (slight difference). 

`🌓 Auto` : will match current system settings.

`🌑 Dark` : --color-scheme dark will force dark mode.

![big_sur_dark](public/big_sur_dark.webp)

`🌕 Light` : --color-scheme light will force light mode.

![big_sur_light](public/big_sur_light.webp)

> Note that the --color-scheme argument is only avalaible for `Big Sur 🍌` (--macOS 11.0) and above.

4. `✂️ Trim margins` corresponds to the `--no-trim` folderify argument.

`Yes 👍` : transparent margins are trimmed from all 4 sides.

![big_sur_dark](public/big_sur_dark.webp)

`No 👎` : --no-trim. Keeps transparent margins from the mask.

![no_trim](public/no_trim.webp)

Here is a small schema to explain the principle :

![schema_trim](public/schema_trim.webp)

5. `📃 Ouput format` : corresponds to the `--verbose` folderify argument. 

`Simple 🔭` : simple output.

![log_simple](public/log_simple.webp)

`Detailed 🔬` : --verbose, detailed output.

![log_detailed](public/log_detailed.webp)

6. `🔫 Workflow action`. Open/Reveal in finder the log file, display a post notification or do nothing.

7. `🎷 Notification sound`. Set notification sound for this workflow.

### Modify icons folders

> Use `foldicon` to trigger this flow.

![trigger1_1](public/trigger1_1.webp)

Choose the mask that will be used for generating the new icon and press ⏎.

![trigger1_2](public/trigger1_2.webp)

### Generate icns and iconset files

> Use `imgicon` to trigger this flow.

![trigger2_1](public/trigger2_1.webp)

### Alfred Buffer and Universal Actions

For both flows, you can use the `Alfred Buffer` to select multiple folder(s) (flow 1) or maks(s) (flow 2).

`Alfred Buffer` basic commands are :

* ⌥↑ to add a file to the buffer from Alfred's results.
* ⌥↓ to add a file and move to the next item in your list of results.
* ⌥← to remove the last item from the buffer.
* ⌥→ to action all items in the buffer.
* ⌥⌫ to remove all items from the buffer.

To know more on how to use `Alfred Buffer`, follow this [link](https://www.alfredapp.com/help/features/file-search/#file-buffer).

> Note that `Alfred Buffer` is preferred compare to the `{query}`, meaning that if you select a folder/image (by clicking on it or by pressing enter ⏎) that is not included in the buffer, **it will not be compressed**.

![alfred_buffer1](public/alfred_buffer1.webp)

![alfred_buffer2](public/alfred_buffer2.webp)

For both flows you can use the corresponding `Alfred Universal Actions` :

1. If you want to start the first flow, select one or multiple folders and select `Modify folder icon`.

![universal1](public/universal1.webp)

2. If you want to start the second flow, select one or multiple folders and select `Create folder icon from mask`.

![universal2](public/universal2.webp)

### Logs output

Check the logs of the folderify command under the `📂 Data folder`. The log file contains the 3 parts :
1. Date and time of the workflow launch.
2. Workflow options.
3. Folderify command detailed.
4. Folderify output.

> Note that each workflow run is separated by a line.

![log_simple](public/log_simple.webp)

## ⚖️ License

[MIT License](LICENSE) © Benjamin Oddou
