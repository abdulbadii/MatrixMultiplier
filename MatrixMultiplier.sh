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
	for((r=0;r<$R;r++)){
		for((c=0;c<$C;c++)){	echo -n ${arr[r*$C+c]}\ ;}
		echo;}
} ##### ENDING OF mul, matrix #####
rot(){ ##### BEGINNING OF rot, rotation matrix #####
	local -n arr1=$1; p=3.1415926535898
	P=$3;D=$2
	[ -z "$P" ] &&{
		if [[ "$2" = P=[0-9]* ]] ;then P=${2#P=};D=45
		else
			P=0
			if [ "$2" = - ] ;then D=-45
			elif [ "$2" ] ;then D=$2
			else D=45;fi
		fi
	}
	d=`bc -l<<<"$D/180*$p"`
	cos=`bc -l<<<"c($d)"`
	sin=`bc -l<<<"s($d)"`
	minsin=`bc -l<<<"-1*$sin"`
	R=${arr1[@]}
	CR=(${R%%,*}); CR=${#CR[@]}
	R=${R//[^,]}; let R=${#R}+1
	arr1=(${arr1[@]//,/ })
	arr2=($cos $minsin $sin $cos)
	C=2
	for((r=0;r<$R;r++)){
		for((c=0;c<$C;c++)){	M=0
			for((cr=0;cr<$CR;cr++)){
				M=`bc<<<"$M+${arr1[r*CR+cr]}*${arr2[cr*C+c]}"`;}
			printf -v arr[r*C+c] %.${P}f $M
};}
echo "Rotated by $D degree based on cartesian system (counter clockwise)"
	for((r=0;r<$R;r++)){
		for((c=0;c<$C;c++)){	echo -n ${arr[r*$C+c]}\ ;}
		echo;}
} ##### ENDING OF rot, matrix #####
