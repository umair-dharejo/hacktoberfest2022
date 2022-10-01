#/bin/bash

package=openresty

 if yum list installed "$package" >/dev/null 2>&1;
 then
    echo 'installed openrestry successfully!'
  else
    echo 'not installed'
  fi
