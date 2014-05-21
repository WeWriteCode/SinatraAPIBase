#!/bin/bash
this_dir=`dirname $0`
unset GEM_HOME
unset GEM_PATH
export PATH=~/.rbenv/bin:"$PATH"

if [ "$(uname -n)" = "vagrant" ]; then
  exec /usr/local/rbenv/shims/ruby "${this_dir}/dispatch_fcgi.rb" "$@";
else
  eval "$(~/.rbenv/bin/rbenv init -)";
  exec ~/.rbenv/shims/ruby "${this_dir}/dispatch_fcgi.rb" "$@";
fi
