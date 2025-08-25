# taopp-in-modern-cpp

My practices with modern cpp for _The Art of Multiprocessor Programming_ Book

That means

1. Use the latest C++ standard to implement examples and exercises in the book.
2. Learn to build project with Bazel and hermetic llvm toolchain.

## How to setup

First of all, make sure you have [bazelbuild/bazelisk](https://github.com/bazelbuild/bazelisk) and `make` installed. That may the only one requirement.

Try to run `make info` in your repo root, if it successed, the terminal will output something like

```
Bazelisk version: 1.27.0
Bazel release: release 8.3.1
Workspace: /path/to/your/directory/of/taopp-in-modern-cpp
host kernel: Darwin
host arch: arm64
Current java-home: OpenJDK 64-Bit Server VM (build 24+36, mixed mode) by Azul Systems, Inc.
Current java-runtime: OpenJDK Runtime Environment (build 24+36) by Azul Systems, Inc.
```

Then try to build by `make build`. If there is no error, that's all settled.

Get our "Hello, world!" via `make run`.

Besides, run `make refresh-compile-commands` to generate compile commands for `clangd`. It helps you to setup IDE like VSCode or Clion.

Start coding!
