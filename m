Received: from smtp122.sbc.mail.sp1.yahoo.com ([69.147.64.95])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2bYi-0004b8-0R
	for linux-mtd@lists.infradead.org; Sun, 24 Jun 2007 19:32:05 -0400
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
Subject: [patch 2.6.22-rc5-git] MTD: m25p80 handles more chips,
	uses JEDEC ids and small eraseblocks
Date: Sun, 24 Jun 2007 15:12:35 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706241512.35332.david-b@pacbell.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update chip ID tables in m25p80 to handle more SPI flash chips, matching
datasheets.  All of these can use the same core operations and are newer
chips that support the JEDEC "read id" instruction:

 - Atmel AT25 and AT26 (seven chips)
 - Spansion S25SL (five chips)
 - SST 25VF (four chips)
 - ST M25, M45 (five more chips)
 - Winbond W25X series (seven chips)

That JEDEC instruction is now used, either to support a sanity check on the
platform data holding board configuration data, or to determine chip type
when it's not included in platform data.  In fact, boards that don't need a
standard partition table may not need that platform data any more.

For chips that support 4KB erase units, use that smaller block size instead
of the larger size (usually 64KB); it's less wasteful.  (Tested on W25X80.)

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/devices/Kconfig  |   17 ++-
 drivers/mtd/devices/m25p80.c |  234 +++++++++++++++++++++++++++++++++----------
 2 files changed, 194 insertions(+), 57 deletions(-)

--- g26.orig/drivers/mtd/devices/Kconfig	2007-05-08 12:41:54.000000000 -0700
+++ g26/drivers/mtd/devices/Kconfig	2007-06-24 13:06:14.000000000 -0700
@@ -69,12 +69,21 @@ config MTD_DATAFLASH26
 	  If you have such a board and such a DataFlash, say 'Y'.
 
 config MTD_M25P80
-	tristate "Support for M25 SPI Flash"
+	tristate "Support most SPI Flash chips (AT26DF, M25P, W25X, ...)"
 	depends on SPI_MASTER && EXPERIMENTAL
 	help
-	  This enables access to ST M25P80 and similar SPI flash chips,
-	  used for program and data storage.  Set up your spi devices
-	  with the right board-specific platform data.
+	  This enables access to most modern SPI flash chips, used for
+	  program and data storage.   Series supported include Atmel AT26DF,
+	  Spansion S25SL, SST 25VF, ST M25P, and Winbond W25X.  Other chips
+	  are supported as well.  See the driver source for the current list,
+	  or to add other chips.
+
+	  Note that the original DataFlash chips (AT45 series, not AT26DF),
+	  need an entirely different driver.
+
+	  Set up your spi devices with the right board-specific platform data,
+	  if you want to specify device partitioning or to use a device which
+	  doesn't support the JEDEC ID instruction.
 
 config MTD_SLRAM
 	tristate "Uncached system RAM"
--- g26.orig/drivers/mtd/devices/m25p80.c	2007-06-20 20:15:50.000000000 -0700
+++ g26/drivers/mtd/devices/m25p80.c	2007-06-24 13:06:14.000000000 -0700
@@ -1,5 +1,5 @@
 /*
- * MTD SPI driver for ST M25Pxx flash chips
+ * MTD SPI driver for ST M25Pxx (and similar) serial flash chips
  *
  * Author: Mike Lavender, mike@steroidmicros.com
  *
@@ -28,25 +28,23 @@
 #include <linux/spi/flash.h>
 
 
-/* NOTE: AT 25F and SST 25LF series are very similar,
- * as are other newer Atmel dataflash chips (AT26),
- * but commands for sector erase and chip id differ...
- */
-
 #define FLASH_PAGESIZE		256
 
 /* Flash opcodes. */
-#define	OPCODE_WREN		6	/* Write enable */
-#define	OPCODE_RDSR		5	/* Read status register */
-#define	OPCODE_READ		3	/* Read data bytes */
-#define	OPCODE_PP		2	/* Page program */
-#define	OPCODE_SE		0xd8	/* Sector erase */
-#define	OPCODE_RES		0xab	/* Read Electronic Signature */
+#define	OPCODE_WREN		0x06	/* Write enable */
+#define	OPCODE_RDSR		0x05	/* Read status register */
+#define	OPCODE_READ		0x03	/* Read data bytes (low frequency) */
+#define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */
+#define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
+#define	OPCODE_BE_4K		0x20	/* Erase 4K block */
+#define	OPCODE_BE_32K		0x52	/* Erase 32K block */
+#define	OPCODE_SE		0xd8	/* Sector erase (usually 64K) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
 
 /* Status Register bits. */
 #define	SR_WIP			1	/* Write in progress */
 #define	SR_WEL			2	/* Write enable latch */
+/* meaning of other SR_* bits may differ between vendors */
 #define	SR_BP0			4	/* Block protect 0 */
 #define	SR_BP1			8	/* Block protect 1 */
 #define	SR_BP2			0x10	/* Block protect 2 */
@@ -68,7 +66,8 @@ struct m25p {
 	struct spi_device	*spi;
 	struct mutex		lock;
 	struct mtd_info		mtd;
-	unsigned		partitioned;
+	unsigned		partitioned:1;
+	u8			erase_opcode;
 	u8			command[4];
 };
 
@@ -151,8 +150,9 @@ static int wait_till_ready(struct m25p *
  */
 static int erase_sector(struct m25p *flash, u32 offset)
 {
-	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s at 0x%08x\n", flash->spi->dev.bus_id,
-			__FUNCTION__, offset);
+	DEBUG(MTD_DEBUG_LEVEL3, "%s: %s %dK at 0x%08x\n",
+			flash->spi->dev.bus_id, __FUNCTION__,
+			flash->mtd.erasesize / 1024, offset);
 
 	/* Wait until finished previous write command. */
 	if (wait_till_ready(flash))
@@ -162,7 +162,7 @@ static int erase_sector(struct m25p *fla
 	write_enable(flash);
 
 	/* Set up command buffer. */
-	flash->command[0] = OPCODE_SE;
+	flash->command[0] = flash->erase_opcode;
 	flash->command[1] = offset >> 16;
 	flash->command[2] = offset >> 8;
 	flash->command[3] = offset;
@@ -204,6 +204,10 @@ static int m25p80_erase(struct mtd_info 
 
 	mutex_lock(&flash->lock);
 
+	/* REVISIT in some cases we could speed up erasing large regions
+	 * by using OPCODE_SE instead of OPCODE_BE_4K
+	 */
+
 	/* now erase those sectors */
 	while (len) {
 		if (erase_sector(flash, addr)) {
@@ -270,7 +274,10 @@ static int m25p80_read(struct mtd_info *
 		return 1;
 	}
 
-	/* NOTE:  OPCODE_FAST_READ (if available) is faster... */
+	/* FIXME switch to OPCODE_FAST_READ.  It's required for higher
+	 * clocks; and at this writing, every chip this driver handles
+	 * supports that opcode.
+	 */
 
 	/* Set up the write data buffer. */
 	flash->command[0] = OPCODE_READ;
@@ -399,24 +406,118 @@ static int m25p80_write(struct mtd_info 
 
 struct flash_info {
 	char		*name;
-	u8		id;
-	u16		jedec_id;
+
+	/* JEDEC id zero means "no ID" (most older chips); otherwise it has
+	 * a high byte of zero plus three data bytes: the manufacturer id,
+	 * then a two byte device id.
+	 */
+	u32		jedec_id;
+
+	/* The size listed here is what works with OPCODE_SE, which isn't
+	 * necessarily called a "sector" by the vendor.
+	 */
 	unsigned	sector_size;
-	unsigned	n_sectors;
+	u16		n_sectors;
+
+	u16		flags;
+#define	SECT_4K		0x01		/* OPCODE_BE_4K works uniformly */
 };
 
+
+/* NOTE: double check command sets and memory organization when you add
+ * more flash chips.  This current list focusses on newer chips, which
+ * have been converging on command sets which including JEDEC ID.
+ */
 static struct flash_info __devinitdata m25p_data [] = {
-	/* JEDEC id zero means "has no ID" */
-	{ "m25p05", 0x05, 0x2010, 32 * 1024, 2 },
-	{ "m25p10", 0x10, 0x2011, 32 * 1024, 4 },
-	{ "m25p20", 0x11, 0x2012, 64 * 1024, 4 },
-	{ "m25p40", 0x12, 0x2013, 64 * 1024, 8 },
-	{ "m25p80", 0x13, 0x0000, 64 * 1024, 16 },
-	{ "m25p16", 0x14, 0x2015, 64 * 1024, 32 },
-	{ "m25p32", 0x15, 0x2016, 64 * 1024, 64 },
-	{ "m25p64", 0x16, 0x2017, 64 * 1024, 128 },
+
+	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
+	{ "at25fs010",  0x1f6601, 32 * 1024, 4, SECT_4K, },
+	{ "at25fs040",  0x1f6604, 64 * 1024, 8, SECT_4K, },
+
+	{ "at25df041a", 0x1f4401, 64 * 1024, 8, SECT_4K, },
+
+	{ "at26f004",   0x1f0400, 64 * 1024, 8, SECT_4K, },
+	{ "at26df081a", 0x1f4501, 64 * 1024, 16, SECT_4K, },
+	{ "at26df161a", 0x1f4601, 64 * 1024, 32, SECT_4K, },
+	{ "at26df321",  0x1f4701, 64 * 1024, 64, SECT_4K, },
+
+	/* Spansion -- single (large) sector size only, at least
+	 * for the chips listed here (without boot sectors).
+	 */
+	{ "s25sl004a", 0x010212, 64 * 1024, 8, },
+	{ "s25sl008a", 0x010213, 64 * 1024, 16, },
+	{ "s25sl016a", 0x010214, 64 * 1024, 32, },
+	{ "s25sl032a", 0x010215, 64 * 1024, 64, },
+	{ "s25sl064a", 0x010216, 64 * 1024, 128, },
+
+	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
+	{ "sst25vf040b", 0xbf258d, 64 * 1024, 8, SECT_4K, },
+	{ "sst25vf080b", 0xbf258e, 64 * 1024, 16, SECT_4K, },
+	{ "sst25vf016b", 0xbf2541, 64 * 1024, 32, SECT_4K, },
+	{ "sst25vf032b", 0xbf254a, 64 * 1024, 64, SECT_4K, },
+
+	/* ST Microelectronics -- newer production may have feature updates */
+	{ "m25p05",  0x202010,  32 * 1024, 2, },
+	{ "m25p10",  0x202011,  32 * 1024, 4, },
+	{ "m25p20",  0x202012,  64 * 1024, 4, },
+	{ "m25p40",  0x202013,  64 * 1024, 8, },
+	{ "m25p80",         0,  64 * 1024, 16, },
+	{ "m25p16",  0x202015,  64 * 1024, 32, },
+	{ "m25p32",  0x202016,  64 * 1024, 64, },
+	{ "m25p64",  0x202017,  64 * 1024, 128, },
+	{ "m25p128", 0x202018, 256 * 1024, 64, },
+
+	{ "m45pe80", 0x204014,  64 * 1024, 16, },
+	{ "m45pe16", 0x204015,  64 * 1024, 32, },
+
+	{ "m25pe80", 0x208014,  64 * 1024, 16, },
+	{ "m25pe16", 0x208015,  64 * 1024, 32, SECT_4K, },
+
+	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4K */
+	{ "w25x10", 0xef3011, 64 * 1024, 2, SECT_4K, },
+	{ "w25x20", 0xef3012, 64 * 1024, 4, SECT_4K, },
+	{ "w25x40", 0xef3013, 64 * 1024, 8, SECT_4K, },
+	{ "w25x80", 0xef3014, 64 * 1024, 16, SECT_4K, },
+	{ "w25x16", 0xef3015, 64 * 1024, 32, SECT_4K, },
+	{ "w25x32", 0xef3016, 64 * 1024, 64, SECT_4K, },
+	{ "w25x64", 0xef3017, 64 * 1024, 128, SECT_4K, },
 };
 
+static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
+{
+	int			tmp;
+	u8			code = OPCODE_RDID;
+	u8			id[3];
+	u32			jedec;
+	struct flash_info	*info;
+
+	/* JEDEC also defines an optional "extended device information"
+	 * string for after vendor-specific data, after the three bytes
+	 * we use here.  Supporting some chips might require using it.
+	 */
+	tmp = spi_write_then_read(spi, &code, 1, id, 3);
+	if (tmp < 0) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: error %d reading JEDEC ID\n",
+			spi->dev.bus_id, tmp);
+		return NULL;
+	}
+	jedec = id[0];
+	jedec = jedec << 8;
+	jedec |= id[1];
+	jedec = jedec << 8;
+	jedec |= id[2];
+
+	for (tmp = 0, info = m25p_data;
+			tmp < ARRAY_SIZE(m25p_data);
+			tmp++, info++) {
+		if (info->jedec_id == jedec)
+			return info;
+	}
+	dev_err(&spi->dev, "unrecognized JEDEC id %06x\n", jedec);
+	return NULL;
+}
+
+
 /*
  * board specific setup should have ensured the SPI clock used here
  * matches what the READ command supports, at least until this driver
@@ -430,27 +531,41 @@ static int __devinit m25p_probe(struct s
 	unsigned			i;
 
 	/* Platform data helps sort out which chip type we have, as
-	 * well as how this board partitions it.
+	 * well as how this board partitions it.  If we don't have
+	 * a chip ID, try the JEDEC id commands; they'll work for most
+	 * newer chips, even if we don't recognize the particular chip.
 	 */
 	data = spi->dev.platform_data;
-	if (!data || !data->type) {
-		/* FIXME some chips can identify themselves with RES
-		 * or JEDEC get-id commands.  Try them ...
-		 */
-		DEBUG(MTD_DEBUG_LEVEL1, "%s: no chip id\n",
-				spi->dev.bus_id);
-		return -ENODEV;
-	}
+	if (data && data->type) {
+		for (i = 0, info = m25p_data;
+				i < ARRAY_SIZE(m25p_data);
+				i++, info++) {
+			if (strcmp(data->type, info->name) == 0)
+				break;
+		}
 
-	for (i = 0, info = m25p_data; i < ARRAY_SIZE(m25p_data); i++, info++) {
-		if (strcmp(data->type, info->name) == 0)
-			break;
-	}
-	if (i == ARRAY_SIZE(m25p_data)) {
-		DEBUG(MTD_DEBUG_LEVEL1, "%s: unrecognized id %s\n",
-				spi->dev.bus_id, data->type);
+		/* unrecognized chip? */
+		if (i == ARRAY_SIZE(m25p_data)) {
+			DEBUG(MTD_DEBUG_LEVEL0, "%s: unrecognized id %s\n",
+					spi->dev.bus_id, data->type);
+			info = NULL;
+
+		/* recognized; is that chip really what's there? */
+		} else if (info->jedec_id) {
+			struct flash_info	*chip = jedec_probe(spi);
+
+			if (!chip || chip != info) {
+				dev_warn(&spi->dev, "found %s, expected %s\n",
+						chip ? chip->name : "UNKNOWN",
+						info->name);
+				info = NULL;
+			}
+		}
+	} else
+		info = jedec_probe(spi);
+
+	if (!info)
 		return -ENODEV;
-	}
 
 	flash = kzalloc(sizeof *flash, GFP_KERNEL);
 	if (!flash)
@@ -460,7 +575,7 @@ static int __devinit m25p_probe(struct s
 	mutex_init(&flash->lock);
 	dev_set_drvdata(&spi->dev, flash);
 
-	if (data->name)
+	if (data && data->name)
 		flash->mtd.name = data->name;
 	else
 		flash->mtd.name = spi->dev.bus_id;
@@ -469,11 +584,19 @@ static int __devinit m25p_probe(struct s
 	flash->mtd.writesize = 1;
 	flash->mtd.flags = MTD_CAP_NORFLASH;
 	flash->mtd.size = info->sector_size * info->n_sectors;
-	flash->mtd.erasesize = info->sector_size;
 	flash->mtd.erase = m25p80_erase;
 	flash->mtd.read = m25p80_read;
 	flash->mtd.write = m25p80_write;
 
+	/* prefer "small sector" erase if possible */
+	if (info->flags & SECT_4K) {
+		flash->erase_opcode = OPCODE_BE_4K;
+		flash->mtd.erasesize = 4096;
+	} else {
+		flash->erase_opcode = OPCODE_SE;
+		flash->mtd.erasesize = info->sector_size;
+	}
+
 	dev_info(&spi->dev, "%s (%d Kbytes)\n", info->name,
 			flash->mtd.size / 1024);
 
@@ -517,14 +640,14 @@ static int __devinit m25p_probe(struct s
 		}
 
 		if (nr_parts > 0) {
-			for (i = 0; i < data->nr_parts; i++) {
+			for (i = 0; i < nr_parts; i++) {
 				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
 					"{.name = %s, .offset = 0x%.8x, "
 						".size = 0x%.8x (%uK) }\n",
-					i, data->parts[i].name,
-					data->parts[i].offset,
-					data->parts[i].size,
-					data->parts[i].size / 1024);
+					i, parts[i].name,
+					parts[i].offset,
+					parts[i].size,
+					parts[i].size / 1024);
 			}
 			flash->partitioned = 1;
 			return add_mtd_partitions(&flash->mtd, parts, nr_parts);
@@ -561,6 +684,11 @@ static struct spi_driver m25p80_driver =
 	},
 	.probe	= m25p_probe,
 	.remove	= __devexit_p(m25p_remove),
+
+	/* REVISIT: many of these chips have deep power-down modes, which
+	 * should clearly be entered on suspend() to minimize power use.
+	 * And also when they're otherwise idle...
+	 */
 };
 
 
