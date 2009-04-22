Received: from n15.bullet.mail.mud.yahoo.com ([68.142.206.42])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LwSl0-0004OG-Oi
	for linux-mtd@lists.infradead.org; Wed, 22 Apr 2009 03:04:30 +0000
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch/RESEND 2.6.30-rc2 2/3] NAND: minor davinci_nand cleanup
Content-Disposition: inline
From: David Brownell <david-b@pacbell.net>
Date: Tue, 21 Apr 2009 19:51:31 -0700
MIME-Version: 1.0
Message-Id: <200904211951.31776.david-b@pacbell.net>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Snehaprabha Narnakaje <nsnehaprabha@ti.com>,
	DaVinci <davinci-linux-open-source@linux.davincidsp.com>,
	dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Make the DaVinci NAND driver require platform_data with
board-specific configuration.  We can't actually do any
kind of sane job of configuring it otherwise.

Also fix the comment about picking the "best" ECC mode.

We can't do those any more; that relied on knowing what kind
of CPU we're using (they don't all support 4-bit ECC), and
current policy is that drivers not have cpu_is_*() checks.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
RESEND 7-april version -- refreshing against current kernel
Seems appropriate for 2.6.30 merge, but not essential.

 drivers/mtd/nand/davinci_nand.c |   27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -306,6 +306,10 @@ static int __init nand_davinci_probe(str
 	uint32_t			val;
 	nand_ecc_modes_t		ecc_mode;
 
+	/* insist on board-specific configuration */
+	if (!pdata)
+		return -ENODEV;
+
 	/* which external chipselect will we be managing? */
 	if (pdev->id < 0 || pdev->id > 3)
 		return -ENODEV;
@@ -351,7 +355,7 @@ static int __init nand_davinci_probe(str
 	info->chip.select_chip	= nand_davinci_select_chip;
 
 	/* options such as NAND_USE_FLASH_BBT or 16-bit widths */
-	info->chip.options	= pdata ? pdata->options : 0;
+	info->chip.options	= pdata->options;
 
 	info->ioaddr		= (uint32_t __force) vaddr;
 
@@ -360,14 +364,8 @@ static int __init nand_davinci_probe(str
 	info->mask_chipsel	= pdata->mask_chipsel;
 
 	/* use nandboot-capable ALE/CLE masks by default */
-	if (pdata && pdata->mask_ale)
-		info->mask_ale	= pdata->mask_cle;
-	else
-		info->mask_ale	= MASK_ALE;
-	if (pdata && pdata->mask_cle)
-		info->mask_cle	= pdata->mask_cle;
-	else
-		info->mask_cle	= MASK_CLE;
+	info->mask_ale		= pdata->mask_cle ? : MASK_ALE;
+	info->mask_cle		= pdata->mask_cle ? : MASK_CLE;
 
 	/* Set address of hardware control function */
 	info->chip.cmd_ctrl	= nand_davinci_hwcontrol;
@@ -377,11 +375,8 @@ static int __init nand_davinci_probe(str
 	info->chip.read_buf     = nand_davinci_read_buf;
 	info->chip.write_buf    = nand_davinci_write_buf;
 
-	/* use board-specific ECC config; else, the best available */
-	if (pdata)
-		ecc_mode = pdata->ecc_mode;
-	else
-		ecc_mode = NAND_ECC_HW;
+	/* Use board-specific ECC config */
+	ecc_mode		= pdata->ecc_mode;
 
 	switch (ecc_mode) {
 	case NAND_ECC_NONE:
@@ -469,7 +464,7 @@ static int __init nand_davinci_probe(str
 			info->mtd.name = master_name;
 		}
 
-		if (mtd_parts_nb <= 0 && pdata) {
+		if (mtd_parts_nb <= 0) {
 			mtd_parts = pdata->parts;
 			mtd_parts_nb = pdata->nr_parts;
 		}
@@ -482,7 +477,7 @@ static int __init nand_davinci_probe(str
 				info->partitioned = true;
 		}
 
-	} else if (pdata && pdata->nr_parts) {
+	} else if (pdata->nr_parts) {
 		dev_warn(&pdev->dev, "ignoring %d default partitions on %s\n",
 				pdata->nr_parts, info->mtd.name);
 	}
