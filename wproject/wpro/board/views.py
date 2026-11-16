from django.shortcuts import render
from . import views

def list(request):
    return render(request,'list.html')
    