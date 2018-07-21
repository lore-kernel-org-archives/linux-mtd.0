Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgsqG-0000fZ-3S
 for linux-mtd@lists.infradead.org; Sat, 21 Jul 2018 14:26:41 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH 2/2] mtd: spi-nor: cadence-quadspi: fix return type to fit
 wait_for_completion_timeout
Date: Sat, 21 Jul 2018 16:21:52 +0200
Message-Id: <1532182912-3674-2-git-send-email-hofrat@osadl.org>
In-Reply-To: <1532182912-3674-1-git-send-email-hofrat@osadl.org>
References: <1532182912-3674-1-git-send-email-hofrat@osadl.org>
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
---

Found during code review.

Given that CQSPI_READ_TIMEOUT_MS is < INT_MAX the type conversion is safe
here but it is cleaner to use proper types.

Patch was compile tested with: socfpga_defconfig (implies
CONFIG_SPI_CADENCE_QUADSPI=y)

Patch is against 4.18-rc5 (localversion-next is next-20180720)

 drivers/mtd/spi-nor/cadence-quadspi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index d7e10b3..f0c3b0f 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -511,6 +511,7 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
 	unsigned int bytes_to_read = 0;
 	u8 *rxbuf_end = rxbuf + n_rx;
 	int ret = 0;
+	unsigned long timeout;
 
 	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
 	writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
@@ -525,13 +526,13 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
 	       reg_base + CQSPI_REG_INDIRECTRD);
 
 	while (remaining > 0) {
-		ret = wait_for_completion_timeout(&cqspi->transfer_complete,
-						  msecs_to_jiffies
-						  (CQSPI_READ_TIMEOUT_MS));
+		timeout = wait_for_completion_timeout(&cqspi->transfer_complete,
+						      msecs_to_jiffies
+						      (CQSPI_READ_TIMEOUT_MS));
 
 		bytes_to_read = cqspi_get_rd_sram_level(cqspi);
 
-		if (!ret && bytes_to_read == 0) {
+		if (!timeout && bytes_to_read == 0) {
 			dev_err(nor->dev, "Indirect read timeout, no bytes\n");
 			ret = -ETIMEDOUT;
 			goto failrd;
-- 
2.1.4
