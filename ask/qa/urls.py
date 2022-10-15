"""QA urls."""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.test, name='qa_index'),
    # ex: /polls/5/
    path('[0-9]+/', views.test, name='qa_detail'),
]
