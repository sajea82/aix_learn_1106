from sklearn import svm, metrics

# 1. 데이터 준비 - 학습데이터, 테스트데이터 분리 8:2
# 학습데이터 : 2차원배열형태
data = [ [0,0],[0,1],[1,0],[1,1] ]
label = [0,1,1,0]
# 테스트 데이터
test_data = [[0,0],[1,0]]
test_label = [0,1]

# 특징(data)과 정답(label): 머신러닝 모델에게 "이러한 입력값이 들어오면(특징) 이런 결과가 정답이야(레이블)"라고 알려주기 위해 데이터를 2차원 형태와 1차원 리스트로 준비한 단계입니다.
# 학습용 데이터와 평가용(test_data)을 명확하게 구분해 두었습니다.


# 2.데이터 학습
clf = svm.SVC()        # 알고리즘 선택
clf.fit(data, label)   # 학습시키기

# 알고리즘 선택(svm.SVC): 서포트 벡터 마신(Support Vector Machine)이라는 분류 알고리즘 객체(clf)를 선언했습니다.
# 학습(fit): fit(data, label)을 실행함으로써 컴퓨터가 데이터와 정답 사이의 패턴을 분석하고 가중치를 조정하며 공부(학습)를 마칩니다.

# 3. 데이터 예측
results = clf.predict(test_data) # 테스트데이터를 가지고 예측실행
print("예측결과:", results)   # 0,1

# 예측(predict): 학습이 끝난 모델에게 새로운 데이터(test_data)를 던져주고 "네가 배운 대로 이 데이터의 정답을 맞춰봐!" 하고 결과를 받아오는 단계입니다.


# 4. 정답율
# score = metrics.accuracy_score(test_label, results)
score = clf.score(test_data, test_label) #정답율을 계산할수 있음
print("정답율:", score)   # 1.0

# 성능 측정: 모델이 예측한 결과와 실제 정답(test_label)을 비교하여 몇 개나 맞췄는지 정확도(Accuracy)를 계산합니다. (1.0은 100점 만점을 의미합니다.)
