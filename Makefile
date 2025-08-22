BAZEL := bazel

mod-tidy:
	@${BAZEL} mod tidy

mod-explain:
	@${BAZEL} mod explain

mod-graph:
	@${BAZEL} mod graph

refresh-compile-commands:
	@${BAZEL} run @hedron_compile_commands//:refresh_all
