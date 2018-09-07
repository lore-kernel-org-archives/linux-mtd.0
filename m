Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyBCf-00049f-UV
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 07:29:21 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/2] mtd: rawnand: denali: remove ->dev_ready() hook
Date: Fri,  7 Sep 2018 16:28:28 +0900
Message-Id: <1536305309-28026-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1536305309-28026-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536305309-28026-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali NAND IP has no way to read out the current signal level
of the R/B# pin.  Instead, denali_dev_ready() checks if the R/B#
transition has already happened. (The INTR__INT_ACT interrupt is
asserted at the rising edge of the R/B# pin.)  It is not a correct
way to implement the ->dev_ready() hook.

In fact, it has a drawback; in the nand_scan_ident phase, the chip
detection iterates over maxchips until it fails to find a homogeneous
chip.  For the last loop, nand_reset() fails if no chip is there.

If ->dev_ready hook exists, nand_command(_lp) calls nand_wait_ready()
after NAND_CMD_RESET.  However, we know denali_dev_ready() never
returns 1 unless there exists a chip that toggles R/B# in that chip
select.  Then, nand_wait_ready() just ends up with wasting 400 msec,
in the end, shows the "timeout while waiting for chip to become ready"
warning.

Let's remove the mis-implemented dev_ready hook, and fallback to
sending the NAND_CMD_STATUS and nand_wait_status_ready(), which
bails out more quickly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index f88a5dc..f069184 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -203,18 +203,6 @@ static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
 	return denali->irq_status;
 }
 
-static uint32_t denali_check_irq(struct denali_nand_info *denali)
-{
-	unsigned long flags;
-	uint32_t irq_status;
-
-	spin_lock_irqsave(&denali->irq_lock, flags);
-	irq_status = denali->irq_status;
-	spin_unlock_irqrestore(&denali->irq_lock, flags);
-
-	return irq_status;
-}
-
 static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -294,7 +282,7 @@ static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 		return;
 
 	/*
-	 * Some commands are followed by chip->dev_ready or chip->waitfunc.
+	 * Some commands are followed by chip->waitfunc.
 	 * irq_status must be cleared here to catch the R/B# interrupt later.
 	 */
 	if (ctrl & NAND_CTRL_CHANGE)
@@ -303,13 +291,6 @@ static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 	denali->host_write(denali, DENALI_BANK(denali) | type, dat);
 }
 
-static int denali_dev_ready(struct mtd_info *mtd)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-
-	return !!(denali_check_irq(denali) & INTR__INT_ACT);
-}
-
 static int denali_check_erased_page(struct mtd_info *mtd,
 				    struct nand_chip *chip, uint8_t *buf,
 				    unsigned long uncor_ecc_flags,
@@ -1349,7 +1330,6 @@ int denali_init(struct denali_nand_info *denali)
 	chip->write_byte = denali_write_byte;
 	chip->read_word = denali_read_word;
 	chip->cmd_ctrl = denali_cmd_ctrl;
-	chip->dev_ready = denali_dev_ready;
 	chip->waitfunc = denali_waitfunc;
 
 	if (features & FEATURES__INDEX_ADDR) {
-- 
2.7.4
