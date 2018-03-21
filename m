Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydOD-0001YZ-5D
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:03:05 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 06/16] mtd: rawnand: fsl_elbc: fix probe function error path
Date: Wed, 21 Mar 2018 14:01:47 +0100
Message-Id: <20180321130157.9524-7-miquel.raynal@bootlin.com>
In-Reply-To: <20180321130157.9524-1-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An error after nand_scan_tail() should trigger a nand_cleanup().
The helper mtd_device_parse_register() returns an error code that should
be checked and nand_cleanup() called accordingly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index d28df991c73c..7a7cb60ec93c 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -926,15 +926,20 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
-	mtd_device_parse_register(mtd, part_probe_types, NULL,
-				  NULL, 0);
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret)
+		goto cleanup_nand;
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
+
 	return 0;
 
+cleanup_nand:
+	nand_cleanup(&priv->chip);
 err:
 	fsl_elbc_chip_remove(priv);
+
 	return ret;
 }
 
-- 
2.14.1
