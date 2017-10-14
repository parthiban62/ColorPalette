Problem Overview

Build a simple server & frontend presenting a user with a 20x20 grid of squares the user can "draw" on to create a simple design.

Requirements
The user should have a palette of colors to choose from
Clicking on a square colors it in with the user's currently selected color
Each visitor to the site should be assigned a randomly generated username (there does not need to be any login or authentication), which should be  shown to that visitor
Hovering over a colored in square should display in some way which user placed that color, and when it was placed
All visitors to the frontend should be presented with the same board, a visitor can overwrite the color of a previously-colored square (set by a different visitor or themselves)
The board should intermittently update to reflect any changes other users have made
Appropriate testing should be in place

Optional Challenges
Display a leaderboard of which users have placed the most colors, and what those users' favorite (most used) colors are
Assign the same username to the visitor across refreshes/ visits
Implement the frontend with a one-way data binding framework
Update the board in realtime using websockets



Implementation Details
Designed the user and palette model to track the users and the colors they were applying on each square. For generating dynamic username for the users who visits the site using the ip address of the request and if the user visits the site again retains the same username using the ip address. Tracking the color applied on the square/tile by using the Row X Column position of the square/tile.