Message-Id: <201007202224.o6KMO138021388@imap1.linux-foundation.org>
Subject: [patch 3/4] mtd-nand: davinci: correct 4-bit error correction
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 20 Jul 2010 15:24:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: nsnehaprabha@ti.com, akpm@linux-foundation.org, sudhakar.raj@ti.com,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com
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
Cc: Anton Vorontsov <cbouatmailru@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/davinci_nand.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff -puN drivers/mtd/nand/davinci_nand.c~mtd-nand-davinci-correct-4-bit-error-correction drivers/mtd/nand/davinci_nand.c
--- a/drivers/mtd/nand/davinci_nand.c~mtd-nand-davinci-correct-4-bit-error-correction
+++ a/drivers/mtd/nand/davinci_nand.c
@@ -311,7 +311,9 @@ static int nand_davinci_correct_4bit(str
 	unsigned short ecc10[8];
 	unsigned short *ecc16;
 	u32 syndrome[4];
+	u32 ecc_state;
 	unsigned num_errors, corrected;
+	unsigned long timeo = jiffies + msecs_to_jiffies(100);
 
 	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
 	for (i = 0; i < 10; i++) {
@@ -361,6 +363,21 @@ compare:
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
 
_
