Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dngoq-0001XW-1j
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 07:56:49 +0000
Received: by mail-io0-x241.google.com with SMTP id 2so2154262ion.3
 for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2017 00:56:27 -0700 (PDT)
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
Subject: [PATCH 04/10] spi-nor: intel-spi: Check transfer length in the HW/SW
 cycle
Date: Fri,  1 Sep 2017 01:00:35 -0700
Message-Id: <1504252841-2445-5-git-send-email-bmeng.cn@gmail.com>
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

Intel SPI controller only has a 64 bytes FIFO. This adds a sanity
check before triggering any HW/SW sequencer work.

Additionally for the SW sequencer, if given data length is zero,
we should not mark the 'Data Cycle' bit.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 drivers/mtd/spi-nor/intel-spi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 263c6ab..c4a9de6 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -399,6 +399,9 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, int len)
 		return -EINVAL;
 	}
 
+	if (len > INTEL_SPI_FIFO_SZ)
+		return -EINVAL;
+
 	val |= (len - 1) << HSFSTS_CTL_FDBC_SHIFT;
 	val |= HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
 	val |= HSFSTS_CTL_FGO;
@@ -419,14 +422,19 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, int len)
 
 static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len)
 {
-	u32 val, status;
+	u32 val = 0, status;
 	int ret;
 
 	ret = intel_spi_opcode_index(ispi, opcode);
 	if (ret < 0)
 		return ret;
 
-	val = ((len - 1) << SSFSTS_CTL_DBC_SHIFT) | SSFSTS_CTL_DS;
+	if (len > INTEL_SPI_FIFO_SZ)
+		return -EINVAL;
+
+	/* Only mark 'Data Cycle' bit when there is data to be transferred */
+	if (len > 0)
+		val = ((len - 1) << SSFSTS_CTL_DBC_SHIFT) | SSFSTS_CTL_DS;
 	val |= ret << SSFSTS_CTL_COP_SHIFT;
 	val |= SSFSTS_CTL_FCERR | SSFSTS_CTL_FDONE;
 	val |= SSFSTS_CTL_SCGO;
-- 
2.9.2
