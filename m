Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLu-00012e-GD
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:27 +0000
Received: by mail-ey0-f177.google.com with SMTP id 6so1530647eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:26 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/18] mtd: fsl_elbc_nand.c: use mtd_device_parse_register
Date: Sun, 12 Jun 2011 03:11:58 +0400
Message-Id: <1307833922-21602-15-git-send-email-dbaryshkov@gmail.com>
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

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 6b66a14..004dbc2 100644
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
@@ -936,11 +935,7 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
-	ret = parse_mtd_partitions(&priv->mtd, part_probe_types, &parts, &ppdata);
-	if (ret < 0)
-		goto err;
-
-	mtd_device_register(&priv->mtd, parts, ret);
+	mtd_device_parse_register(&priv->mtd, part_probe_types, &ppdata, NULL, 0);
 
 	printk(KERN_INFO "eLBC NAND device at 0x%llx, bank %d\n",
 	       (unsigned long long)res.start, priv->bank);
-- 
1.7.5.3
