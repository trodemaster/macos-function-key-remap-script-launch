# macos-function-key-remap-script-launch
This repo is a reference implementation of using opensource tools to re-map function keys on macOS keyboard. Also provides ability to run shell scripts from function key press. I really just wanted 100% control of all the function keys. Using the built in Keyboard System Preferences and automator services is not reliable or fast enough. 

The first tool is a "Simple hotkey daemon for macOS" which intercepts keyboard input. Each key or key combo triggers a shell application or script. 
skhd
https://github.com/koekeishiya/skhd

The second tool cliclick is a powerful tool for trigging all kinds of keyboard and mouse activity. 
cliclick
https://github.com/BlueM/cliclick

To get this setup working first remove any other keyboard utilities to remove conflicts. Open the system preferences keyboard panel and on the Keyboard tab select "Use F1, F2, etc. keys as standard function keys". These two steps insure that when you push a F1 key that the system receives F1.

![Keyboard preferences enabling standard function keys](screenshot/function-key-toggle.png?raw=true "Keyboard Preferences")

# Install skhd
If you use brew then {brew install skhd}. Alternately cloning from github and building with Xcode was problem free. Just rember to install the launchd .plist 
    sudo cp skhd/examples/com.koekeishiya.skhd.plist ~/Library/LaunchAgents/
I also updated the path key to include my $GOPATH/bin with the variable expanded as the launchd context will not have standard environment variables.

Copy the example config file from this repo to your home dir.
    cp macos-function-key-remap-script-launch/skhdrc ~/.skhdrc

Start the skhd agent
    launchctl load -w ~/Library/LaunchAgents/com.koekeishiya.skhd.plist

Approve the skhd binary for Accessibility access in system preferences after being prompted.
SCREENSHOT

# Install cliclick
Both brew and MacPorts have cliclick so install that via one of the two options
```
   sudo port install cliclick
```
OR
   brew install cliclick

# Configuring and testing the setup
The launchd .plist is configured by default to log skhd to the following two files. I found it useful to tail -f the .out file when configuring the settings.
    /tmp/skhd.err
    /tmp/skhd.out

Edit the ~/.skhdrc example file and adjust to your desired actions. The example from this repo is setup for customizing function keys but the tool can handle any combination of key chords. The authors repo has lots of examples for complex input for managing terminal windows. 

