From: Pekon Gupta <pekon@ti.com>
To: <mark.rutland@arm.com>, <olof@lixom.net>, <computersforpeace@gmail.com>,
 <dedekind1@gmail.com>
Subject: [PATCH v11 04/10] mtd: nand: omap: use DT specified bus-width only
 for scanning NAND device
Date: Thu, 24 Oct 2013 18:20:20 +0530
Message-ID: <1382619026-4182-5-git-send-email-pekon@ti.com>
In-Reply-To: <1382619026-4182-1-git-send-email-pekon@ti.com>
References: <1382619026-4182-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, Pawel.Moll@arm.com, arnd@arndb.de,
 swarren@wwwdotorg.org, tony@atomide.com, jp.francois@cynove.com,
 ijc+devicetree@hellion.org.uk, avinashphilipk@gmail.com, balbi@ti.com,
 robherring2@gmail.com, Pekon Gupta <pekon@ti.com>, bcousson@baylibre.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch:
- calls nand_scan_ident() using bus-width as passed by DT
- removes double calls to nand_scan_ident(), incase first call fails
  then omap_nand_probe just returns error.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 5596368..f464321 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1856,7 +1856,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 	mtd->name		= dev_name(&pdev->dev);
 	mtd->owner		= THIS_MODULE;
 	nand_chip		= &info->nand;
-	nand_chip->options	= pdata->devsize;
 	nand_chip->options	|= NAND_SKIP_BBTSCAN;
 #ifdef CONFIG_MTD_NAND_OMAP_BCH
 	info->of_node		= pdata->of_node;
@@ -1904,6 +1903,15 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->chip_delay = 50;
 	}
 
+	/* scan NAND device connected to chip controller */
+	nand_chip->options |= pdata->devsize & NAND_BUSWIDTH_16;
+	if (nand_scan_ident(mtd, 1, NULL)) {
+		pr_err("nand device scan failed, may be bus-width mismatch\n");
+		err = -ENXIO;
+		goto out_release_mem_region;
+	}
+
+	/* re-populate low-level callbacks based on xfer modes */
 	switch (pdata->xfer_type) {
 	case NAND_OMAP_PREFETCH_POLLED:
 		nand_chip->read_buf   = omap_read_buf_pref;
@@ -2011,17 +2019,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* DIP switches on some boards change between 8 and 16 bit
-	 * bus widths for flash.  Try the other width if the first try fails.
-	 */
-	if (nand_scan_ident(mtd, 1, NULL)) {
-		nand_chip->options ^= NAND_BUSWIDTH_16;
-		if (nand_scan_ident(mtd, 1, NULL)) {
-			err = -ENXIO;
-			goto out_release_mem_region;
-		}
-	}
-
 	/* rom code layout */
 	if (pdata->ecc_opt == OMAP_ECC_HAM1_CODE_HW) {
 
-- 
1.8.1
