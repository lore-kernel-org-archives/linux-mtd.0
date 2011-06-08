Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHO-0007GE-Gg
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:51 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so531513wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:50 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 32/43] mtd: omap2.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:41 +0400
Message-Id: <1307549152-7085-33-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/omap2.c |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 8783c08..c5e33fd 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -112,7 +112,6 @@ struct omap_nand_info {
 	struct nand_hw_control		controller;
 	struct omap_nand_platform_data	*pdata;
 	struct mtd_info			mtd;
-	struct mtd_partition		*parts;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -1101,13 +1100,8 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		goto out_release_mem_region;
 	}
 
-	err = parse_mtd_partitions(&info->mtd, NULL, &info->parts, 0);
-	if (err > 0)
-		mtd_device_register(&info->mtd, info->parts, err);
-	else if (pdata->parts)
-		mtd_device_register(&info->mtd, pdata->parts, pdata->nr_parts);
-	else
-		mtd_device_register(&info->mtd, NULL, 0);
+	mtd_device_parse_register(&info->mtd, NULL, 0,
+			pdata->parts, pdata->nr_parts);
 
 	platform_set_drvdata(pdev, &info->mtd);
 
-- 
1.7.4.4
