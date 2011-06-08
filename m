Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULH5-0007GE-6n
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:32 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so531513wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:30 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/43] mtd: atmel_nand.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:30 +0400
Message-Id: <1307549152-7085-22-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/atmel_nand.c |   19 ++-----------------
 1 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index a19a112..6702208 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -491,8 +491,6 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	struct resource *regs;
 	struct resource *mem;
 	int res;
-	struct mtd_partition *partitions = NULL;
-	int num_partitions = 0;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
@@ -651,24 +649,11 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	}
 
 	mtd->name = "atmel_nand";
-	num_partitions = parse_mtd_partitions(mtd, NULL, &partitions, 0);
-	if (num_partitions <= 0 && host->board->parts) {
-		partitions = host->board->parts;
-		num_partitions = host->board->num_parts;
-	}
-
-	if ((!partitions) || (num_partitions == 0)) {
-		printk(KERN_ERR "atmel_nand: No partitions defined, or unsupported device.\n");
-		res = -ENXIO;
-		goto err_no_partitions;
-	}
-
-	res = mtd_device_register(mtd, partitions, num_partitions);
+	res = mtd_device_parse_register(mtd, NULL, 0,
+			host->board->parts, host->board->num_parts);
 	if (!res)
 		return res;
 
-err_no_partitions:
-	nand_release(mtd);
 err_scan_tail:
 err_scan_ident:
 err_no_card:
-- 
1.7.4.4
