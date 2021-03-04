FROM python:latest AS bw_img_maker
RUN pip install pillow

COPY /bw_img.py .

COPY /image.jpg .

COPY /index.html .

RUN python bw_img.py

FROM python:latest AS tra_img_maker
RUN pip install pillow

COPY /tra_img.py .

COPY /image.jpg .

COPY /image.png .

RUN python tra_img.py

FROM httpd:latest AS webtest

COPY --from=bw_img_maker /image.jpg /usr/local/apache2/htdocs/color.jpg

COPY --from=bw_img_maker /T_image.jpg /usr/local/apache2/htdocs/BW_image.jpg

COPY --from=tra_img_maker /TR_image.jpg /usr/local/apache2/htdocs/TR_image.jpg

COPY --from=bw_img_maker /index.html /usr/local/apache2/htdocs/index.html

EXPOSE 80
