# HOST_JVM_ARGS := --host_jvm_args=-Xms4g --host_jvm_args=-XX:+UseZGC --host_jvm_args=-XX:+ZGenerational
# COMMON_ARGS := ${HOST_JVM_ARGS}

BAZEL := bazel

# == first recipe as default ==
info:
	@echo "$(shell ${BAZEL} version 2>&1 | head -n 1)"
	@echo "Bazel release: $(shell ${BAZEL} info release)"
	@echo "Workspace: $(shell ${BAZEL} info workspace)"
	@echo "host kernel: $(shell uname -s)"
	@echo "host arch: $(shell uname -m)"
	@echo "Current java-home: $(shell ${BAZEL} info java-vm)"
	@echo "Current java-runtime: $(shell ${BAZEL} info java-runtime)"

# == wrapper for bazel commands ==

# bazel:
# 	${BAZEL} $%

# == bootstrap ==


# == build ==

build:
	@${BAZEL} build //ch01:intro --toolchain_resolution_debug='@bazel_tools//tools/cpp:toolchain_type'

run:
	@${BAZEL} build //ch01:intro

# == analysis ==

mod-paths:
	@${BAZEL} mod all_paths

mod-graph:
	@${BAZEL} mod graph

mod-tidy:
	@${BAZEL} mod tidy

mod-explain:
	@${BAZEL} mod explain

# == clean ==

clean:
	@${BAZEL} clean

clean-all:
	@${BAZEL} clean --expunge

# == utilities ==

refresh-compile-commands:
	@${BAZEL} run @hedron_compile_commands//:refresh_all

query-toolchain:
	@${BAZEL} query --output=build @llvm_toolchain//:all | grep -v -e '^#' -e '^  generator'
