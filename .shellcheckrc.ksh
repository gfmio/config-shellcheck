# ShellCheck configuration for ksh (KornShell)
# See: https://github.com/koalaman/shellcheck/wiki/Directive
#
# ksh (KornShell) is a powerful shell with features that influenced bash.
# It has some overlap with bash but distinct syntax and capabilities.
# Use this for scripts targeting KornShell environments (ksh88/ksh93).

# Use ksh dialect
shell=ksh

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
