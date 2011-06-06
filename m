Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvT-00073I-Ke
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:48 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799739wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:47 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/32] mtd: jz4740_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:06 +0400
Message-Id: <1307351782-7456-16-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/jz4740_nand.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index 6e813da..920719c 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -251,10 +251,6 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
 	return 0;
 }
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-static const char *part_probes[] = {"cmdline", NULL};
-#endif
-
 static int jz_nand_ioremap_resource(struct platform_device *pdev,
 	const char *name, struct resource **res, void __iomem **base)
 {
@@ -373,10 +369,7 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 		goto err_gpio_free;
 	}
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-	num_partitions = parse_mtd_partitions(mtd, part_probes,
-						&partition_info, 0);
-#endif
+	num_partitions = parse_mtd_partitions(mtd, NULL, &partition_info, 0);
 	if (num_partitions <= 0 && pdata) {
 		num_partitions = pdata->num_partitions;
 		partition_info = pdata->partitions;
-- 
1.7.4.4
