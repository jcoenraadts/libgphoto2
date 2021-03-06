dir=`mktemp -d /tmp/camera.XXXXXX`
cd $dir
echo -n "Attach Nikon D90 and press return: "
read dummy 
set -x -v
echo "***  single capture"
gphoto2 --set-config capturetarget=0
gphoto2 --set-config imagequality=2 --capture-image-and-download
rm capt0000.jpg
gphoto2 --set-config imagequality=6 --capture-image-and-download
rm capt0000.jpg capt0000.nef
gphoto2 --set-config capturetarget=1
gphoto2 --set-config imagequality=2 --capture-image-and-download
gphoto2 --set-config imagequality=6 --capture-image-and-download
echo -n "remove SDCARD and press return: " 
read dummy
gphoto2 --set-config capturetarget=0
gphoto2 --set-config imagequality=2 --capture-image-and-download
rm capt0000.jpg
gphoto2 --set-config imagequality=6 --capture-image-and-download
rm capt0000.jpg capt0000.nef
echo -n "replugin SDCARD and press return: " 
read dummy

echo "***  interval capture"
gphoto2 --set-config capturetarget=0
gphoto2 --set-config imagequality=2 --capture-image-and-download -F 3 -I 5
rm capt000*.*
gphoto2 --set-config imagequality=6 --capture-image-and-download -F 3 -I 5
rm capt000*.*
gphoto2 --set-config capturetarget=1
gphoto2 --set-config imagequality=2 --capture-image-and-download -F 3 -I 5
gphoto2 --set-config imagequality=6 --capture-image-and-download -F 3 -I 5
gphoto2 --set-config imagequality=2

echo "***  timing capture"
gphoto2 --set-config capturetarget=0
rm capt000*.*
time gphoto2 --set-config imagequality=2 --capture-image-and-download
rm capt0000.jpg
gphoto2 --set-config capturetarget=1
time gphoto2 --set-config imagequality=2 --capture-image-and-download

echo "*** testing preview"
rm preview.jpg || true
gphoto2 --capture-preview
gwenview preview.jpg
rm preview.jpg || true
gphoto2 --set-config capturetarget=0
gphoto2 --capture-preview --capture-image-and-download --capture-preview --capture-image-and-download
rm capt*.*
gwenview preview.jpg
gphoto2 --set-config capturetarget=1
gphoto2 --capture-preview --capture-image-and-download --capture-preview --capture-image-and-download
gwenview preview.jpg
rm preview.jpg

rm movie.mjpg || true
gphoto2 --capture-movie=10s
rm movie.mjpg

echo "*** capture and wait_event  - jpg/sdram - 10s"
gphoto2 --set-config capturetarget=0
gphoto2 --set-config imagequality=2
gphoto2 --wait-event-and-download=10s
gphoto2 --set-config imagequality=6
gphoto2 --wait-event-and-download=10s
echo "*** capture and wait_event  - jpg/card - 50 events"
gphoto2 --set-config capturetarget=1
gphoto2 --set-config imagequality=2
gphoto2 --wait-event-and-download=50
gphoto2 --set-config imagequality=6
gphoto2 --wait-event-and-download=50
gphoto2 --set-config imagequality=2

echo "*** config "
gphoto2 --list-config
gphoto2 --list-all-config

gphoto2 --set-config imagecomment="Markus Meissner"
gphoto2 --get-config imagecomment|grep Markus.Meissner
gphoto2 --set-config imagecomment="Marcus Meissner"
gphoto2 --get-config imagecomment|grep Marcus.Meissner
gphoto2 --get-config d090|grep Marcus.Meissner
gphoto2 --set-config d090="Markus Meissner"
gphoto2 --get-config d090|grep Markus.Meissner
gphoto2 --set-config d090="Marcus Meissner"
gphoto2 --get-config d090|grep Marcus.Meissner

gphoto2 --get-config imagecommentenable
gphoto2 --set-config imagecommentenable=0
gphoto2 --get-config d091|grep 1
gphoto2 --set-config d091=0
gphoto2 --get-config d091|grep 0
gphoto2 --set-config d091=1

echo "*** DONE"
echo rm -rf $dir
