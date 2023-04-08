#!/bin/sh

#!/bin/sh

################################################################################

build_path="."

################################################################################

execution_dir=".."

################################################################################
# Generator
################################################################################

check_settings()
{
  if [ -z "${build_path}" ]; then
    echo "Error: 'build_path' is invalid..." >&2
    exit 1
  fi

  if [ -z "${execution_dir}" ]; then
    echo "Error: 'execution_dir' is invalid..." >&2
    exit 1
  fi
}

################################################################################

main()
(
  # Print commands while executing
  # set -x

  # { cd "${execution_dir}"; } || exit 1

  # Run with verbose output
  # ninja -vC "${build_path}" libcxx-generate-files

  # Run
  ninja -C "${build_path}" libcxx-generate-files
)

################################################################################

main "$@"
