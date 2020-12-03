FROM paperist/alpine-texlive-ja:latest
RUN apk update && apk add --no-cache xz gnuplot
WORKDIR /usr/local/texlive/2020/texmf-dist/tex/latex/gnuplot
RUN gnuplot -e "set term tikz createstyle;quit" && mktexlsr
RUN tlmgr update --self && tlmgr install siunitx
