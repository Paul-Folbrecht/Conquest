Conquest is a large-scale, abstract wargame in the vein of many games that have gone before it.  In particular, it bears a strong resemblance to a game known as "Empire" that has been around in one form or another for decades. I also have to name Sid Meier's Civilization as a strong influence.

Conquest falls into the category of what is known as a “Triple-E" game - Explore, Expand, Exterminate. You win by overcoming your opponent(s) and you do this by building a production base large enough to build a force sufficient for the task.

The game is played on a randomly-generated map that includes terrain types of water, plains, swamp, forest, and mountains.  Scattered about the map are a number of cities; capturing cities is the essence of the game.  Each player starts with a single city from which he begins his conquest. 

I wrote the first version of the game in C++ in the late 90s, then wrote it over in Java in the early 2000s.  I dusted it off in the fall of 2019 and made some enhancements, and plan to continue development.

## Build and run on macOS

Install a Java 21 JDK matching your Mac (ARM64 for Apple Silicon, x64 for Intel).
With Homebrew:

```sh
brew install openjdk@21
export JAVA_HOME="$(brew --prefix openjdk@21)/libexec/openjdk.jdk/Contents/Home"
```

Set `JAVA_HOME` in each new Terminal session, or add the export to `~/.zshrc`.
From the project directory:

```sh
./build.sh
./startConquest.sh
```

The launcher honors `JAVA_HOME` when set; otherwise it uses macOS Java discovery,
then `java` on PATH. For example, with a Homebrew JDK:

```sh
JAVA_HOME=/opt/homebrew/opt/openjdk@21 ./startConquest.sh
```

## Share a compiled copy

With Java 21 selected via `JAVA_HOME`, run:

```sh
./package.sh
```

This builds the game and creates `Conquest-Mac.zip`, replacing any previous archive.
Email that zip. It contains one `Conquest/` folder with:

- `startConquest.sh`
- `classes/` — compiled `com/` tree, `images/`, `maps/`, and properties files
- `lib/`
- `README.md`

The archive includes all of `classes/maps/`, including any personal saved games. Source files,
IDE settings, and `out/` are not needed. Java itself is not included in this zip.

The recipient should install a Java 21 JDK, extract the zip into a writable
folder, open Terminal in the extracted `Conquest/` folder, and run:

```sh
sh ./startConquest.sh
```

Use Terminal rather than double-clicking the `.sh` file in Finder. The same
compiled game files work on Intel and Apple Silicon Macs, with the matching JDK.
