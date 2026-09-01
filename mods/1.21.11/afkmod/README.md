# AFKMod

AFKMod is a Minecraft mod that adds a simple AFK system for players.

## Command

| Command | What it does |
| --- | --- |
| `/afk` | Toggles AFK mode on or off |

## Behavior

- The first time you use `/afk`, AFK mode is activated.
- The second time you use it, AFK mode is disabled.
- If the player moves while AFK, the AFK state is removed automatically.

## AFK effects

When a player is AFK:

- they receive the Glowing effect
- they have no hitbox and take no damage
- they appear effectively invisible
- they are treated as non-interactive for combat and collision purposes

## Broadcast messages

- Join AFK: `§7[AFK] §e<N> se ha puesto AFK.`
- Return manually: `§7[AFK] §a<N> ha vuelto de AFK.`
- Leave automatically after moving: `§7[AFK] §e<N> ha salido de AFK automáticamente al moverte.`

## Known bug

There is a bug when a player enables AFK and then disconnects without moving, and later reconnects.

In that case, the player can remain in the AFK state without taking damage from:

- fire
- drowning
- other harmful environmental damage

Hostile mobs also do not detect them as targets.

This happens because the AFK state is not being fully cleaned up when the player disconnects and reconnects, leaving the protective state active even after rejoining.

## Summary

AFKMod makes AFK players harmless and visually marked, while automatically removing their AFK state as soon as they move or leave the AFK state.
