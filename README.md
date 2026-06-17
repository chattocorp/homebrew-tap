# Chatto Homebrew Tap

Homebrew tap for Chatto.

## Install

```sh
brew install chattocorp/tap/chatto
```

## Upgrade

```sh
brew update
brew upgrade chatto
```

## Supported Platforms

- macOS Apple Silicon
- Linux arm64
- Linux x86_64

Chatto does not currently publish a macOS Intel release artifact, so the
formula intentionally does not support macOS Intel.

## macOS Signing

The formula ad-hoc signs the installed macOS binary with:

```sh
codesign --force --sign - "$(brew --prefix)/bin/chatto"
```

This keeps the binary runnable from a Homebrew install without requiring a
Developer ID certificate.
