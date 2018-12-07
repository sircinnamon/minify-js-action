FROM smithmicro/uglifyjs

LABEL "com.github.actions.name"="Uglify JS"
LABEL "com.github.actions.description"="Minify one or more js files into a single file"
LABEL "com.github.actions.icon"="minimize-2"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/sircinnamon/minify-js-action"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Riley Lahd <sircinnamon@github.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]