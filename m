Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULGp-0007CU-06
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:16 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:14 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/43] mtd: lantiq-flash.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:21 +0400
Message-Id: <1307549152-7085-13-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
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
 drivers/mtd/maps/lantiq-flash.c |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 57ea3fe..f750784 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -112,9 +112,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 {
 	struct physmap_flash_data *ltq_mtd_data = dev_get_platdata(&pdev->dev);
 	struct ltq_mtd *ltq_mtd;
-	struct mtd_partition *parts;
 	struct resource *res;
-	int nr_parts = 0;
 	struct cfi_private *cfi;
 	int err;
 
@@ -170,16 +168,8 @@ ltq_mtd_probe(struct platform_device *pdev)
 	cfi->addr_unlock1 ^= 1;
 	cfi->addr_unlock2 ^= 1;
 
-	nr_parts = parse_mtd_partitions(ltq_mtd->mtd, NULL, &parts, 0);
-	if (nr_parts > 0) {
-		dev_info(&pdev->dev,
-			"using %d partitions from cmdline", nr_parts);
-	} else {
-		nr_parts = ltq_mtd_data->nr_parts;
-		parts = ltq_mtd_data->parts;
-	}
-
-	err = add_mtd_partitions(ltq_mtd->mtd, parts, nr_parts);
+	err = mtd_device_parse_register(ltq_mtd->mtd, NULL, 0,
+			ltq_mtd_data->parts, ltq_mtd_data->nr_parts);
 	if (err) {
 		dev_err(&pdev->dev, "failed to add partitions\n");
 		goto err_destroy;
-- 
1.7.4.4
