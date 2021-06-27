# setup

- [install rust](https://github.com/ks6088ts/dotfiles/commit/ed0710f4676436659f10ee1d393f9d6cf9fdd750)

```bash
cargo new example-app --bin
cargo new example-lib --lib

# add example-lib dependency to example-app
cd example-app
cargo add example-lib --path=../example-lib

# windows
rustc --print target-list | grep windows
```
