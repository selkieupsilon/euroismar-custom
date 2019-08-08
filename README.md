
# euroismar-custom
Customization directory for the EUROISMAR 2019 website on Indico 
https://www.euroismar2019.org/

Updated for [Indico 2.2](https://getindico.io/). Github repo https://github.com/indico/indico


## Features
* Implemented responsive customizations to make it nicer for mobiles. (CSS + footer template)
* Removed buttons from top navigation bar on event display pages. (CSS)
* (not Indico) speedopt contains server settings for speed optimizations.

## EUROISMAR-specific branding and customizations
* sitewide CSS - changed background colour of header to EUROISMAR green (CSS)
* added extra instructions for abstract submitters for Markdown/LaTeX superscripts and subscripts (sumission.html template)
* branded login page to ensure that visitors know they are still on EUROISMAR site (login_page.html template)

## Indico 2.2 specific changes
* no more scss, so scss -> css
* /static/ renamed to /files/
* url path for files to use in templates `"{{ url_for('assets.custom', filename='...') }}"`
 
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

