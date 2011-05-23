Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROY-0002U4-1N
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:52 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:49 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 50/62] mtd/orion_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:31 +0100
Message-Id: <1306142623-24952-51-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/orion_nand.c |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index da6e753..7794d06 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -21,9 +21,7 @@
 #include <mach/hardware.h>
 #include <plat/orion_nand.h>
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
 static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
@@ -83,10 +81,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *io_base;
 	int ret = 0;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *partitions = NULL;
 	int num_part = 0;
-#endif
 
 	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
 	if (!nc) {
@@ -136,7 +132,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		goto no_dev;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	mtd->name = "orion_nand";
 	num_part = parse_mtd_partitions(mtd, part_probes, &partitions, 0);
@@ -147,14 +142,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		partitions = board->parts;
 	}
 
-	if (partitions && num_part > 0)
-		ret = add_mtd_partitions(mtd, partitions, num_part);
-	else
-		ret = add_mtd_device(mtd);
-#else
-	ret = add_mtd_device(mtd);
-#endif
-
+	ret = mtd_device_register(mtd, partitions, num_part);
 	if (ret) {
 		nand_release(mtd);
 		goto no_dev;
-- 
1.7.4.4
