# data-fabric-docs

이 문서는 C4 model 에 기초하여 INT2 데이터 패브릭 프로젝트의 소프트웨어(시스템) 아키텍처에 대한 문서 프로젝트 입니다.
Documentation as a Code 의 아이디어를 착안해 [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr)를 이용해서 작성된 코드를 github webpage hosting 을 이용해서 발행하고 있습니다.

## 문서의 편집과 발행

### 문서의 편집
[문서 레포지토리](./)를 clone 하고, 에디터를 이용해서 필요한 문서를 추가하거나 편집 합니다.

### 문서 발행 전 디버깅
아래 명령어를 이용하면 docker container를 실행시킬 수 있습니다. Port forwarding 옵션을 추가해서 로컬 환경의 웹브라우저를 통해 발행 될 사이트에 대한 디버깅을 수행할 수 있습니다. 자세한 사용법은 [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr)에서 확인 가능합니다.

```bash
docker run -it --rm -v /path/to/local-repository/workspace:/var/model -p 8080:8080 \
ghcr.io/avisi-cloud/structurizr-site-generatr serve -w workspace.dsl
```
