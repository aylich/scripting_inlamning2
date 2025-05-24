#Funktion för hämta info om särskild Pokémon
function Get-PokemonInfo {
    param ($pokemonName)

    $url = "https://pokeapi.co/api/v2/pokemon/$pokemonName"

    try {
        $response = Invoke-RestMethod -Uri $url -Method Get

         # Extraherar statistiken från API i tabellformat för att ta fram stats
        $stats = @{}
        foreach ($stat in $response.stats) {
            $statName = $stat.stat.name
            $baseStat = $stat.base_stat
            $stats[$statName] = $baseStat
        }

        # Visar info om Pokémon i ett listformat utifrån tabellen ovan (PSCustomObject)
        [PSCustomObject]@{
            Name             = $response.name
            ID               = $response.id
            HP               = $stats["hp"]
            Attack           = $stats["attack"]
            Defense          = $stats["defense"]
            'Sp. Attack'     = $stats["special-attack"]
            'Sp. Defense'    = $stats["special-defense"]
            Speed            = $stats["speed"]
            Types            = ($response.types | ForEach-Object { $_.type.name }) -join ", " # Specifiering av typ
            Abilities        = ($response.abilities | ForEach-Object { $_.ability.name }) -join ", "
        }
    }
    catch {
        Write-Host "Can't show info. Check the name of the Pokémon or API-status."
    }
}