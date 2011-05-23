Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORPo-0002vC-CV
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:27:09 +0000
Received: by wwi18 with SMTP id 18so1299991wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:27:06 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 41/62] mtd/fsl_upm: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:22 +0100
Message-Id: <1306142623-24952-42-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/fsl_upm.c |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 073ee02..23752fd 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -33,10 +33,7 @@ struct fsl_upm_nand {
 	struct mtd_info mtd;
 	struct nand_chip chip;
 	int last_ctrl;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
-#endif
-
 	struct fsl_upm upm;
 	uint8_t upm_addr_offset;
 	uint8_t upm_cmd_offset;
@@ -161,9 +158,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 {
 	int ret;
 	struct device_node *flash_np;
-#ifdef CONFIG_MTD_PARTITIONS
 	static const char *part_types[] = { "cmdlinepart", NULL, };
-#endif
 
 	fun->chip.IO_ADDR_R = fun->io_base;
 	fun->chip.IO_ADDR_W = fun->io_base;
@@ -197,7 +192,6 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	ret = parse_mtd_partitions(&fun->mtd, part_types, &fun->parts, 0);
 
 #ifdef CONFIG_MTD_OF_PARTS
@@ -207,11 +201,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 			goto err;
 	}
 #endif
-	if (ret > 0)
-		ret = add_mtd_partitions(&fun->mtd, fun->parts, ret);
-	else
-#endif
-		ret = add_mtd_device(&fun->mtd);
+	ret = mtd_device_register(&fun->mtd, fun->parts, ret);
 err:
 	of_node_put(flash_np);
 	return ret;
-- 
1.7.4.4
