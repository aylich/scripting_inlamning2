# Välkomnar användaren
Write-Host "Hello User!"

# Ber användaren att skriva in sitt stjärntecken och sparar det i en variabel
$pokemonName = Read-Host "Please enter the name of a pokemon:"

# Anropar modulfilen
Import-Module "$PSScriptRoot\GetPokemonInfo.psm1"

# Anropar funktionen från modulfilen
Get-PokemonInfo -pokemonName $pokemonName
