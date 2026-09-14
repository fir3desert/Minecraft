# AFKMod

AFKMod is a lightweight utility mod for Minecraft that makes AFK status simple and quick to use.

## Command

The entire AFK feature is controlled by a single command:

- `/afk`

When used, the player enters AFK mode and gains:

- invulnerability
- glowing effect
- protection from being damaged while standing still

The glowing effect remains active until the player moves.

## Behavior

This mod is designed for players who want to safely stand still in-game without being interrupted by combat or environmental hazards while they are away.

## Bug

There is a known bug in the current version:

If a player activates `/afk` and then disconnects from the server, the protection does not fully reset normally. As a result, mobs, drowning, fire damage, and similar damage sources will no longer affect the player after reconnecting or while the AFK state is still effectively active.

This is unintended behavior and may be considered a protection-state desync bug.

## Notes

- Intended use: stand still safely while AFK
- Current command: `/afk`
- Main effect: invulnerability + glowing until movement is detected
- Known issue: disconnecting while AFK can leave the player effectively immune to damage from mobs and environmental hazards

