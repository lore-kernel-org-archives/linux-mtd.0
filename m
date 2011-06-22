Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJtD-00041T-8l
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:28 +0000
Received: by mail-ww0-f49.google.com with SMTP id 22so452817wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:26 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/18] mtd: ndfc: use ofpart through generic parsing
Date: Wed, 22 Jun 2011 13:37:42 +0400
Message-Id: <1308735472-32640-9-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
References: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
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
