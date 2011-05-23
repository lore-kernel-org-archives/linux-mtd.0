Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORO2-0002TB-Mp
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:20 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:18 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 37/62] mtd/davinci_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:18 +0100
Message-Id: <1306142623-24952-38-git-send-email-jamie@jamieiles.com>
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

Convert to mtd_device_register() and remove the check for
mtd_has_partitions() as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/davinci_nand.c |   51 ++++++++++++++++-----------------------
 1 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index aff3468..1f34951 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -530,6 +530,8 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	int				ret;
 	uint32_t			val;
 	nand_ecc_modes_t		ecc_mode;
+	struct mtd_partition		*mtd_parts = NULL;
+	int				mtd_parts_nb = 0;
 
 	/* insist on board-specific configuration */
 	if (!pdata)
@@ -749,41 +751,33 @@ syndrome_done:
 	if (ret < 0)
 		goto err_scan;
 
-	if (mtd_has_partitions()) {
-		struct mtd_partition	*mtd_parts = NULL;
-		int			mtd_parts_nb = 0;
+	if (mtd_has_cmdlinepart()) {
+		static const char *probes[] __initconst = {
+			"cmdlinepart", NULL
+		};
 
-		if (mtd_has_cmdlinepart()) {
-			static const char *probes[] __initconst =
-				{ "cmdlinepart", NULL };
-
-			mtd_parts_nb = parse_mtd_partitions(&info->mtd, probes,
-							    &mtd_parts, 0);
-		}
-
-		if (mtd_parts_nb <= 0) {
-			mtd_parts = pdata->parts;
-			mtd_parts_nb = pdata->nr_parts;
-		}
+		mtd_parts_nb = parse_mtd_partitions(&info->mtd, probes,
+						    &mtd_parts, 0);
+	}
 
-		/* Register any partitions */
-		if (mtd_parts_nb > 0) {
-			ret = add_mtd_partitions(&info->mtd,
-					mtd_parts, mtd_parts_nb);
-			if (ret == 0)
-				info->partitioned = true;
-		}
+	if (mtd_parts_nb <= 0) {
+		mtd_parts = pdata->parts;
+		mtd_parts_nb = pdata->nr_parts;
+	}
 
-	} else if (pdata->nr_parts) {
-		dev_warn(&pdev->dev, "ignoring %d default partitions on %s\n",
-				pdata->nr_parts, info->mtd.name);
+	/* Register any partitions */
+	if (mtd_parts_nb > 0) {
+		ret = mtd_device_register(&info->mtd, mtd_parts,
+					  mtd_parts_nb);
+		if (ret == 0)
+			info->partitioned = true;
 	}
 
 	/* If there's no partition info, just package the whole chip
 	 * as a single MTD device.
 	 */
 	if (!info->partitioned)
-		ret = add_mtd_device(&info->mtd) ? -ENODEV : 0;
+		ret = mtd_device_register(&info->mtd, NULL, 0) ? -ENODEV : 0;
 
 	if (ret < 0)
 		goto err_scan;
@@ -824,10 +818,7 @@ static int __exit nand_davinci_remove(struct platform_device *pdev)
 	struct davinci_nand_info *info = platform_get_drvdata(pdev);
 	int status;
 
-	if (mtd_has_partitions() && info->partitioned)
-		status = del_mtd_partitions(&info->mtd);
-	else
-		status = del_mtd_device(&info->mtd);
+	status = mtd_device_unregister(&info->mtd);
 
 	spin_lock_irq(&davinci_nand_lock);
 	if (info->chip.ecc.mode == NAND_ECC_HW_SYNDROME)
-- 
1.7.4.4
