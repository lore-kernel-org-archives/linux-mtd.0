Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTa-0001St-8i
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:47 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852593wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:45 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 34/44] mtd: orion_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:33 +0400
Message-Id: <1307453803-31950-35-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/orion_nand.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 5c55981..29f505a 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -79,8 +79,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *io_base;
 	int ret = 0;
-	struct mtd_partition *partitions = NULL;
-	int num_part = 0;
 
 	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
 	if (!nc) {
@@ -131,14 +129,8 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	}
 
 	mtd->name = "orion_nand";
-	num_part = parse_mtd_partitions(mtd, NULL, &partitions, 0);
-	/* If cmdline partitions have been passed, let them be used */
-	if (num_part <= 0) {
-		num_part = board->nr_parts;
-		partitions = board->parts;
-	}
-
-	ret = mtd_device_register(mtd, partitions, num_part);
+	ret = mtd_device_parse_register(mtd, NULL, 0,
+			board->parts, board->nr_parts);
 	if (ret) {
 		nand_release(mtd);
 		goto no_dev;
-- 
1.7.4.4
