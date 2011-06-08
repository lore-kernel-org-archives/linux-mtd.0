Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHD-0007CU-R0
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:41 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:39 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 26/43] mtd: davinci_nand.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:35 +0400
Message-Id: <1307549152-7085-27-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/davinci_nand.c |   25 ++-----------------------
 1 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 70c92a5..c153e1f 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -57,7 +57,6 @@ struct davinci_nand_info {
 
 	struct device		*dev;
 	struct clk		*clk;
-	bool			partitioned;
 
 	bool			is_readmode;
 
@@ -530,8 +529,6 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	int				ret;
 	uint32_t			val;
 	nand_ecc_modes_t		ecc_mode;
-	struct mtd_partition		*mtd_parts = NULL;
-	int				mtd_parts_nb = 0;
 
 	/* insist on board-specific configuration */
 	if (!pdata)
@@ -753,26 +750,8 @@ syndrome_done:
 	if (ret < 0)
 		goto err_scan;
 
-	mtd_parts_nb = parse_mtd_partitions(&info->mtd, NULL, &mtd_parts, 0);
-
-	if (mtd_parts_nb <= 0) {
-		mtd_parts = pdata->parts;
-		mtd_parts_nb = pdata->nr_parts;
-	}
-
-	/* Register any partitions */
-	if (mtd_parts_nb > 0) {
-		ret = mtd_device_register(&info->mtd, mtd_parts,
-					  mtd_parts_nb);
-		if (ret == 0)
-			info->partitioned = true;
-	}
-
-	/* If there's no partition info, just package the whole chip
-	 * as a single MTD device.
-	 */
-	if (!info->partitioned)
-		ret = mtd_device_register(&info->mtd, NULL, 0) ? -ENODEV : 0;
+	ret = mtd_device_parse_register(&info->mtd, NULL, 0,
+			pdata->parts, pdata->nr_parts);
 
 	if (ret < 0)
 		goto err_scan;
-- 
1.7.4.4
