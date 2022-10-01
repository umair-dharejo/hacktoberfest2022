#/bin/bash

package=openresty

 if yum list installed "$package" >/dev/null 2>&1;
 then
    echo 'successfully installed openrestry'
  else
    echo 'not installed openrestry'
  fi
