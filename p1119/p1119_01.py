import pandas as pd
import requests

url = "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=12468492e3342af45386faec3f334193"
params = {
    "curPage": "1",
    "itemPerPage": "100",
}

res = requests.get(url, params=params)
res.raise_for_status()
data = res.json()

movie_list = data["movieListResult"]["movieList"][:100]

rows = []
for idx, m in enumerate(movie_list, start=1):
    rows.append({
        "mno": idx,
        "movieCd": m.get("movieCd"),
        "movieNm": m.get("movieNm"),
        "movieNmEn": m.get("movieNmEn"),
        "prdtYear": m.get("prdtYear"),
        "openDt": m.get("openDt"),
        "typeNm": m.get("typeNm"),
        "prdtStatNm": m.get("prdtStatNm"),
        "nationAlt": m.get("nationAlt"),
        "genreAlt": m.get("genreAlt"),
        "repNationNm": m.get("repNationNm"),
        "repGenreNm": m.get("repGenreNm"),
    })

df = pd.DataFrame(rows)
df.to_csv("movie_list_100.csv", index=False, encoding="utf-8")
print("저장된 행 수:", len(df))