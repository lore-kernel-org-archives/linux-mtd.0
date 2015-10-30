Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZryR3-0005YA-Vg
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 01:24:54 +0000
Received: by pacfv9 with SMTP id fv9so59164562pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 18:24:33 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>
Subject: [PATCH 1/2] mtd: spi-nor: provide default erase_sector implementation
Date: Thu, 29 Oct 2015 18:24:20 -0700
Message-Id: <1446168261-4102-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some spi-nor drivers perform sector erase by duplicating their
write_reg() command. Let's not require that the driver fill this out,
and provide a default instead.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 30 ++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |  3 ++-
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 49883905a434..58a435372be7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -313,6 +313,29 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 }
 
 /*
+ * Initiate the erasure of a single sector
+ */
+static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
+{
+	u8 buf[nor->addr_width];
+	int i;
+
+	if (nor->erase)
+		return nor->erase(nor, addr);
+
+	/*
+	 * Default implementation, if driver doesn't have a specialized HW
+	 * control
+	 */
+	for (i = nor->addr_width - 1; i >= 0; i--) {
+		buf[i] = addr & 0xff;
+		addr >>= 8;
+	}
+
+	return nor->write_reg(nor, nor->erase_opcode, buf, nor->addr_width);
+}
+
+/*
  * Erase an address range on the nor chip.  The address range may extend
  * one or more erase sectors.  Return an error is there is a problem erasing.
  */
@@ -371,10 +394,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		while (len) {
 			write_enable(nor);
 
-			if (nor->erase(nor, addr)) {
-				ret = -EIO;
+			ret = spi_nor_erase_sector(nor, addr);
+			if (ret)
 				goto erase_err;
-			}
 
 			addr += mtd->erasesize;
 			len -= mtd->erasesize;
@@ -1138,7 +1160,7 @@ static int set_quad_mode(struct spi_nor *nor, const struct flash_info *info)
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
-		!nor->read_reg || !nor->write_reg || !nor->erase) {
+		!nor->read_reg || !nor->write_reg) {
 		pr_err("spi-nor: please fill all the necessary fields!\n");
 		return -EINVAL;
 	}
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c8723b62c4cd..69898b675ade 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -144,7 +144,8 @@ struct mtd_info;
  * @read:		[DRIVER-SPECIFIC] read data from the SPI NOR
  * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
  * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
- *			at the offset @offs
+ *			at the offset @offs; if not provided by the driver,
+ *			spi-nor will send the erase opcode via write_reg()
  * @flash_lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
-- 
2.6.0.rc2.230.g3dd15c0
