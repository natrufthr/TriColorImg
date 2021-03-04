import glob
from PIL import Image


# get all the jpg files from the current folder
for infile in glob.glob("*.jpg"):
  im = Image.open(infile)
  # convert to thumbnail image
  greyscale_img = im.convert(mode="1", dither=Image.NONE)
  # don't save if thumbnail already exists
  if infile[0:2] != "T_":
    greyscale_img.save("T_" + infile, "JPEG")