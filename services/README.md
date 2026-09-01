# Services

This project includes a service setup to keep the Minecraft server console persistent and available for running commands continuously.

## Purpose

The service is designed to keep the server running in the background so it does not stop when the terminal is closed or the session ends.

## What it does

- Keeps the Minecraft server process alive
- Maintains a persistent console session
- Allows commands to be sent and executed while the server stays running
- Helps ensure the server remains available without manual restarts

## Typical use

You can use this service to:

- start the Minecraft server
- keep it active in the background
- send commands through the console when needed
- manage the server without needing to keep an interactive terminal open

## Summary

This service is meant to provide a persistent Minecraft server console so the server can stay online and accept commands reliably over time.
