"1.",
for $a in doc("factbook.xml")/mondial/continent
return $a /@name/string(),
"2.",
for $a in doc("factbook.xml")/mondial/river[10]
return $a /@name,
"3.",
for $area in doc("factbook.xml")/mondial/island
where $area /@area = 13935
return $area /@name,
"4." ,
for $notf in doc("factbook.xml")/mondial/country
where $notf [count (border) = 0]
return $notf //@name,
"5.",
for $miembro in doc("factbook.xml")/mondial/organization
where $miembro [count(members) > 5]
return $miembro /@name,
"6.",
for $miembro in doc("factbook.xml")/mondial/country/province
where $miembro /@name= "Madrid"
let $a := $miembro
return $a /following-sibling::*/@name,
"7.",
for $pop in doc("factbook.xml")/mondial/country
where $pop /@population < 1000000
return $pop/@name | $pop/@government,

"8.",
for $a in doc("factbook.xml")/mondial/country/province/city
where $a /@name="Cordoba"
return $a /../../@name,
"9.",
for $a in doc("factbook.xml")/mondial/
country
where $a /@name="Russia"
let $b := $a/@id
for $c in doc("factbook.xml")/mondial/
lake/located
where $c /@country=$b
let $d := $c/../@name
return $d,
"10.",
for $a in doc("factbook.xml")/mondial/
continent
where $a /@name="Europe"
let $b := $a/@id
for $c in doc("factbook.xml")/mondial/country/encompassed
where $c /@continent=$b
let $d := $c/../@name
return $d