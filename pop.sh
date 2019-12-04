dir=.
for file in $dir/*;
do
  if [ "$file" != "./pop.sh" ]
  then
  start=$(awk '{if($0 ~ /Inferred clusters/){print NR;exit;}}' $file )
  end=$(awk '{if($0 ~ /Estimated Allele Frequencies/){print NR;exit;}}' $file )
  awk -v start=$start -v end=$end '{if(NR > start && NR < end){print $0;if(NR > end){exit;}}}' $file

  fi
done
