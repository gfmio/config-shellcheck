# config-shellcheck

Strict, opinionated ShellCheck configurations for all supported shell dialects.

## Overview

This repository provides production-ready ShellCheck configurations with maximum strictness enabled. Each config is tailored for a specific shell dialect and enables all optional checks for the highest code quality.

## Available Configurations

| Config File | Shell Dialect | Use Case |
|------------|---------------|----------|
| [.shellcheckrc.sh](.shellcheckrc.sh) | POSIX sh | Maximum portability across all POSIX systems |
| [.shellcheckrc.bash](.shellcheckrc.bash) | bash | Most common, feature-rich scripting |
| [.shellcheckrc.dash](.shellcheckrc.dash) | dash | Debian/Ubuntu `/bin/sh`, lightweight scripts |
| [.shellcheckrc.ksh](.shellcheckrc.ksh) | ksh | KornShell environments |
| [.shellcheckrc.busybox](.shellcheckrc.busybox) | busybox | Embedded systems, Alpine Linux, minimal containers |

## Features

All configurations include:

- ✅ **All optional checks enabled** (`enable=all`)
- ✅ **Maximum strictness** (`severity=style`)
- ✅ **External source following** (`external-sources=true`)
- ✅ **Source path resolution** (`source-path=SCRIPTDIR`)
- ✅ **Clear documentation** with comments explaining each setting
- ✅ **Consistent structure** across all dialects

## Installation

### Option 1: Copy the config you need

```bash
# For bash scripts (most common)
curl -o .shellcheckrc https://raw.githubusercontent.com/gfmio/config-shellcheck/main/.shellcheckrc.bash

# For POSIX sh (maximum portability)
curl -o .shellcheckrc https://raw.githubusercontent.com/gfmio/config-shellcheck/main/.shellcheckrc.sh

# For dash
curl -o .shellcheckrc https://raw.githubusercontent.com/gfmio/config-shellcheck/main/.shellcheckrc.dash

# For ksh
curl -o .shellcheckrc https://raw.githubusercontent.com/gfmio/config-shellcheck/main/.shellcheckrc.ksh

# For busybox
curl -o .shellcheckrc https://raw.githubusercontent.com/gfmio/config-shellcheck/main/.shellcheckrc.busybox
```

### Option 2: Symlink for easy updates

```bash
# Clone this repo
git clone https://github.com/gfmio/config-shellcheck.git ~/.config/shellcheck-configs

# Symlink the config you need
ln -s ~/.config/shellcheck-configs/.shellcheckrc.bash .shellcheckrc
```

### Option 3: Use directly with --config-file

```bash
# No need to copy - reference directly
shellcheck --config-file=/path/to/config-shellcheck/.shellcheckrc.bash script.sh
```

## Usage

### Basic Usage

Once installed as `.shellcheckrc` in your project root:

```bash
shellcheck script.sh
```

ShellCheck will automatically find and use the config file.

### Using a Specific Config

You can use a config directly without renaming:

```bash
shellcheck --config-file=.shellcheckrc.sh script.sh
```

### Overriding Severity in CI/CD

The configs use `severity=style` for maximum strictness during development. In CI/CD, you might want to fail only on errors/warnings:

```bash
# Fail only on errors
shellcheck -S error script.sh

# Fail on errors and warnings
shellcheck -S warning script.sh
```

### Disabling Specific Checks

If you need to disable certain checks for your project, uncomment and modify the `disable=` line in your `.shellcheckrc`:

```bash
# Disable specific checks
disable=SC2034,SC2086
```

Or use inline directives in your scripts:

```bash
# shellcheck disable=SC2086
echo $var
```

## Configuration Details

### What's Enabled

- **`shell=<dialect>`** - Explicitly sets the shell dialect
- **`enable=all`** - Enables all optional checks including:
  - `quote-safe-variables` - Enforce quoting even for "safe" variables
  - `require-variable-braces` - Always use `${var}` instead of `$var`
  - `check-unassigned-uppercase` - Catch potential environment variable typos
  - `add-default-case` - Require default case in switch statements
- **`external-sources=true`** - Follows `source` statements to check sourced files
- **`source-path=SCRIPTDIR`** - Resolves relative source paths from script directory
- **`severity=style`** - Reports all issues at any severity level

### Why These Settings?

- **Maximum strictness** catches potential bugs early
- **All optional checks** enforce best practices consistently
- **External source following** ensures modular scripts are fully analyzed
- **Style-level reporting** helps maintain high code quality standards

## Choosing the Right Dialect

### When to use POSIX sh (.shellcheckrc.sh)

- Scripts need to run on any UNIX-like system
- Maximum portability is required
- You want warnings about bashisms
- Target systems may not have bash installed

### When to use bash (.shellcheckrc.bash)

- Most common choice for Linux systems
- Need arrays, associative arrays, or process substitution
- Using bash-specific features like `[[` or `(())`
- Target systems are known to have bash

### When to use dash (.shellcheckrc.dash)

- Targeting Debian/Ubuntu systems where `/bin/sh` is dash
- Need fast script execution
- Want POSIX compliance with dash-specific optimizations

### When to use ksh (.shellcheckrc.ksh)

- Working in KornShell environments
- Legacy systems or enterprise Unix that standardize on ksh
- Need ksh-specific features

### When to use busybox (.shellcheckrc.busybox)

- Embedded systems or IoT devices
- Alpine Linux containers
- Minimal Docker images
- Resource-constrained environments

## Integration

### Pre-commit Hook

Add to `.git/hooks/pre-commit`:

```bash
#!/bin/sh
git diff --cached --name-only --diff-filter=ACM | grep '\.sh$' | xargs shellcheck
```

### GitHub Actions

```yaml
name: ShellCheck
on: [push, pull_request]
jobs:
  shellcheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run ShellCheck
        uses: ludeeus/action-shellcheck@master
        with:
          severity: warning
```

### VS Code

Install the [ShellCheck extension](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck) - it will automatically use your `.shellcheckrc`.

## Customization

While these configs provide strict defaults, you can customize them for your needs:

1. **Copy the config** to your project
2. **Modify settings** as needed
3. **Document your changes** with comments explaining why

## About ShellCheck

ShellCheck is a static analysis tool for shell scripts that helps you:

- Find and fix bugs in your scripts
- Avoid common pitfalls and gotchas
- Write more portable and robust code
- Follow shell scripting best practices

Learn more: [shellcheck.net](https://www.shellcheck.net)

## Supported Shell Dialects

ShellCheck supports these dialects only:

- ✅ POSIX sh
- ✅ bash
- ✅ dash
- ✅ ksh
- ✅ busybox

Not supported: zsh, fish (they have different syntax and tooling)

## License

[MIT](LICENSE)

## Contributing

Contributions welcome! Please:

1. Explain the rationale for any changes
2. Keep configs consistent across dialects
3. Update documentation accordingly
4. Test with actual ShellCheck usage

## Resources

- [ShellCheck Wiki](https://www.shellcheck.net/wiki/)
- [Error Code Reference](https://www.shellcheck.net/wiki/SC1000)
- [ShellCheck GitHub](https://github.com/koalaman/shellcheck)
- [List Optional Checks](https://github.com/koalaman/shellcheck/wiki/Optional) - Run `shellcheck --list-optional`
