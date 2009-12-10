Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIfkX-0007Wq-3E
	for linux-mtd@lists.infradead.org; Thu, 10 Dec 2009 09:55:57 +0000
From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd-nand: davinci: Correct 4-bit error correction
Date: Thu, 10 Dec 2009 15:06:17 +0530
Message-Id: <1260437777-4793-1-git-send-email-sudhakar.raj@ti.com>
Cc: akpm@linux-foundation.org, Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	nsnehaprabha@ti.com, davinci-linux-open-source@linux.davincidsp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after
setting the 4BITECC_ADD_CALC_START bit in the NAND Flash
control register to 1 and before waiting for the NAND Flash
status register to be equal to 1, 2 or 3, we have to wait
till the ECC HW goes to correction state. Without this wait,
ECC correction calculations will not be proper.

This has been tested on DA830/OMAP-L137, DA850/OMAP-L138,
DM355 and DM365 EVMs.

Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
---
 From the previous version, timeout has been added to come out
 of the infinite loop.

 drivers/mtd/nand/davinci_nand.c |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index f13f5b9..89f0a0f 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -310,7 +310,9 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
 	unsigned short ecc10[8];
 	unsigned short *ecc16;
 	u32 syndrome[4];
+	u32 ecc_state;
 	unsigned num_errors, corrected;
+	unsigned long timeo = jiffies + msecs_to_jiffies(100);
 
 	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
 	for (i = 0; i < 10; i++) {
@@ -360,6 +362,21 @@ compare:
 	 */
 	davinci_nand_writel(info, NANDFCR_OFFSET,
 			davinci_nand_readl(info, NANDFCR_OFFSET) | BIT(13));
+
+	/*
+	 * ECC_STATE field reads 0x3 (Error correction complete) immediately
+	 * after setting the 4BITECC_ADD_CALC_START bit. So if you immediately
+	 * begin trying to poll for the state, you may fall right out of your
+	 * loop without any of the correction calculations having taken place.
+	 * The recommendation from the hardware team is to wait till ECC_STATE
+	 * reads less than 4, which means ECC HW has entered correction state.
+	 */
+	do {
+		ecc_state = (davinci_nand_readl(info,
+				NANDFSR_OFFSET) >> 8) & 0x0f;
+		cpu_relax();
+	} while ((ecc_state < 4) && time_before(jiffies, timeo));
+
 	for (;;) {
 		u32	fsr = davinci_nand_readl(info, NANDFSR_OFFSET);
 
-- 
1.5.6
