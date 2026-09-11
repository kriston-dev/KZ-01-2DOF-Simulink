C:

cd C:\Program Files\FlightGear 2024.1

SET FG_ROOT=C:\Program Files\FlightGear 2024.1\data

START .\\bin\fgfs.exe --fdm=null --native-fdm=socket,in,30,localhost,5502,udp  --enable-terrasync  --aircraft=c172p --fog-fastest --disable-clouds --start-date-lat=2004:06:01:09:00:00 --disable-sound --in-air --airport=KSEA --runway=34R --altitude=0 --heading=0 --offset-distance=0 --offset-azimuth=0  
