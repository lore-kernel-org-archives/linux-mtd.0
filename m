Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvE-000726-Io
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:34 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:32 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/32] mtd: atmel_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:57 +0400
Message-Id: <1307351782-7456-7-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/atmel_nand.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 7c35739..2e6c5b9 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -480,10 +480,6 @@ static void atmel_nand_hwctl(struct mtd_info *mtd, int mode)
 	}
 }
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
-
 /*
  * Probe for the NAND device.
  */
@@ -654,11 +650,9 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		goto err_scan_tail;
 	}
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
 	mtd->name = "atmel_nand";
-	num_partitions = parse_mtd_partitions(mtd, part_probes,
+	num_partitions = parse_mtd_partitions(mtd, NULL,
 					      &partitions, 0);
-#endif
 	if (num_partitions <= 0 && host->board->parts) {
 		partitions = host->board->parts;
 		num_partitions = host->board->num_parts;
-- 
1.7.4.4
