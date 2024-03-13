from django.urls import path
from djapp import views

urlpatterns = [
    path('', views.djapp, name='hello_world'),
]