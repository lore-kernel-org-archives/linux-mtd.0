Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRsOW-0004aN-5y
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 05:28:19 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 1/2] mtd: rawnand: denali: remove ->dev_ready() hook
Date: Wed, 28 Nov 2018 14:27:36 +0900
Message-Id: <1543382857-30827-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543382857-30827-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543382857-30827-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali NAND IP has no way to read out the current signal level
of the R/B# pin. Instead, denali_dev_ready() checks if the R/B#
transition has already happened. (The INTR__INT_ACT interrupt is
asserted at the rising edge of the R/B# pin.) It is not a correct
way to implement the ->dev_ready() hook.

In fact, it has a drawback; in the nand_scan_ident phase, the chip
detection iterates over maxchips until it fails to find a homogeneous
chip. For the last loop, nand_reset() fails if no chip is there.

If ->dev_ready hook exists, nand_command(_lp) calls nand_wait_ready()
after NAND_CMD_RESET. However, we know denali_dev_ready() never
returns 1 unless there exists a chip that toggles R/B# in that chip
select. Then, nand_wait_ready() just ends up with wasting 400 msec,
in the end, shows the "timeout while waiting for chip to become ready"
warning.

Let's remove the mis-implemented dev_ready hook, and fallback to
sending the NAND_CMD_STATUS and nand_wait_status_ready(), which
bails out more quickly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Rebase

 drivers/mtd/nand/raw/denali.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 830ea24..ead6e60 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -204,18 +204,6 @@ static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
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
 static void denali_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -288,8 +276,7 @@ static void denali_cmd_ctrl(struct nand_chip *chip, int dat, unsigned int ctrl)
 		return;
 
 	/*
-	 * Some commands are followed by chip->legacy.dev_ready or
-	 * chip->legacy.waitfunc.
+	 * Some commands are followed by chip->legacy.waitfunc.
 	 * irq_status must be cleared here to catch the R/B# interrupt later.
 	 */
 	if (ctrl & NAND_CTRL_CHANGE)
@@ -298,13 +285,6 @@ static void denali_cmd_ctrl(struct nand_chip *chip, int dat, unsigned int ctrl)
 	denali->host_write(denali, DENALI_BANK(denali) | type, dat);
 }
 
-static int denali_dev_ready(struct nand_chip *chip)
-{
-	struct denali_nand_info *denali = mtd_to_denali(nand_to_mtd(chip));
-
-	return !!(denali_check_irq(denali) & INTR__INT_ACT);
-}
-
 static int denali_check_erased_page(struct mtd_info *mtd,
 				    struct nand_chip *chip, uint8_t *buf,
 				    unsigned long uncor_ecc_flags,
@@ -1359,7 +1339,6 @@ int denali_init(struct denali_nand_info *denali)
 	chip->legacy.read_byte = denali_read_byte;
 	chip->legacy.write_byte = denali_write_byte;
 	chip->legacy.cmd_ctrl = denali_cmd_ctrl;
-	chip->legacy.dev_ready = denali_dev_ready;
 	chip->legacy.waitfunc = denali_waitfunc;
 
 	if (features & FEATURES__INDEX_ADDR) {
-- 
2.7.4
