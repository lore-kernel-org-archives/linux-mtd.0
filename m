Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMcWx-0007jh-WF
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 17:31:16 +0000
From: thor.thayer@linux.intel.com
To: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thor Thayer <thor.thayer@linux.intel.com>
Subject: [PATCH] mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
Date: Tue, 13 Nov 2018 11:32:25 -0600
Message-Id: <1542130345-10005-1-git-send-email-thor.thayer@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Thor Thayer <thor.thayer@linux.intel.com>

The current Cadence QSPI driver caused a kernel panic sporadically
when writing to QSPI. The problem was caused by writing more bytes
than needed because the QSPI operated on 4 bytes at a time.
<snip>
[   11.202044] Unable to handle kernel paging request at virtual address bffd3000
[   11.209254] pgd = e463054d
[   11.211948] [bffd3000] *pgd=2fffb811, *pte=00000000, *ppte=00000000
[   11.218202] Internal error: Oops: 7 [#1] SMP ARM
[   11.222797] Modules linked in:
[   11.225844] CPU: 1 PID: 1317 Comm: systemd-hwdb Not tainted 4.17.7-d0c45cd44a8f
[   11.235796] Hardware name: Altera SOCFPGA Arria10
[   11.240487] PC is at __raw_writesl+0x70/0xd4
[   11.244741] LR is at cqspi_write+0x1a0/0x2cc
</snip>
On a page boundary limit the number of bytes copied from the tx buffer
to remain within the page.

This patch uses a temporary buffer to hold the 4 bytes to write and then
copies only the bytes required from the tx buffer. A min() function is
used to limit the length to prevent buffer indexing overflows.

Reported-by: Adrian Amborzewicz <adrian.ambrozewicz@intel.com>
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d846428ef038..3659d94b4d2f 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -644,9 +644,23 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor, loff_t to_addr,
 		ndelay(cqspi->wr_delay);
 
 	while (remaining > 0) {
+		size_t write_words, mod_bytes;
+
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
+
+			memcpy(&temp, txbuf, min(sizeof(temp), mod_bytes));
+			iowrite32(temp, cqspi->ahb_base);
+			txbuf += mod_bytes;
+		}
 
 		if (!wait_for_completion_timeout(&cqspi->transfer_complete,
 					msecs_to_jiffies(CQSPI_TIMEOUT_MS))) {
@@ -655,7 +669,6 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor, loff_t to_addr,
 			goto failwr;
 		}
 
-		txbuf += write_bytes;
 		remaining -= write_bytes;
 
 		if (remaining > 0)
-- 
2.7.4
