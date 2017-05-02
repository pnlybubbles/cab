# cab

# Requirements

* iterm2 (~3.1 Recommended)
* docker
* nerd-fonts (Optional)
* AdobeSourceCodePro (Optional)

# Installation

* clone
* `./bin/cab build`
* `./bin/cab start`
* `./bin/cab sh`

# Optional Installation

* iTerm2: Pref -> Profiles -> Colors -> Color Presets... -> Import (Select `./cab.itermcolors` and apply)
* iTerm2: Pref -> Profiles -> Text -> (Apply font and non-ascii font)
* iTerm2: Pref -> Profiles -> General -> (Set "Name" to blank)
* iTerm2: Pref -> Appearance -> Theme (Select Dark)
* iTerm2: Pref -> Appearance -> Window (Uncheck "Show line under...")
* iTerm2: Pref -> Appearance -> Window (Check "Hide scrollbar")
* iTerm2: Pref -> Appearance -> Window & Tab Titles (Only check "Show profile name")
* iTerm2: Pref -> Advanced -> (Search "mergin") -> General -> (Set mergins to 25, 25)

# Docker Configuration

Remap detach keys inside container

`~/.docker/config.json`

```json
{
    "detachKeys": "ctrl-\\"
}
```

# Usage

## Run container

### Basic

```
$ d node index.js
```

### Port forwarding

```
$ d --port 4000 node index.js
$ d --status # to check port attached to host
```

More detail to hit `d --help`

