Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNr-0002U4-GW
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:09 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:07 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 32/62] mtd/atmel_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:13 +0100
Message-Id: <1306142623-24952-33-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/atmel_nand.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 950646a..1836e9b 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -494,11 +494,8 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	struct resource *regs;
 	struct resource *mem;
 	int res;
-
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *partitions = NULL;
 	int num_partitions = 0;
-#endif
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
@@ -656,7 +653,6 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		goto err_scan_tail;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	mtd->name = "atmel_nand";
 	num_partitions = parse_mtd_partitions(mtd, part_probes,
@@ -672,17 +668,11 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		goto err_no_partitions;
 	}
 
-	res = add_mtd_partitions(mtd, partitions, num_partitions);
-#else
-	res = add_mtd_device(mtd);
-#endif
-
+	res = mtd_device_register(mtd, partitions, num_partitions);
 	if (!res)
 		return res;
 
-#ifdef CONFIG_MTD_PARTITIONS
 err_no_partitions:
-#endif
 	nand_release(mtd);
 err_scan_tail:
 err_scan_ident:
-- 
1.7.4.4
