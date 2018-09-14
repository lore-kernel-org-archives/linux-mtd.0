Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0lgA-0006QM-WC
 for linux-mtd@lists.infradead.org; Fri, 14 Sep 2018 10:50:28 +0000
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] mtd: spi-nor: Use DMA-safe buffer for JEDEC ID in
 spi_nor_read_id()
Date: Fri, 14 Sep 2018 13:49:01 +0300
Message-Id: <20180914104901.4480-1-jarkko.nikula@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After commit 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
there is no allocation for DMA-safe buffer when transmitting data bytes
over SPI bus in m25p80 driver.

JEDEC ID reading in spi_nor_read_id() has the buffer in stack. This is
not safe with the m25p80 driver anymore after commit 4120f8d158ef if
underlying SPI controller is using DMA for transfers.

Therefore allocate a temporary DMA-safe buffer for JEDEC ID reading.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
I'm not an spi-nor expert at all but noticed this "WARNING: CPU: 3 PID: 154
at kernel/dma/debug.c:1191 check_for_stack+0xc2/0x1a0" after
4120f8d158ef since my test setup has DMA debugging enabled and using DMA
for SPI.
I don't know are there other places that may transfer from stack but it
looked potentially better to have the buffer allocated in
spi_nor_read_id() instead of doing allocation & copy all the places
that 4120f8d158ef touches.
---
 drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f028277fb1ce..f2294ed14d8f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1269,25 +1269,37 @@ static const struct flash_info spi_nor_ids[] = {
 static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 {
 	int			tmp;
-	u8			id[SPI_NOR_MAX_ID_LEN];
-	const struct flash_info	*info;
+	u8			*id;
+	const struct flash_info	*info, *ret;
+
+	id = kzalloc(SPI_NOR_MAX_ID_LEN, GFP_KERNEL | GFP_DMA);
+	if (!id) {
+		ret = ERR_PTR(ENOMEM);
+		goto out;
+	}
 
 	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
 	if (tmp < 0) {
 		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", tmp);
-		return ERR_PTR(tmp);
+		ret = ERR_PTR(tmp);
+		goto out;
 	}
 
 	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
 		info = &spi_nor_ids[tmp];
 		if (info->id_len) {
-			if (!memcmp(info->id, id, info->id_len))
-				return &spi_nor_ids[tmp];
+			if (!memcmp(info->id, id, info->id_len)) {
+				ret = &spi_nor_ids[tmp];
+				goto out;
+			}
 		}
 	}
 	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
 		id[0], id[1], id[2]);
-	return ERR_PTR(-ENODEV);
+	ret = ERR_PTR(-ENODEV);
+out:
+	kfree(id);
+	return ret;
 }
 
 static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
-- 
2.18.0
