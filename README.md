# KaliClean

A lightweight Bash-based cleanup utility for Kali Linux and other Debian-based distributions.

## Features

- Clean APT cache
- Remove unused packages
- Vacuum old system logs
- Clear user trash
- Remove thumbnail cache
- Deep cleanup mode
- Interactive CLI menu
- Command-line argument support

---

## Preview

```bash
=======================================
        KaliClean CLI Tool
=======================================

1) Basic Clean
2) Deep Clean
3) Exit
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/KaliClean.git
cd KaliClean
```

Make the script executable:

```bash
chmod +x clean.sh
```

---

## Usage

### Interactive Mode

```bash
sudo ./clean.sh
```

### Basic Cleanup

```bash
sudo ./clean.sh --basic
```

### Deep Cleanup

```bash
sudo ./clean.sh --deep
```

---

## What Gets Cleaned?

### Basic Clean
- APT package cache
- Unused packages
- Old system logs
- User trash
- Thumbnail cache

### Deep Clean
Includes everything in Basic Clean plus:
- Purging orphaned packages
- Removing old kernels safely

---

## Requirements

- Kali Linux / Debian-based distributions
- Root privileges (`sudo`)

---

## File Structure

```text
KaliClean/
├── clean.sh
├── README.md
└── LICENSE
```

---

## Safety Notes

This script uses safe cleanup commands commonly used on Debian/Kali systems.

Review the script before running:

```bash
nano clean.sh
```

---

## Future Improvements

- Disk usage analyzer
- Log size reporting
- GUI version
- Backup option before cleanup
- Custom cleanup profiles

---

## License

MIT License

---

## Author

Your Name / GitHub Username

---

## Contributing

Pull requests and improvements are welcome.
If you find bugs or want new features, open an issue.

---

## Disclaimer

Use this tool at your own risk. Always verify commands before running scripts with root privileges.
