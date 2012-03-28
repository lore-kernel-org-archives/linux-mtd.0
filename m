Received: from mail131.messagelabs.com ([216.82.242.99])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SCxN8-0006Wo-Cs
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2012 18:13:29 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] mtd: plat_nand: Add default partition parser to driver
Date: Wed, 28 Mar 2012 11:13:05 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201203281113.05362.hartleys@visionengravers.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use cmdlinepart as the default partition parser and allow the arch setup code
to still use their own partition parsers.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

---

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 6404e6e..5856399 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -23,6 +23,8 @@ struct plat_nand_data {
 	void __iomem		*io_base;
 };
 
+static const char *part_probe_types[] = { "cmdlinepart", NULL };
+
 /*
  * Probe for the NAND device.
  */
@@ -31,6 +33,7 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	struct platform_nand_data *pdata = pdev->dev.platform_data;
 	struct plat_nand_data *data;
 	struct resource *res;
+	const char **part_types;
 	int err = 0;
 
 	if (pdata->chip.nr_chips < 1) {
@@ -98,8 +101,9 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	err = mtd_device_parse_register(&data->mtd,
-					pdata->chip.part_probe_types, NULL,
+	part_types = pdata->chip.part_probe_types ? : part_probe_types;
+
+	err = mtd_device_parse_register(&data->mtd, part_types, NULL,
 					pdata->chip.partitions,
 					pdata->chip.nr_partitions);
 
