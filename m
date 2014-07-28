Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBh3V-0004UZ-Ic
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 09:17:20 +0000
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: support ONFI timings mode retrieval for
 non-ONFI NANDs
Date: Mon, 28 Jul 2014 11:16:51 +0200
Message-Id: <1406539012-16320-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1406539012-16320-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1406539012-16320-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add an onfi_timing_mode_ds field to nand_chip and nand_flash_dev in order
to support NAND timings definition for non-ONFI NAND.

NAND that support better timings mode than the default one (timings mode 0)
have to define a new entry in the nand_ids table.

The timings mode should be deduced from timings description from the
datasheet and the ONFI specification
(www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf, chapter 4.15
"Timing Parameters").
You should choose the closest mode that fit the timings requirements of
your NAND chip.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 1 +
 include/linux/mtd/nand.h     | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d8cdf06..c952c21 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3576,6 +3576,7 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->options |= type->options;
 		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
 		chip->ecc_step_ds = NAND_ECC_STEP(type);
+		chip->onfi_timing_mode_ds = type->onfi_timing_mode_ds;
 
 		*busw = type->options & NAND_BUSWIDTH_16;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3083c53..435c005 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -587,6 +587,7 @@ struct nand_buffers {
  * @ecc_step_ds:	[INTERN] ECC step required by the @ecc_strength_ds,
  *                      also from the datasheet. It is the recommended ECC step
  *			size, if known; if unknown, set to zero.
+ * @onfi_timing_mode_ds:[INTERN] ONFI timing mode deduced from datasheet.
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
@@ -671,6 +672,7 @@ struct nand_chip {
 	uint8_t bits_per_cell;
 	uint16_t ecc_strength_ds;
 	uint16_t ecc_step_ds;
+	int onfi_timing_mode_ds;
 	int badblockpos;
 	int badblockbits;
 
@@ -772,6 +774,10 @@ struct nand_chip {
  *               @ecc_step_ds in nand_chip{}, also from the datasheet.
  *               For example, the "4bit ECC for each 512Byte" can be set with
  *               NAND_ECC_INFO(4, 512).
+ * @onfi_timing_mode_ds: the ONFI timing mode supported by this NAND chip. This
+ *                       should be deduced from timings described in the
+ *                       datasheet.
+ *
  */
 struct nand_flash_dev {
 	char *name;
@@ -792,6 +798,7 @@ struct nand_flash_dev {
 		uint16_t strength_ds;
 		uint16_t step_ds;
 	} ecc;
+	int onfi_timing_mode_ds;
 };
 
 /**
-- 
1.8.3.2
