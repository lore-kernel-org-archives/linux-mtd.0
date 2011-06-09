Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8m-0007V5-UI
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:22 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so1305416wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:20 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/17] mtd: ndfc: use ofpart through generic parsing
Date: Thu,  9 Jun 2011 18:22:56 +0400
Message-Id: <1307629388-24769-8-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/ndfc.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 70c04ff..1ae94f0 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -188,6 +188,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (!flash_np)
 		return -ENODEV;
 
+	ndfc->mtd.node = flash_np;
 	ndfc->mtd.name = kasprintf(GFP_KERNEL, "%s.%s",
 			dev_name(&ndfc->ofdev->dev), flash_np->name);
 	if (!ndfc->mtd.name) {
@@ -203,13 +204,6 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
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
