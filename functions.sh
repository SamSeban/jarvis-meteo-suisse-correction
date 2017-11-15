#!/bin/bash
# Here you can create functions which will be available from the commands file
# You can also use here user variables defined in your config file
# To avoid conflicts, name your function like this
# pg_XX_myfunction () { }
# pg for PluGin
# XX is a short code for your plugin, ex: ww for Weather Wunderground
# You can use translations provided in the language folders functions.sh

jv_pg_ms_snow() {
	local json="$(curl -s https://www.prevision-meteo.ch/services/json/$jv_pg_ms_city)"
	local match=""
	match+="$(echo "$json" | jq -r "$match.current_condition.condition")"
	if [[ $match =~ .*neige.* ]] #si neige existe dans text alors on allume
	then
		hue lights 1,2 on
		say "Alerte ! tu dois te réveiller."
		say "Voici les conditions météo actuelle :"
		say "$match"
	fi
}
jv_pg_ms_weather_now() {
	local json="$(curl -s https://www.prevision-meteo.ch/services/json/$jv_pg_ms_city)"
	local tmp=$(echo "$json" | jq -r "$match.current_condition.tmp")
	say "Voici les conditions météo actuelle :"
	say "$(echo "$json" | jq -r "$match.current_condition.condition")." #exemple nuit clair et stratus
	say "Température $(echo "$tmp" | sed -r 's/[-]+/moins  /g' ) degré." #on remplace tiret par moins 
	say "humidité $(echo "$json" | jq -r "$match.current_condition.humidity") pourcent." #on remplace tiret par moins

	#on va donner des conseils maintenant
	if [[ $(echo "$json" | jq -r "$match.current_condition.condition") =~ .*pluie|averse.* ]]
	then
		say "pense à prendre un parapluie"
	fi
}
jv_pg_ms_weather_tomorrow() {
	local json="$(curl -s https://www.prevision-meteo.ch/services/json/$jv_pg_ms_city)"
	local match=""
	local tmpmin=$(echo "$json" | jq -r "$match.fcst_day_1.tmin")
	local tmpmax=$(echo "$json" | jq -r "$match.fcst_day_1.tmax")
	say "Voici les conditions météo pour demain :"
	say "$(echo "$json" | jq -r "$match.fcst_day_1.condition")." #exemple nuit clair et stratus
	say "Température, minimum $(echo "$tmpmin" | sed -r 's/[-]+/moins  /g' ) degré, maximum  $(echo "$tmpmax" | sed -r 's/[-]+/moins  /g' ) degré." #on remplace tiret par moins 
}
jv_pg_ms_weather_today() {
	local json="$(curl -s https://www.prevision-meteo.ch/services/json/$jv_pg_ms_city)"
	local match=""
	local tmpmin=$(echo "$json" | jq -r "$match.fcst_day_0.tmin")
	local tmpmax=$(echo "$json" | jq -r "$match.fcst_day_0.tmax")
	say "La météo du jour:"
	say "$(echo "$json" | jq -r "$match.fcst_day_1.condition")." #exemple nuit clair et stratus
	say "Température, minimum $(echo "$tmpmin" | sed -r 's/[-]+/moins  /g' ) degré, maximum  $(echo "$tmpmax" | sed -r 's/[-]+/moins  /g' ) degré." #on remplace tiret par moins 

	#on va donner des conseils maintenant
	if [[ $(echo "$json" | jq -r "$match.current_condition.condition") =~ .*pluie|averse.* ]]
	then
		say "Il faudra mettre ton pantalon de pluie"
	fi
}