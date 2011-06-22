Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJtc-00041T-Ep
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:53 +0000
Received: by mail-ww0-f49.google.com with SMTP id 22so452817wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:52 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/18] mtd: ndfc.c: use mtd_device_parse_register
Date: Wed, 22 Jun 2011 13:37:51 +0400
Message-Id: <1308735472-32640-18-git-send-email-dbaryshkov@gmail.com>
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

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/ndfc.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 1528734..ee17139 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -42,7 +42,6 @@ struct ndfc_controller {
 	struct nand_chip chip;
 	int chip_select;
 	struct nand_hw_control ndfc_control;
-	struct mtd_partition *parts;
 };
 
 static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
@@ -201,11 +200,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
-	ret = parse_mtd_partitions(&ndfc->mtd, NULL, &ndfc->parts, &ppdata);
-	if (ret < 0)
-		goto err;
-
-	ret = mtd_device_register(&ndfc->mtd, ndfc->parts, ret);
+	ret = mtd_device_parse_register(&ndfc->mtd, NULL, &ppdata, NULL, 0);
 
 err:
 	of_node_put(flash_np);
-- 
1.7.5.3
