# 한국기준금리 정량적 예측
방법: 정량분석으로 결정
1. 정성적 분석은 많은 대부분 분들이 해올 것으로 예상
2. 그간 자료를 다 찾아보는건 시간적으로 어려움이 있다.
3. 재밌다.

방향: 각 변수들의 추세를 파악 후 회귀분석
1. 변수들의 추세는 prophet을 사용하자.
2. 변수들은 기사를 통해 찾아내자.

변수 : 
1. 미국기준금리ㅇ
2. 한국기준금리 ㅇ
3. 경기동행지표 ㅇ
4. 물가상승률 ㅇ
5. 수입물가지수 ㅇ
6. 설비투자 ㅇ 
7. 수출금액지수 ㅇ
8. 고용 ㅇ
9. WTI_price ㅇ
10. 해외자본흐름 - 외국인주식매도 ㅇ

모델 : 회귀모델
한국기준금리 ~ 미국기준금리 + 경기동행지표 + 물가상승률 + 수입물가지수 + 수출금액지수 + 설비투자 + 실업률 + WTI + 해외자본흐름

# 결론: 실패
## 왜?
1. prophet은 큰 틀에서 추세를 알려주기 때문에 최근 변화는 무시하는 경향이 있는듯 하다.
2. 데이터 선택의 문제가 있을 수도 있다.
3. 다르게 생각해보면 현재 한국 데이터를 기반으로보면 기준금리를 올리지 않아도 되지 않을까?
