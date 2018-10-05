#!/bin/bash
# make sure pngquant is installed before running

imgdir=/opt/indico/.venv/lib/python2.7/site-packages/indico/htdocs/images

if [[ -d ${imgdir}-bak ]]; then
 echo "Backup exists"
else
 rsync -av ${imgdir} ${imgdir}-bak
fi

echo "Before pngquant"
du -bsh ${imgdir}-bak
du -bsh ${imgdir} 

if [[ -f ${imgdir}/pngquanted ]]; then
 echo "PNGs already optimized"
 exit
else
 find ${imgdir} -name \*.png | while read line; do pngquant -f --ext .png $line; done
 touch ${imgdir}/pngquanted
 touch ${imgdir}/pngquanted-on-`date +'%Y%m%d'`
fi

echo "After pngquant"
du -bsh ${imgdir}-bak
du -bsh ${imgdir} 

exit
