# Generated by Django 3.1.14 on 2023-11-08 10:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blogs', '0091_auto_20231108_1009'),
    ]

    operations = [
        migrations.AddField(
            model_name='blog',
            name='dashboard_styles',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='blog',
            name='robots_txt',
            field=models.TextField(blank=True),
        ),
    ]
