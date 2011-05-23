Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROV-0002Tm-Pn
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:50 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:47 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 49/62] mtd/omap2: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:30 +0100
Message-Id: <1306142623-24952-50-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/omap2.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index da9a351..3166f60 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -94,9 +94,7 @@
 #define P4e_s(a)	(TF(a & NAND_Ecc_P4e)		<< 0)
 #define P4o_s(a)	(TF(a & NAND_Ecc_P4o)		<< 1)
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 /* oob info generated runtime depending on ecc algorithm and layout selected */
 static struct nand_ecclayout omap_oobinfo;
@@ -1101,15 +1099,13 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		info->nand.ecc.layout = &omap_oobinfo;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
 	if (err > 0)
-		add_mtd_partitions(&info->mtd, info->parts, err);
+		mtd_device_register(&info->mtd, info->parts, err);
 	else if (pdata->parts)
-		add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_parts);
+		mtd_device_register(&info->mtd, pdata->parts, pdata->nr_parts);
 	else
-#endif
-		add_mtd_device(&info->mtd);
+		mtd_device_register(&info->mtd, NULL, 0);
 
 	platform_set_drvdata(pdev, &info->mtd);
 
-- 
1.7.4.4
