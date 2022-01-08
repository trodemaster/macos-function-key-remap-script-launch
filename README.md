# macos-function-key-remap-script-launch
This repo is a reference implementation of using opensource tools to re-map function keys on macOS keyboard. Also provides ability to run shell scripts from function key press. I really just wanted 100% control of all the function keys. Using the built in Keyboard System Preferences and automator services is not reliable or fast enough. 

The first tool is a "Simple hotkey daemon for macOS" which intercepts keyboard input. Each key or key combo triggers a shell application or script. 

*skhd* https://github.com/koekeishiya/skhd

The second tool cliclick is a powerful tool for trigging all kinds of keyboard and mouse activity. 

*cliclick* https://github.com/BlueM/cliclick

To get this setup working first remove any other keyboard utilities to remove conflicts. Open the system preferences keyboard panel and on the Keyboard tab select "Use F1, F2, etc. keys as standard function keys". These two steps insure that when you push a F1 key that the system receives F1.

![Keyboard preferences enabling standard function keys](screenshot/function-key-toggle.png?raw=true "Keyboard Preferences")

# Install skhd
Both macports and brew have the binary available. For reference or if you have macports installed take a look at install.sh 

Approve the skhd binary for Accessibility access in system preferences after being prompted.
![Keyboard preferences enabling standard function keys](screenshot/skhd-accessibility.png?raw=true "Keyboard Preferences")

# Install cliclick
Both brew and MacPorts have cliclick so install that via one of the two options. The cliclick is providing the abiilty to use the media keys and other hard to simulate keys. Seems really powerful and likely can do all kinds of crazy stuff with it. 

```sudo port install cliclick```

OR

```brew install cliclick```

# Configuring and testing the setup
The launchd .plist is configured by default to log skhd to the following two files. I found it useful to tail -f the .out file when configuring the settings.
```
/tmp/skhd.err
/tmp/skhd.out
```

# Edit the ~/.skhdrc example file
The example file ```skhdrc``` in this repo is setup for customizing function keys but the tool can handle any combination of key chords. The skhd author's repo has lots of examples for complex input for managing terminal windows. 

