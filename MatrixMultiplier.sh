mul(){ ##### BEGINNING OF mul, matrix multiplier #####
	local -n arr1=$1 arr2=$2;
	P=$3; : ${P=-0} 
	R=${arr1[@]}
	CR=(${R%%,*}); CR=${#CR[@]}
	R=${R//[^,]}; let R=${#R}+1
	arr1=(${arr1[@]//,/ })
	C=${arr2[@]}
	C=(${C%%,*}); C=${#C[@]}
	arr2=(${arr2[@]//,/ })
	for((r=0;r<$R;r++)){
		for((c=0;c<$C;c++)){	M=0
			for((cr=0;cr<$CR;cr++)){
				M=`bc<<<"$M+${arr1[r*CR+cr]}*${arr2[cr*C+c]}"`;}
			printf -v arr[r*C+c] %.${P}f $M
};}
	for((r=0;r<$R;r++)){ echo
		for((c=0;c<$C;c++)){	echo -n ${arr[r*$C+c]}\ ;};}
} ##### ENDING OF mul, matrix #####
