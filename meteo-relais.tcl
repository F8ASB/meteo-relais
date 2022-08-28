#
# FONCTION METEO openweathermap
#



proc WeatherInfo {} {

set runcmd [exec python3 /home/SVXCARD/meteo-relais.py];
set splitmeteo [split $runcmd /]
lassign $splitmeteo temperature tempmini tempmaxi pression humidite ventDirection ventVitesse

puts "Temperature: $temperature °"
puts "Temperature mini: $tempmini °"
puts "Temperature maxi: $tempmaxi °"
puts "Pression atmospherique $pression Hpa"
puts "Humidité $humidite %"
puts "Direction du vent: $ventDirection °"
puts "Vitesse du vent $ventVitesse km/h"

#
#lecture bulletin meteo
#

playMsg "SVXCard/Weatherstation" "weatherinfo"

#
#Temperature exterieur
#

playMsg "SVXCard/Weatherstation" "tempext"
playTemp $temperature

#
#Temperature mini
#

#playMsg "SVXCard/Weatherstation" "tempmini"
#playTemp $tempmini


#
#Temperature maxi
#

#playMsg "SVXCard/Weatherstation" "tempmaxi"
#playTemp $tempmaxi



#
#Pression atmospherique
#

playMsg "SVXCard/Weatherstation" "pressure"
playFourDigitNumber $pression
playMsg "SVXCard/Weatherstation" "hpa"


#
#Humidité
#

playMsg "SVXCard/Weatherstation" "Humity"
playNumber  $humidite
playMsg "Default" "percent"

#
#Direction du vent
#

playMsg "SVXCard/Weatherstation" "winddir"
playTemp $ventDirection
playMsg "SVXCard/Weatherstation" "degrees"

#
#Vitesse du vent
#

playMsg "SVXCard/Weatherstation" "windspeed"
playNumber  $hventVitesse
playMsg "SVXCard/Weatherstation" "kmh"

return 1

}
