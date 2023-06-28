# 로컬 지식 그래프 아키텍처

Local Knowledge Graph 는 Data Set 에 포함된 metadata 와 자동화된 데이터 분석을 통해 generated metadata 에서 Entity를 식별하고 관계를 정의한다.

### 1. 메타데이터 추출 과 Fabric Data Catalog

아래 다이어그램은 Fabric 에 연결된 Data Set 에서 메타데이터를 추출하는 흐름을 나타낸다. 데이터 소스에서 메타데이터에 포함돼 있거나 추출된 데이터 스키마는 ODD Specification 을 통해서 Fabric Data Catalog 로 변환되어 관리된다. Meta Gin 은 메테데이터 프로세싱 엔진이다.

![Metadata 분석 및 추출](embed:WorkflowBuildingFabricDataCatalog)

작성된 Fabric Catalog 의 Entities 는 Knowledge Weaver 의 Semantic Processing 을 통해서 식별된 관계 정의와 함께 Local Knowlege Graph 로 구축된다. 

### 2. Local Knowledge Graph 구축과 Knowledge Catalog 로 통합

![Local Knowledge  Graph 구축](embed:WorkflowBuildingLocalKnowledgeGraph)

구축된 Fabric Data Catalog 와 Local Knowledge Graph 는 API 레벨에서 Knowledge Catalog 로 통합한다. 아래 다이어그램은 Knowlege Catalog 의 개념도를 나타낸다.

![Knowledge Catalog 개념도](embed:KnowledgeCatalog)

아래 그림은 생성된 Local Knowledge Graph 의 데이터 구조 예를 보여준다. "nuScene"이라는 이름의 DataSet 에 포함된 데이터 중 "description" 항목에 "pedestrain" 이라는 단어를 entity 로 식별 했을 때, 아래와 같이 그래프로 표현할 수 있다.

동의어의 관계를 추적해서 "보행자" 를 탐색하는 쿼리로 관련이 있는 Data Set 인 "자율주행" 이 존재한다는 것과 id 값을 추출해서 강화된 검색 결과를 제공하는 어플리케이션을 생각해볼 수 있다.


![](https://kroki.io/graphviz/svg/eNqVlL9u2zAQxmfpKQjOVuA6SdNG0ODaRgK0SYEayNJ4uEjnmMCJFEjajRP4Abp16lR06dI9HftGdd-hpARVVlLDqQaBJ919_H7HP9caihkbD05HZ312FwZTJa2EHBN-irRAK1Lo9LUA6hiQJjKoxZSHgVQZsvdPSp6EAWbX_5FNsFRzm0gEq-qZzAwKTFKhU8JJzMKAuYejtMIujwvM0FgNQvKNb9qojfjX_Y_fnz-uv37ibUkkEoVpNO-qnwRXSAk36QxzOB6ChTFaPmGZOZ-PU5QYu-FgbqzK49WOygugOfraxRBNqkVhhZKuftGXUlkooxVr27pSN84Sv-TPevsHh8-PXrzsXnIeh2HwL-goesRd-9BIYDHjHUKZHOx1u5N4p0bTqwZnKZVc5qbS6e0dljpblVqoDq0d-4S6j39nEGZEmDu5t24TOO0mwzt70IiHbRZZbawE9MvRrpfV-FGh34_bmDbaUCI1y-WBmqjiqTbDFhzfgjqjwum_GkQOKRoN3z2VZ6PemVp_-b7-9tMZ3M3ky8uXWqAmKJIpkEF_0FwZS5wd-UalQOy1VB-oPKwn1bVQCrLRDeQFodt-5fVgxC0mvW4crv4AwuVtVg==)

[편집](http://magjac.com/graphviz-visual-editor/?dot=graph%20SCHEMA%20%7B%0A%09fontname%3D%22Helvetica%2CArial%2Csans-serif%22%0A%09node%20%5Bfontname%3D%22Helvetica%2CArial%2Csans-serif%22%5D%0A%09edge%20%5Bfontname%3D%22Helvetica%2CArial%2Csans-serif%22%5D%0A%09layout%3Dneato%0A%09node%20%5Bshape%3Dcircle%5D%3B%20%0A%09%20%20%20%20%22entity%3Apedestrain%22%20%22entity%3Aperson%22%20%22entity%3A%EB%B3%B4%ED%96%89%EC%9E%90%22%0A%09node%20%5Bshape%3Dellipse%5D%3B%20%0A%09%20%20%20%20%7Bnode%20%5Blabel%3D%22schema%3ADataSet%22%5D%20dsNuScene%3B%20dsCustom%3B%7D%0A%09%20%20%20%20%7Bnode%20%5Blabel%3D%22schema%3ADataValue%22%5D%20dvDescription%3B%20dvAnnotation%3B%7D%20%0A%09node%20%5Bshape%3Dbox%5D%3B%20%22%5C%221234567890%5C%22%22%3B%0A%0A%09%22entity%3Apedestrain%22%20--%20%22entity%3Aperson%22%20%5Blabel%3D%22related%22%2Clen%3D4.00%5D%3B%0A%09%22entity%3Apedestrain%22%20--%20%22entity%3A%EB%B3%B4%ED%96%89%EC%9E%90%22%20%5Blabel%3D%22synonyms%22%2Clen%3D2.50%5D%3B%0A%09%0A%09%22entity%3Apedestrain%22%20--%20dvDescription%20%0A%09dvDescription%20--%20dsNuScene%20%5Blabel%3D%22isElementOf%22%5D%3B%0A%09dsNuScene%20--%20%22%5C%221234567890%5C%22%22%20%5Blabel%3D%22schema%3Aid%22%2Clen%3D2.00%5D%3B%0A%20%20%20%20dsNuScene%20--%20%22nuScene%22%20%5Blabel%3D%22schema%3Aname%22%2Clen%3D2.50%5D%3B%0A%09%0A%09%22entity%3A%EB%B3%B4%ED%96%89%EC%9E%90%22%20--%20dvAnnotation%0A%09dvAnnotation%20--%20dsCustom%20%5Blabel%3D%22isElementOf%22%5D%3B%20%0A%09dsCustom%20--%20%22%5C%22ABC-123-EDR%5C%22%22%20%5Blabel%3D%22schema%3Aid%22%2Clen%3D2.00%5D%3B%0A%20%20%20%20dsCustom%20--%20%22%EC%9E%90%EC%9C%A8%EC%A3%BC%ED%96%89%22%20%5Blabel%3D%22schema%3Aname%22%2Clen%3D2.50%5D%3B%0A%20%20%20%20%0A%20%20%20%20overlap%3Dfalse%0A%09label%20%3D%20%22%5CnLocal%20Knowledge%20Graph%20Schema%20Example%22%3B%0A%09fontsize%3D20%3B%0A%7D)

## 지식 그래프로 생성 과정 (예. nuScene 데이터)

1. nuScene Data Set 데이터 예시
```json
{
    {
    "scene": {
        "token": "73030fb67d3c46cfb5e590168088ae39",
        "log_token": "6b6513e6c8384cec88775cae30b78c0e",
        "nbr_samples": 40,
        "first_sample_token": "e93e98b63d3b40209056d129dc53ceee",
        "last_sample_token": "40e413c922184255a94f08d3c10037e0",
        "name": "scene-0001",
        "description": "Construction, maneuver between several trucks"
    },
    "sample": {
        "token": "e93e98b63d3b40209056d129dc53ceee",
        "timestamp": 1531883530449377,
        "prev": "",
        "next": "14d5adfe50bb4445bc3aa5fe607691a8",
        "scene_token": "73030fb67d3c46cfb5e590168088ae39"
    },
    "sample_data": {
        "token": "bddd80ae33ec4e32b27fdb3c1160a30e",
        "sample_token": "e93e98b63d3b40209056d129dc53ceee",
        "ego_pose_token": "bddd80ae33ec4e32b27fdb3c1160a30e",
        "calibrated_sensor_token": "7781065816974801afc4dcdaf6acf92c",
        "timestamp": 1531883530440378,
        "fileformat": "pcd",
        "is_key_frame": true,
        "height": 0,
        "width": 0,
        "filename": "samples/RADAR_FRONT/n015-2018-07-18-11-07-57+0800__RADAR_FRONT__1531883530440378.pcd",
        "prev": "",
        "next": "90df03ad4710427aabb5f88fe049df2e"
    },
    "sample_annotation": {
        "token": "2cd832644d09479389ed0785e5de85c9",
        "sample_token": "e93e98b63d3b40209056d129dc53ceee",
        "instance_token": "5e2b6fd1fab74d04a79eefebbec357bb",
        "visibility_token": "3",
        "attribute_tokens": [],
        "translation": [
            993.884,
            612.441,
            0.675
        ],
        "size": [
            0.3,
            0.291,
            0.734
        ],
        "rotation": [
            -0.04208490861058176,
            0.0,
            0.0,
            0.9991140377690821
        ],
        "prev": "5cd018cb2448415ab8aff4dc7256999a",
        "next": "",
        "num_lidar_pts": 2,
        "num_radar_pts": 0
    }
}
}
```
2. 

```json
{
    "oddrn": "//aws/s3/data/nuScene/catalog-sample.csv",
    "name": "1.csv",
    "owner": "aws:iam:88898998/username",
    "metadata": {
        "location": "internet",        
    },
    "parentOddrn": null,    
    "description": "nuScene Sample Data",
    "updatedAt": "2021-02-11T00:01:00Z",
    "subtype": "DATASET_TABLE",
    "fieldList": [
        {
           "oddrn": "//aws/s3/sample.data/path/to/folder/file.csv/token",
           "name": "token",
           "owner": "aws:iam:88898998/username",
           "metadata": {},
           "parentFieldOddrn": null,
           "type": "TYPE_STRING",
           "isKey": false,
           "isValue": false,
           "defaultValue": null,
           "description": "Goods name",
           "stats": {
               "string_stats": {
                   "maxLength": 120,
                   "avgLength": 52,
                   "nullsCount": 0,
                   "uniqueCount": 10000
               }
           }
        }      
    ]
}
```
