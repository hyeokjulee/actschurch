## 1. 소개
행전우리교회 홈페이지입니다. 운영에 어려움이 있는 개척교회를 돕기 위해 봉사 목적으로 개발되었습니다.
- 링크 : http://actswoori.org


<br><br>


## 2. 개발 및 운영 환경
- 백엔드 : Java 8, Servlet 3.1, JSP 2.3, MyBatis 3.5
- 인프라 : CentOS 7, Tomcat 8.5, MariaDB 10.0
- 협업 도구 : Git, Discord, Notion, Google Workspace
- 외부 서비스 연동 : 네이버 메일 SMTP 서버, Kakao 지도 API, 카카오 로그인
- 깃 브랜치 전략 : GitLab Flow
  - 인원별로 역할 분담을 하여 각자 구현해야 할 기능이 구분되어 있기 때문에 기능별로 브랜치를 나누는 대신에 인원별로 브랜치를 나누었습니다. 브랜치를 합쳐야 할 경우에는 먼저 테스트할 브랜치로 머지하여 그 안에서 테스트 후 문제가 없다면 최종적으로 마스터 브랜치로 머지하는 식으로 진행하였습니다.


<br><br>


## 3. 데이터 모델링 / DB 및 ERD 설계
<img width="500" src="ERD.png">


<br><br>


## 4. IA
<img width="700" src="IA.png">


<br><br>


## 5. 상세 내용

### 사용자

- 사용자는 관리자, 회원, 비회원으로 구분됩니다. 인증과 인가는 세션 기반 인증 방식으로 처리했습니다.
- 회원가입은 회원가입 신청 후 관리자가 가입 승인을 해야 완료됩니다.
- 비밀번호 찾기 시 본인 이메일 인증 후 비밀번호를 재설정하는 방식입니다. 메일 발송은 Naver Mail SMTP Server를 통해 처리됩니다.


### 갤러리

- 이미지 업로드 시 다중 이미지 파일 업로드가 가능하도록 Apache Commons IO와 Apache Commons FileUpload를 이용했습니다.
- 갤러리 게시판 첫 화면에서 썸네일을 보기 쉽게 표시하기 위해 Bootstrap을 이용했습니다. 그리고 게시물 표시 개수 조정, 여러 옵션에 대한 검색, 페이징을 동시에 처리할 수 있도록 Mybatis 동적 쿼리를 이용했습니다.
- 자세히 보기 시 원본 이미지를 볼 수 있게 하기 위해 Lightbox를 사용했습니다. 썸네일 클릭 시 자세히 보기가 가능합니다.


### 주보

- PDF 형식의 주보 업로드, 다운로드, 열람이 가능합니다. 편리한 다운로드와 열람을 위해 PDF.js와 iframe을 이용했습니다.
- 주보 게시판 첫 화면에서 게시물 표시 개수 조정, 여러 옵션에 대한 검색, 페이징을 동시에 처리할 수 있도록 Mybatis 동적 쿼리를 이용했습니다.


### 일반 게시판

- 이미지 파일이나 PDF 파일의 업로드가 아닌 일반 글 작성이 목적인 게시판입니다. 예배 설교, 주요 특강, 복음과 교리, 말씀 서원, 교회 소식, 협력 교회와 기관 소식이 있습니다.
- 게시글 작성 시 편리한 작성을 위해 Summernote를 이용했습니다.
- 게시판 첫 화면에서 게시물 표시 개수 조정, 여러 옵션에 대한 검색, 페이징을 동시에 처리할 수 있도록 Mybatis 동적 쿼리를 이용했습니다.


### 오시는 길

- 교회 위치 표시를 위해 Kakao Map API를 이용했습니다. 정확한 위치를 쉽게 볼 수 있게 로드뷰 보기 기능을 추가했습니다.


### 유효성 검사

- 입력 데이터의 유효성 검사를 위해 정규 표현식을 이용했습니다.


<br><br>


## 6. 운영 중 발생한 문제 / 트러블 슈팅

운영 중에 서버 용량이 가득 차는 현상이 발생했습니다. 원인을 분석해보니 10MB 이상의 고용량 이미지 파일들이 다수 업로드되어 있는 것을 발견했습니다. 소규모의 웹사이트이므로 용량이 작은 서버를 이용 중인 것도 있었지만 그것이 주된 문제는 아니었기 때문에 업로드 파일의 용량을 줄이기로 결정하고 문제를 해결하였습니다.
이미지 파일 업로드 시 5MB 이상의 파일은 올릴 수 없도록 처리했고 기존에 업로드되어 있던 이미지 파일들은 압축한 파일로 교체해 주었습니다. 기존에 업로드되어 있던 이미지 파일들이 전부 JPEG 형식(손실 압축 방식)이었기 때문에 이미 용량이 충분히 작은 파일들은 압축 시 압축률을 낮게 하여 기존의 이미지들을 보는 데에는 최대한 영향이 가지 않도록 해 부작용이 생기지 않게끔 문제를 해결했습니다.
