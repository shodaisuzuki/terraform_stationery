# terraformの雛形作成

## 1.terraformをダウンロードする

```
$ curl -O https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip
$ sudo unzip terraform_0.11.1_linux_amd64.zip -d /usr/bin/
$ terraform --version
```

## 2. git clone
```
$ git clone https://github.com/shodaisuzuki/terraform_stationery.git
```

## 構成

```
$ tree
├── README.md
├── bin
│   ├── apply
│   ├── plan
│   └── terraform.exec.sh
├── environments
│   ├── production
│   │   ├── config
│   │   │   └── production.conf
│   │   ├── tfvars
│   │   │   ├── credential.tfvars
│   │   │   └── production.tfvars
│   │   └── user_data
│   │       └── user_data.sh
│   └── staging
│       ├── config
│       │   └── staging.conf
│       ├── tfvars
│       │   ├── credential.tfvars
│       │   └── staging.tfvars
│       └── user_data
│           └── user_data.sh
├── tf
│   ├── auto_scaling.tf
│   ├── load_balancer.tf
│   ├── production
│   └── staging
└── tfvars
    └── common.tfvars
```

### bin
terraform実行ファイル

```
$ ./terraform_stationery/bin/plan | apply
```

### enviroments
環境ごとの設定値を記述

### tf
AWS構成を定義する
ファイル名はサービス単位で作成
tf直下の.tfは共通のリソースを記述
環境名の下には環境別のリソースを記述する

### tfvars
tfファイルで使用する設定値
共通の設定値をここに書き、環境別の設定値はenvironmentsの方に書く

### lib

#### lib/add_env
環境を追加する
```
$ ./lib/ add_env ENV
```

#### lib/remove_env
環境を削除する
```
$ ./lib/ remove_env ENV
```

## 参考

### リファレンス
https://www.terraform.io/docs/commands/index.html

### 構築
http://made.livesense.co.jp/entry/2016/07/12/083000
https://tech.recruit-mp.co.jp/infrastructure/post-10665/
https://qiita.com/zembutsu/items/93e546df765f8b2c4f32

### 壊れた時の復旧参考
https://qiita.com/minamijoyo/items/e0f69bfa853bef60977e#%E3%83%80%E3%83%9F%E3%83%BC%E3%81%AEtf%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E4%BD%9C%E3%82%8B
https://blog.stormcat.io/post/entry/2015/06/01/210500/
