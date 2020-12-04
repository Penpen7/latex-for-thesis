# 概要
修論用のlatex環境のdockerfileです。

# 内容
- 日本語用のTexLive2020
- textlint

# 使用方法
## texをコンパイルする場合
platex hoge.tex
dvipdfmx hoge.dvi

## linter
npx textlint hoge.tex
