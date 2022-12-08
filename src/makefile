# Usage:
# make			# make the final video
# make vids		# make the videos
# make clean 	# clean all

Fpdf := ./pdf
Fimg := ./img
Fvid := ./vid

Ffpdf := ./fpdf
Ffimg := ./fimg

PDF := $(wildcard ${Fpdf}/*.pdf)
fPDF := $(wildcard ${Ffpdf}/*.pdf)
FIL := $(PDF:${Fpdf}/%.pdf=%)
fFIL := $(fPDF:${Ffpdf}/%.pdf=%)
VID := $(FIL:%=${Fvid}/%.mp4) $(fFIL:%=${Fvid}/%.mp4)
OUT := final_vid.mp4

MKDIR = @mkdir -p $(@D)

all: ${OUT}

clean:
	rm -rf ${Fpdf} ${Fimg} ${Fvid} ${Ffpdf} ${Ffimg} ${OUT} input.txt

${OUT}: ${VID}
	printf "file %s\n" ${Fvid}/*.mp4 > input.txt
	ffmpeg -f concat -safe 0 -i input.txt -y -c copy $@

${Fvid}/%.mp4: ${Fimg}/%.png
	$(MKDIR)
	ffmpeg -loop 1 -i $^ -y -movflags +faststart -vf scale=1920:1080 -t 10 -c:v libx264 -pix_fmt yuv420p -framerate 24 $@

${Fvid}/%.mp4: ${Ffimg}/%.png
	$(MKDIR)
	ffmpeg -loop 1 -i $^ -y -movflags +faststart -vf scale=1920:1080 -t 500ms -c:v libx264 -pix_fmt yuv420p -framerate 24 $@

${Fimg}/%.png: ${Fpdf}/%.pdf
	$(MKDIR)
	pdftoppm -png -rx 144 -ry 144 -singlefile $^ $(basename $@)

${Ffimg}/%.png: ${Ffpdf}/%.pdf
	$(MKDIR)
	pdftoppm -png -rx 144 -ry 144 -singlefile $^ $(basename $@)
