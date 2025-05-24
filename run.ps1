# Välkomnar användaren
Write-Host "Hello User!"

# Ber användaren att skriva in en pokemon och sparar det i en variabel
$pokemonName = Read-Host "Please enter the name of a pokemon:"

# Anropar modulfilen
Import-Module "$PSScriptRoot\GetPokemonInfo.psm1"

# Anropar funktionen från modulfilen
Get-PokemonInfo -pokemonName $pokemonName
