Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCz0L-0006Mn-EI
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 16:44:32 +0000
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: [PATCH revised] mtd: remove driver-core BUS_ID_SIZE
Date: Sun,  7 Jun 2009 01:44:24 +0900
Message-Id: <1244306664-23741-1-git-send-email-anemo@mba.ocn.ne.jp>
Cc: Kay Sievers <kay.sievers@vrfy.org>, linux-mtd@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@suse.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kay Sievers <kay.sievers@vrfy.org>

The name size limit is gone from the driver-core, the BUS_ID_SIZE
value will be removed.

[initial version by kay.sievers, reimplemented by dwmw2, adjusted by anemo]
Cc: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/nand/txx9ndfmc.c |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 8124792..114ac76 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -64,7 +64,7 @@ struct txx9ndfmc_priv {
 	struct nand_chip chip;
 	struct mtd_info mtd;
 	int cs;
-	char mtdname[BUS_ID_SIZE + 2];
+	const char *mtdname;
 };
 
 #define MAX_TXX9NDFMC_DEV	4
@@ -334,16 +334,24 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 
 		if (plat->ch_mask != 1) {
 			txx9_priv->cs = i;
-			sprintf(txx9_priv->mtdname, "%s.%u",
-				dev_name(&dev->dev), i);
+			txx9_priv->mtdname = kasprintf(GFP_KERNEL, "%s.%u",
+						       dev_name(&dev->dev), i);
+			if (!txx9_priv->mtdname) {
+				kfree(txx9_priv);
+				dev_err(&dev->dev,
+					"Unable to allocate MTD name.\n");
+				continue;
+			}
 		} else {
 			txx9_priv->cs = -1;
-			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
+			txx9_priv->mtdname = kstrdup(dev_name(&dev->dev),
+						     GFP_KERNEL);
 		}
 		if (plat->wide_mask & (1 << i))
 			chip->options |= NAND_BUSWIDTH_16;
 
 		if (nand_scan(mtd, 1)) {
+			kfree(txx9_priv->mtdname);
 			kfree(txx9_priv);
 			continue;
 		}
@@ -385,6 +393,7 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		kfree(drvdata->parts[i]);
 #endif
 		del_mtd_device(mtd);
+		kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
 	return 0;
-- 
1.5.6.5
