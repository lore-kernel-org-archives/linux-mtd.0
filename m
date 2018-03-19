Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exzo5-0000ij-Ub
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 18:46:55 +0000
From: thor.thayer@linux.intel.com
To: cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thor.thayer@linux.intel.com
Subject: [PATCH] mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
Date: Mon, 19 Mar 2018 13:45:24 -0500
Message-Id: <1521485124-24882-1-git-send-email-thor.thayer@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Thor Thayer <thor.thayer@linux.intel.com>

The current Cadence QSPI driver caused a kernel panic when loading
a Root Filesystem from QSPI. The problem was caused by reading more
bytes than needed because the QSPI operated on 4 bytes at a time.
<snip>
[    7.947754] spi_nor_read[1048]:from 0x037cad74, len 1 [bfe07fff]
[    7.956247] cqspi_read[910]:offset 0x58502516, buffer=bfe07fff
[    7.956247]
[    7.966046] Unable to handle kernel paging request at virtual
address bfe08002
[    7.973239] pgd = eebfc000
[    7.975931] [bfe08002] *pgd=2fffb811, *pte=00000000, *ppte=00000000
</snip>
Notice above how only 1 byte needed to be read but by reading 4 bytes
into the end of a mapped page, a unrecoverable page fault occurred.

This patch uses a temporary buffer to hold the 4 bytes read and then
copies only the bytes required into the buffer. A min() function is
used to limit the length to prevent buffer overflows.

Similar changes were made for the write routine.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 39 ++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 4b8e9183489a..b22ed982f896 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -501,7 +501,8 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
 	void __iomem *reg_base = cqspi->iobase;
 	void __iomem *ahb_base = cqspi->ahb_base;
 	unsigned int remaining = n_rx;
-	unsigned int bytes_to_read = 0;
+	unsigned int mod_bytes, words_to_read, bytes_to_read = 0;
+	u8 *rxbuf_end = rxbuf + n_rx;
 	int ret = 0;
 
 	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
@@ -533,9 +534,21 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
 			bytes_to_read *= cqspi->fifo_width;
 			bytes_to_read = bytes_to_read > remaining ?
 					remaining : bytes_to_read;
-			ioread32_rep(ahb_base, rxbuf,
-				     DIV_ROUND_UP(bytes_to_read, 4));
-			rxbuf += bytes_to_read;
+			/* Read 4 byte chunks before using single byte mode */
+			words_to_read = bytes_to_read / 4;
+			mod_bytes = bytes_to_read % 4;
+			if (words_to_read) {
+				ioread32_rep(ahb_base, rxbuf, words_to_read);
+				rxbuf += (words_to_read * 4);
+			}
+			if (mod_bytes) {
+				unsigned int temp = ioread32(ahb_base);
+
+				memcpy(rxbuf, &temp, min((unsigned int)
+							 (rxbuf_end - rxbuf),
+							 mod_bytes));
+				rxbuf += mod_bytes;
+			}
 			remaining -= bytes_to_read;
 			bytes_to_read = cqspi_get_rd_sram_level(cqspi);
 		}
@@ -599,7 +612,7 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor, loff_t to_addr,
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	void __iomem *reg_base = cqspi->iobase;
 	unsigned int remaining = n_tx;
-	unsigned int write_bytes;
+	unsigned int mod_bytes, write_bytes, write_words;
 	int ret;
 
 	writel(to_addr, reg_base + CQSPI_REG_INDIRECTWRSTARTADDR);
@@ -625,9 +638,20 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor, loff_t to_addr,
 
 	while (remaining > 0) {
 		write_bytes = remaining > page_size ? page_size : remaining;
-		iowrite32_rep(cqspi->ahb_base, txbuf,
-			      DIV_ROUND_UP(write_bytes, 4));
+		write_words = write_bytes / 4;
+		mod_bytes = write_bytes % 4;
+		/* Write 4 bytes at a time then single bytes. */
+		if (write_words) {
+			iowrite32_rep(cqspi->ahb_base, txbuf, write_words);
+			txbuf += (write_words * 4);
+		}
+		if (mod_bytes) {
+			unsigned int temp = 0xFFFFFFFF;
 
+			memcpy(&temp, txbuf, min(sizeof(temp), mod_bytes));
+			iowrite32(temp, cqspi->ahb_base);
+			txbuf += mod_bytes;
+		}
 		ret = wait_for_completion_timeout(&cqspi->transfer_complete,
 						  msecs_to_jiffies
 						  (CQSPI_TIMEOUT_MS));
@@ -637,7 +661,6 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor, loff_t to_addr,
 			goto failwr;
 		}
 
-		txbuf += write_bytes;
 		remaining -= write_bytes;
 
 		if (remaining > 0)
-- 
2.7.4
