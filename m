Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drLAJ-000692-Ih
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 09:38:05 +0000
Received: by mail-it0-x242.google.com with SMTP id b76so3843407itb.2
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 02:37:43 -0700 (PDT)
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
Subject: [PATCH v2 02/10] spi-nor: intel-spi: Remove useless 'buf' parameter
 in the HW/SW cycle
Date: Mon, 11 Sep 2017 02:41:52 -0700
Message-Id: <1505122921-5534-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
References: <1505122921-5534-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

intel_spi_hw_cycle() and intel_spi_sw_cycle() don't use the parameter
'buf' at all. Remove it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---

Changes in v2: None

 drivers/mtd/spi-nor/intel-spi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index e5b52e8..07626ca 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -377,8 +377,7 @@ static int intel_spi_opcode_index(struct intel_spi *ispi, u8 opcode)
 	return -EINVAL;
 }
 
-static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, u8 *buf,
-			      int len)
+static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, int len)
 {
 	u32 val, status;
 	int ret;
@@ -418,8 +417,7 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, u8 *buf,
 	return 0;
 }
 
-static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, u8 *buf,
-			      int len)
+static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len)
 {
 	u32 val, status;
 	int ret;
@@ -456,9 +454,9 @@ static int intel_spi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	writel(0, ispi->base + FADDR);
 
 	if (ispi->swseq)
-		ret = intel_spi_sw_cycle(ispi, opcode, buf, len);
+		ret = intel_spi_sw_cycle(ispi, opcode, len);
 	else
-		ret = intel_spi_hw_cycle(ispi, opcode, buf, len);
+		ret = intel_spi_hw_cycle(ispi, opcode, len);
 
 	if (ret)
 		return ret;
@@ -486,8 +484,8 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 		return ret;
 
 	if (ispi->swseq)
-		return intel_spi_sw_cycle(ispi, opcode, buf, len);
-	return intel_spi_hw_cycle(ispi, opcode, buf, len);
+		return intel_spi_sw_cycle(ispi, opcode, len);
+	return intel_spi_hw_cycle(ispi, opcode, len);
 }
 
 static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
-- 
2.9.2
