# WIP

# A Chop Shop for QBCore Framework
Features :
- Has a easily configurable PED for assignment of a random vehicle and location after a short while via email.
- The random location gives a 200 wide slightly transparent blue blip over the approximate vehicle location.  The vehicle can be anywhere within that zone, and the zone moves around the vehicle location.
- All locations and vehicles easily configurable in the Config file.
- Won't assign the same vehicle or location twice in a row.
- Utilized the vehicle bones for QB-Target Exports to only show on assigned vehicle, and only usable in assigned Chop Shop Zone

Issues :
- Runs at ~0.01 most of the time, but when inside of Chop Shop Zone with assigned car it will jump to ~0.07 or so while actively chopping a vehicle.
- Occasionally the assigned car can spawn on top of a local car if there is one in the same spot.  Still trying to figure out a way to check if theres a car there that isn't being utilized or owned by a player and replace it with the assigned car, until then its just an unfortunate thing to happen.

## Dependencies :
QB Framework
PolyZone
qb-target
progressbar
