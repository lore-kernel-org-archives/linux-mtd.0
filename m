Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTW-0001Tv-6F
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:43 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852637wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:41 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 32/44] mtd: mxc_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:31 +0400
Message-Id: <1307453803-31950-33-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/mxc_nand.c |   15 +++------------
 1 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index ca42c8f..4c2bb4a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -143,7 +143,6 @@
 struct mxc_nand_host {
 	struct mtd_info		mtd;
 	struct nand_chip	nand;
-	struct mtd_partition	*parts;
 	struct device		*dev;
 
 	void			*spare0;
@@ -1044,7 +1043,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	struct mxc_nand_platform_data *pdata = pdev->dev.platform_data;
 	struct mxc_nand_host *host;
 	struct resource *res;
-	int err = 0, __maybe_unused nr_parts = 0;
+	int err = 0;
 	struct nand_ecclayout *oob_smallpage, *oob_largepage;
 
 	/* Allocate memory for MTD device structure and private data */
@@ -1231,16 +1230,8 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	}
 
 	/* Register the partitions */
-	nr_parts =
-	    parse_mtd_partitions(mtd, part_probes, &host->parts, 0);
-	if (nr_parts > 0)
-		mtd_device_register(mtd, host->parts, nr_parts);
-	else if (pdata->parts)
-		mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
-	else {
-		pr_info("Registering %s as whole device\n", mtd->name);
-		mtd_device_register(mtd, NULL, 0);
-	}
+	mtd_device_parse_register(mtd, part_probes, 0,
+			pdata->parts, pdata->nr_parts);
 
 	platform_set_drvdata(pdev, host);
 
-- 
1.7.4.4
