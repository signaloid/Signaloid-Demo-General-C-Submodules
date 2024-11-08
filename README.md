[<img src="https://assets.signaloid.io/add-to-signaloid-cloud-logo-dark-v6.png#gh-dark-mode-only" alt="[Add to signaloid.io]" height="30">](https://signaloid.io/repositories?connect=https://github.com/signaloid/Signaloid-Demo-General-C-Submodules#gh-dark-mode-only)
[<img src="https://assets.signaloid.io/add-to-signaloid-cloud-logo-light-v6.png#gh-light-mode-only" alt="[Add to signaloid.io]" height="30">](https://signaloid.io/repositories?connect=https://github.com/signaloid/Signaloid-Demo-General-C-Submodules#gh-light-mode-only)

# C Project With Submodules Example

This is a minimal example to demonstrate how to use other repositories in a C project in the Signaloid Cloud Developer
Platform. The repository contains a C source file in the `src` folder which gets compiled and executed by the Signaloid
Cloud Developer Platform. The repository also contains a submodule in the `src/submodule-dir-example` folder. The
submodule is a different repository that implements functions that are used in the main C source file (`src/main.c`).

## Getting Started
1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repository.
2. Edit `README.md` to [adapt the "Add to signaloid.io" button's URL](#option-1--using-the-add-to-signaloidio-button).
3. Edit the code and [configure the build](#configuring-the-build-configmk).

## Repository Structure
The Signaloid Cloud Developer Platform expects any GitHub repository you wish to run to have a `src` folder containing your source code. By default, the Signaloid Cloud Developer Platform will compile all C and C++ source files (extensions `*.c`, `*.cc`, `*.cpp`, `*.c++`, `*.cp`, and `*.cxx`) in the `src` folder and will link them into a single binary and run that on your choice Signaloid C0 cores.

Here is the structure of this repository:

```
.
├── LICENSE
├── README.md
└── src
    ├── config.mk
    ├── main.c
    └── submodule-dir-example
        ├── [submodule files]
        ├── [more submodule files]
```

### Configuring the Build (`config.mk`)
You can modify the default build behavior described above by providing a file named `config.mk`.

For C repositories, there are two relevant variables in `config.mk`:
- `SOURCES`, a list of C source files to compile;
- `CFLAGS`, the options that are passed to the C compiler.

If the `SOURCES` variable is not set, the Signaloid Cloud Developer Platform compiles all the C and C++ files in the `src` folder.

In this repository, the file [`src/config.mk`](./src/config.mk) contains
```makefile
SOURCES = main.c submodule-dir-example/src/batt.c
CFLAGS = -Isubmodule-dir-example/src
```
This tells the Signaloid Cloud Developer Platform to build the files [`main.c`](./src/main.c)
and [submodule-dir-example/src/batt.c](./src/submodule-dir-example/src/batt.c) using
the compiler flag `-Isubmodule-dir-example/src` (i.e., adding the submodule's src directory in the includes path).

### Libraries
During the build process, the Signaloid Cloud Developer Platform links the compiled object files against the following libraries:
- `libc`: the C standard library;
- `libm`: the C math library (with function prototypes and other definitions in `math.h`);
- `UxHw`: a library that allows you to access and modify probability distribution information within the Signaloid C0 cores (with function prototypes and other definitions in `uxhw.h`). You can find out more about `UxHw` in the [UxHw documentation](https://docs.signaloid.io/docs/hardware-api/).

## 🍰 Accessing Your GitHub Repository from the Signaloid Cloud Developer Platform
There are two ways to access a GitHub repository from the Signaloid Cloud Developer Platform.

### Option 1:  Using the "Add to signaloid.io" Button
This first option makes it easiest for you (and other GitHub users) to run your repository on the Signaloid Cloud Developer Platform. Edit the snippet at the top of this `README.md` to include the URL of your Git repository.

The text you need to change is (replacing the text `<your repository URL here>`):
```html
[<img src="https://assets.signaloid.io/add-to-signaloid-cloud-logo-dark-v6.svg#gh-dark-mode-only" alt="[Add to signaloid.io]" height="30">](https://signaloid.io/repositories?connect=<your repository URL here>#gh-dark-mode-only)
[<img src="https://assets.signaloid.io/add-to-signaloid-cloud-logo-light-v6.svg#gh-light-mode-only" alt="[Add to signaloid.io]" height="30">](https://signaloid.io/repositories?connect=<your repository URL here>#gh-light-mode-only)
```

Next, go to the repository's GitHub page and click on the "Add to signaloid.io" button.

### Option 2: Manually Adding Repositories to the Signaloid Cloud Developer Platform
A second option is to manually add a repository to the Signaloid Cloud Developer Platform. To do so, follow these steps:
1. Log in to the Signaloid Cloud Developer Platform at [https://signaloid.io/](https://signaloid.io/). If you do not already have an account, you can create one for free [here](https://get.signaloid.io/).
2. Click on the `Repositories` tab in the menu on the left side of the screen (you might need to go through the menu icon on mobile screens).
3. Give the Signaloid Cloud Developer Platform permission to access your repositories, using the blue GitHub "Login" button.
4. Click on the green button (Connect to Repositories). All your repositories will appear in a list. Add the relevant repository.
5. Your repository should now appear in the Signaloid Cloud Developer Platform `Repositories` tab.
