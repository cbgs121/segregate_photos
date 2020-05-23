year=()						#creating array  year work as visited array
mkdir segregated_file
for file in *.jpg
do
	a=0
	for i in ${year[@]}
	do
		if [ $i = ${file:0:4} ]		#check if year contained in file name visited prviously or not
		then						
			a=`expr $a + 1`
			break
		fi
	done
	if [ $a -eq 0 ]				#if not visited then add  current file year to year visited array
	then
		temp=" "
		temp+=${file:0:4}
		year+=$temp
		mkdir segregated_file/${file:0:4}			# create a directory with current visited year
		month=()									# month as visited array  
		for mnth in $(ls | grep  ${file:0:4})			#loop over all the file contianing current year as prefix
		do
			b=0
			for c in ${month[@]}			
			do												
				if [ $c = ${mnth:5:1} ]					# check if current month is already visited
				then
					b=`expr $b + 1`
					mv $file segregated_file/${file:0:4}/${mnth:5:1}		# if visited then move current file to the existing dir
					break
				fi
			done
			if [ $b -eq 0 ]					# if not visited month				
			then
				 
				temp1=" "
				temp1+=${mnth:5:1}
				month+=$temp1					#mark as visited
				mkdir segregated_file/${file:0:4}/${mnth:5:1}   #create dir
			fi
				mv $mnth segregated_file/${file:0:4}/${mnth:5:1}   # move to created directory
		done
	fi
done

