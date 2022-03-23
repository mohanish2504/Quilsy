from django.db import models

# Create your models here.
class Clip(models.Model):
    clipText = models.TextField(null=False)
    clipTitle = models.TextField(default="")

    def __str__(self):
        return str(self.id)