#!/data/data/com.termux/files/usr/bin/bash

while true; do
  clear
  printf '\n'
  printf '%s\n' '========================================'
  printf '%s\n' '          NOTEBOOK TOOLKIT'
  printf '%s\n' '========================================'
  printf '\n'
  printf '%s\n' '  1) Rust Story Vault'
  printf '%s\n' '  2) Go Sync Server'
  printf '%s\n' '  3) Java Notebook Studio'
  printf '%s\n' '  4) Validate all projects'
  printf '%s\n' '  5) Exit'
  printf '\n'

  read -r -p "  Select an option: " choice
  printf '\n'

  case "$choice" in
    1)
      cd "$HOME/rust-work/rust-story-vault" || continue
      rv help
      read -r -p "Press Enter to return to menu..."
      ;;
    2)
      cd "$HOME/go-work/notebook-sync-server" || continue
      printf '%s\n' 'Starting Go Sync Server on 127.0.0.1:8080'
      printf '%s\n' 'Press Ctrl+C to stop the server.'
      go run .
      read -r -p "Press Enter to return to menu..."
      ;;
    3)
      cd "$HOME/java-work/java-notebook-studio" || continue
      gradle run --args="help"
      read -r -p "Press Enter to return to menu..."
      ;;
    4)
      printf '%s\n' '--- Rust Story Vault ---'
      (cd "$HOME/rust-work/rust-story-vault" && rv validate)
      printf '\n%s\n' '--- Go Sync Server tests ---'
      (cd "$HOME/go-work/notebook-sync-server" && go test ./...)
      printf '\n%s\n' '--- Java Notebook Studio tests ---'
      (cd "$HOME/java-work/java-notebook-studio" && gradle test && gradle run --args="validate")
      printf '\n'
      read -r -p "Press Enter to return to menu..."
      ;;
    5)
      printf '%s\n' 'Notebook Toolkit closed.'
      exit 0
      ;;
    *)
      printf '%s\n' 'Invalid option. Choose 1 through 5.'
      sleep 1
      ;;
  esac
done
