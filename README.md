# 🔗 Engenius_team3 🔗

<div align> 
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white">
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white">
<img src="https://img.shields.io/badge/PyCharm-000000?style=for-the-badge&logo=PyCharm&logoColor=white">
<img src="https://img.shields.io/badge/Jupyter-F37626?style=for-the-badge&logo=Jupyter&logoColor=white">
<img src="https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=SQLite&logoColor=white">
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white">
</div align> 

&nbsp;

## 👥 Members
**[Engenius_team3]** <br/>
**2023111809 장예서 / 2021111599 배채윤 / 2024111799 유지민**

&nbsp;

## 🔍 Project subject

#### [Topic]
|산업제어시스템 보안위협 탐지|
|-----|

#### [Background]
- 산업제어시스템(ICS)은 효율성과 원격 제어 기능 강화를 위해 IT 네트워크와 연결하는 경우가 증가하는 추세
- 이에 따라 외부로부터 사이버 보안 위협 (공격) 가능성도 함께 급증하고 있음
- 사이버 공격이 정교화·다양화 되면서 기업 및 기관들은 보안 위협에 대한 사전 대응이 필수적
- 기존의 보안 시스템은 주로 공격 발생 후에 대응하는 방식이 많음 (실시간으로 공격을 탐지하고 예방하는데 한계 존재)
- 통합적이고 정교한 보안 시스템의 필요성을 깨닫고 3팀은 데이터 기반으로 대응책을 모색하고자 함

&nbsp;

## 📜 Data Info
#### [데이터 출처]
DataON 국가연구데이터플랫폼 / 제어시스템 보안데이터셋: HAI/HAIEnd 23.05 <br/>
#### [데이터 정보]
- HAI : 산업제어시스템(ICS) 정상/비정상 동작 포함 보안 데이터셋 
- HAIEnd : HAI 데이터의 상세한 내부 제어 로직 포함 데이터셋 (전반적 과정에서 사용 X)
#### [데이터 특징]
- HAI 23.05 버전인 이전 버전인 HAI 22.04와 동일한 정상 시나리오로 동작, 동일한 태그 값을 매초 수집
- 각 csv 파일은 시간 연속성을 가짐

&nbsp;

## ✒ Used Columns
|유량 센서 밸브|수위 센서 밸브|압력 센서 밸브|
|-----|-----|-----|
|P1_FCV01D - P1FCV01Z <br/> P1_FCV02D - P1FCV02Z <br/> P1_FCV03D - P1FCV03Z |P1_LCV01D - P1LCV01Z|P1_PCV01D - P1PCV01Z <br/> P1_PCV02D - P1PCV02Z |

&nbsp;

## 🔄 Process
#### [Data Preprocessing]
- 시간 순 정렬 (timestamp)
- 명령값(D) - 실행값(Z) 차이 계산 → |D-Z| 차이 계산 (기준 : 0.3)
- 이상치 (outlier) 처리
- 정규화 및 표준화
- 불필요한 컬럼 제거 (유지 보수 목적 컬럼, 단순 출력값 등)
- 라벨링(labeling)

#### [Data Modeling]
|Model|Decision Tree|Random Forest|XGBoost|
|-----|-----|-----|-----|
|Accuracy|0.9350|0.9350|0.9120|

#### [DataBase Configuration]
- **Software**
  : MySQL, SQLite
- **DataBase inventory**
  : sudden_changes / attack_intervals / attack_probabilities / predicted_future_threats
