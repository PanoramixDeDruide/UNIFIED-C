#!/bin/bash

echo "#define unifiedf2(e1,e2,e3) e1##e2##e3"
echo "#define unifiedf1(e1,e2,e3) unifiedf2(e1,e2,e3)"
echo "??=define unifiedf4(e1,e2) e1##e2"
echo "??=define unifiedf3(e1,e2) unifiedf4(e1,e2)"
echo "#define unifiede1 \u0061"
echo "#define unifiede2 \u0062"
echo "#define unifiede3 \u0063"
for i in {0..255}; do
  hexi=`echo "obase=16;ibase=10;$i" | bc | tr [A-Z] [a-z]`
  if [[ ${#hexi} -eq 1 ]]; then
    hexi=`echo "0$hexi"`
  fi
  tens=${hexi:0:1}
  digs=${hexi:1:1}
  preq=`echo -n "??=define unifiedd$i unifiedf1(??/u00"`
  if [[ $tens == "a" ]]; then
    preq=`echo "$preq,unifiede1"`
  elif [[ $tens == "b" ]]; then
    preq=`echo "$preq,unifiede2"`
  elif [[ $tens == "c" ]]; then
    preq=`echo "$preq,unifiede3"`
  else
    preq=`echo "$preq,$tens"`
  fi
  if [[ $digs == "a" ]]; then
    preq=`echo "$preq,unifiede1)"`
  elif [[ $digs == "b" ]]; then
    preq=`echo "$preq,unifiede2)"`
  elif [[ $digs == "c" ]]; then
    preq=`echo "$preq,unifiede3)"`
  else
    preq=`echo "$preq,$digs)"`
  fi
  echo "$preq"
done
file=${1--}
while IFS= read -r line; do
  i=0
  braces=0
  while [[ $i -lt ${#line} ]]; do
    firstchar=${line:i:1}
    firstchar2=`printf "%x" "'$firstchar" | tr [a-z] [A-Z]`
    firstchar3=`echo $((16#$firstchar2))`
    firstchar4=`echo "unifiedd$firstchar3"`
    let "i = i + 1"
    if [[ $i -lt ${#line} ]]; then
      secondchar=${line:i:1}
      secondchar2=`printf "%x" "'$secondchar" | tr [a-z] [A-Z]`
      secondchar3=`echo $((16#$secondchar2))`
      secondchar4=`echo "unifiedd$secondchar3"`
      let "i = i + 1"
      echo -n "unifiedf3($firstchar4,unifiedf3($secondchar4,"
      let "braces = braces + 2"
    else
      echo -n "unifiedf3($firstchar4,)"
    fi
  done
  while [[ $braces -gt 0 ]]; do
    echo -n ")"
    let "braces = braces - 1"
  done
  echo ""
done < <(cat -- $file)
