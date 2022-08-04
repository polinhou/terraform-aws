# README

### 架構圖

![image](https://github.com/polinhou/terraform-aws/blob/master/architecture.jpeg)

### 第一步

確認本機端可以使用 CLI 進行 AWS 環境操作

以及是否安裝 Terraform ([如果沒安裝請點](https://www.terraform.io/downloads))

---

### 第二步

首先請先修改 provider.tf 設定檔

```bash
provider "aws" {
    region                   = "<region>"
    profile                  = "<profile>"
}
```

<region> 修改成您環境的地區 e.x. us-west-2

<profile> 修改成您設定的profile名稱 e.x. default 

----

### 第三步

執行
```bash
terraform init
```

terraform 初始化並且下載相關的套件

---

### 第四步

執行
```bash
terraform plan
```

terraform 腳本執行前的DRY RUN，並且同時可以確保是否此修改是否符合預期

---

### 第五步

執行
```bash
terraform apply
```

腳本執行，會先將欲執行動作列出，需要再次輸入 `yes` 確認

---

### 第六步

執行成功後會出現類似以下
```bash
Outputs:

elb_dns_name = "!@#$%^&*()(*&^%$#@!.us-west-2.elb.amazonaws.com"
```

輸出的網址為ELB的網址，可以直接在網址連結就可以連到服務了

---

### 第七步

開啟瀏覽器連上網址就能看到類似畫面

![image](https://github.com/polinhou/terraform-aws/blob/master/result.png)
