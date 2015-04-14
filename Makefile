all: Figs JS

.PHONY: all tar Figs JS web weball


Figs: Figs/intercross.png Figs/lodcurve_insulin.png

JS: JS/corr_w_scatter.js JS/handle_stickies.js JS/density.js JS/plotframe.js JS/scatterplot.js JS/panelutil.js

Figs/%.png: R/%.R
	cd R;R CMD BATCH $(<F)

JS/%.js: Coffee/%.coffee
	coffee -bco JS $^

web:
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/Showcase2015

weball: JS Figs
	scp *.html broman-9.biostat.wisc.edu:public_html/presentations/Showcase2015/
	scp JS/* broman-9.biostat.wisc.edu:public_html/presentations/Showcase2015/JS/
	scp Coffee/* broman-9.biostat.wisc.edu:public_html/presentations/Showcase2015/Coffee/
	scp CSS/* broman-9.biostat.wisc.edu:public_html/presentations/Showcase2015/CSS/
	scp Figs/*.png broman-9.biostat.wisc.edu:public_html/presentations/Showcase2015/Figs/
	scp Figs/*.jpg broman-9.biostat.wisc.edu:public_html/presentations/Showcase2015/Figs/

tar: all
	cd ..;tar czhf Showcase2015.tgz Showcase2015/[A-Za-z]*
