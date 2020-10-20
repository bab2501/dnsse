#mysql -uroot -ppwd -s -N -e "use rp2; SELECT * FROM mxdata_soacheck_progress;" >> /var/www/html/log/mxdata_soacheck_progress.log
#mysql -uroot -ppwd -s -N -e "use rp2; SELECT * FROM mxdata_check_progress;" >> /var/www/html/log/mxdata_check_progress.log
mysql -uroot -ppwd -s -N -e "use rp2; SELECT * FROM ztable_check_progress;" >> /var/www/html/log/ztable_check_progress.log
mysql -uroot -ppwd -s -N -e "use rp2; SELECT * FROM check3;" >> /var/www/html/log/check3.log

