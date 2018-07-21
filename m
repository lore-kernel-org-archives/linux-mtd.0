Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fguV9-0005Aq-7e
 for linux-mtd@lists.infradead.org; Sat, 21 Jul 2018 16:13:01 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: Graham Moore <grmoore@opensource.altera.com>
Cc: Vignesh R <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] mtd: spi-nor: cadence-quadspi: make return type fit
 wait_for_completion_timeout
Date: Sat, 21 Jul 2018 18:08:13 +0200
Message-Id: <1532189293-5975-1-git-send-email-hofrat@osadl.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

wait_for_completion_timeout returns an unsigned long not int. declare a
suitably type timeout and fix up assignment and check.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Reported-by: Vignesh R <vigneshr@ti.com>
Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
---

Given that CQSPI_TIMEOUT_MS is < INT_MAX the type conversion is actually safe
here but it is cleaner to use proper types.

Patch was compile tested with: socfpga_defconfig (implies
CONFIG_SPI_CADENCE_QUADSPI=y)

Patch is against 4.18-rc5 (localversion-next is next-20180720)

 drivers/mtd/spi-nor/cadence-quadspi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d7e10b3..ce5f840 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -622,6 +622,7 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor, loff_t to_addr,
 	unsigned int remaining = n_tx;
 	unsigned int write_bytes;
 	int ret;
+	unsigned long timeout;
 
 	writel(to_addr, reg_base + CQSPI_REG_INDIRECTWRSTARTADDR);
 	writel(remaining, reg_base + CQSPI_REG_INDIRECTWRBYTES);
@@ -649,10 +650,10 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor, loff_t to_addr,
 		iowrite32_rep(cqspi->ahb_base, txbuf,
 			      DIV_ROUND_UP(write_bytes, 4));
 
-		ret = wait_for_completion_timeout(&cqspi->transfer_complete,
-						  msecs_to_jiffies
-						  (CQSPI_TIMEOUT_MS));
-		if (!ret) {
+		timeout = wait_for_completion_timeout(&cqspi->transfer_complete,
+						      msecs_to_jiffies
+						      (CQSPI_TIMEOUT_MS));
+		if (!timeout) {
 			dev_err(nor->dev, "Indirect write timeout\n");
 			ret = -ETIMEDOUT;
 			goto failwr;
-- 
2.1.4
