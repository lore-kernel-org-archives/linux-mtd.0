Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8z-0007V5-Q2
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:35 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so1305416wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/17] mtd: fsl_elbc_nand.c: use mtd_device_parse_register
Date: Thu,  9 Jun 2011 18:23:04 +0400
Message-Id: <1307629388-24769-16-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/fsl_elbc_nand.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 5236840..73c8d87 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -843,7 +843,6 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl;
 	static const char *part_probe_types[]
 		= { "cmdlinepart", "RedBoot", "ofpart", NULL };
-	struct mtd_partition *parts;
 	int ret;
 	int bank;
 	struct device *dev;
@@ -935,11 +934,7 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
-	ret = parse_mtd_partitions(&priv->mtd, part_probe_types, &parts, 0);
-	if (ret < 0)
-		goto err;
-
-	mtd_device_register(&priv->mtd, parts, ret);
+	mtd_device_parse_register(&priv->mtd, part_probe_types, 0, NULL, 0);
 
 	printk(KERN_INFO "eLBC NAND device at 0x%llx, bank %d\n",
 	       (unsigned long long)res.start, priv->bank);
-- 
1.7.5.3
