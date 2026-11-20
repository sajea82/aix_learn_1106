import pandas as pd

# 파일읽어오기
df = pd.read_json('db/searchMovieList.json')
print(df.head(2))


# 파일저장
df.to_csv('searchMovie.csv',encoding='utf-8-sig')
print('완료')