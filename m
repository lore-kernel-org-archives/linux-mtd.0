Received: from mail-bk0-f44.google.com ([209.85.214.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Trwpv-0006vJ-Kr
 for linux-mtd@lists.infradead.org; Sun, 06 Jan 2013 20:28:52 +0000
Received: by mail-bk0-f44.google.com with SMTP id w11so8157605bku.31
 for <linux-mtd@lists.infradead.org>; Sun, 06 Jan 2013 12:28:49 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] mtd: bcm47xxsflash: add own struct for abstrating bus type
Date: Sun,  6 Jan 2013 21:28:50 +0100
Message-Id: <1357504130-21951-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
After not receiving any NACKs and testing this patch with "maintaining":
> Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-", no issues
I'm resending it without RFC.

This patch is based on a
> mtd: bcm47xxsflash: adjust names of bus-specific functions
---
 drivers/mtd/devices/bcm47xxsflash.c         |   37 +++++++++++++++++---------
 drivers/mtd/devices/bcm47xxsflash.h         |   15 +++++++++++
 include/linux/bcma/bcma_driver_chipcommon.h |    1 +
 3 files changed, 40 insertions(+), 13 deletions(-)
 create mode 100644 drivers/mtd/devices/bcm47xxsflash.h

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
diff --git a/drivers/mtd/devices/bcm47xxsflash.h b/drivers/mtd/devices/bcm47xxsflash.h
new file mode 100644
index 0000000..ebf6f71
--- /dev/null
+++ b/drivers/mtd/devices/bcm47xxsflash.h
@@ -0,0 +1,15 @@
+#ifndef __BCM47XXSFLASH_H
+#define __BCM47XXSFLASH_H
+
+#include <linux/mtd/mtd.h>
+
+struct bcm47xxsflash {
+	u32 window;
+	u32 blocksize;
+	u16 numblocks;
+	u32 size;
+
+	struct mtd_info mtd;
+};
+
+#endif /* BCM47XXSFLASH */
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index ee332fa..fba90af 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -528,6 +528,7 @@ struct bcma_sflash {
 	u32 size;
 
 	struct mtd_info *mtd;
+	void *priv;
 };
 #endif
 
-- 
1.7.7
