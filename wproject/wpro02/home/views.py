from django.shortcuts import render
from django.http import JsonResponse
from pathlib import Path
import joblib
import numpy as np
from scipy.special import softmax

BASE_DIR = Path(__file__).resolve().parent.parent

# 모델 로드 (model_ex.joblib)
model_ex = joblib.load(BASE_DIR / "model_ex.joblib")

def ajax_data(request):
    data = request.POST.get('data', '290.0,26.3,31.2,12.48,4.3056')
    
    # 1. 입력 데이터 변환
    in_data = data.split(',')
    result = list(map(float, in_data))
    print('입력데이터 : ', result)
    
    # 2. 주피터에서 쓰신 예측 및 확률 계산 로직 그대로 적용
    pred_fish = model_ex.predict([in_data])[0]
    decisions = model_ex.decision_function([in_data])
    soft1 = softmax(decisions, axis=1)
    result_all = np.round(soft1, decimals=3)[0]
    
    # 조건문으로 해당 생선의 확률 매칭
    if pred_fish == 'Bream':
        pred_prob = result_all[0]
    elif pred_fish == 'Parkki':
        pred_prob = result_all[1]
    elif pred_fish == 'Perch':
        pred_prob = result_all[2]
    elif pred_fish == 'Pike':
        pred_prob = result_all[3]
    elif pred_fish == 'Roach':
        pred_prob = result_all[4]
    elif pred_fish == 'Smelt':
        pred_prob = result_all[5]
    elif pred_fish == 'Whitefish':
        pred_prob = result_all[6]
    else:
        pred_prob = 0.0

    print(f'예측 생선 : {pred_fish} (예측확률 : {pred_prob})')
    print('전체확률 : ', result_all)
    
    # 3. 프론트엔드(HTML)로 전달
    context = {
        'result': 'success',
        'result_data': str(pred_fish),              # 예측된 생선 이름
        'probability': float(pred_prob),            # 해당 생선 예측 확률
        'probabilities': result_all.tolist()        # 7개 품종 전체 확률 배열 (나중에 그래프용으로 쓰기 좋음)
    }
    return JsonResponse(context)

def index(request):
    return render(request, 'index.html')