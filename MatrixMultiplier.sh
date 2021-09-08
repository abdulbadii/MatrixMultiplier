mul(){ ##### BEGINNING OF mul, matrix multiplier #####
	unset IFS; local -n arr1=$1 arr2=$2;
	p=$3; : ${p=-0} 
	R=${arr1[@]}
	CR=(${R%%,*}); CR=${#CR[@]}
	r=${arr2[@]};r=${r//[^,]}
	((${#r}+1-CR)) &&{ echo The number of 1st matrix column must be equal to row number of 2nd one;return;}
	R=${R//[^,]}; let R=${#R}+1
	arr1=(${arr1[@]//,/ })
	C=${arr2[@]}
	C=(${C%%,*}); C=${#C[@]}
	arr2=(${arr2[@]//,/ })
	for((r=0;r<$R;r++)){
		for((c=0;c<$C;c++)){	M=0
			for((cr=0;cr<$CR;cr++)){
				M=`bc<<<"$M+${arr1[r*CR+cr]}*${arr2[cr*C+c]}"`;}
			printf -v arr[r*C+c] %.${p}f $M
};}
	for((r=0;r<$R;r++)){ echo
		for((c=0;c<$C;c++)){	echo -n ${arr[r*$C+c]}\ ;}
		};echo
} ##### ENDING OF mul, matrix #####
rot(){ ##### BEGINNING OF rot, rotation #####
	unset IFS; local -n arr1=$1
	p=${3#p=};D=$2
	[ -z "$p" ] &&{
		if [[ "$2" = p=[0-9]* ]] ;then p=${2#p=};D=45
		else
			p=0
			if [ "$2" = - ] ;then D=-45
			elif [ -z "$2" ] ;then D=45;fi
		fi
	}
	d=`bc -l<<<"$D/180*3.14159265358979323844"` #pi
	cos=`bc -l<<<"c($d)"`
	sin=`bc -l<<<"s($d)"`
	minsin=`bc -l<<<"-1*$sin"`
	R=${arr1[@]}
	CR=(${R%%,*}); CR=${#CR[@]}
	((CR==2))||{ echo Column of matrix must be 2;return ;}
	R=${R//[^,]}; let R=${#R}+1
	arr1=(${arr1[@]//,/ })
	arr2=($cos $minsin $sin $cos)
	for((r=0;r<$R;r++)){
		for((c=0;c<2;c++)){	M=0
			for((cr=0;cr<$CR;cr++)){
				M=`bc<<<"$M+${arr1[r*CR+cr]}*${arr2[cr*2+c]}"`;}
			printf -v arr[r*2+c] %.${p}f $M
};}
echo "Rotated by $D degree on cartesian system (start at horizontal line, counterclockwise):"
	for((r=0;r<R;r++)){ echo
		for((c=0;c<2;c++)){	echo -n ${arr[r*2+c]}\ ;}
		};echo
} ##### ENDING OF rot, matrix #####
