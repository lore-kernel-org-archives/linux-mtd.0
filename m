Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROQ-0002Tm-KW
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:44 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:42 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 47/62] mtd/ndfc: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:28 +0100
Message-Id: <1306142623-24952-48-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/ndfc.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index bbe6d45..8b44ac7 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -41,9 +41,7 @@ struct ndfc_controller {
 	struct nand_chip chip;
 	int chip_select;
 	struct nand_hw_control ndfc_control;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
-#endif
 };
 
 static struct ndfc_controller ndfc_ctrl;
@@ -152,13 +150,11 @@ static int ndfc_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 static int ndfc_chip_init(struct ndfc_controller *ndfc,
 			  struct device_node *node)
 {
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	static const char *part_types[] = { "cmdlinepart", NULL };
 #else
 	static const char *part_types[] = { NULL };
 #endif
-#endif
 	struct device_node *flash_np;
 	struct nand_chip *chip = &ndfc->chip;
 	int ret;
@@ -198,25 +194,18 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	ret = parse_mtd_partitions(&ndfc->mtd, part_types, &ndfc->parts, 0);
 	if (ret < 0)
 		goto err;
 
-#ifdef CONFIG_MTD_OF_PARTS
 	if (ret == 0) {
 		ret = of_mtd_parse_partitions(&ndfc->ofdev->dev, flash_np,
 					      &ndfc->parts);
 		if (ret < 0)
 			goto err;
 	}
-#endif
 
-	if (ret > 0)
-		ret = add_mtd_partitions(&ndfc->mtd, ndfc->parts, ret);
-	else
-#endif
-		ret = add_mtd_device(&ndfc->mtd);
+	ret = mtd_device_register(&ndfc->mtd, ndfc->parts, ret);
 
 err:
 	of_node_put(flash_np);
-- 
1.7.4.4
