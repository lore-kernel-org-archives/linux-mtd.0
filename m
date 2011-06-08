Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHV-0007Bz-TW
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:59 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so531325wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:57 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 36/43] mtd: pxa3xx_nand.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:45 +0400
Message-Id: <1307549152-7085-37-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/pxa3xx_nand.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 5c3af2f..b7db1b2 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1133,8 +1133,6 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_platform_data *pdata;
 	struct pxa3xx_nand_info *info;
-	struct mtd_partition *parts;
-	int nr_parts;
 
 	pdata = pdev->dev.platform_data;
 	if (!pdata) {
@@ -1152,13 +1150,8 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-
-	nr_parts = parse_mtd_partitions(info->mtd, NULL, &parts, 0);
-
-	if (nr_parts)
-		return mtd_device_register(info->mtd, parts, nr_parts);
-
-	return mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
+	return mtd_device_parse_register(info->mtd, NULL, 0,
+			pdata->parts, pdata->nr_parts);
 }
 
 #ifdef CONFIG_PM
-- 
1.7.4.4
