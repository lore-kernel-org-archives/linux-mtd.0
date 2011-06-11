Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLh-00012e-0l
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:14 +0000
Received: by eyh6 with SMTP id 6so1530647eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:11 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/18] mtd: fsl_upm: use ofpart through generic parsing
Date: Sun, 12 Jun 2011 03:11:50 +0400
Message-Id: <1307833922-21602-7-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert the driver to use ofpart partitions parsing through the generic
parse_mtd_partitions().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/fsl_upm.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 7c782eb..714d831 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -158,6 +158,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 {
 	int ret;
 	struct device_node *flash_np;
+	struct mtd_part_parser_data ppdata;
 
 	fun->chip.IO_ADDR_R = fun->io_base;
 	fun->chip.IO_ADDR_W = fun->io_base;
@@ -191,15 +192,9 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
-	ret = parse_mtd_partitions(&fun->mtd, NULL, &fun->parts, 0);
+	ppdata.of_node = flash_np;
+	ret = parse_mtd_partitions(&fun->mtd, NULL, &fun->parts, &ppdata);
 
-#ifdef CONFIG_MTD_OF_PARTS
-	if (ret == 0) {
-		ret = of_mtd_parse_partitions(fun->dev, flash_np, &fun->parts);
-		if (ret < 0)
-			goto err;
-	}
-#endif
 	ret = mtd_device_register(&fun->mtd, fun->parts, ret);
 err:
 	of_node_put(flash_np);
-- 
1.7.5.3
