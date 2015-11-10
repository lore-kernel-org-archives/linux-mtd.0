Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwFKj-00053H-Le
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 20:16:02 +0000
Received: by pabfh17 with SMTP id fh17so6822548pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 12:15:40 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 1/2] mtd: spi-nor: provide default erase_sector
 implementation
Date: Tue, 10 Nov 2015 12:15:27 -0800
Message-Id: <1447186528-42263-1-git-send-email-computersforpeace@gmail.com>
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

Tested on m25p80.c and Medatek's MT8173 SPI NOR flash driver.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v1 -> v2:
  * use statically-sized array, with a check to make sure MAX is big enough

v1: http://lists.infradead.org/pipermail/linux-mtd/2015-October/062916.html

 drivers/mtd/spi-nor/spi-nor.c | 37 +++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |  3 ++-
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 49883905a434..aa85564cf25a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -38,6 +38,7 @@
 #define CHIP_ERASE_2MB_READY_WAIT_JIFFIES	(40UL * HZ)
 
 #define SPI_NOR_MAX_ID_LEN	6
+#define SPI_NOR_MAX_ADDR_WIDTH	4
 
 struct flash_info {
 	char		*name;
@@ -313,6 +314,29 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 }
 
 /*
+ * Initiate the erasure of a single sector
+ */
+static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
+{
+	u8 buf[SPI_NOR_MAX_ADDR_WIDTH];
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
@@ -371,10 +395,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
@@ -1138,7 +1161,7 @@ static int set_quad_mode(struct spi_nor *nor, const struct flash_info *info)
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
-		!nor->read_reg || !nor->write_reg || !nor->erase) {
+		!nor->read_reg || !nor->write_reg) {
 		pr_err("spi-nor: please fill all the necessary fields!\n");
 		return -EINVAL;
 	}
@@ -1340,6 +1363,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		nor->addr_width = 3;
 	}
 
+	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
+		dev_err(dev, "address width is too large: %u\n",
+			nor->addr_width);
+		return -EINVAL;
+	}
+
 	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
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
