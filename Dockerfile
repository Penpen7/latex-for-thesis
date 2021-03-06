FROM paperist/alpine-texlive-ja:latest
RUN apk update && apk add --no-cache xz gnuplot nodejs npm python3 py3-pip && \
    pip install pygments && \
    npm install -g textlint textlint-rule-preset-ja-spacing \
    textlint-rule-preset-ja-technical-writing \
    textlint-rule-spellcheck-tech-word \
    textlint-plugin-latex \
    textlint-rule-preset-ja-engineering-paper \
    textlint-rule-preset-jtf-style \
    textlint-rule-prh && \
    sed -i -e """s@node_modules@/usr/lib/node_modules/textlint-rule-prh/node_modules@""" /usr/lib/node_modules/textlint-rule-preset-ja-engineering-paper/lib/index.js
WORKDIR /usr/local/texlive/2020/texmf-dist/tex/latex/gnuplot
RUN gnuplot -e "set term tikz createstyle;quit" && mktexlsr && \
    tlmgr update --self && tlmgr install siunitx && \
    sed -i -e """s/main_memory = 5000000/main_memory = 10000000/g""" /usr/local/texlive/2020/texmf-dist/web2c/texmf.cnf && \
    fmtutil-sys --all
