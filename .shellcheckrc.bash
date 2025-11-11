# ShellCheck configuration for bash
# See: https://github.com/koalaman/shellcheck/wiki/Directive
#
# bash is the most common shell for Linux systems and provides many features
# beyond POSIX sh including arrays, associative arrays, process substitution,
# extended test constructs [[]], and more.
# Use this for scripts targeting bash environments (most Linux distributions).

# Use bash dialect
shell=bash

# Enable all optional checks
enable=all

# Follow external sources (enable for projects with sourced files)
external-sources=true

# Source path resolution
source-path=SCRIPTDIR

# Set severity threshold (error, warning, info, style)
severity=style

# Note: Use -S/--severity flag on command line to filter by severity level
# severity levels: error, warning, info, style

# Disable specific checks if needed (uncomment to use)
# disable=SC2034  # Unused variables
# disable=SC2086  # Double quote to prevent globbing and word splitting
