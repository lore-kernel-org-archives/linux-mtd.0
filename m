Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5QZF-0006yU-Mc
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 07:18:35 +0000
From: Daniel Mack <daniel@zonque.org>
To: miquel.raynal@bootlin.com,
	boris.brezillon@bootlin.com
Cc: linux-mtd@lists.infradead.org, chris.packham@alliedtelesis.co.nz,
 Daniel Mack <daniel@zonque.org>, stable@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after enabling
 the IRQ
Date: Thu, 27 Sep 2018 09:17:51 +0200
Message-Id: <20180927071751.21513-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At least on PXA3xx platforms, enabling RDY interrupts in the NDCR register
will only cause the IRQ to latch when the RDY lanes are changing, and not
in case they are already asserted.

This means that if the controller finished the command in flight before
marvell_nfc_wait_op() is called, that function will wait for a change in
the bit that can't ever happen as it is already set.

To address this race, check for the RDY bits after the IRQ was enabled,
and complete the completion immediately if the condition is already met.

This fixes a bug that was observed with a NAND chip that holds a UBIFS
parition on which file system stress tests were executed. When
marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mount
the filesystem read-only, reporting lots of warnings along the way.

Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller driver
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Mack <daniel@zonque.org>
---
v1 → v2:

 * Use complete(&nfc->complete) when the condition is met, and do
   wait_for_completion_timeout() in all cases. Suggested by Boris
   Brezillon.

 drivers/mtd/nand/raw/marvell_nand.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 666f34b58dec..4870b5bae296 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -614,6 +614,7 @@ static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
 {
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 	int ret;
+	u32 st;
 
 	/* Timeout is expressed in ms */
 	if (!timeout_ms)
@@ -622,6 +623,15 @@ static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
 	init_completion(&nfc->complete);
 
 	marvell_nfc_enable_int(nfc, NDCR_RDYM);
+
+	/*
+	 * Check if the NDSR_RDY bits have already been set before the
+	 * interrupt was enabled.
+	 */
+	st = readl_relaxed(nfc->regs + NDSR);
+	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
+		complete(&nfc->complete);
+
 	ret = wait_for_completion_timeout(&nfc->complete,
 					  msecs_to_jiffies(timeout_ms));
 	marvell_nfc_disable_int(nfc, NDCR_RDYM);
-- 
2.17.1
