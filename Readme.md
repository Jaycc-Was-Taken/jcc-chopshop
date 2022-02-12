# WIP

## A Chop Shop for QBCore Framework
Features :
- The random location gives a 200 wide slightly transparent blue blip over the approximate vehicle location.  The vehicle can be anywhere within that zone, and the zone moves around the vehicle location.
- All locations and vehicles easily configurable in the Config file.
- Won't assign the same vehicle or location twice in a row.
- Utilized the vehicle bones for QB-Target Exports to only show on assigned vehicle, and only usable in assigned Chop Shop Zone

## Issues :
- Runs at ~0.01 most of the time, but when inside of Chop Shop Zone with assigned car it will jump to ~0.07 or so while actively chopping a vehicle.  Any ideas to help optimize this would be greatly appreciated!
- Occasionally the assigned car can spawn on top of a local car if there is one in the same spot.  Still trying to figure out a way to check if theres a car there that isn't being utilized or owned by a player and replace it with the assigned car, if anyone has any ideas please let me know.
## Currently Working On :
- I'm trying to figure out a good way to have a grouping system (this is more overall for QBCore as a whole) so that players can sign up for jobs together.
- Still working on rewards, obviously change as you need.
- Working on getting it to run better during the last chop cycle (chopping the whole body)
- Would like to have multiple drop off locations for the vehicle that it gives at random after you obtain it rather than just 1 location.

## Dependencies :
- QB Framework
- PolyZone
- qb-target
- progressbar
- legacyfuel - But this is easy to change to whatever you use

## Preview :
https://www.youtube.com/watch?v=U8l9bOC-7-Y