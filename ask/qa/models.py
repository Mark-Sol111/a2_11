"""QA models."""

import datetime
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


class Question(models.Model):
    """Question."""

    title = models.CharField(max_length=255)
    text = models.TextField()
    added_at = models.DateField()
    rating = models.IntegerField(default=0)
    author = User()
    likes = models.ManyToManyField(User)

    def __str__(self):
        """Self representation."""
        return self.title

    def was_published_recently(self):
        """Recently."""
        return self.added_at >= timezone.now() - datetime.timedelta(days=1)

    def get_abdolute_url(self):
        """Path."""
        return '/question/%d/' % self.pk

    class Meta():
        """MetaInfo."""

        db_table = 'question'
        ordering = ['-added_at']


class QuestionManager(models.Manager):
    """Custom Manager."""

    def new(self):
        """Latest question."""
        return Question.objects.order_by('added_at')

    def popular(self):
        """Sort by rating."""
        return Question.objects.order_by('rating')


class Answer(models.Model):
    """UsersAnswer."""

    text = models.TextField()
    added_at = models.DateField()
    questtion = models.ForeignKey(Question, on_delete=models.CASCADE)
    author = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        """Self representation."""
        return self.text

    def get_absolute_url(self):
        """Path."""
        return '/quesiton/%d' % self.pk

    class Meta():
        """Meta."""

        db_table = 'answer'
        ordering = ['-added_at']
