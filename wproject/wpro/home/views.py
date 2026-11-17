from django.shortcuts import render
from django.http import JsonResponse
from pathlib import Path
import os
import joblib

BASE_DIR = Path(__file__).resolve().parent.parent
model = joblib.load(BASE_DIR / "model.joblib")

def ajax_data(request):
    data = request.POST.get('data','40,11.73,7.22')
    # 파일 변환
    in_data = data
    in_data = in_data.split(',')
    result = list(map(float,in_data))

    # 예측
    print('입력데이터 : ',result)
    result = model.predict([result])
    print(f'예측무게 : {result[0]:.2f} g')
    # 파일전달
    context = {
        'result_data':f'{result[0]:.2f}','result':'success'
    }
    return JsonResponse(context)


# 메인페이지
def index(request):
    # BASE_DIR = Path(__file__).resolve().parent.parent
    # model = joblib.load(BASE_DIR / "model.joblib")
    # # 예측
    # in_data = '40,11.73,7.22'
    # in_data = in_data.split(',')
    # result = list(map(float,in_data))

    #예측
    # print('입력데이터 : ',result)
    # result = model.predict([result])
    # print(f'예측무게 : {result[0]:.2f} g')
    # print("주소 : ",BASE_DIR)

    return render(request,'index.html')