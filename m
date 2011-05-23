Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROg-0002TQ-Qz
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:00 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:58 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 54/62] mtd/socrates_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:35 +0100
Message-Id: <1306142623-24952-55-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/socrates_nand.c |   16 +---------------
 1 files changed, 1 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index a853548..ca2d055 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -155,9 +155,7 @@ static int socrates_nand_device_ready(struct mtd_info *mtd)
 	return 1;
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 /*
  * Probe for the NAND device.
@@ -168,11 +166,8 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 	struct mtd_info *mtd;
 	struct nand_chip *nand_chip;
 	int res;
-
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *partitions = NULL;
 	int num_partitions = 0;
-#endif
 
 	/* Allocate memory for the device structure (and zero it) */
 	host = kzalloc(sizeof(struct socrates_nand_host), GFP_KERNEL);
@@ -230,7 +225,6 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 		goto out;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	num_partitions = parse_mtd_partitions(mtd, part_probes,
 					      &partitions, 0);
@@ -240,7 +234,6 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 	}
 #endif
 
-#ifdef CONFIG_MTD_OF_PARTS
 	if (num_partitions == 0) {
 		num_partitions = of_mtd_parse_partitions(&ofdev->dev,
 							 ofdev->dev.of_node,
@@ -250,19 +243,12 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 			goto release;
 		}
 	}
-#endif
-	if (partitions && (num_partitions > 0))
-		res = add_mtd_partitions(mtd, partitions, num_partitions);
-	else
-#endif
-		res = add_mtd_device(mtd);
 
+	res = mtd_device_register(mtd, partitions, num_partitions);
 	if (!res)
 		return res;
 
-#ifdef CONFIG_MTD_PARTITIONS
 release:
-#endif
 	nand_release(mtd);
 
 out:
-- 
1.7.4.4
