

#requiere parar el docker para usar direwolf
rtl_fm -M fm -f 144.800M -s 22050 - | direwolf -t 0 -c /dev/null -r 22050 -D 1 -
