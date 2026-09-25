# ufw-allow-ip.sh

Script for allowing an IPv4 address to access the Minecraft server through
UFW. It is intended for servers where incoming WAN traffic is denied by
default and access is granted only to explicitly allowed IP addresses.

## What It Does

For the specified address, the script adds UFW rules allowing TCP traffic on:

- `25565`: Minecraft server port.
- `24454`: additional server port.

Each rule includes the supplied comment and the execution date and time. When
it finishes, the script displays the rules associated with the IP address.

## Requirements

- Linux with [UFW](https://help.ubuntu.com/community/UFW) installed.
- The script must be run as `root` or through `sudo`.
- A valid IPv4 address.
- UFW configured with the desired firewall policies.

The script does not install or enable UFW, and it does not change the global
inbound or outbound policies.

## Usage

From this directory:

```bash
sudo ./ufw-allow-ip.sh <IP> <COMMENT>
```

Example:

```bash
sudo ./ufw-allow-ip.sh 192.168.0.100 "fir3 linux"
```

The comment may contain spaces. The date and time are added automatically to
each rule's comment.

## Checking the Rules

To view all UFW rules:

```bash
sudo ufw status verbose
```

To view the rules with their numbers:

```bash
sudo ufw status numbered
```

UFW saves the rules automatically. To remove a rule, use its number with
`ufw delete`:

```bash
sudo ufw delete <RULE_NUMBER>
```

## Common Errors

The script exits with an error if:

- it is not run as `root`;
- the IP address or comment is missing;
- the address does not have a valid IPv4 format;
- UFW is not installed or is not available in the `PATH`.
