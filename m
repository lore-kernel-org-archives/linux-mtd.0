Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVva-000737-KM
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:55 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799709wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:54 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/32] mtd: mpc5121_nfc don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:09 +0400
Message-Id: <1307351782-7456-19-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
this in every driver, instead pass NULL to force parse_mtd_partitions
to use default.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/mpc5121_nfc.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index e0e0846..0b61367 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -131,8 +131,6 @@ struct mpc5121_nfc_prv {
 
 static void mpc5121_nfc_done(struct mtd_info *mtd);
 
-static const char *mpc5121_nfc_pprobes[] = { "cmdlinepart", NULL };
-
 /* Read NFC register */
 static inline u16 nfc_read(struct mtd_info *mtd, uint reg)
 {
@@ -838,7 +836,7 @@ static int __devinit mpc5121_nfc_probe(struct platform_device *op)
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
-	retval = parse_mtd_partitions(mtd, mpc5121_nfc_pprobes, &parts, 0);
+	retval = parse_mtd_partitions(mtd, NULL, &parts, 0);
 #ifdef CONFIG_MTD_OF_PARTS
 	if (retval == 0)
 		retval = of_mtd_parse_partitions(dev, dn, &parts);
-- 
1.7.4.4
