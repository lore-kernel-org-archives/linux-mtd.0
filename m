Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dngop-0001Xz-64
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 07:56:48 +0000
Received: by mail-io0-x242.google.com with SMTP id z67so339458iof.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2017 00:56:31 -0700 (PDT)
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
Subject: [PATCH 06/10] spi-nor: intel-spi: Remove 'Atomic Cycle Sequence' in
 intel_spi_write()
Date: Fri,  1 Sep 2017 01:00:37 -0700
Message-Id: <1504252841-2445-7-git-send-email-bmeng.cn@gmail.com>
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

So far intel_spi_write() uses the HW sequencer to do the write. But
the HW sequencer register HSFSTS_CTL does not have such a field for
'Atomic Cycle Sequence', remove it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 drivers/mtd/spi-nor/intel-spi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index d0237fe..757b9f1 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -572,11 +572,6 @@ static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
 		val |= (block_size - 1) << HSFSTS_CTL_FDBC_SHIFT;
 		val |= HSFSTS_CTL_FCYCLE_WRITE;
-
-		/* Write enable */
-		if (ispi->preopcodes[1] == SPINOR_OP_WREN)
-			val |= SSFSTS_CTL_SPOP;
-		val |= SSFSTS_CTL_ACS;
 		writel(val, ispi->base + HSFSTS_CTL);
 
 		ret = intel_spi_write_block(ispi, write_buf, block_size);
-- 
2.9.2
