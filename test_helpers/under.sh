find . -name "*.csv" -depth 1 -exec sh -c $'f="{}"; mv -- "$f" "$(echo "$f" | sed s/\|/_/g)"' \;
