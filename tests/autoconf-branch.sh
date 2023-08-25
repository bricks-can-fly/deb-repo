#!/usr/bin/env bash

branch="1 autoconf/2.69-14
2 perl/5.32.1-4+deb11u2 libansicolor-perl/5.01 libarchive-tar-perl/2.36 libattribute-handlers-perl/1.01 libautodie-perl/2.32 libcompress-raw-bzip2-perl/2.093 libcompress-raw-zlib-perl/2.093 libcompress-zlib-perl/2.093 libcpan-meta-perl/2.150010 libcpan-meta-requirements-perl/2.140 libcpan-meta-yaml-perl/0.018 libdigest-md5-perl/2.55.01 libdigest-perl/1.17.01 libdigest-sha-perl/6.02 libencode-perl/3.06 libexperimental-perl/0.020 libextutils-cbuilder-perl/0.280234 libextutils-command-perl/7.44 libextutils-install-perl/2.14 libextutils-parsexs-perl/3.400000 libfile-spec-perl/3.7800 libhttp-tiny-perl/0.076 libi18n-langtags-perl/0.44 libio-compress-base-perl/2.093 libio-compress-bzip2-perl/2.093 libio-compress-perl/2.093 libio-compress-zlib-perl/2.093 libio-zlib-perl/1.10 libjson-pp-perl/4.04000 liblocale-maketext-perl/1.29 liblocale-maketext-simple-perl/0.21.01 libmath-bigint-perl/1.999818 libmath-complex-perl/1.5901 libmime-base64-perl/3.15 libmodule-corelist-perl/5.20210123 libmodule-load-conditional-perl/0.70 libmodule-load-perl/0.34 libmodule-metadata-perl/1.000037 libnet-perl/1:3.11 libnet-ping-perl/2.72 libparams-check-perl/0.38 libparent-perl/0.238 libparse-cpan-meta-perl/2.150010 libperl-ostype-perl/1.010 libpod-escapes-perl/1.07 libpod-simple-perl/3.40 libstorable-perl/3.21 libsys-syslog-perl/0.36 libtest-harness-perl/3.42 libtest-simple-perl/1.302175 libtest-tester-perl/1.302175 libtest-use-ok-perl/1.302175 libthread-queue-perl/3.14 libthreads-perl/2.25 libthreads-shared-perl/1.61 libtime-hires-perl/1.9764 libtime-local-perl/1.2800 libtime-piece-perl/1.3401 libunicode-collate-perl/1.27 libversion-perl/1:0.9924 libversion-requirements-perl/ podlators-perl/4.14
3 perl-base/=5.32.1-4+deb11u2
3 perl-modules-5.32/5.32.1-4+deb11u2 perl-modules/
4 perl-base/=5.32.1-4+deb11u2
3 libperl5.32/5.32.1-4+deb11u2
4 libbz2-1.0/1.0.8-4

5 libc6/2.31-13+deb11u6
6 libgcc-s1/10.2.1-6 libgcc1/1:10.2.1-6
7 gcc-10-base/=10.2.1-6
6 libcrypt1/1:4.4.18-4

4 libc6/=2.31-13+deb11u6
4 libcrypt1/=1:4.4.18-4
4 libdb5.3/5.3.28+dfsg1-0.8
5 libc6/=2.31-13+deb11u6
4 libgdbm-compat4/1.19-2
5 libc6/=2.31-13+deb11u6
5 libgdbm6/1.19-2
6 libc6/=2.31-13+deb11u6
4 libgdbm6/>=1.18-3
4 zlib1g/1:1.2.11.dfsg-2+deb11u2 libz1/
5 libc6/=2.31-13+deb11u6
4 perl-modules-5.32/>=5.32.1-4+deb11u2
2 m4/1.4.18-5
3 libc6/=2.31-13+deb11u6
3 libsigsegv2/2.13-1
4 libc6/=2.31-13+deb11u6
2 debianutils/>=1.8"

source ./bin/bspec-lib

regexp='s/^\([0-9]\+\)\s\([^ ]\+\)\s\?\(.*\)$'
btree="./.build-reqs/bash"

readarray -t lines <<< "$branch"

prev_level=""
for ((i=0; i<"${#lines[@]}"; ++i)); do
  lnum=$(( $i + 1 ))
  level=$(echo "${lines[$i]}" | sed -n "$regexp/\1/p")
  bspec=$(echo "${lines[$i]}" | sed -n "$regexp/\2/p")
  echo "/$i/ $level $bspec"

  if [[ -f "$btree/.cyclic" ]]; then

    echo "--- cyclic ---"

  fi


  [[ -z $prev_level ]] && continue


  prev_level="$level"
done