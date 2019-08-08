# euroismar-custom
Customization directory for the EUROISMAR 2019 website on Indico 
https://www.euroismar2019.org/

Updated for Indico 2.2.

* Implemented responsive customizations to make it nicer for mobiles.
* Removed buttons from top navigation bar on event display pages.
* (not Indico) speedopt contains server settings for speed optimizations.

Indico 2.2 specific changes
* no more scss, so scss -> css
* /static/ renamed to /files/
* url path for files to use in templates "{{ url_for('assets.custom', filename='...') }}"
 
