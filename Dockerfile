FROM python:3.6.5
ENV DEBUG=False
ENV SECRET=passsomesecret
ENV SENDGRID_API_KEY=passsomeapikey
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt

# These files are necessary for the migration script to initialize the DB
# we want to mitigate copying over source files that might read from a database
# that may not exist yet
COPY ./blogs/migrations /app/blogs/migrations
COPY ./blogs/models.py /app/blogs/models.py
COPY ./manage.py /app/manage.py
COPY ./textblog /app/textblog
COPY ./blogs/helpers.py /app/blogs/helpers.py
COPY ./blogs/urls.py /app/blogs/urls.py
COPY ./blogs/apps.py /app/blogs/apps.py
COPY ./blogs/forms.py /app/blogs/forms.py
COPY ./blogs/hooks.py /app/blogs/hooks.py
COPY ./blogs/views /app/blogs/views
COPY ./blogs/templatetags /app/blogs/templatetags

RUN python manage.py migrate

# finally, copy over the rest of the files
COPY . /app/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
