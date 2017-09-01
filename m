Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dngou-0001Yv-NS
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 07:56:54 +0000
Received: by mail-io0-x241.google.com with SMTP id 2so2154579ion.3
 for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2017 00:56:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
Subject: [PATCH 08/10] spi-nor: intel-spi: Remove the unnecessary HSFSTS
 register RW
Date: Fri,  1 Sep 2017 01:00:39 -0700
Message-Id: <1504252841-2445-9-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
References: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no code that alters the HSFSTS register content in between
in intel_spi_write(). Remove the unnecessary RW to save some cycles.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 drivers/mtd/spi-nor/intel-spi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 07146ab..91ceef7 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -611,7 +611,6 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
 		val |= (block_size - 1) << HSFSTS_CTL_FDBC_SHIFT;
 		val |= HSFSTS_CTL_FCYCLE_WRITE;
-		writel(val, ispi->base + HSFSTS_CTL);
 
 		ret = intel_spi_write_block(ispi, write_buf, block_size);
 		if (ret) {
@@ -620,8 +619,8 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 		}
 
 		/* Start the write now */
-		val = readl(ispi->base + HSFSTS_CTL);
-		writel(val | HSFSTS_CTL_FGO, ispi->base + HSFSTS_CTL);
+		val |= HSFSTS_CTL_FGO;
+		writel(val, ispi->base + HSFSTS_CTL);
 
 		ret = intel_spi_wait_hw_busy(ispi);
 		if (ret) {
-- 
2.9.2
