#!/bin/sh

################################################################################

test_suite=""

################################################################################

build_path="./"
test_tool_path="${build_path}/bin"

################################################################################

output_dir="."
output_file_prefix="${output_dir}/"

output_file="${output_file_prefix}$(basename "${test_suite}").log"
output_file="${output_file_prefix}$(echo "${test_suite}" | sed -r 's/[\/]+/-/g').log"

################################################################################

execution_dir=".."

################################################################################
# Examples
################################################################################

# Run all tests
# ninja -C ./build/default.debug.libcxx check-cxx check-cxxabi check-unwind

# Run all tests in subdirectory
# ./build/default.debug.libcxx/bin/llvm-lit -sv ./libcxx/test/std/ranges

# Run a single test file
# ./build/default.debug.libcxx/bin/llvm-lit -sv ./libcxx/test/std/ranges/range.adaptors/range.take.while/ctor.view.pass.cpp

# Test
# ./build/default.debug.libcxx/bin/llvm-lit -sv ./libcxx/test/libcxx/containers/sequences/deque/compare.three_way.pass.cpp

################################################################################
# Test
################################################################################

check_output_dir()
{
  if ! [ -d "${output_dir}" ]; then
    mkdir -p "${output_dir}" || {
      echo "Error: Failed to create '${output_dir}"
      exit 1
    }
  fi
}

check_settings()
{
  if [ -z "${test_suite}" ]; then
    echo "Error: 'test_suite' is invalid..."
    exit 1
  fi

  if [ -z "${build_path}" ]; then
    echo "Error: 'build_path' is invalid..."
    exit 1
  fi

  if [ -z "${test_tool_path}" ]; then
    echo "Error: 'test_tool_path' is invalid..."
    exit 1
  fi

  if [ -z "${output_dir}" ]; then
    echo "Error: 'output_dir' is invalid..."
    exit 1
  fi

  if [ -z "${output_file_prefix}" ]; then
    echo "Error: 'output_file_prefix' is invalid..."
    exit 1
  fi

  if [ -z "${output_file}" ]; then
    echo "Error: 'output_file' is invalid..."
    exit 1
  fi

  if [ -z "${execution_dir}" ]; then
    echo "Error: 'execution_dir' is invalid..."
    exit 1
  fi
}

################################################################################

main()
(
  check_settings
  check_output_dir

  # Print commands while executing
  # set -x

  # { cd "${execution_dir}/"; } || exit 1

  # Run a test suite
  # "${test_tool_path}/llvm-lit" -sv "${test_suite}"

  # Run a test suite and log to a file
  # "${test_tool_path}/llvm-lit" -sv "${test_suite}" > "${output_file}"

  # Run a test suite (dump stderr and stdout streams and write them to a file and to the console)
  "${test_tool_path}/llvm-lit" -sv "${test_suite}" 2>&1 \
  | tee "${output_file}"
)

################################################################################

main "$@"