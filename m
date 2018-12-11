Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWlzs-0007T3-S9
 for linux-mtd@lists.infradead.org; Tue, 11 Dec 2018 17:39:07 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: marvell: prevent timeouts on a loaded machine
Date: Tue, 11 Dec 2018 18:38:28 +0100
Message-Id: <20181211173828.6619-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

marvell_nfc_wait_op() waits for completion during 'timeout_ms'
milliseconds before throwing an error. While the logic is fine, the
value of 'timeout_ms' is given by the core and actually correspond to
the maximum time the NAND chip will take to complete the
operation. Assuming there is no overhead in the propagation of the
interrupt signal to the the NAND controller (through the Ready/Busy
line), this delay does not take into account the latency of the
operating system. For instance, for a page write, the delay given by
the core is rounded up to 1ms. Hence, when the machine is over loaded,
there is chances that this timeout will be reached.

There are two ways to solve this issue that are not incompatible:
1/ Enlarge the timeout value (if so, how much?).
2/ Check after the waiting method if we did not miss any interrupt
because of the OS latency (an interrupt is still pending). In this
case, we assume the operation exited successfully.

We choose the second approach that is a must in all cases, with the
possibility to also modify the timeout value to be, e.g. at least 1
second in all cases.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index e6c3739cea73..bc0eef4ade4f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -514,9 +514,14 @@ static void marvell_nfc_enable_int(struct marvell_nfc *nfc, u32 int_mask)
 	writel_relaxed(reg & ~int_mask, nfc->regs + NDCR);
 }
 
-static void marvell_nfc_clear_int(struct marvell_nfc *nfc, u32 int_mask)
+static int marvell_nfc_clear_int(struct marvell_nfc *nfc, u32 int_mask)
 {
+	u32 reg;
+
+	reg = readl_relaxed(nfc->regs + NDSR);
 	writel_relaxed(int_mask, nfc->regs + NDSR);
+
+	return reg & int_mask;
 }
 
 static void marvell_nfc_force_byte_access(struct nand_chip *chip,
@@ -683,6 +688,7 @@ static int marvell_nfc_wait_cmdd(struct nand_chip *chip)
 static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
 {
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
+	int pending;
 	int ret;
 
 	/* Timeout is expressed in ms */
@@ -695,8 +701,13 @@ static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int timeout_ms)
 	ret = wait_for_completion_timeout(&nfc->complete,
 					  msecs_to_jiffies(timeout_ms));
 	marvell_nfc_disable_int(nfc, NDCR_RDYM);
-	marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));
-	if (!ret) {
+	pending = marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));
+
+	/*
+	 * In case the interrupt was not served in the required time frame,
+	 * check if the ISR was not served or if something went actually wrong.
+	 */
+	if (ret && !pending) {
 		dev_err(nfc->dev, "Timeout waiting for RB signal\n");
 		return -ETIMEDOUT;
 	}
-- 
2.19.1
