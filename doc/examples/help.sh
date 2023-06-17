#!/bin/sh

script_dir="$(cd "$(dirname "$0")" && pwd)" || exit 1
export PATH="$script_dir/../../target/debug:$script_dir/../../target/release:$PATH"

show_help()
{
    echo "Usage: example.sh OPTIONS <input-file...>"
    echo "  -l, --long           enable detailed output"
    echo "  -o, --out-file FILE  file to write result"

}

eval "$(parseargs -n help.sh.sh -H -o 'l:long#detailed,o:out-file=outfile' -- "$@")" || exit 1

