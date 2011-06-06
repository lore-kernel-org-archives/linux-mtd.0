Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvO-000737-9O
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:43 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799709wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:41 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/32] mtd: fsl_upm don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:03 +0400
Message-Id: <1307351782-7456-13-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/fsl_upm.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 23752fd..7c782eb 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -158,7 +158,6 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 {
 	int ret;
 	struct device_node *flash_np;
-	static const char *part_types[] = { "cmdlinepart", NULL, };
 
 	fun->chip.IO_ADDR_R = fun->io_base;
 	fun->chip.IO_ADDR_W = fun->io_base;
@@ -192,7 +191,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
-	ret = parse_mtd_partitions(&fun->mtd, part_types, &fun->parts, 0);
+	ret = parse_mtd_partitions(&fun->mtd, NULL, &fun->parts, 0);
 
 #ifdef CONFIG_MTD_OF_PARTS
 	if (ret == 0) {
-- 
1.7.4.4
