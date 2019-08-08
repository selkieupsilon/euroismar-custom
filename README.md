
# euroismar-custom
Customization directory for the EUROISMAR 2019 website on Indico 
https://www.euroismar2019.org/

Updated for Indico 2.2.

## Features
* Implemented responsive customizations to make it nicer for mobiles.
* Removed buttons from top navigation bar on event display pages.
* (not Indico) speedopt contains server settings for speed optimizations.

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

