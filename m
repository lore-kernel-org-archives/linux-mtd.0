Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROj-0002U4-1s
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:04 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:00 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 55/62] mtd/tmio_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:36 +0100
Message-Id: <1306142623-24952-56-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/tmio_nand.c |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index c004e47..11e8371 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -381,10 +381,8 @@ static int tmio_probe(struct platform_device *dev)
 	struct tmio_nand *tmio;
 	struct mtd_info *mtd;
 	struct nand_chip *nand_chip;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
 	int nbparts = 0;
-#endif
 	int retval;
 
 	if (data == NULL)
@@ -463,7 +461,6 @@ static int tmio_probe(struct platform_device *dev)
 		goto err_scan;
 	}
 	/* Register the partitions */
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	nbparts = parse_mtd_partitions(mtd, part_probes, &parts, 0);
 #endif
@@ -472,12 +469,7 @@ static int tmio_probe(struct platform_device *dev)
 		nbparts = data->num_partitions;
 	}
 
-	if (nbparts)
-		retval = add_mtd_partitions(mtd, parts, nbparts);
-	else
-#endif
-	retval = add_mtd_device(mtd);
-
+	retval = mtd_device_register(mtd, parts, nbparts);
 	if (!retval)
 		return retval;
 
-- 
1.7.4.4
