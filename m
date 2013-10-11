Received: from mail-pd0-f170.google.com ([209.85.192.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUUYe-0004RO-6I
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 04:42:36 +0000
Received: by mail-pd0-f170.google.com with SMTP id x10so3679575pdj.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2013 21:42:14 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: bcm47xxnflash: Use devm_kzalloc
Date: Fri, 11 Oct 2013 10:11:25 +0530
Message-Id: <1381466485-7534-3-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1381466485-7534-1-git-send-email-sachin.kamat@linaro.org>
References: <1381466485-7534-1-git-send-email-sachin.kamat@linaro.org>
Cc: computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com,
 zajec5@gmail.com, dwmw2@infradead.org, sachin.kamat@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

devm_kzalloc is device managed and simplifies the code.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/bcm47xxnflash/main.c |   18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 2dc3aa6..1074459 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -29,11 +29,9 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct bcm47xxnflash *b47n;
 	int err = 0;
 
-	b47n = kzalloc(sizeof(*b47n), GFP_KERNEL);
-	if (!b47n) {
-		err = -ENOMEM;
-		goto out;
-	}
+	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	if (!b47n)
+		return -ENOMEM;
 
 	b47n->nand_chip.priv = b47n;
 	b47n->mtd.owner = THIS_MODULE;
@@ -48,22 +46,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	}
 	if (err) {
 		pr_err("Initialization failed: %d\n", err);
-		goto err_init;
+		return err;
 	}
 
 	err = mtd_device_parse_register(&b47n->mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
-		goto err_dev_reg;
+		return err;
 	}
 
 	return 0;
-
-err_dev_reg:
-err_init:
-	kfree(b47n);
-out:
-	return err;
 }
 
 static int bcm47xxnflash_remove(struct platform_device *pdev)
-- 
1.7.9.5
