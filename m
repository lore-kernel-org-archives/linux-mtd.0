Received: from mail-ea0-f171.google.com ([209.85.215.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tnqfp-0007LL-3T
 for linux-mtd@lists.infradead.org; Wed, 26 Dec 2012 13:05:29 +0000
Received: by mail-ea0-f171.google.com with SMTP id n10so3568500eaa.16
 for <linux-mtd@lists.infradead.org>; Wed, 26 Dec 2012 05:05:26 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH] mtd: bcm47xxsflash: add own struct for abstrating bus
 type
Date: Wed, 26 Dec 2012 14:05:22 +0100
Message-Id: <1356527122-32137-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
The biggest problem with that seems to be:
> b47s->window = sflash->window;
> b47s->blocksize = sflash->blocksize;
> b47s->numblocks = sflash->numblocks;
> b47s->size = sflash->size;

In theory we could use some generic struct with that fields and modify
bcma to user that generic struct. I'm just not sure if it's worth adding
extra struct to just avoid such a 4 lines...?
---
 drivers/mtd/devices/bcm47xxsflash.c         |   37 +++++++++++++++++---------
 include/linux/bcma/bcma_driver_chipcommon.h |    1 +
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index f293682..13634c3 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -5,6 +5,8 @@
 #include <linux/platform_device.h>
 #include <linux/bcma/bcma.h>
 
+#include "bcm47xxsflash.h"
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Serial flash driver for BCMA bus");
 
@@ -13,26 +15,27 @@ static const char *probes[] = { "bcm47xxpart", NULL };
 static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			      size_t *retlen, u_char *buf)
 {
-	struct bcma_sflash *sflash = mtd->priv;
+	struct bcm47xxsflash *b47s = mtd->priv;
 
 	/* Check address range */
 	if ((from + len) > mtd->size)
 		return -EINVAL;
 
-	memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(sflash->window + from),
+	memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(b47s->window + from),
 		      len);
 
 	return len;
 }
 
-static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
-				   struct mtd_info *mtd)
+static void bcm47xxsflash_fill_mtd(struct bcm47xxsflash *b47s)
 {
-	mtd->priv = sflash;
+	struct mtd_info *mtd = &b47s->mtd;
+
+	mtd->priv = b47s;
 	mtd->name = "bcm47xxsflash";
 	mtd->owner = THIS_MODULE;
 	mtd->type = MTD_ROM;
-	mtd->size = sflash->size;
+	mtd->size = b47s->size;
 	mtd->_read = bcm47xxsflash_read;
 
 	/* TODO: implement writing support and verify/change following code */
@@ -43,16 +46,23 @@ static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
 static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 {
 	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
+	struct bcm47xxsflash *b47s;
 	int err;
 
-	sflash->mtd = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
-	if (!sflash->mtd) {
+	b47s = kzalloc(sizeof(*b47s), GFP_KERNEL);
+	if (!b47s) {
 		err = -ENOMEM;
 		goto out;
 	}
-	bcm47xxsflash_fill_mtd(sflash, sflash->mtd);
+	sflash->priv = b47s;
+
+	b47s->window = sflash->window;
+	b47s->blocksize = sflash->blocksize;
+	b47s->numblocks = sflash->numblocks;
+	b47s->size = sflash->size;
+	bcm47xxsflash_fill_mtd(b47s);
 
-	err = mtd_device_parse_register(sflash->mtd, probes, NULL, NULL, 0);
+	err = mtd_device_parse_register(&b47s->mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
 		goto err_dev_reg;
@@ -61,7 +71,7 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 	return 0;
 
 err_dev_reg:
-	kfree(sflash->mtd);
+	kfree(&b47s->mtd);
 out:
 	return err;
 }
@@ -69,9 +79,10 @@ out:
 static int bcm47xxsflash_bcma_remove(struct platform_device *pdev)
 {
 	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
+	struct bcm47xxsflash *b47s = sflash->priv;
 
-	mtd_device_unregister(sflash->mtd);
-	kfree(sflash->mtd);
+	mtd_device_unregister(&b47s->mtd);
+	kfree(b47s);
 
 	return 0;
 }
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index 1cfd613..aa3be07 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -532,6 +532,7 @@ struct bcma_sflash {
 	u32 size;
 
 	struct mtd_info *mtd;
+	void *priv;
 };
 #endif
 
-- 
1.7.7
