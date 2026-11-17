from django.urls import path,include
from . import views

app_name = ''
urlpatterns = [
    path('',views.index,name='index'),
    path('ajax_data/',views.ajax_data,name='ajax_data'),
]
