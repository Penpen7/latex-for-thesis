FROM paperist/alpine-texlive-ja:latest
RUN apk update && apk add --no-cache xz gnuplot nodejs npm && \
      npm install -g textlint textlint-rule-preset-ja-spacing \
      textlint-rule-preset-ja-technical-writing \
      textlint-rule-spellcheck-tech-word \
      textlint-plugin-latex
WORKDIR /usr/local/texlive/2020/texmf-dist/tex/latex/gnuplot
RUN gnuplot -e "set term tikz createstyle;quit" && mktexlsr
RUN tlmgr update --self && tlmgr install siunitx
