from django.shortcuts import render
from django.http import JsonResponse
from pathlib import Path
import os
import joblib


def ajax_data(request):
    data = request.POST.get('data','40,11.73,7.22')
    #### 머신러닝 예측 결과
    context = {
        'result':data,'result2':874.54
    }
    return JsonResponse(context)


def index(request):
    data = request.POST.get('data','40,11.73,7.22')
    context = {'result':data,'result2':876.54}
    return render(request,'index.html',context)