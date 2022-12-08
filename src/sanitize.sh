mkdir -p ./pdf

for i in ./default_pdf/*.pdf;
do
    name_file=./pdf/$(sha256sum "$i" | cut -d " " -f1).pdf
    if [ ! -f $name_file ]
    then
        echo $name_file
        cp "$i" "$name_file"
    fi
done


mkdir -p ./fpdf
for i in ./fun_pdf/*.pdf;
do
    name_file=./fpdf/$(sha256sum "$i" | cut -d " " -f1).pdf
    if [ ! -f $name_file ]
    then
        echo $name_file
        cp "$i" "$name_file"
    fi
done
