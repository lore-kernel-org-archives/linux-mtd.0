Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpxwR-0001er-1p
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 10:19:55 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: nand: pxa3xx: Use extended cmdfunc() only if needed
Date: Mon,  9 Dec 2013 07:19:43 -0300
Message-Id: <1386584384-6379-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1386584384-6379-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1386584384-6379-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, we have two different cmdfunc's implementations:
one for PXA3xx SoC variant and one for Armada 370/XP SoC variant.

The former is the legacy one, typically constrained to devices
with page sizes smaller or equal to the controller's FIFO buffer.
On the other side, the latter _only_ supports the so-called extended
command semantics, which allow to handle devices with larger
page sizes (4 KiB, 8 KiB, ...).

This means we currently don't support devices with smaller pages on the
A370/XP SoC. Fix it by first renaming the cmdfuncs variants, and then
make the choice based on device page size (and SoC variant), rather than
SoC variant alone.

While at it, add a check for page size, to make sure we don't allow larger
pages sizes on the PXA3xx variant.

Tested-by: Arnaud Ebalard <arno@natisbad.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 8b3f2f4..1840d33 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -907,8 +907,8 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
 	return exec_cmd;
 }
 
-static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
-				int column, int page_addr)
+static void nand_cmdfunc(struct mtd_info *mtd, unsigned command,
+			 int column, int page_addr)
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
@@ -955,9 +955,9 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
 	info->state = STATE_IDLE;
 }
 
-static void armada370_nand_cmdfunc(struct mtd_info *mtd,
-				   const unsigned command,
-				   int column, int page_addr)
+static void nand_cmdfunc_extended(struct mtd_info *mtd,
+				  const unsigned command,
+				  int column, int page_addr)
 {
 	struct pxa3xx_nand_host *host = mtd->priv;
 	struct pxa3xx_nand_info *info = host->info_data;
@@ -1497,6 +1497,21 @@ KEEP_CONFIG:
 		chip->bbt_md = &bbt_mirror_descr;
 	}
 
+	/*
+	 * If the page size is bigger than the FIFO size, let's check
+	 * we are given the right variant and then switch to the extended
+	 * (aka splitted) command handling,
+	 */
+	if (mtd->writesize > PAGE_CHUNK_SIZE) {
+		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370) {
+			chip->cmdfunc = nand_cmdfunc_extended;
+		} else {
+			dev_err(&info->pdev->dev,
+				"unsupported page size on this variant\n");
+			return -ENODEV;
+		}
+	}
+
 	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
 		ret = armada370_ecc_init(info, &chip->ecc,
 				   chip->ecc_strength_ds,
@@ -1576,11 +1591,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		chip->read_buf		= pxa3xx_nand_read_buf;
 		chip->write_buf		= pxa3xx_nand_write_buf;
 		chip->options		|= NAND_NO_SUBPAGE_WRITE;
-
-		if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
-			chip->cmdfunc = armada370_nand_cmdfunc;
-		else
-			chip->cmdfunc = pxa3xx_nand_cmdfunc;
+		chip->cmdfunc		= nand_cmdfunc;
 	}
 
 	spin_lock_init(&chip->controller->lock);
-- 
1.8.1.5
