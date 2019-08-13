
# euroismar-custom
Customization directory for the EUROISMAR 2019 website on Indico 
https://www.euroismar2019.org/

Apart from the folders necessary for the customization directory, also include folders for the **event CSS** and the **server config**.

Updated for [Indico 2.2](https://getindico.io/). Github repo https://github.com/indico/indico


## Features
* Implemented responsive customizations to make it nicer for mobiles. (event CSS + templates)
* Removed buttons from top navigation bar on event display pages. (event CSS)
* Record server configs (`speedopt`) for speed optimizations from the [HTML5 boilerplate project](https://github.com/h5bp/server-configs-nginx/).

### Mobile-friendly navigation menu
* `templates/core/events/display/conference/base.html` - template changes needed to add CSS class (`resmenu`) to the side menu.
* `event-css/euroismar2019.css` - uploaded to the specific event on the manage/layout page, included here so it is part of the repo. Responsive styles for the `resmenu` class need to be at the end of the file.
  * idea: move the responsive styles to its own stylesheet and load it in the customization folder?
* `templates/core/footer.html` - template change to add JS at the end of page to attach event to the `resmenu` class under `outer` CSS id.
  * also works as a JS include in header, but have other JS that has to be added end of page, so put it all there.

## EUROISMAR-specific branding and customizations
* sitewide CSS - changed background colour of header to EUROISMAR green (CSS in customization directory)
* added extra instructions for abstract submitters for Markdown/LaTeX superscripts and subscripts (submission.html template)
* branded login page to ensure that visitors know they are still on EUROISMAR site (login_page.html template)
* hardcoded error page to return to EUROISMAR homepage instead of Indico category view (error.html)
* added event to track click through of sponsorship brochure and registration via Google Analytics (footer.html)
  * has to be in footer since DOM needs to be in place for events to be attached. Normal JS include adds into header.
  * (suspected) cannot use extend footer.html due to escaping by Jinja leads to dropping of any <script></script> tags added to footer.html
* hardcoded Indico logos to return to EUROISMAR homepage (header.html template extension)
* Removed Indico in the title since it shows up in title on Google searches (indico_base.html)
* Changed site favicon to EUROISMAR logo (indico_base.html)
* Added viewport meta tag (indico_base.html) - this can in principle now be changed by an extension of the template in {% block extra_meta_tags %}

## Mobile-friendly timetable
Based on example from [Linux Plumbers Conference](https://linuxplumbersconf.org/).
Seems to be a modification of the "compact" or "nicecompact" theme that is built into Indico. Original templates called `compact.html` [link](https://github.com/search?utf8=%E2%9C%93&q=repo%3Aindico%2Findico+filename%3Acompact.html&type=Code&ref=advsearch&l=&l=) to search in Indico project for files named "compact.html".

* added templates 
  * `templates/core/events/display/better.html` - same as `compact.html`
  * `templates/core/events/timetable/display/better.html` - shared by LPC administrators
* modified installed versions of two files to add "better" as a theme option:
  * `/opt/indico/.venv/local/lib/python2.7/site-packages/indico/modules/events/themes.yaml`
  * `/opt/indico/.venv/lib/python2.7/site-packages/indico/web/static/dist/manifest.json`

This "feature" is definitely better achieved as a plugin but currently hardcoded.

## Indico 2.2 specific changes
* no more scss, so scss -> css
* /static/ renamed to /files/
* url path for files to use in templates `"{{ url_for('assets.custom', filename='...') }}"`
* quite a lot of changes in `indico_base.html`
 
## How to enable customizations
See https://docs.getindico.io/en/stable/config/settings/#customization

In `/opt/indico/etc/indico.conf`
Add this line:
```
  CUSTOMIZATION_DIR = '/opt/indico/custom'
```

Also add this line to give more information on the path to templates for Jinja inheritance:
```
  CUSTOMIZATION_DEBUG = 'True'
```
The "debug" info is stored in `/opt/indico/log/indico.log`

