sed -Ene '/^\s*\w+\(\)\{\s+#{5,}\s*BEGINNING OF mul, matrix/,/\}\s+#{5,}\s*ENDING OF l, find/{s/^li\(\)/l\(\)/; wMatrixMultiplier.sh' -e '}' ~/.bashrc
