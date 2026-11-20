
import pandas as pd

# 1. JSON 파일 읽기
df = pd.read_json("db/galleryList.json")

# 2. 1부터 시작하는 gno 컬럼을 맨 앞(0번 위치)에 추가
df.insert(0, "gno", range(1, len(df) + 1))

# 3. 불필요한 인덱스 열 없이 CSV 저장
df.to_csv("galleryList.csv", index=False, encoding="utf-8-sig")
print("저장 완료! 행 개수:", len(df))