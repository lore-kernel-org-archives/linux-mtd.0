Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMs-0002Ul-Pu
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:07 +0000
Received: by wwi18 with SMTP id 18so1297816wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:04 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/62] mtd/nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:46 +0100
Message-Id: <1306142623-24952-6-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/nand_base.c |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..47153f9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -47,10 +47,7 @@
 #include <linux/bitops.h>
 #include <linux/leds.h>
 #include <linux/io.h>
-
-#ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
-#endif
 
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
@@ -3539,12 +3536,7 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->ecc.mode == NAND_ECC_SOFT_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
-#ifdef CONFIG_MTD_PARTITIONS
-	/* Deregister partitions */
-	del_mtd_partitions(mtd);
-#endif
-	/* Deregister the device */
-	del_mtd_device(mtd);
+	mtd_device_unregister(mtd);
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-- 
1.7.4.4
