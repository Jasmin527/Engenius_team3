import pandas as pd

# 데이터 불러오기
df_hai = pd.read_csv("preprocessed_data.csv")

# 비교하고 싶은 컬럼 쌍 리스트
column_pairs = [
    ('P1_FCV01D', 'P1_FCV01Z'),
    ('P1_FCV02D', 'P1_FCV02Z'),
    ('P1_FCV03D', 'P1_FCV03Z'),
    ('P1_LCV01D', 'P1_LCV01Z'),
    ('P1_PCV01D', 'P1_PCV01Z'),
    ('P1_PCV02D', 'P1_PCV02Z')]

for col1, col2 in column_pairs:
    diff = (df_hai[col1] - df_hai[col2]).abs()  # 절댓값 차이
    mean_val = diff.mean()  # 평균
    std_val = diff.std()  # 표준편차
    threshold = mean_val + 3 * std_val  # 정규분포(임계값)
    max_val = diff.max()  # 최대차이
    min_val = diff.min()  # 최소차이
    flag_col = f'{col1} - {col2}_flag'

    # 결과 요약 출력
    over_count = df_hai[flag_col].sum()
    total = len(df_hai)
    percent = (over_count / total) * 100
    print(f"[{col1} vs {col2}]")
    print(f" 평균: {mean_val:.4f}")
    print(f" 표준편차: {std_val:.4f}")
    print(f" 임계값 (mean + 3*std): {threshold:.4f}")
    print(f" 최대 차이: {max_val:.4f}")
    print(f" 최소 차이: {min_val:.4f}")
    print(f" 임계값 초과 개수: {over_count}개 / 전체 {total}개")
    print(f" 전체의 {percent:.2f}%\n")
