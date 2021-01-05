# GodotFun

Following the [tutorial from Getting Started with Godot](https://docs.godotengine.org/en/stable/getting_started/step_by_step/your_first_game.html).

# Added

* Shader for the game background

* Touch driver for running on phone

I found there [already was one in the iOS guide](https://docs.godotengine.org/en/stable/getting_started/step_by_step/exporting.html?highlight=ios#ios), but I've stuck with mine.

![Godot Fun](GodotFun.gif)

_Screen cap from actual iPhone 8+_

## To Build

### Pre Reqs

* Get [Godot Engine](https://godotengine.org/download/windows)

* Get the zip file `dodge_assets.zip` from [the Project Setup for the tut](https://docs.godotengine.org/en/stable/getting_started/step_by_step/your_first_game.html#project-setup).

* Build environment for a [Godot compatible touchscreen device, eg iPhone](https://docs.godotengine.org/en/stable/getting_started/step_by_step/exporting.html?highlight=ios#ios)

* Export templates for [Godot targets](https://docs.godotengine.org/en/stable/getting_started/step_by_step/exporting.html?highlight=ios#export-templates)

### Steps

* Clone/Download this repo eg to `~/GodotFun`

* Unzip the `dodge_assets.zip` inside that, eg `~/GodotFun/dodge_assets`

* Run Godot & open the project

* Run the project on the desktop inside Godot to confirm it works (3.1 is supported)

* Use `Project > Export...` to export to eg `~/GodotFun/ios`

* Run the resulting project in eg XCode or Android Studio
