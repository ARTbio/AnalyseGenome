grep -P "(^ID)|(^ +[GATCNgatcn ]+\d+)" transposon_sequence_set_v9.5.embl.txt > transposon_sequence_set_v9.5.fa

sed -i.bak -E "s/^ID   />/" transposon_sequence_set_v9.5.fa

sed -i.bak2 -E "s/(>[^ ]+) .+/\1/g" transposon_sequence_set_v9.5.fa

sed -i.bak3 -E "s/([GATCNgatcn]+) /\1/g" transposon_sequence_set_v9.5.fa

sed -i.bak4 -r "s/^ +//g" transposon_sequence_set_v9.5.fa

sed -i.bak5 -r "s/ +[0-9]+//g" transposon_sequence_set_v9.5.fa
