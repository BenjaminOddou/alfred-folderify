<img src="public/icon_dark_mode.png#gh-dark-mode-only" alt="logo-dark" height="55"/>
<img src="public/icon_light_mode.png#gh-light-mode-only" alt="logo-light" height="55"/>

[![made with hearth by Benjamin Oddou](https://img.shields.io/badge/made%20with%20%E2%99%A5%20by-benjamin%20oddou-3FAEFF.svg?style=flat)](https://github.com/BenjaminOddou)
[![saythanks](https://img.shields.io/badge/say-thanks-0182E5.svg?style=flat)](https://saythanks.io/to/BenjaminOddou)

Welcome to the Alfred Folderify repository: **An Alfred Workflowk** â¨

## â Prerequisite

* đ MacOS
* đŠ Alfred 5. Note that the [Alfred Powerpack](https://www.alfredapp.com/powerpack/) is required to use workflows.

## âšī¸ information

* đī¸ Under the hood, the icon generation is made with [folderify](https://github.com/lgarron/folderify) made by [Lucas Garron](https://github.com/lgarron).

## âŦī¸ Installation

1. [Download the workflow](https://github.com/BenjaminOddou/alfred-folderify/releases/latest)
2. Double click the `.alfredworkflow` file to install

![workflow](src/images/workflow.webp)

## đ§ââī¸ Invoke the Workflow

There is 2 flows in this workflow :

1. The first one allows you to assign an generated icon to one or multiple folder(s). It can be triggered by writing `foldicon` keyword.
2. The second allows you to generate `mask.icns` and `mask.iconset` files from one or multiple mask(s). You can invoke this flow with the `imgicon` keyword.

You can change these values by changing the `đšī¸ Trigger 1` or `đšī¸ Trigger 2` variables in workflow configuration panel [optionnal]. Please avoid putting the same trigger for the two flows.

## đ§° Setup the workflow

### đ¨âđģ Install dependencies

#### Open the Terminal of you Mac and run the following commands

1. âī¸ Install Homebrew.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. âī¸ Install folderify.

```shell
brew install folderify
```

đĄ Note that you have [other installation options](https://github.com/lgarron/folderify#other-installation-options) for folderify

### đ Data (Logs) folder

â This variable cannot be empty. You can change it at your convenience in the workflow configuration panel.

It contains the output logs generated by folderify.

đĄ Note that if you change the `Data folder` location after generating logs, you should probably move the files created along in the new folder.

## đ¤ Usage of the workflow

### âī¸ Setup variables

All of the following variables correspond to a folderify argument. Check the original [folderify documentation](https://github.com/lgarron/folderify#full-options) if you need more details.

1. `đŧī¸ Folder icon style` correspond to the `--macOS VERSION` folderify argument and allows you to change the style of the icon folder. Here are the current available styles from all macOS versions :

`Auto đ` : will detect your system version and apply the correct settings.

`Big Sur đ` : --macOS 11.0 and above.

![big_sur_light](src/images/big_sur_light.webp)

`Yosemite đ` : --macOS ["10.10", "10.11", "10.12", "10.13", "10.14", "10.15"].

![yosemite](src/images/yosemite.webp)

`Leopard đ` : --macOS ["10.5", "10.6", "10.7", "10.8", "10.9"].

![leopard](src/images/leopard.webp)

2. `đ¨ Color scheme` correspond to the `--color-scheme COLOR_SCHEME` folderify argument and allows you to change the color of the icon folder (slight difference). 

`đ Auto` : will match current system settings.

`đ Dark` : --color-scheme dark will force dark mode.

![big_sur_dark](src/images/big_sur_dark.webp)

`đ Light` : --color-scheme light will force light mode.

![big_sur_light](src/images/big_sur_light.webp)

đĄ Note that the --color-scheme argument is only avalaible for `Big Sur đ` (--macOS 11.0) and above.

3. `âī¸ Trim margins` corresponds to the `--no-trim` folderify argument.

`Yes đ` : transparent margins are trimmed from all 4 sides.

![big_sur_dark](src/images/big_sur_dark.webp)

`No đ` : --no-trim. Keeps transparent margins from the mask.

![no_trim](src/images/no_trim.webp)

Here is a small schema to explain the principle :

![schema_trim](src/images/schema_trim.webp)

4. `đ Ouput format` : corresponds to the `--verbose` folderify argument. 

`Simple đ­` : simple output.

![log_simple](src/images/log_simple.webp)

`Detailed đŦ` : --verbose. Detail output.

![log_detailed](src/images/log_detailed.webp)

### đĨ Modify icons folders

Launch the first flow with the `đšī¸ Trigger 1`, choose the folder you want to modify and press â.

![trigger1_1](src/images/trigger1_1.webp)

Choose the mask that will be used for generating the new icon and press â.

![trigger1_2](src/images/trigger1_2.webp)

### đ§ Generate icns and iconset files

Launch the second flow with the `đšī¸ Trigger 2`, choose the mask you want to modify and press â.

![trigger2_1](src/images/trigger2_1.webp)

### đŠ Alfred Buffer and Universal Actions

For both flows, you can use the `Alfred Buffer` to select multiple folder(s) (flow 1) or maks(s) (flow 2).

`Alfred Buffer` basic commands are :

* âĨâ to add a file to the buffer from Alfred's results.
* âĨâ to add a file and move to the next item in your list of results.
* âĨâ to remove the last item from the buffer.
* âĨâ to action all items in the buffer.
* âĨâĢ to remove all items from the buffer.

To know more on how to use `Alfred Buffer`, follow this [link](https://www.alfredapp.com/help/features/file-search/#file-buffer).

đĄ Note that `Alfred Buffer` is preferred compare to the `{query}`, meaning that if you select a folder/image (by clicking on it or by pressing enter â) that is not included in the buffer, **it will not be compressed**.

![alfred_buffer1](src/images/alfred_buffer1.webp)

![alfred_buffer2](src/images/alfred_buffer2.webp)

For both flows you can use the corresponding `Alfred Universal Actions` :

1. If you want to start the first flow, select one or multiple folders and select `Modify folder icon`.

![universal1](src/images/universal1.webp)

2. If you want to start the second flow, select one or multiple folders and select `Create folder icon from mask`.

![universal2](src/images/universal2.webp)

### đ Logs output

Check the logs of the folderify command under the `Data folder`. The log file contains the 3 parts :
1. Date and time of the workflow launch.
2. Workflow options.
3. Folderify command detailed.
4. Folderify output.

đĄ Note that each workflow run is separated by a line.

![log_simple](src/images/log_simple.webp)

## âī¸ License

[MIT License](LICENSE) ÂŠ Benjamin Oddou
