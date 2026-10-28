# Aula F75 Max — User Guide

`aula` is a command-line tool for controlling your **Aula F75 Max** keyboard: lighting, battery, performance, game mode, and clock sync.

## Install

1. Make sure Python 3 and `hidapi` are installed.
   - Arch/Manjaro: `sudo pacman -S hidapi python`
2. Run the installer from this folder:

   ```sh
   ./install.sh
   ```

   This makes the `aula` command available in your terminal.
3. Plug in the keyboard's 2.4G dongle for most features (USB-C for clock sync).

## Basic use

```sh
aula <command> [options]
```

If you type something that isn't a known command, `aula` assumes you mean a lighting effect:

```sh
aula red        # same as: aula light red
```

## Commands

### Lighting

List all available effects:

```sh
aula light --list
```

Set an effect:

```sh
aula light <effect> [options]
```

Options:
- `-b, --brightness` — 1 to 5 (default 4)
- `-s, --speed` — 1 to 5 (default 3)
- `-d, --direction` — 0 to 3 (default 0)
- `-c, --color` — hex color, e.g. `ff0000` (default `ffffff`)
- `--colorful` — enable colorful mode

Examples:

```sh
aula light spectrum -b 5 -s 4
aula light 7 -c ff0000
aula static -b 3
```

### Battery

```sh
aula battery
# Battery: 42%
```

### Performance

Adjust response level and sleep timeout:

```sh
aula perf -l 3 --sleep 2
```

- `-l, --level` — response level 1 to 5 (default 2)
- `--sleep` — 0 = none, 1 = 1 min, 2 = 5 min, 3 = 30 min (default 2)

### Game mode

```sh
aula game-mode --on -l 3 --sleep 2
aula game-mode --off
```

Enables or disables game mode and sets response level and sleep timeout like `perf`.

### Sync clock

```sh
aula sync-time
```

Syncs the keyboard clock to your computer's current time. The keyboard must be connected via USB-C.

## Troubleshooting

- **"Dongle not found"** — plug in the 2.4G receiver and try again.
- **"Wired keyboard not found"** — connect the keyboard with USB-C for `sync-time`.
- **Command not found** — run `./install.sh` again, or add `~/.local/bin` to your `PATH`.
- **Permission errors** — your user may need access to the hidraw device; try running with `sudo` or set up udev rules.