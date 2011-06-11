Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLj-00012e-Re
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:17 +0000
Received: by mail-ey0-f177.google.com with SMTP id 6so1530647eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:15 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/18] mtd: ndfc: use ofpart through generic parsing
Date: Sun, 12 Jun 2011 03:11:52 +0400
Message-Id: <1307833922-21602-9-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/ndfc.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 70c04ff..1528734 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -161,6 +161,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 {
 	struct device_node *flash_np;
 	struct nand_chip *chip = &ndfc->chip;
+	struct mtd_part_parser_data ppdata;
 	int ret;
 
 	chip->IO_ADDR_R = ndfc->ndfcbase + NDFC_DATA;
@@ -188,6 +189,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (!flash_np)
 		return -ENODEV;
 
+	ppdata->of_node = flash_np;
 	ndfc->mtd.name = kasprintf(GFP_KERNEL, "%s.%s",
 			dev_name(&ndfc->ofdev->dev), flash_np->name);
 	if (!ndfc->mtd.name) {
@@ -199,17 +201,10 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
-	ret = parse_mtd_partitions(&ndfc->mtd, NULL, &ndfc->parts, 0);
+	ret = parse_mtd_partitions(&ndfc->mtd, NULL, &ndfc->parts, &ppdata);
 	if (ret < 0)
 		goto err;
 
-	if (ret == 0) {
-		ret = of_mtd_parse_partitions(&ndfc->ofdev->dev, flash_np,
-					      &ndfc->parts);
-		if (ret < 0)
-			goto err;
-	}
-
 	ret = mtd_device_register(&ndfc->mtd, ndfc->parts, ret);
 
 err:
-- 
1.7.5.3
