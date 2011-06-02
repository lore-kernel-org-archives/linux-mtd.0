Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FV-00074e-SI
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:50 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so758005wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:49 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 045/104] mtd: fsl_upm: use ofpart through generic parsing
Date: Thu,  2 Jun 2011 18:51:23 +0400
Message-Id: <1307026293-8535-11-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/fsl_upm.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 7c782eb..253b8ff 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -175,6 +175,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 
 	fun->mtd.priv = &fun->chip;
 	fun->mtd.owner = THIS_MODULE;
+	fun->mtd.node = flash_np;
 
 	flash_np = of_get_next_child(upm_np, NULL);
 	if (!flash_np)
@@ -193,13 +194,6 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 
 	ret = parse_mtd_partitions(&fun->mtd, NULL, &fun->parts, 0);
 
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
1.7.4.4
