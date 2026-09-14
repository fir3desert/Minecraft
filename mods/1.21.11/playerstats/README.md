# PlayerStats

Server-side Fabric mod for Minecraft 1.21.11 that tracks and displays per-player statistics.

## What it tracks

The mod records:

- Blocks mined
- Mobs killed
- Items crafted
- Items traded
- Deaths
- Playtime
- Distances traveled:
  - Walking
  - Sprinting
  - Swimming
  - With elytra

Player data is stored in JSON files inside the server configuration directory.

On first launch, the mod automatically creates:

- `config/playerstats/config.json`
- `config/playerstats/data/`

## Commands

### `/stats`

Shows your own statistics.

Example:

```text
/stats
```

### `/stats <player>`

Shows the statistics of a specific connected player.

Example:

```text
/stats fir3
```

### `/stats top <category>`

Shows the top 10 players for a specific category.

Available categories:

- `blocks_mined`
- `mobs_killed`
- `items_crafted`
- `items_traded`
- `deaths`
- `playtime`

Examples:

```text
/stats top blocks_mined
/stats top mobs_killed
/stats top playtime
```

## Configuration options

The configuration file is generated at:

```text
config/playerstats/config.json
```

Default values:

```json
{
  "saveIntervalTicks": 6000,
  "topPlayersCount": 10,
  "enableAchievements": true
}
```

### Option explanations

- `saveIntervalTicks`: automatic save interval in ticks. 6000 ticks equals 5 minutes.
- `topPlayersCount`: maximum number of players displayed in the ranking.
- `enableAchievements`: flag for enabling achievement-related features (currently defined in config, while the main system is already built around command and data tracking).

## Saved data

Each player has an individual file here:

```text
config/playerstats/data/<uuid>.json
```

This allows statistics to persist across server restarts.

## Notes

This mod is intended as a server statistics system and syncs native Minecraft stats with its own internal storage.
