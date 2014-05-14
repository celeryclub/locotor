# Locotor

Step-by-step mapping via text message.


http://maps.googleapis.com/maps/api/directions/json?origin=114 newel street&destination=meserole at diamond&region=us&sensor=false&mode=walking

## Prerequisites

You should already have Ruby and Redis installed. If necessary, you can install them via [Homebrew](http://brew.sh).





# Message formats

## Send to server
meserole at diamond
114 newel st

## Recieve from server



## TODO

receiving from phone
  domain setup
sending to phone


## ENV vars

export SENDGRID_USERNAME=stephendavis89
export SENDGRID_PASSWORD=fland3rs

heroku config:set SENDGRID_USERNAME=stephendavis89 SENDGRID_PASSWORD=fland3rs



## Curl test

curl http://localhost:5000

curl -d "from=stephendavis89@gmail.com&text=114%20newel
meserole%20at%20diamond" http://localhost:5000

curl -d "from=stephendavis89@gmail.com&text=114%20newel
meserole%20at%20diamond" http://locotor.com/



<!-- response = '{
   "routes" : [
      {
         "bounds" : {
            "northeast" : {
               "lat" : 40.72847730,
               "lng" : -73.94817290
            },
            "southwest" : {
               "lat" : 40.72619260,
               "lng" : -73.94932439999999
            }
         },
         "copyrights" : "Map data ©2013 Google",
         "legs" : [
            {
               "distance" : {
                  "text" : "0.2 mi",
                  "value" : 321
               },
               "duration" : {
                  "text" : "4 mins",
                  "value" : 230
               },
               "end_address" : "Meserole Avenue & Diamond Street, Brooklyn, NY 11222, USA",
               "end_location" : {
                  "lat" : 40.72847730,
                  "lng" : -73.94849409999999
               },
               "start_address" : "114 Newell Street, Brooklyn, NY 11222, USA",
               "start_location" : {
                  "lat" : 40.72619260,
                  "lng" : -73.94817290
               },
               "steps" : [
                  {
                     "distance" : {
                        "text" : "0.2 mi",
                        "value" : 245
                     },
                     "duration" : {
                        "text" : "3 mins",
                        "value" : 176
                     },
                     "end_location" : {
                        "lat" : 40.72821550,
                        "lng" : -73.94932439999999
                     },
                     "html_instructions" : "Head \u003cb\u003enorthwest\u003c/b\u003e on \u003cb\u003eNewell St\u003c/b\u003e toward \u003cb\u003eNorman Ave\u003c/b\u003e",
                     "polyline" : {
                        "points" : "uiqwF`_jbMeAf@oI|D"
                     },
                     "start_location" : {
                        "lat" : 40.72619260,
                        "lng" : -73.94817290
                     },
                     "travel_mode" : "WALKING"
                  },
                  {
                     "distance" : {
                        "text" : "249 ft",
                        "value" : 76
                     },
                     "duration" : {
                        "text" : "1 min",
                        "value" : 54
                     },
                     "end_location" : {
                        "lat" : 40.72847730,
                        "lng" : -73.94849409999999
                     },
                     "html_instructions" : "Turn \u003cb\u003eright\u003c/b\u003e onto \u003cb\u003eMeserole Ave\u003c/b\u003e",
                     "maneuver" : "turn-right",
                     "polyline" : {
                        "points" : "kvqwFffjbMs@eD"
                     },
                     "start_location" : {
                        "lat" : 40.72821550,
                        "lng" : -73.94932439999999
                     },
                     "travel_mode" : "WALKING"
                  }
               ],
               "via_waypoint" : []
            }
         ],
         "overview_polyline" : {
            "points" : "uiqwF`_jbMuKdFs@eD"
         },
         "summary" : "Newell St",
         "warnings" : [
            "Walking directions are in beta.    Use caution – This route may be missing sidewalks or pedestrian paths."
         ],
         "waypoint_order" : []
      }
   ],
   "status" : "OK"
}' -->
