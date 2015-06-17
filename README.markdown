# Hexes

This is a simple game that uses a luvit/luvi server and websockets to sync up
piece movements between all players.

## Get It!

First make sure you have [lit][] installed on your system.  Then to you can
download and build the application in one step by running:

```sh
lit make lit://creationix/hexes
```

### Running on Linux / OSX / FreeBSD

If you're on a bsd style system, you'll have a `hexes` binary in your current
directory.  Simply run it with:

```sh
./hexes
```

### Running on windows

If you're on Windows, you'll have a `hexes.exe` binary in your current
directory.  Simply run it with:

```powershell
hexes.exe
```

## Building from Git

If you want to hack on the program, clone it from GitHub and run directly off
the filesystem using [luvi][].

```sh
git clone git@github.com:creationix/hexes.git
cd hexes
lit install
luvi .
```

## Running as Luvit Script

Even though this is packaged as a [luvi][] app, you can also run it directly as
a [luvit][] script.  Most luvi apps can also be run with luvit.

```sh
git clone git@github.com:creationix/hexes.git
cd hexes
lit install
luvit main.lua
```

## Testing

Once the server is running, go to http://localhost:8080/ in a modern browser to
see the game served from your local laptop.

To play, simply click (or tap) on a piece, and then click where you want it to
go.  Open the same url in a several browser windows to see them stay synced.

[lit]: https://github.com/luvit/lit
[luvit]: https://luvit.io/
[luvi]: https://github.com/luvit/luvi
