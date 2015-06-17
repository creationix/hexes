# Hexes

This is a simple game that run above a luvi http server and WebSocket to sync up piece movements between all players.

## Get it!

All you need is [lit](https://github.com/luvit/lit#installing-lit) installed on your system . 

You then download and build this using:

    lit make lit://creationix/hexes
    
This will build an executable in your current directory
    
##Run it!

###unix

```bash
    ./hexes
```
###windows
    
```PowerShell
    hexes.exe
```

## Running as Luvit Script

You can also run the script directly using luvit or luvi.

Once the code is checked out, run this from the root of the code tree and lit will grab all the dependencies automatically.

    lit install

To start the server simply type the following in this folder:

    luvit main.lua

Or run as an unpackaged luvi app with:

    luvi .

## Testing

Once the server is running, go to http://localhost:8080/ in a modern browser to see the game served from your local laptop.

To play, simply click (or tap) on a piece, and then click where you want it to go.  Open the same url in a couple browser windows to see them stay synced.
