Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmbpU-00023L-Mc
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2018 09:29:35 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@bootlin.com,
	miquel.raynal@bootlin.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 3/3] mtd: rawnand: vf610_nfc: handle only idle interrupts
Date: Mon,  6 Aug 2018 11:29:09 +0200
Message-Id: <20180806092909.28980-3-stefan@agner.ch>
In-Reply-To: <20180806092909.28980-1-stefan@agner.ch>
References: <20180806092909.28980-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are two similar sounding interrupts: IDLE and DONE. The DONE
interrupt only reflects the NAND command state, but not DMA or HW
ECC correction. The IDLE interrupt reflects that all components are
idle. The driver can assume that the NAND command finished and that
data have been transferred and corrected.

This driver makes use of the IDLE interrupt only. But before this
patch the driver still handled all interrupts and cleared the DONE
interrupt although not used. This works just fine in practice, but
is not the way it should be done.

This patch makes sure that only the IDLE interrupt is handled and
cleared. To do so we have to clear the status bit in the interrupt
routine. With that it is also save to keep the interrupt always
enabled and just clear the IRQ in the interrupt handler.

This new interrupt handling has been tested for several thousand
boots and did not show any adverse effects.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Tested-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 52e7811c0bde..39307f4b1c94 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -290,15 +290,6 @@ static inline void vf610_nfc_wr_to_sram(void __iomem *dst, const void *src,
 	}
 }
 
-/* Clear flags for upcoming command */
-static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
-{
-	u32 tmp = vf610_nfc_read(nfc, NFC_IRQ_STATUS);
-
-	tmp |= DONE_CLEAR_BIT | IDLE_CLEAR_BIT;
-	vf610_nfc_write(nfc, NFC_IRQ_STATUS, tmp);
-}
-
 static void vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
@@ -310,24 +301,29 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 	 * vf610_nfc_set implicates such a barrier by using writel
 	 * to write to the register.
 	 */
-	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 	vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_BIT);
 
 	if (!wait_for_completion_timeout(&nfc->cmd_done, timeout))
 		dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
-
-	vf610_nfc_clear_status(nfc);
 }
 
 static irqreturn_t vf610_nfc_irq(int irq, void *data)
 {
 	struct mtd_info *mtd = data;
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	u32 status;
 
-	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
-	complete(&nfc->cmd_done);
+	status = vf610_nfc_read(nfc, NFC_IRQ_STATUS);
 
-	return IRQ_HANDLED;
+	if (status & IDLE_IRQ_BIT) {
+		status |= IDLE_CLEAR_BIT;
+		vf610_nfc_write(nfc, NFC_IRQ_STATUS, status);
+		complete(&nfc->cmd_done);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
 }
 
 static inline void vf610_nfc_ecc_mode(struct vf610_nfc *nfc, int ecc_mode)
@@ -826,7 +822,9 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, WERR_EN_BIT);
 	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, DONE_EN_BIT);
-	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
+
+	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_CLEAR_BIT);
+	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 
 	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, mtd);
 	if (err) {
-- 
2.18.0
