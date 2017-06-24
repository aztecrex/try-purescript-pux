# Try Purescript Pux

Taking a look at
[_puresecript-pux_](https://github.com/alexmingoia/purescript-pux).
In addition to trying out that package, this project has a few
extra goals:

1. no Bower (psc-package only)
2. Webpack
3. effective vendor bundle with external manifest
4. live update during dev
5. see how small the JS output can be

## Prep

1. install
[psc-package](https://github.com/purescript/psc-package/releases)
2. `npm run prep`

## Workflow

- build for deployment: `./build.sh`
    - static files are put to `./build/`
- start a dev server: `./run.sh`
    - there is a bug, run `./build.sh` first

## Notes

[_puresecript-pux_](https://github.com/alexmingoia/purescript-pux) is not in the latest release of
[_package-sets_](https://github.com/purescript/package-sets). I
configured the _set_ parameter to _master_ since it looks like it
will be available in the next release. Not sure if that's
conventional but it works well enough for this experiment.

The live reload story is not great here. Even for a simple app like
this, changes take quite a while to compile and show in the browser.
