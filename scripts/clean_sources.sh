#!/bin/sh

################################################################################

execution_dir=".."

################################################################################
# Delete test files files
################################################################################

check_settings()
{
  if [ -z "${execution_dir}" ]; then
    echo "Error: 'execution_dir' is invalid..." >&2
    exit 1
  fi
}

################################################################################

main()
(
  check_settings

  find . -name ".DS_Store" -type f -delete
)

################################################################################

main "$@"
