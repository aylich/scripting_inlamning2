#Funktion för hämta info om särskild Pokémon
function Get-PokemonInfo {
    param ($pokemonName)

    $url = "https://pokeapi.co/api/v2/pokemon/$pokemonName"

    try {
        $response = Invoke-RestMethod -Uri $url -Method Get

         # Extrahera statistik från API i en hashtabell
        $stats = @{}
        foreach ($stat in $response.stats) {
            $statName = $stat.stat.name
            $baseStat = $stat.base_stat
            $stats[$statName] = $baseStat
        }

        # Visa info om Pokémon i ett listformat (PSCustomObject)
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
            Abilities        = ($response.abilities | ForEach-Object { $_.ability.name }) -join ", "  # Specifiering
        }
    }
    catch {
        Write-Host "Can't show info. Check the name of the Pokémon or API-status."
    }
}