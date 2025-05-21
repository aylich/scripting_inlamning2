# Välkomnar användaren
Write-Host "Hello user!"

# Ber användaren att skriva in sitt stjärntecken och sparar det i en variabel
$zodiacSign = Read-Host "Please enter your zodiac sign:"

#Hämtar modulfilen
Import-Module "$PSScriptRoot\Get-Horoscope.psm1"


Get-Horoscope
