import glob
from PIL import Image

# get all the jpg files from the current folder
for infile in glob.glob("*.jpg"):
  im = Image.open(infile)
  # convert to transparent image
  new_img = im.convert('RGBA')
  im_rgba = new_img.copy()
  im_rgba.putalpha(128)
  # chech if image exists
  if infile[0:2] != "TR":
      im_rgba.save("TR_" + infile, "PNG")