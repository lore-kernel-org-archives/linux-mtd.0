Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvf-00073I-F7
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:00 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799739wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:59 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/32] mtd: omap2 don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:11 +0400
Message-Id: <1307351782-7456-21-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/omap2.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 0db2c0e..8783c08 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -94,8 +94,6 @@
 #define P4e_s(a)	(TF(a & NAND_Ecc_P4e)		<< 0)
 #define P4o_s(a)	(TF(a & NAND_Ecc_P4o)		<< 1)
 
-static const char *part_probes[] = { "cmdlinepart", NULL };
-
 /* oob info generated runtime depending on ecc algorithm and layout selected */
 static struct nand_ecclayout omap_oobinfo;
 /* Define some generic bad / good block scan pattern which are used
@@ -1103,7 +1101,7 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		goto out_release_mem_region;
 	}
 
-	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
+	err = parse_mtd_partitions(&info->mtd, NULL, &info->parts, 0);
 	if (err > 0)
 		mtd_device_register(&info->mtd, info->parts, err);
 	else if (pdata->parts)
-- 
1.7.4.4
