# Notebook Toolkit

A unified Termux launcher for three notebook utilities: Rust Story Vault, Go Sync Server, and Java Notebook Studio.

## Requirements

- Termux on Android
- Rust and Cargo
- Go
- Java 21 and Gradle
- The three projects installed in their expected folders under `$HOME`

## Launch

```sh
notebook-toolkit
```

You can also run `./toolkit.sh` from this repository directory.

## Menu options

1. Rust Story Vault: opens the Rust CLI help.
2. Go Sync Server: starts the local read-only API on `127.0.0.1:8080`.
3. Java Notebook Studio: opens the Java CLI help.
4. Validate all projects: runs Rust validation, Go tests, and Java tests and notebook validation.
5. Exit: closes the launcher.

## Notebook data

The tools use the configured notebook JSON file. Back up important data before making changes with any tool that supports editing.

## License

MIT
