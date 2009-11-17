Message-Id: <200911172245.nAHMjk8X001820@imap1.linux-foundation.org>
Subject: [patch 1/4] mtd-nand: davinci: Correct 4-bit error correction
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 17 Nov 2009 14:45:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: nsnehaprabha@ti.com, akpm@linux-foundation.org, sudhakar.raj@ti.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>

On TI's DA830/OMAP-L137, DA850/OMAP-L138 and DM365, after setting the
4BITECC_ADD_CALC_START bit in the NAND Flash control register to 1 and
before waiting for the NAND Flash status register to be equal to 1, 2 or
3, we have to wait till the ECC HW goes to correction state.  Without this
wait, ECC correction calculations will not be proper.

This has been tested on DA830/OMAP-L137, DA850/OMAP-L138, DM355 and DM365
EVMs.

Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Acked-by: Sneha Narnakaje <nsnehaprabha@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/davinci_nand.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff -puN drivers/mtd/nand/davinci_nand.c~mtd-nand-davinci-correct-4-bit-error-correction drivers/mtd/nand/davinci_nand.c
--- a/drivers/mtd/nand/davinci_nand.c~mtd-nand-davinci-correct-4-bit-error-correction
+++ a/drivers/mtd/nand/davinci_nand.c
@@ -310,6 +310,7 @@ static int nand_davinci_correct_4bit(str
 	unsigned short ecc10[8];
 	unsigned short *ecc16;
 	u32 syndrome[4];
+	u32 ecc_state;
 	unsigned num_errors, corrected;
 
 	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
@@ -360,6 +361,21 @@ compare:
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
+	} while (ecc_state < 4);
+
 	for (;;) {
 		u32	fsr = davinci_nand_readl(info, NANDFSR_OFFSET);
 
_
