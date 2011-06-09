Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg94-0007Vd-Je
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:39 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1555625wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:38 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/17] mtd: ndfc.c: use mtd_device_parse_register
Date: Thu,  9 Jun 2011 18:23:07 +0400
Message-Id: <1307629388-24769-19-git-send-email-dbaryshkov@gmail.com>
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

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/ndfc.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 1ae94f0..24c449f 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -42,7 +42,6 @@ struct ndfc_controller {
 	struct nand_chip chip;
 	int chip_select;
 	struct nand_hw_control ndfc_control;
-	struct mtd_partition *parts;
 };
 
 static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
@@ -200,11 +199,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
-	ret = parse_mtd_partitions(&ndfc->mtd, NULL, &ndfc->parts, 0);
-	if (ret < 0)
-		goto err;
-
-	ret = mtd_device_register(&ndfc->mtd, ndfc->parts, ret);
+	ret = mtd_device_parse_register(&ndfc->mtd, NULL, 0, NULL, 0);
 
 err:
 	of_node_put(flash_np);
-- 
1.7.5.3
