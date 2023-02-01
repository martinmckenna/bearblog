FROM python:3.6.5
ENV DEBUG=False
ENV SECRET=passsomesecret
ENV SENDGRID_API_KEY=passsomeapikey
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY ./blogs/migrations /app/blogs/migrations
COPY ./blogs/models.py /app/blogs/models.py
COPY ./manage.py /app/manage.py
COPY ./textblog /app/textblog
COPY ./blogs/helpers.py /app/blogs/helpers.py
COPY ./blogs/urls.py /app/blogs/urls.py
COPY ./blogs/views.py /app/blogs/views.py
COPY ./blogs/forms.py /app/blogs/forms.py

RUN python manage.py migrate

COPY . /app/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
