#Funktion för hämta info om särskild Pokémon
function Get-PokemonInfo {
    param ($pokemonName)

    $url = "https://pokeapi.co/api/v2/pokemon/$pokemonName"

    try {
        $response = Invoke-RestMethod -Uri $url -Method Get

        # Visa info om Pokémon i ett listformat (PSCustomObject)
        [PSCustomObject]@{
            Name       = $response.name
            ID         = $response.id
            Types      = ($response.types | ForEach-Object { $_.type.name }) -join ", "
            Abilities  = ($response.abilities | ForEach-Object { $_.ability.name }) -join ", "
        }
    }
    catch {
        Write-Host "Can't show info. Check the name of the Pokémon or API-status."
    }
}

# Anropa funktionen:
Get-PokemonInfo -pokemonName "pikachu"