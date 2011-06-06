Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvd-000726-91
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:58 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:56 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 20/32] mtd: ndfc don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:10 +0400
Message-Id: <1307351782-7456-20-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/ndfc.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index ea2dea8..cb66fd7 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -159,11 +159,6 @@ static int ndfc_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 static int ndfc_chip_init(struct ndfc_controller *ndfc,
 			  struct device_node *node)
 {
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-	static const char *part_types[] = { "cmdlinepart", NULL };
-#else
-	static const char *part_types[] = { NULL };
-#endif
 	struct device_node *flash_np;
 	struct nand_chip *chip = &ndfc->chip;
 	int ret;
@@ -204,7 +199,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
-	ret = parse_mtd_partitions(&ndfc->mtd, part_types, &ndfc->parts, 0);
+	ret = parse_mtd_partitions(&ndfc->mtd, NULL, &ndfc->parts, 0);
 	if (ret < 0)
 		goto err;
 
-- 
1.7.4.4
