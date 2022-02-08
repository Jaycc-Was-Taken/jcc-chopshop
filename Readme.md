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
- Not 100% sure it's an issue, but on my test server I don't have a lot of local cars, so I'm not sure if a local car will occasionally be in the spot that spawns the car.  If that happens just put let me know and I'll redo the spots into non parking spots only to ensure that won't happen. I've had local cars spawn in the space next to it but never in the exact location so just be advised it could happen.

## Dependencies :
QB Framework
PolyZone
qb-target
progressbar
