Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5Mpl-0002Y5-7C
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 17:06:22 +0000
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mxc_nand: i.MX35 hardware ECC fixups
From: John Ogness <john.ogness@linutronix.de>
Date: Tue, 03 Nov 2009 18:06:13 +0100
Message-ID: <804opb7d2y.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: s.hauer@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is against the recently posted patches from Sascha Hauer
(21 Oct 2009 mxc_nand). This patch does the following:

 - fixes ECC hardware error detection for the i.MX35
 - sets up an appropriate ECC mode (4-bit) for the i.MX35
 - configures the spare area size for the i.MX35

I tested this patch with ubifs on an i.MX35 PDK board.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 mxc_nand.c |   35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d5445cd..de056aa 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -86,6 +86,7 @@
  * Status operation */
 #define NFC_INT            0x8000
 
+#define NFC_ECC_4BIT        (1 << 0)
 #define NFC_SP_EN           (1 << 2)
 #define NFC_ECC_EN          (1 << 3)
 #define NFC_INT_MSK         (1 << 4)
@@ -351,11 +352,25 @@ static int mxc_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 	 */
 	uint16_t ecc_status = readw(host->regs + NFC_ECC_STATUS_RESULT);
 
-	if (((ecc_status & 0x3) == 2) || ((ecc_status >> 2) == 2)) {
-		DEBUG(MTD_DEBUG_LEVEL0,
-		      "MXC_NAND: HWECC uncorrectable 2-bit ECC error\n");
-		return -1;
-	}
+	if (nfc_is_v21()) {
+		if ((ecc_status & 0xf) > 1 ||
+		    ((ecc_status >> 4) & 0xf) > 1 ||
+		    ((ecc_status >> 8) & 0xf) > 1 ||
+		    ((ecc_status >> 12) & 0xf) > 1) {
+			DEBUG(MTD_DEBUG_LEVEL0,
+			      "MXC_NAND: "
+			      "HWECC uncorrectable 2-bit ECC error\n");
+			return -1;
+		}
+	} else if (nfc_is_v1()) {
+		if (((ecc_status & 0x3) == 2) || ((ecc_status >> 2) == 2)) {
+			DEBUG(MTD_DEBUG_LEVEL0,
+			      "MXC_NAND: "
+			      "HWECC uncorrectable 2-bit ECC error\n");
+			return -1;
+		}
+	} else
+		BUG();
 
 	return 0;
 }
@@ -756,6 +771,8 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	tmp = readw(host->regs + NFC_CONFIG1);
 	tmp |= NFC_INT_MSK;
 	tmp &= ~NFC_SP_EN;
+	if (nfc_is_v21())
+		tmp |= NFC_ECC_4BIT;
 	writew(tmp, host->regs + NFC_CONFIG1);
 
 	init_waitqueue_head(&host->irq_waitq);
@@ -773,6 +790,14 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	/* Unlock the internal RAM Buffer */
 	writew(0x2, host->regs + NFC_CONFIG);
 
+	if (nfc_is_v21()) {
+		/* configure spare size (in 16-bit blocks) */
+		tmp = readw(host->regs + NFC_RSLTSPARE_AREA);
+		tmp &= ~0xff;
+		tmp |= host->spare_len / 2;
+		writew(tmp, host->regs + NFC_RSLTSPARE_AREA);
+	}
+
 	/* Blocks to be unlocked */
 	if (nfc_is_v21()) {
 		writew(0x0, host->regs + NFC_V21_UNLOCKSTART_BLKADDR);
