Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMdkF-0006tI-9K
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2016 15:35:36 +0000
From: Mason <slash.tmp@free.fr>
Subject: RFC on large number of hacks in mtd core files
To: linux-mtd <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Sebastian Frias <sf84@laposte.net>
Message-ID: <56A24C22.2050607@free.fr>
Date: Fri, 22 Jan 2016 16:34:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone,

As I've mentioned in a previous thread, I'm supposed to port a NAND
controller driver from 3.4 to 4.4. But this is complicated by the
fact that several core files have been modified along the way.

Here's the full picture:

$ git diff --stat v3.4.39 custom-3.4 drivers/mtd
 drivers/mtd/Kconfig                 |   15 +-
 drivers/mtd/chips/cfi_cmdset_0002.c |  129 ++-
 drivers/mtd/devices/Kconfig         |    6 +
 drivers/mtd/devices/Makefile        |    3 +-
 drivers/mtd/devices/m25p80.c        |  100 +-
 drivers/mtd/devices/spiflash.c      | 2131 +++++++++++++++++++++++++++++++++++
 drivers/mtd/maps/Kconfig            |   11 +-
 drivers/mtd/maps/physmap.c          |  202 +++-
 drivers/mtd/mtdchar.c               |   54 +
 drivers/mtd/mtdcore.c               |   63 +-
 drivers/mtd/mtdpart.c               |    9 +
 drivers/mtd/nand/Kconfig            |   46 +-
 drivers/mtd/nand/Makefile           |   11 +-
 drivers/mtd/nand/monza_nand.c       |  614 ++++++++++
 drivers/mtd/nand/nand_base.c        | 1226 +++++++++++++++++++-
 drivers/mtd/nand/nand_bch_ecc.c     |  311 +++++
 drivers/mtd/nand/nand_bch_ecc.h     |   11 +
 drivers/mtd/nand/nand_ids.c         |  253 ++++-
 drivers/mtd/nand/nandsim.c          |    2 +-
 drivers/mtd/nand/smp8xxx_nand.c     | 2009 +++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/misc.c              |    7 +
 21 files changed, 7164 insertions(+), 49 deletions(-)


Here's the actual diff, with non-core changes omitted.
I have also deleted two irrelevant large diff blocks in nand_base.c
CONFIG_VENDOR_DTV can be ignored, it's an unrelated project.

AFAICT, most of this code should not be in core files.


diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 27143e042af5..f50826842364 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -1,6 +1,7 @@
 menuconfig MTD
 	tristate "Memory Technology Device (MTD) support"
 	depends on GENERIC_IO
+	depends on (!VENDOR_DTV || (VENDOR_DTV_ROM_SLC || VENDOR_DTV_ROM_MLC))
 	help
 	  Memory Technology Devices are flash, RAM and similar chips, often
 	  used for solid state file systems on embedded devices. This option
@@ -22,9 +23,21 @@ config MTD_TESTS
 
 	  WARNING: some of the tests will ERASE entire MTD device which they
 	  test. Do not use these tests unless you really know what you do.
+config MTD_PARTITIONS
+	bool "MTD partitioning support"
+	help
+	 If you have a device which needs to divide its flash chip(s) up
+	 into multiple 'partitions', each of which appears to the user as
+	 a separate MTD device, you require this option to be enabled. If
+	 unsure, say 'Y'.
+
+	 Note, however, that you don't need this option for the DiskOnChip
+	 devices. Partitioning on NFTL 'devices' is a different - that's the
+	 'normal' form of partitioning used on a block device.
 
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
+	depends on !TANGOX
 	---help---
 	  RedBoot is a ROM monitor and bootloader which deals with multiple
 	  'images' in flash devices by putting a table one of the erase
@@ -75,7 +88,7 @@ endif # MTD_REDBOOT_PARTS
 
 config MTD_CMDLINE_PARTS
 	bool "Command line partition table parsing"
-	depends on MTD = "y"
+	depends on MTD = "y" && !XENV_PARTITION
 	---help---
 	  Allow generic configuration of the MTD partition tables via the kernel
 	  command line. Multiple flash resources are supported for hardware where
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d02592e6a0f0..eb70d2eca02d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -345,6 +345,16 @@ static struct cfi_fixup cfi_nopri_fixup_table[] = {
 	{ 0, 0, NULL }
 };
 
+static void fixup_M29W128G_write_buffer(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	if (cfi->cfiq->BufWriteTimeoutTyp) {
+		pr_warning("Don't use write buffer on ST flash M29W128G\n");
+		cfi->cfiq->BufWriteTimeoutTyp = 0;
+	}
+}
+
 static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri },
 #ifdef AMD_BOOTLOC_BUG
@@ -362,6 +372,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
+	{ CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer },
 	{ CFI_MFR_SST, 0x536a, fixup_sst38vf640x_sectorsize }, /* SST38VF6402 */
 	{ CFI_MFR_SST, 0x536b, fixup_sst38vf640x_sectorsize }, /* SST38VF6401 */
 	{ CFI_MFR_SST, 0x536c, fixup_sst38vf640x_sectorsize }, /* SST38VF6404 */
@@ -616,6 +627,22 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
  * correctly and is therefore not done	(particularly with interleaved chips
  * as each chip must be checked independently of the others).
  */
+#ifdef CONFIG_TANGOX
+/* For TANGOX, verify content in start address as well */
+static int __xipram chip_ready(struct map_info *map, unsigned long addr, unsigned long start, map_word z_val)
+{
+	map_word d, t, z;
+
+	d = map_read(map, addr);
+	mb();
+	t = map_read(map, addr);
+	mb();
+	z = map_read(map, start);
+	mb();
+
+	return map_word_equal(map, d, t) && map_word_equal(map, z, z_val);
+}
+#else
 static int __xipram chip_ready(struct map_info *map, unsigned long addr)
 {
 	map_word d, t;
@@ -625,6 +652,7 @@ static int __xipram chip_ready(struct map_info *map, unsigned long addr)
 
 	return map_word_equal(map, d, t);
 }
+#endif
 
 /*
  * Return true if the chip is ready and has the correct value.
@@ -658,6 +686,9 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo;
 	struct cfi_pri_amdstd *cfip = (struct cfi_pri_amdstd *)cfi->cmdset_priv;
+#ifdef CONFIG_TANGOX
+	map_word z_val = map_read(map, chip->start);
+#endif
 
  resettime:
 	timeo = jiffies + HZ;
@@ -666,8 +697,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 
 	case FL_STATUS:
 		for (;;) {
+#ifdef CONFIG_TANGOX
+			if (chip_ready(map, adr, chip->start, z_val))
+				break;
+#else
 			if (chip_ready(map, adr))
 				break;
+#endif
 
 			if (time_after(jiffies, timeo)) {
 				printk(KERN_ERR "Waiting for chip to be ready timed out.\n");
@@ -691,6 +727,12 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		    (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))))
 			goto sleep;
 
+		/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+		 * Sentivision FIX: map_write here whole flash operation freeze on VIP1216 STB.
+		 *   So we just will sleep waitting for state change: */
+		goto sleep;
+		/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
+
 		/* We could check to see if we're trying to access the sector
 		 * that is currently being erased. However, no user will try
 		 * anything like that so we just wait for the timeout. */
@@ -703,8 +745,13 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
 		for (;;) {
+#ifdef CONFIG_TANGOX
+			if (chip_ready(map, adr, chip->start, z_val))
+				break;
+#else
 			if (chip_ready(map, adr))
 				break;
+#endif
 
 			if (time_after(jiffies, timeo)) {
 				/* Should have suspended the erase by now.
@@ -1143,6 +1190,9 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
+#ifdef CONFIG_TANGOX
+	map_word z_val;
+#endif
 
 	adr += chip->start;
 
@@ -1162,6 +1212,9 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 * data at other locations when 0xff is written to a location that
 	 * already contains 0xff.
 	 */
+#ifdef CONFIG_TANGOX
+	z_val = ((adr == chip->start) ? datum : map_read(map, chip->start));
+#endif
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n",
@@ -1200,15 +1253,25 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+#ifdef CONFIG_TANGOX
+		if (time_after(jiffies, timeo) && !chip_ready(map, adr, chip->start, z_val))
+#else
+		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
+#endif
+		{
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
 			break;
 		}
 
+#ifdef CONFIG_TANGOX
+		if (chip_ready(map, adr, chip->start, z_val))
+			break;
+#else
 		if (chip_ready(map, adr))
 			break;
+#endif
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
@@ -1374,6 +1437,9 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	unsigned long cmd_adr;
 	int z, words;
 	map_word datum;
+#ifdef CONFIG_TANGOX
+	map_word z_val;
+#endif
 
 	adr += chip->start;
 	cmd_adr = adr;
@@ -1394,6 +1460,9 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, cmd_adr);
 
+#ifdef CONFIG_TANGOX
+	z_val = ((adr == chip->start) ? datum : map_read(map, chip->start));
+#endif
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 
@@ -1443,10 +1512,20 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
+#ifdef CONFIG_TANGOX
+		if (time_after(jiffies, timeo) && !chip_ready(map, adr, chip->start, z_val))
+			break;
+#else
 		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
 			break;
+#endif
 
-		if (chip_ready(map, adr)) {
+#ifdef CONFIG_TANGOX
+		if (chip_ready(map, adr, chip->start, z_val)) 
+#else
+		if (chip_ready(map, adr)) 
+#endif
+		{
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
@@ -1563,12 +1642,19 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 	struct cfi_private *cfi = map->fldrv_priv;
 	int retries = 10;
 	int i;
+#ifdef CONFIG_TANGOX
+	map_word z_val = map_read(map, chip->start);
+#endif
 
 	/*
 	 * If the driver thinks the chip is idle, and no toggle bits
 	 * are changing, then the chip is actually idle for sure.
 	 */
+#ifdef CONFIG_TANGOX
+	if (chip->state == FL_READY && chip_ready(map, adr, chip->start, z_val))
+#else
 	if (chip->state == FL_READY && chip_ready(map, adr))
+#endif
 		return 0;
 
 	/*
@@ -1585,7 +1671,11 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 
 		/* wait for the chip to become ready */
 		for (i = 0; i < jiffies_to_usecs(timeo); i++) {
+#ifdef CONFIG_TANGOX
+			if (chip_ready(map, adr, chip->start, z_val))
+#else
 			if (chip_ready(map, adr))
+#endif
 				return 0;
 
 			udelay(1);
@@ -1616,6 +1706,9 @@ static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
 	map_word oldd;
 	int ret = 0;
 	int i;
+#ifdef CONFIG_TANGOX
+	map_word z_val = map_read(map, chip->start);
+#endif
 
 	adr += chip->start;
 
@@ -1647,7 +1740,11 @@ retry:
 	map_write(map, datum, adr);
 
 	for (i = 0; i < jiffies_to_usecs(uWriteTimeout); i++) {
+#ifdef CONFIG_TANGOX
+		if (chip_ready(map, adr, chip->start, z_val))
+#else
 		if (chip_ready(map, adr))
+#endif
 			break;
 
 		udelay(1);
@@ -1793,6 +1890,10 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+#ifdef CONFIG_TANGOX
+	map_word z_val;
+	z_val.x[0] = ((map->bankwidth == 1) ? 0xff : 0xffff);
+#endif
 
 	adr = cfi->addr_unlock1;
 
@@ -1845,8 +1946,13 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 			chip->erase_suspended = 0;
 		}
 
+#ifdef CONFIG_TANGOX
+		if (chip_ready(map, adr, chip->start, z_val))
+			break;
+#else
 		if (chip_ready(map, adr))
 			break;
+#endif
 
 		if (time_after(jiffies, timeo)) {
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
@@ -1882,6 +1988,9 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	unsigned long timeo = jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+#ifdef CONFIG_TANGOX
+	map_word z_val;
+#endif
 
 	adr += chip->start;
 
@@ -1895,6 +2004,13 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
 	       __func__, adr );
 
+#ifdef CONFIG_TANGOX
+	if (adr == chip->start)
+		z_val.x[0] = ((map->bankwidth == 1) ? 0xff : 0xffff);
+	else
+		z_val = map_read(map, chip->start);
+#endif
+
 	XIP_INVAL_CACHED_RANGE(map, adr, len);
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
@@ -1928,13 +2044,18 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 		if (chip->erase_suspended) {
-			/* This erase was suspended and resumed.
+		/* This erase was suspended and resumed.
 			   Adjust the timeout */
 			timeo = jiffies + (HZ*20); /* FIXME */
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr)) {
+#ifdef CONFIG_TANGOX
+		if (chip_ready(map, adr, chip->start, z_val))
+#else
+		if (chip_ready(map, adr)) 
+#endif
+		{
 			xip_enable(map, chip, adr);
 			break;
 		}
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1924d247c1cb..077105f0996d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -56,6 +56,9 @@
 /* Used for Macronix flashes only. */
 #define	OPCODE_EN4B		0xb7	/* Enter 4-byte mode */
 #define	OPCODE_EX4B		0xe9	/* Exit 4-byte mode */
+#if defined(CONFIG_SPI_TANGOX) || defined (CONFIG_SPI_TANGOX_MODULE)
+#define OPCODE_RDP      0xab    /* Release from deep power down */
+#endif
 
 /* Used for Spansion flashes only. */
 #define	OPCODE_BRWR		0x17	/* Bank register write */
@@ -388,6 +391,80 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	return 0;
 }
 
+ /*
+ * Read an address range from the flash chip page by page.
+ * Some controller has transaction length limitation such as the
+ * Freescale's eSPI controller can only trasmit 0xFFFF bytes one
+ * time, so we have to read page by page if the len is more than
+ * the limitation.
+ */
+static int m25p80_page_read(struct mtd_info *mtd, loff_t from, size_t len,
+	size_t *retlen, u_char *buf)
+{
+	struct m25p *flash = mtd_to_m25p(mtd);
+	struct spi_transfer t[2];
+	struct spi_message m;
+	u32 i, page_size = 0;
+
+    pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
+			__func__, (u32)from, len);
+
+	/* sanity checks */
+	if (!len)
+		return 0;
+
+	if (from + len > flash->mtd.size)
+		return -EINVAL;
+
+	spi_message_init(&m);
+	memset(t, 0, (sizeof t));
+
+	/* NOTE:
+	 * OPCODE_FAST_READ (if available) is faster.
+	 * Should add 1 byte DUMMY_BYTE.
+	 */
+	t[0].tx_buf = flash->command;
+	t[0].len = m25p_cmdsz(flash) + FAST_READ_DUMMY_BYTE;
+	spi_message_add_tail(&t[0], &m);
+
+	t[1].rx_buf = buf;
+	spi_message_add_tail(&t[1], &m);
+
+	/* Byte count starts at zero. */
+	if (retlen)
+		*retlen = 0;
+
+	mutex_lock(&flash->lock);
+
+	/* Wait till previous write/erase is done. */
+	if (wait_till_ready(flash)) {
+		/* REVISIT status return?? */
+		mutex_unlock(&flash->lock);
+		return 1;
+	}
+
+	/* Set up the write data buffer. */
+	flash->command[0] = OPCODE_READ;
+
+	for (i = page_size; i < len; i += page_size) {
+		page_size = len - i;
+		if (page_size > flash->page_size)
+			page_size = flash->page_size;
+		m25p_addr2cmd(flash, from + i, flash->command);
+		t[1].len = page_size;
+		t[1].rx_buf = buf + i;
+
+		spi_sync(flash->spi, &m);
+
+		*retlen += m.actual_length - m25p_cmdsz(flash)
+			- FAST_READ_DUMMY_BYTE;
+	}
+
+	mutex_unlock(&flash->lock);
+
+	return 0;
+}
+
 /*
  * Write an address range to the flash chip.  Data must be written in
  * FLASH_PAGESIZE chunks.  The address range may be any size provided
@@ -820,6 +897,22 @@ static int __devinit m25p_probe(struct spi_device *spi)
 			dev_warn(&spi->dev, "unrecognized id %s\n", data->type);
 	}
 
+#if defined(CONFIG_SPI_TANGOX) || defined (CONFIG_SPI_TANGOX_MODULE)
+    /*
+     * - we need to send wake up command before probing id. this is because
+     * the macronix device will not return correct id in sleep mode.
+     *
+     * - the wake up command is only for macronix device and we check it with
+     * the id string from platform device info.
+     */
+    if ( !strncmp(id->name, "mx", 2) ) {
+        /* wake up device for the case flash in deep power down mode */
+        u8	code = OPCODE_RDP;
+        u8	dummy;
+        spi_write_then_read(spi, &code, 1, &dummy, 1);
+     }
+#endif
+
 	info = (void *)id->driver_data;
 
 	if (info->jedec_id) {
@@ -880,6 +973,12 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash->mtd._erase = m25p80_erase;
 	flash->mtd._read = m25p80_read;
 
+#if defined(CONFIG_SPI_TANGOX) || defined (CONFIG_SPI_TANGOX_MODULE)
+    /* overwrite read for page size read */
+    if (spi->master->quirks & SPI_QUIRK_TRANS_LEN_LIMIT)
+		flash->mtd._read = m25p80_page_read;
+#endif
+
 	/* sst flash chips use AAI word program */
 	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_SST)
 		flash->mtd._write = sst_write;
@@ -934,7 +1033,6 @@ static int __devinit m25p_probe(struct spi_device *spi)
 				flash->mtd.eraseregions[i].erasesize / 1024,
 				flash->mtd.eraseregions[i].numblocks);
 
-
 	/* partitions should match sector boundaries; and it may be good to
 	 * use readonly partitions for writeprotected sectors (BP2..BP0).
 	 */
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 8af67cfd671a..7354f465b430 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -4,6 +4,7 @@ menu "Mapping drivers for chip access"
 
 config MTD_COMPLEX_MAPPINGS
 	bool "Support non-linear mappings of flash chips"
+	depends on MTD && !TANGOX_XENV_READ
 	help
 	  This causes the chip drivers to allow for complicated
 	  paged mappings of flash chips.
@@ -24,7 +25,7 @@ config MTD_PHYSMAP
 
 config MTD_PHYSMAP_COMPAT
 	bool "Physmap compat support"
-	depends on MTD_PHYSMAP
+	depends on MTD_PHYSMAP && !TANGOX_XENV_READ
 	default n
 	help
 	  Setup a simple mapping via the Kconfig options.  Normally the
@@ -35,7 +36,7 @@ config MTD_PHYSMAP_COMPAT
 
 config MTD_PHYSMAP_START
 	hex "Physical start address of flash mapping"
-	depends on MTD_PHYSMAP_COMPAT
+	depends on MTD_PHYSMAP_COMPAT && !TANGOX_XENV_READ
 	default "0x8000000"
 	help
 	  This is the physical memory location at which the flash chips
@@ -45,8 +46,8 @@ config MTD_PHYSMAP_START
 
 config MTD_PHYSMAP_LEN
 	hex "Physical length of flash mapping"
-	depends on MTD_PHYSMAP_COMPAT
-	default "0"
+	depends on MTD_PHYSMAP_COMPAT && !TANGOX_XENV_READ
+	default "0x4000000"
 	help
 	  This is the total length of the mapping of the flash chips on
 	  your particular board. If there is space, or aliases, in the
@@ -57,7 +58,7 @@ config MTD_PHYSMAP_LEN
 
 config MTD_PHYSMAP_BANKWIDTH
 	int "Bank width in octets"
-	depends on MTD_PHYSMAP_COMPAT
+	depends on MTD_PHYSMAP_COMPAT && !TANGOX_XENV_READ
 	default "2"
 	help
 	  This is the total width of the data bus of the flash devices
diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 21b0b713cacb..3b682502988d 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -21,6 +21,53 @@
 #include <linux/mtd/concat.h>
 #include <linux/io.h>
 
+#if defined(CONFIG_TANGOX) && defined(CONFIG_TANGOX_XENV_READ)
+
+#ifdef CONFIG_TANGO2
+#include <asm/tango2/emhwlib_registers_tango2.h>
+#include <asm/tango2/tango2_gbus.h>
+#elif defined(CONFIG_TANGO3)
+#include <asm/tango3/emhwlib_registers_tango3.h>
+#include <asm/tango3/tango3_gbus.h>
+#endif
+
+#define XENV_MAX_FLASH    4
+#define XENV_MAX_FLASH_PARTITIONS   16
+static struct mtd_info *mymtds[XENV_MAX_FLASH] = { NULL, NULL, NULL, NULL };
+static struct mtd_partition *mtd_parts[XENV_MAX_FLASH] = { NULL, NULL, NULL, NULL };
+static unsigned int p_cnts[XENV_MAX_FLASH] = { 0, 0, 0, 0 };
+static u64 f_sizes[XENV_MAX_FLASH] = { 0, 0, 0, 0 };
+
+struct map_info physmap_maps[XENV_MAX_FLASH] = {
+        {
+                .name = "CS0: Physically mapped flash",
+                .phys = 0x40000000,
+                .size = 0, /* To be filled by XENV */
+                .bankwidth = 2, /* To be checked by PBI registers */
+        },
+        {
+                .name = "CS1: Physically mapped flash",
+                .phys = 0x44000000,
+                .size = 0, /* To be filled by XENV */
+                .bankwidth = 2, /* To be checked by PBI registers */
+        },
+        {
+                .name = "CS2: Physically mapped flash",
+                .phys = 0x48000000,
+                .size = 0, /* To be filled by XENV */
+                .bankwidth = 2, /* To be checked by PBI registers */
+        },
+        {
+                .name = "CS3: Physically mapped flash",
+                .phys = 0x4c000000,
+                .size = 0, /* To be filled by XENV */
+                .bankwidth = 2, /* To be checked by PBI registers */
+        },
+};
+int tangox_flash_get_info(int cs, u64 *size, unsigned int *part_count);
+int tangox_flash_get_parts(int cs, u64 offset[], u64 size[]);
+#endif
+
 #define MAX_RESOURCES		4
 
 struct physmap_flash_info {
@@ -33,6 +80,29 @@ struct physmap_flash_info {
 
 static int physmap_flash_remove(struct platform_device *dev)
 {
+#if defined(CONFIG_TANGOX) && defined(CONFIG_TANGOX_XENV_READ)
+        int cs, p;
+        struct mtd_partition *part_ptr;
+
+        for (cs = 0; cs < XENV_MAX_FLASH; cs++) {
+                if (f_sizes[cs] != 0) {
+                        if (p_cnts[cs] != 0) {
+                                for (part_ptr = mtd_parts[cs], p = 0; p < p_cnts[cs]; p++, part_ptr++) {
+                                        if (part_ptr->name) {
+                                                kfree(part_ptr->name);
+                                                part_ptr->name = NULL;
+                                        }
+                                }
+                        }
+			mtd_device_unregister(mymtds[cs]);
+                        map_destroy(mymtds[cs]);
+                        kfree(mtd_parts[cs]);
+                        mtd_parts[cs] = NULL;
+                        iounmap(physmap_maps[cs].virt);
+                        physmap_maps[cs].virt = NULL;
+                }
+        }
+#else
 	struct physmap_flash_info *info;
 	struct physmap_flash_data *physmap_data;
 	int i;
@@ -57,7 +127,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 
 	if (physmap_data->exit)
 		physmap_data->exit(dev);
-
+#endif
 	return 0;
 }
 
@@ -93,14 +163,128 @@ static const char *rom_probe_types[] = {
 					"qinfo_probe",
 					"map_rom",
 					NULL };
+
+#ifndef CONFIG_TANGOX
 static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", "afs",
 					  NULL };
+#endif
 
 static int physmap_flash_probe(struct platform_device *dev)
 {
+	const char **probe_type;
+
+#if defined(CONFIG_TANGOX) && defined(CONFIG_TANGOX_XENV_READ)
+        int cs;
+        int part_num = 0;
+        unsigned long csconfig = gbus_read_reg32(REG_BASE_host_interface + PB_CS_config) & 0xf;
+
+        for (cs = 0; cs < XENV_MAX_FLASH; cs++) {
+
+                /* Check XENV for availability */
+                f_sizes[cs] = p_cnts[cs] = 0;
+
+                tangox_flash_get_info(cs, &f_sizes[cs], &p_cnts[cs]);
+                if (f_sizes[cs] == 0)
+                        continue;
+                else {
+                        physmap_maps[cs].size = f_sizes[cs];
+                        physmap_maps[cs].bankwidth = ((csconfig >> cs) & 0x1) ? 1 : 2;
+                }
+
+                printk(KERN_NOTICE "physmap flash device CS%d: 0x%x at 0x%x\n",
+                                cs, (u32)physmap_maps[cs].size, (u32)physmap_maps[cs].phys);
+                physmap_maps[cs].virt = ioremap(physmap_maps[cs].phys, physmap_maps[cs].size);
+
+                if (!physmap_maps[cs].virt) {
+                        printk("Failed to ioremap\n");
+                        continue;
+                }
+
+                simple_map_init(&physmap_maps[cs]);
+
+                mymtds[cs] = NULL;
+                probe_type = rom_probe_types;
+                for(; !mymtds[cs] && *probe_type; probe_type++) {
+                        mymtds[cs] = do_map_probe(*probe_type, &physmap_maps[cs]);
+                }
+
+                if (mymtds[cs] && (mymtds[cs]->size != f_sizes[cs])) {
+                        /* Redo ioremap if size specified is not the same as detected */
+                        iounmap((void *)physmap_maps[cs].virt);
+                        physmap_maps[cs].size = mymtds[cs]->size;
+                        physmap_maps[cs].virt = ioremap(physmap_maps[cs].phys, physmap_maps[cs].size);
+			physmap_maps[cs].set_vpp = physmap_set_vpp;
+
+                        if (!physmap_maps[cs].virt) {
+                                printk(KERN_NOTICE "Failed to ioremap at 0x%08x, size 0x%08x\n",
+                                                (u32)physmap_maps[cs].phys, (u32)physmap_maps[cs].size);
+                                continue;
+                        }
+                        printk(KERN_NOTICE "CS%d: flash size mismatched, re-do probing/initialization.\n", cs);
+                        printk(KERN_NOTICE "physmap flash device CS%d: 0x%x at 0x%x (remapped 0x%x)\n",
+                                        cs, (u32)physmap_maps[cs].size, (u32)physmap_maps[cs].phys, (u32)physmap_maps[cs].virt);
+
+                        /* Re-do initialization */
+                        simple_map_init(&physmap_maps[cs]);
+                        mymtds[cs] = NULL;
+                        probe_type = rom_probe_types;
+                        for(; !mymtds[cs] && *probe_type; probe_type++) {
+                                mymtds[cs] = do_map_probe(*probe_type, &physmap_maps[cs]);
+                        }
+                }
+
+                if (mymtds[cs]) {
+                        mymtds[cs]->owner = THIS_MODULE;
+			mtd_device_register(mymtds[cs], NULL, 0);
+                        part_num++;
+
+                        if (p_cnts[cs] > 0) {
+                                int p, pcnt;
+                                struct mtd_partition *part_ptr;
+                                u64 offsets[XENV_MAX_FLASH_PARTITIONS];
+                                u64 szs[XENV_MAX_FLASH_PARTITIONS];
+
+                                if ((mtd_parts[cs] = (struct mtd_partition *)kmalloc(
+                                                sizeof(struct mtd_partition) * p_cnts[cs], GFP_KERNEL)) == NULL) {
+                                        printk(KERN_NOTICE "Out of memory.\n");
+                                        return -ENOMEM;
+                                }
+                                memset(mtd_parts[cs], 0, sizeof(struct mtd_partition) * p_cnts[cs]);
+                                tangox_flash_get_parts(cs, offsets, szs);
+
+                                printk(KERN_NOTICE "Using physmap partition definition\n");
+
+                                /* Initialize each partition */
+                                for (pcnt = 0, part_ptr = mtd_parts[cs], p = 0; p < p_cnts[cs]; p++) {
+                                        if (((szs[p] & 0x7fffffff) + offsets[p]) > physmap_maps[cs].size) {
+                                                printk(KERN_NOTICE "CS%d-Part%d (offset:0x%llx, size:0x%llx) outside physical map, removed.\n",
+                                                                cs, p + 1, offsets[p], szs[p] & 0x7fffffffffffffffULL);
+                                                        continue;
+                                        }
+                                        part_ptr->size = szs[p] & 0x7fffffffffffffffULL;
+                                        part_ptr->offset = offsets[p];
+                                        if (part_ptr->size & 0x8000000000000000ULL)
+                                                part_ptr->mask_flags = MTD_WRITEABLE;
+                                        part_ptr->name = (char *)kmalloc(16, GFP_KERNEL);
+                                        if (part_ptr->name != NULL)
+                                                sprintf(part_ptr->name, "CS%d-Part%d", cs, p + 1);
+                                        pcnt++;
+                                        part_ptr++;
+                                }
+                                p_cnts[cs] = pcnt;
+
+                                if (p_cnts[cs] > 0) {
+                                        printk(KERN_NOTICE "Adding partition #%d-#%d\n", part_num, part_num + p_cnts[cs] - 1);
+                                        mtd_device_register(mymtds[cs], mtd_parts[cs], p_cnts[cs]);
+                                        part_num += p_cnts[cs];
+                                }
+                        }
+                }
+        }
+        return 0;
+#else
 	struct physmap_flash_data *physmap_data;
 	struct physmap_flash_info *info;
-	const char **probe_type;
 	const char **part_types;
 	int err = 0;
 	int i;
@@ -199,6 +383,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 err_out:
 	physmap_flash_remove(dev);
 	return err;
+#endif /* CONFIG_TANGOX && CONFIG_TANGOX_XENV_READ */
 }
 
 #ifdef CONFIG_PM
@@ -218,7 +403,9 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 static struct platform_driver physmap_flash_driver = {
 	.probe		= physmap_flash_probe,
 	.remove		= physmap_flash_remove,
-	.shutdown	= physmap_flash_shutdown,
+#ifdef CONFIG_PM
+ 	.shutdown	= physmap_flash_shutdown,
+#endif
 	.driver		= {
 		.name	= "physmap-flash",
 		.owner	= THIS_MODULE,
@@ -261,11 +448,20 @@ static int __init physmap_init(void)
 	}
 #endif
 
+#ifdef CONFIG_TANGOX
+	/* a hack to force probing here */
+	err = physmap_flash_probe(NULL);
+#endif
+
 	return err;
 }
 
 static void __exit physmap_exit(void)
 {
+#ifdef CONFIG_TANGOX
+	physmap_flash_remove(NULL);
+#endif
+
 #ifdef CONFIG_MTD_PHYSMAP_COMPAT
 	platform_device_unregister(&physmap_flash);
 #endif
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index f2f482bec573..8219c1ce0f6b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -620,6 +620,8 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 	return ret;
 }
 
+#define MEMERASEFORCE  _IOW('M', 20, struct erase_info_user)
+
 static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_file_info *mfi = file->private_data;
@@ -751,6 +753,58 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		break;
 	}
 
+	case MEMERASEFORCE:
+	{
+		struct erase_info *erase;
+
+		if(!(file->f_mode & 2))
+			return -EPERM;
+
+		erase=kzalloc(sizeof(struct erase_info),GFP_KERNEL);
+		if (!erase)
+			ret = -ENOMEM;
+		else {
+			wait_queue_head_t waitq;
+			DECLARE_WAITQUEUE(wait, current);
+
+			init_waitqueue_head(&waitq);
+
+			if (copy_from_user(&erase->addr, argp,
+				    sizeof(struct erase_info_user))) {
+				kfree(erase);
+				return -EFAULT;
+			}
+			erase->mtd = mtd;
+			erase->callback = mtdchar_erase_callback;
+			erase->priv = (unsigned long)&waitq;
+			erase->retries = 0x73092215;
+
+			/*
+			  FIXME: Allow INTERRUPTIBLE. Which means
+			  not having the wait_queue head on the stack.
+
+			  If the wq_head is on the stack, and we
+			  leave because we got interrupted, then the
+			  wq_head is no longer there when the
+			  callback routine tries to wake us up.
+			*/
+			ret = mtd_erase(mtd, erase);
+			if (!ret) {
+				set_current_state(TASK_UNINTERRUPTIBLE);
+				add_wait_queue(&waitq, &wait);
+				if (erase->state != MTD_ERASE_DONE &&
+				    erase->state != MTD_ERASE_FAILED)
+					schedule();
+				remove_wait_queue(&waitq, &wait);
+				set_current_state(TASK_RUNNING);
+
+				ret = (erase->state == MTD_ERASE_FAILED)?-EIO:0;
+			}
+			kfree(erase);
+		}
+		break;
+	}
+
 	case MEMWRITEOOB:
 	{
 		struct mtd_oob_buf buf;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c837507dfb1c..3a3d5062456e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -3,7 +3,7 @@
  * drivers and users.
  *
  * Copyright © 1999-2010 David Woodhouse <dwmw2@infradead.org>
- * Copyright © 2006      Red Hat UK Limited 
+ * Copyright © 2006      Red Hat UK Limited
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -80,6 +80,10 @@ static struct class mtd_class = {
 	.resume = mtd_cls_resume,
 };
 
+#if defined(CONFIG_ARCH_VENDOR_SX6) && defined(CONFIG_MTD_UBI) && !defined(CONFIG_BLK_DEV_INITRD)
+extern char saved_root_name[64];
+#endif
+
 static DEFINE_IDR(mtd_idr);
 
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
@@ -250,6 +254,49 @@ static ssize_t mtd_name_show(struct device *dev,
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
+static ssize_t mtd_nand_type_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->nand_type);
+}
+static DEVICE_ATTR(nand_type, S_IRUGO, mtd_nand_type_show, NULL);
+
+static ssize_t mtd_nand_manufacturer_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->nand_manufacturer);
+}
+static DEVICE_ATTR(nand_manufacturer, S_IRUGO, mtd_nand_manufacturer_show, NULL);
+
+static ssize_t mtd_nand_onfi_version_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->onfi_version);
+}
+static DEVICE_ATTR(onfi_version, S_IRUGO, mtd_nand_onfi_version_show, NULL);
+
+static ssize_t mtd_nand_id_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n", mtd->id_data[0]
+																			   , mtd->id_data[1]
+																			   , mtd->id_data[2]
+																			   , mtd->id_data[3]
+																			   , mtd->id_data[4]
+																			   , mtd->id_data[5]
+																			   , mtd->id_data[6]
+																			   , mtd->id_data[7]);
+}
+static DEVICE_ATTR(nand_id, S_IRUGO, mtd_nand_id_show, NULL);
+
 static struct attribute *mtd_attrs[] = {
 	&dev_attr_type.attr,
 	&dev_attr_flags.attr,
@@ -260,6 +307,10 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
+	&dev_attr_nand_type.attr,
+	&dev_attr_nand_manufacturer.attr,
+	&dev_attr_nand_id.attr,
+	&dev_attr_onfi_version.attr,
 	NULL,
 };
 
@@ -321,7 +372,15 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mtd->index = i;
 	mtd->usecount = 0;
-
+#if defined(CONFIG_ARCH_VENDOR_SX6) && defined(CONFIG_MTD_UBI) && !defined(CONFIG_BLK_DEV_INITRD)
+	if(0 == strncmp(mtd->name,"Rootfs",6))
+	{
+		char rootname[16];
+		sprintf(rootname,"/dev/mtdblock%d",i);
+		strlcpy(saved_root_name, rootname, sizeof(rootname));
+		printk("UBI root=%s\n",saved_root_name);
+	}
+#endif
 	if (is_power_of_2(mtd->erasesize))
 		mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
 	else
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index bf24aa77175d..148cfefa045d 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -345,6 +345,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 {
 	struct mtd_part *slave;
 	char *name;
+	int i;
 
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
@@ -366,6 +367,11 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.oobsize = master->oobsize;
 	slave->mtd.oobavail = master->oobavail;
 	slave->mtd.subpage_sft = master->subpage_sft;
+	slave->mtd.nand_type = master->nand_type;
+	slave->mtd.nand_manufacturer = master->nand_manufacturer;
+	slave->mtd.onfi_version = master->onfi_version;
+	for (i = 0; i < 8; i++)
+		slave->mtd.id_data[i] = master->id_data[i];
 
 	slave->mtd.name = name;
 	slave->mtd.owner = master->owner;
@@ -646,6 +652,9 @@ int add_mtd_partitions(struct mtd_info *master,
 
 	return 0;
 }
+#ifdef CONFIG_VENDOR_DTV
+EXPORT_SYMBOL(add_mtd_partitions);
+#endif
 
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 7d17cecad69d..241410eee873 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1,3 +1,10 @@
+config MTD_NAND_IDS
+	tristate "Include chip ids for known NAND devices."
+	depends on MTD
+	help
+	  Useful for NAND drivers that do not use the NAND subsystem but
+	  still like to take advantage of the known chip information.
+
 config MTD_NAND_ECC
 	tristate
 
@@ -83,6 +90,14 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
           scratch register here to enable this feature. On Intel Moorestown
           boards, the scratch register is at 0xFF108018.
 
+config MTD_NAND_TANGOX
+        tristate "TANGOX NAND Device Support"
+        depends on TANGO3 || TANGO4
+        select MTD_PARTITIONS
+        default m
+        help
+          Support TANGOX NAND Flash in the NAND flash reserved zone.
+
 config MTD_NAND_H1900
 	tristate "iPAQ H1900 flash"
 	depends on ARCH_PXA && BROKEN
@@ -115,9 +130,6 @@ config MTD_NAND_OMAP2
           Support for NAND flash on Texas Instruments OMAP2, OMAP3 and OMAP4
 	  platforms.
 
-config MTD_NAND_IDS
-	tristate
-
 config MTD_NAND_RICOH
 	tristate "Ricoh xD card reader"
 	default n
@@ -566,5 +578,33 @@ config MTD_NAND_FSMC
 	help
 	  Enables support for NAND Flash chips on the ST Microelectronics
 	  Flexible Static Memory Controller (FSMC)
+choice
+	prompt "NAND ECC mode"
+	depends on MTD_NAND && ARCH_VENDOR_SX6
+	default MTD_NAND_MLC_BCH if (VENDOR_DTV_ROM_SLC || VENDOR_DTV_ROM_MLC)
+config MTD_NAND_ECC_HW
+	bool "Hardware ECC"
+config MTD_NAND_ECC_SW
+	bool "Soft ECC"
+config MTD_NAND_MLC_BCH
+	bool "MLC BCH "
+config MTD_NAND_ECC_NONE
+	bool "None ECC"
+endchoice
+
+choice
+	prompt "NAND ECC calc size"
+	depends on MTD_NAND && ARCH_VENDOR_SX6
+	default MTD_NAND_ECC_512 if VENDOR_DTV_ROM_SLC
+	default MTD_NAND_ECC_1024 if VENDOR_DTV_ROM_MLC
+config MTD_NAND_ECC_512
+	bool "512 bytes"
+config MTD_NAND_ECC_1024
+	bool "1024 bytes"
+endchoice
 
+config MTD_NAND_DMA
+	bool "DMA enable"
+	depends on MTD_NAND_PHYSMAP
+default y
 endif # MTD_NAND
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index d4b4d8739bd8..696b8ddfd8f4 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -7,12 +7,15 @@ obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
 obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
-
+ifdef CONFIG_MTD_NAND
+obj-$(CONFIG_ARCH_VENDOR_SX6)		+= monza_nand.o
+endif
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
 obj-$(CONFIG_MTD_NAND_SPIA)		+= spia.o
 obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
 obj-$(CONFIG_MTD_NAND_AUTCPU12)		+= autcpu12.o
 obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
+obj-$(CONFIG_MTD_NAND_TANGOX)		+= smp8xxx_nand.o
 obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
 obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
 obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)	+= ppchameleonevb.o
@@ -53,3 +56,9 @@ obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
 obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
 
 nand-objs := nand_base.o nand_bbt.o
+
+ifeq ($(CONFIG_VENDOR_DTV),y)
+ifdef CONFIG_MTD_NAND_MLC_BCH
+nand-objs += nand_bch_ecc.o
+endif
+endif
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index eb9f5fb02eef..4f05253bdc26 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -47,7 +47,22 @@
 #include <linux/bitops.h>
 #include <linux/leds.h>
 #include <linux/io.h>
+#ifdef CONFIG_VENDOR_DTV
+#include <linux/semaphore.h>
+
+#include <asm/byteorder.h>
+#include <asm/io.h>
+#include <asm/irq.h>
+#include <asm/system.h>
+#include <asm/unaligned.h>
+#endif
+
+#ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
+#endif
+#ifdef CONFIG_MTD_NAND_MLC_BCH
+#define CONFIG_NAND_MODE 1
+#endif
 
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
@@ -64,8 +79,11 @@ static struct nand_ecclayout nand_oob_16 = {
 	.eccbytes = 6,
 	.eccpos = {0, 1, 2, 3, 6, 7},
 	.oobfree = {
-		{.offset = 8,
-		 . length = 8} }
+#ifdef CONFIG_MTD_NAND_BBM
+		{.offset = 9, . length = 7}}		//nand bbm config
+#else
+		{.offset = 8, . length = 8}}
+#endif
 };
 
 static struct nand_ecclayout nand_oob_64 = {
@@ -75,8 +93,112 @@ static struct nand_ecclayout nand_oob_64 = {
 		   48, 49, 50, 51, 52, 53, 54, 55,
 		   56, 57, 58, 59, 60, 61, 62, 63},
 	.oobfree = {
-		{.offset = 2,
-		 .length = 38} }
+#ifdef CONFIG_MTD_NAND_BBM
+		{.offset = 3,.length = 37}}     //nand bbm config
+#else
+		{.offset = 2,.length = 38}}
+#endif
+};
+
+/*For BCH code*/
+static struct nand_ecclayout nand_oob_mlcbch_16 = {
+	.eccbytes = 7,
+	.eccpos = {0, 1, 2, 3, 6, 7, 9},
+	.oobfree = {
+		{.offset = 10,
+		 .length = 6}}
+};
+
+#ifdef CONFIG_MTD_NAND_ECC_512
+//change for 8bit 512 byte ecc
+static struct nand_ecclayout nand_oob_mlcbch_64 = {
+	.eccbytes = 56,
+	.eccpos = {
+		8,9,10,11,12,13,14,15,16,17,18,19,20,21,
+		22,23,24,25,26,27,28,29,30,31,32,33,34,35,
+		36,37,38,39,40,41,42,43,44,45,46,47,48,49,
+		50,51,52,53,54,55,56,57,58,59,60,61,62,63 },
+	.oobfree = {
+		{.offset = 3,
+		 .length = 5}}
+};
+#else
+//change for 8bit 1024 byte ecc
+static struct nand_ecclayout nand_oob_mlcbch_64 = {
+	.eccbytes = 28,
+	.eccpos = {
+		36,37,38,39,40,41,42,43,44,45,46,47,48,49,
+		50,51,52,53,54,55,56,57,58,59,60,61,62,63 },
+	.oobfree = {
+		{.offset = 3,
+		 .length = 33}}
+};
+
+static struct nand_ecclayout nand_oob_mlcbch_448 = {
+	.eccbytes = 336,//24*7/4 *8,
+	.eccpos = {
+			112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122,
+			123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133,
+			134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144,
+			145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155,
+			156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166,
+			167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177,
+			178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
+			189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
+			200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210,
+			211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221,
+			222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232,
+			233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243,
+			244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254,
+			255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265,
+			266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276,
+			277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287,
+			288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298,
+			299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309,
+			310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320,
+			321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331,
+			332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342,
+			343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353,
+			354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364,
+			365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375,
+			376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386,
+			387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397,
+			398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408,
+			409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419,
+			420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430,
+			431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441,
+			442, 443, 444, 445, 446, 447 },
+	.oobfree = {
+		{.offset = 3,
+		 .length = 109}}
+};
+
+#endif
+
+/*2013.4.2 add for Micron MT29F16G08CBACA*/
+static struct nand_ecclayout nand_oob_mlcbch_224 = {
+		.eccbytes = 168,
+		.eccpos = {
+			 56,  57,  58,  59,  60,  61,  62,  63,  64,  65,  66,
+			 67,  68,  69,  70,  71,  72,  73,  74,  75,  76,  77,
+			 78,  79,  80,  81,  82,  83,  84,  85,  86,  87,  88,
+			 89,  90,  91,  92,  93,  94,  95,  96,  97,  98,  99,
+			100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110,
+			111,
+			112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122,
+			123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133,
+			134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144,
+			145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155,
+			156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166,
+			167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177,
+			178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
+			189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
+			200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210,
+			211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221,
+			222, 223},
+		.oobfree = {
+			{.offset = 3,
+			.length = 53}}
 };
 
 static struct nand_ecclayout nand_oob_128 = {
@@ -93,6 +215,86 @@ static struct nand_ecclayout nand_oob_128 = {
 		 .length = 78} }
 };
 
+#ifdef CONFIG_MIPS_TRIDENT_FUSION_ANDROID
+/*
+	read 1`b1 , access permission, 0`b1 permission denied. it should be write
+	1 after finish access, then others can access
+	warning: the SPI_lock will change when read the register each time,so don`t
+	use unnecessary ReadRegWord operation
+*/
+
+static int DMA_flag_reset = 1;
+#define SPIN_REG_ADDR	0xf5024068
+
+#define SPINID                          0x1
+static void NAND_spin_lock_hw(volatile void * reg)
+{
+	u32 value ;
+	do {
+		value = ReadRegWord(reg) ;
+	} while((value & SPINID) == 0 );	//get 0 permission denied
+
+	//now we get the SPI_lock, value should be 1`b1
+	//printk(KERN_INFO "[%s] reg = 0x%x\t value = 0x%x \n",__func__,reg,value);
+
+	return ;
+}
+
+//fail return 1, 0 success & get the SPIN lock
+u32 NAND_try_spinlock_hw(volatile void * reg)
+{
+	u32 val;
+	val = ReadRegWord(reg);
+	if((val&SPINID)==0x0)		//0 is permission denied
+	{
+		//printk(KERN_INFO "NAND: try to get hw SPIN lock fail \n");
+		return 1;
+	}
+	else
+	{
+		//printk(KERN_INFO "NAND: try to get hw SPIN lock success \n");
+		return 0;
+	}
+}
+
+void NAND_spin_lock_hw_dump(volatile void * reg)
+{
+	int try_time = 0;
+	int print_once = 1;
+	while( NAND_try_spinlock_hw(reg) )
+	{
+		schedule();
+
+		//debug
+		#if 0
+		try_time++;
+		if(unlikely(try_time > 20000))
+		{
+			if(print_once)
+			{
+				print_once = 0;
+				dump_stack();
+			}
+		}
+		#endif
+	}
+}
+
+void NAND_spin_unlock_hw(volatile void * reg)
+{
+	u32 val;
+	val = ReadRegWord(reg);
+	WriteRegWord(reg,(val |SPINID));
+
+	//printk(KERN_INFO "[%s] reg = 0x%x\t value = 0x%x \n",__func__,reg,val);
+}
+
+#endif
+
+#ifdef CONFIG_TRIDENT_FLASH_MULTI
+DECLARE_MUTEX(flash_multi_sem);
+#endif
+
 static int nand_get_device(struct nand_chip *chip, struct mtd_info *mtd,
 			   int new_state);
 
@@ -123,6 +325,14 @@ static int check_offs_len(struct mtd_info *mtd,
 		ret = -EINVAL;
 	}
 
+//#ifdef CONFIG_VENDOR_DTV
+	/* Do not allow past end of device */
+	if (ofs + len > mtd->size) {
+		pr_debug( "%s: Past end of device\n",__func__);
+		ret = -EINVAL;
+	}
+//#endif
+
 	return ret;
 }
 
@@ -145,6 +355,14 @@ static void nand_release_device(struct mtd_info *mtd)
 	chip->state = FL_READY;
 	wake_up(&chip->controller->wq);
 	spin_unlock(&chip->controller->lock);
+
+#ifdef CONFIG_TRIDENT_FLASH_MULTI
+	up(&flash_multi_sem);
+#endif
+
+#ifdef CONFIG_MIPS_TRIDENT_FUSION_ANDROID
+	NAND_spin_unlock_hw(SPIN_REG_ADDR);
+#endif
 }
 
 /**
@@ -156,7 +374,11 @@ static void nand_release_device(struct mtd_info *mtd)
 static uint8_t nand_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
+#ifdef CONFIG_VENDOR_DTV
+	return ReadRegByte(chip->IO_ADDR_R);
+#else
 	return readb(chip->IO_ADDR_R);
+#endif
 }
 
 /**
@@ -182,7 +404,11 @@ static uint8_t nand_read_byte16(struct mtd_info *mtd)
 static u16 nand_read_word(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
+#ifdef CONFIG_VENDOR_DTV
+	return ReadRegWord(chip->IO_ADDR_R);
+#else
 	return readw(chip->IO_ADDR_R);
+#endif
 }
 
 /**
@@ -322,6 +548,51 @@ static int nand_verify_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
 	return 0;
 }
 
+#ifdef CONFIG_VENDOR_DTV
+static void nand_write_buf32(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+//	int i;
+	struct nand_chip *chip = mtd->priv;
+	register volatile void* hwaddr = chip->IO_ADDR_W;
+	register u32 *p = (u32 *) buf;
+
+	len >>= 2;
+	if (len == 0)
+		return;
+	do {
+		WriteRegWord(hwaddr,*p++);
+	} while(--len);
+
+//	for (i = 0; i < len; i++)
+//		WriteRegWord(chip->IO_ADDR_W,p[i]);
+}
+
+static void nand_read_buf32(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *chip = mtd->priv;
+	u32 *p = (u32 *) buf;
+
+	len >>= 2;
+	for (i = 0; i < len; i++)
+		p[i] = ReadRegWord(chip->IO_ADDR_R);
+}
+
+static int nand_verify_buf32(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	int i;
+	struct nand_chip *chip = mtd->priv;
+	u32 *p = (u32 *) buf;
+
+	len >>= 2;
+	for (i = 0; i < len; i++)
+		if (p[i] != ReadRegWord(chip->IO_ADDR_R))
+			return -EFAULT;
+
+	return 0;
+}
+#endif
+
 /**
  * nand_block_bad - [DEFAULT] Read bad block marker from the chip
  * @mtd: MTD device structure
@@ -646,7 +917,13 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	 * Apply this short delay always to ensure that we do wait tWB in
 	 * any case on any machine.
 	 */
+#ifdef CONFIG_TANGOX
+	udelay(1); /* needs to make it much longer than tWB */
+#elif defined(CONFIG_VENDOR_DTV)
+	//ndelay(100);
+#else
 	ndelay(100);
+#endif
 
 	nand_wait_ready(mtd);
 }
@@ -768,7 +1045,13 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	 * Apply this short delay always to ensure that we do wait tWB in
 	 * any case on any machine.
 	 */
+#ifdef CONFIG_TANGOX
+	udelay(1); /* needs to make it much longer than tWB */
+#elif defined(CONFIG_VENDOR_DTV)
+	//ndelay(100);
+#else
 	ndelay(100);
+#endif
 
 	nand_wait_ready(mtd);
 }
@@ -800,9 +1083,59 @@ static void panic_nand_get_device(struct nand_chip *chip,
 static int
 nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
 {
+#ifdef CONFIG_MIPS_TRIDENT_FUSION_ANDROID
+	/*for share NAND control between PLF and APP, we use HW SPIN_LOCK to
+	    protect */
+	NAND_spin_lock_hw_dump(SPIN_REG_ADDR);
+#endif
+
 	spinlock_t *lock = &chip->controller->lock;
 	wait_queue_head_t *wq = &chip->controller->wq;
 	DECLARE_WAITQUEUE(wait, current);
+
+#ifdef CONFIG_TRIDENT_FLASH_MULTI
+	unsigned int val;
+	if(new_state != FL_PM_SUSPENDED){
+		down(&flash_multi_sem);
+	}
+
+	/*switch to nand*/
+	val = ReadRegWord((void*)0xfB002008);
+	if(val != 0x2)
+	{
+		WriteRegWord((void*)0xfb002008,0x2);
+		ReadRegWord((void*)0xfb002008);
+	}
+
+ #ifdef CONFIG_NAND_MODE
+	/* switch the nand source clock from 100Hz to 200Hz for this version of NAND mode setting
+	 if the souce clock is not match the NAND mode, will cause the DMA read time out error */
+	unsigned char nand_clock = ReadRegByte((void*)0xf500e849);
+	nand_clock &= 0xcf;
+	nand_clock |= 0x20;
+	WriteRegByte((void*)0xf500e849,nand_clock);
+
+	/* switch the nand source clock 200Hz clock for write,
+	if the clock is not match the NAND init setting such like 1b002004 = 0x21, will cause WP*/
+	WriteRegWord((void*)0xfb002004, 0x00000067);
+
+	unsigned int write_clock = ReadRegWord((void*)0xfb002070);
+	write_clock |= 0x100;
+	WriteRegWord((void*)0xfb002070,write_clock);
+
+	write_clock = ReadRegWord((void*)0xfb002020);
+	write_clock &= 0xffff3f3f;
+	WriteRegWord((void*)0xfb002020,write_clock);
+
+	/*we set 205c only here,it changed in UXL*/
+  #ifdef CONFIG_MIPS_TRIDENT_UXL
+	WriteRegWord((void*)0xfb00205c, 0x40193333);
+  #else
+	WriteRegWord((void*)0xfb00205c, 0x40193333);
+  #endif
+ #endif
+#endif
+
 retry:
 	spin_lock(lock);
 
@@ -874,7 +1207,11 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	if (state == FL_ERASING)
 		timeo += (HZ * 400) / 1000;
 	else
+#ifdef CONFIG_VENDOR_DTV
+		timeo += (HZ * 100) / 1000;
+#else
 		timeo += (HZ * 20) / 1000;
+#endif
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
@@ -882,7 +1219,11 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	 * Apply this short delay always to ensure that we do wait tWB in any
 	 * case on any machine.
 	 */
+#ifdef CONFIG_TANGOX
+	udelay(1); /* needs to make it much longer than tWB */
+#else
 	ndelay(100);
+#endif
 
 	if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
 		chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
@@ -903,6 +1244,10 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 			cond_resched();
 		}
 	}
+#ifdef CONFIG_VENDOR_DTV
+	if(!time_before(jiffies, timeo)&& state == FL_ERASING)
+		printk("%s eraseing? %d not ready\n",__func__,state == FL_ERASING);
+#endif
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
 	status = (int)chip->read_byte(mtd);
@@ -939,6 +1284,11 @@ static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
 
 	/* Call wait ready function */
 	status = chip->waitfunc(mtd, chip);
+
+#ifdef CONFIG_VENDOR_DTV
+	udelay(1000);
+#endif
+
 	/* See if device thinks it succeeded */
 	if (status & 0x01) {
 		pr_debug("%s: error status = 0x%08x\n",
@@ -991,6 +1341,10 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	ret = __nand_unlock(mtd, ofs, len, 0);
 
 out:
+#ifdef CONFIG_VENDOR_DTV
+	/* de-select the NAND device */
+	chip->select_chip(mtd, -1);
+#endif
 	nand_release_device(mtd);
 
 	return ret;
@@ -1272,6 +1626,76 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	uint8_t *ecc_code = chip->buffers->ecccode;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
+#ifdef CONFIG_VENDOR_DTV
+	unsigned int reg;
+	unsigned int status;
+	//unsigned char soft_ecc_code[3];
+	int timeo = 1000;
+
+	//printk("%s\n",__func__);
+
+	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);//read oob first to get ECC code
+	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+//	enable_nce(0); //make ce invalid for a while
+	//ndelay(100);  //ce high
+	nand_wait_ready(mtd);
+
+	for (i = 0; i < chip->ecc.total; i++)
+		ecc_code[i] = chip->oob_poi[eccpos[i]];
+
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
+		//enable read ecc, size 256 bytes
+		WriteRegWord((u32 __iomem *)0xfb002044, 0);
+
+		//write ecc code to register need by caculate
+		reg = ReadRegWord((u32 __iomem *)0xfb002044);
+		reg |= (0x2000000 | ecc_code[i+2]<<16 | ecc_code[i+1] | ecc_code[i+0]<<8 );//0x12000000; only supprot 3 byte ecc code by SX
+		WriteRegWord((u32 __iomem *)0xfb002044, reg);
+
+#ifdef CONFIG_MTD_NAND_DMA
+		nand_dma_read(p, chip->IO_ADDR_R, eccsize);
+#else
+		chip->read_buf(mtd, p, eccsize);
+#endif
+		//chip->ecc.calculate(mtd, p, &ecc_calc[i]);
+
+		status = ReadRegWord((u32 __iomem *)0xfb002048);
+		while(timeo&&(status&0x8000)!=0x8000){
+			udelay(1);
+			timeo--;
+			status = ReadRegWord((u32 __iomem *)0xfb002048);
+		}
+		if(timeo<=0)
+			printk("Error: NAND ECC ready timeout\n");
+
+		//check status
+		if((status&0x2000)==0x2000){
+			mtd->ecc_stats.failed++;
+		       printk("Error:Hardware ECC error at page:%d\n",page);
+		}
+		else if((status&0x1000)!=0x1000){
+		  	// no ecc error
+		  	//return 0;
+		}
+		else{
+			int byte_position;
+			int bit_position;
+			//printk("Hardware ECC correct one bit error at page:%d\n",page);
+			byte_position = status>>3 &0x1ff;
+			bit_position = status&0x7;
+
+			p[byte_position] ^= 1<<bit_position;
+
+			mtd->ecc_stats.corrected ++;
+		}
+
+	 }
+	return 0;
+
+#else
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_READ);
 		chip->read_buf(mtd, p, eccsize);
@@ -1295,6 +1719,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 			mtd->ecc_stats.corrected += stat;
 	}
 	return 0;
+#endif
 }
 
 /**
@@ -1448,6 +1873,12 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 	return NULL;
 }
 
+#ifdef CONFIG_VENDOR_DTV
+static int nand_read_page_onek(struct mtd_info *mtd, struct nand_chip *chip, u_char *buf,u_int page_addr);
+#ifdef CONFIG_UBI_SCAN_OPTIMIZE
+static int ubi_scan_finished = 0;
+#endif
+#endif
 /**
  * nand_do_read_ops - [INTERN] Read data with ECC
  * @mtd: MTD device structure
@@ -1485,6 +1916,18 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	buf = ops->datbuf;
 	oob = ops->oobbuf;
 
+#if defined(CONFIG_UBI_SCAN_OPTIMIZE) && defined(CONFIG_VENDOR_DTV)
+	//optimize ubi attach speed
+	if(!ubi_scan_finished && col == 0 && readlen <= 1024 && !oob )
+	{
+		//printk("%s %08x\n",__func__,readlen);
+		ret = nand_read_page_onek(mtd, chip, buf, page);
+
+		readlen = 0;
+	}
+	else
+	{
+#endif
 	while (1) {
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
@@ -1493,15 +1936,21 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		if (realpage != chip->pagebuf || oob) {
 			bufpoi = aligned ? buf : chip->buffers->databuf;
 
+#if defined(CONFIG_TANGOX) || (!defined(CONFIG_MTD_NAND_MLC_BCH) && !defined(CONFIG_MTD_NAND_ECC_HW) && defined(CONFIG_VENDOR_DTV))
 			if (likely(sndcmd)) {
 				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
 				sndcmd = 0;
 			}
+#endif
 
 			/* Now read the page into the buffer */
-			if (unlikely(ops->mode == MTD_OPS_RAW))
+			if (unlikely(ops->mode == MTD_OPS_RAW)){
+#ifdef CONFIG_VENDOR_DTV
+				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+#endif
 				ret = chip->ecc.read_page_raw(mtd, chip,
 							      bufpoi, page);
+			}
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
 							col, bytes, bufpoi);
@@ -1583,6 +2032,9 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		if (!NAND_CANAUTOINCR(chip) || !(page & blkcheck))
 			sndcmd = 1;
 	}
+#if defined(CONFIG_UBI_SCAN_OPTIMIZE) && defined(CONFIG_VENDOR_DTV)
+	}
+#endif
 
 	ops->retlen = ops->len - (size_t) readlen;
 	if (oob)
@@ -1614,6 +2066,14 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
+//#ifdef CONFIG_VENDOR_DTV
+	/* Do not allow reads past end of device */
+	if ((from + len) > mtd->size)
+		return -EINVAL;
+	if (!len)
+		return 0;
+//#endif
+
 	nand_get_device(chip, mtd, FL_READING);
 	ops.len = len;
 	ops.datbuf = buf;
@@ -2010,18 +2470,91 @@ static void nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	const uint8_t *p = buf;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
+#ifdef CONFIG_VENDOR_DTV
+	unsigned int reg;
+	unsigned int status;
+	//unsigned char soft_ecc_code[3];
+	int timeo = 1000;
+
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
+		//enable read ecc, size 256 bytes
+		WriteRegWord((u32 __iomem *)0xfb002044, 0);
+
+		reg = ReadRegWord((u32 __iomem *)0xfb002044);
+		reg |= 0x1000000 ;
+		WriteRegWord((u32 __iomem *)0xfb002044, reg);
+
+		chip->write_buf(mtd, p, eccsize);
+
+		status = ReadRegWord((u32 __iomem *)0xfb002048);
+		while(timeo&&(status&0x8000)!=0x8000){
+			udelay(1);
+			timeo--;
+			status = ReadRegWord((u32 __iomem *)0xfb002048);
+		}
+		if(timeo<=0)
+			printk("Error: NAND ECC ready timeout\n");
+
+		ecc_calc[i+2] = ReadRegWord((u32 __iomem *)0xfb00204c)&0xff;
+		ecc_calc[i+1] = (ReadRegWord((u32 __iomem *)0xfb002048)&0x00ff0000)>>16;
+		ecc_calc[i+0] = (ReadRegWord((u32 __iomem *)0xfb002048)&0xff000000)>>24;
+
+		//nand_calc_ecc_word_256((unsigned int *)(p),soft_ecc_code);
+
+		//printk(" hardware ECC code:%02x,%02x,%02x\n",ecc_calc[i+0],ecc_calc[i+1],ecc_calc[i+2]);
+		//printf(" soft ECC code:%02x,%02x,%02x\n",soft_ecc_code[0],soft_ecc_code[1],soft_ecc_code[2]);
+
+	 }
+#else
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
 		chip->write_buf(mtd, p, eccsize);
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 	}
+#endif
+
+	for (i = 0; i < chip->ecc.total; i++)
+		chip->oob_poi[eccpos[i]] = ecc_calc[i];
+
+	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+}
+
+#if defined(CONFIG_MTD_NAND_MLC_BCH) && defined(CONFIG_VENDOR_DTV)
+
+char ecc_tmp_write[250] __attribute__ ((aligned (4)));
+static int nand_write_page_mlcbch(struct mtd_info *mtd, struct nand_chip *chip,
+							u_char *buf,u_int page_addr)
+{
+	int i, eccsize = chip->ecc.size;
+	int eccbytes = chip->ecc.bytes;
+	int eccsteps = chip->ecc.steps;
+	u_char *p = buf;
+	u_char *ecc_calc = chip->buffers->ecccalc;
+	int *eccpos = chip->ecc.layout->eccpos;
+	unsigned int ret;
+
+	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
+		BCH_ECC_enc_start(chip);
+		chip->write_buf(mtd, p, eccsize);
+		ret = BCH_ECC_enc_end((unsigned int*)ecc_tmp_write,chip);
+		if(ret)
+		{
+			printk("BCH: write page error %d  at page addr %d \n",ret,page_addr);
+			return ret;
+		}
+
+		memcpy(&ecc_calc[i] ,ecc_tmp_write,eccbytes);
+	}
 
 	for (i = 0; i < chip->ecc.total; i++)
 		chip->oob_poi[eccpos[i]] = ecc_calc[i];
 
 	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	return 0;
 }
 
+#endif
+
 /**
  * nand_write_page_syndrome - [REPLACEABLE] hardware ECC syndrome based page write
  * @mtd: mtd info structure
@@ -2541,6 +3074,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	struct nand_chip *chip = mtd->priv;
 	loff_t rewrite_bbt[NAND_MAX_CHIPS] = {0};
 	unsigned int bbt_masked_page = 0xffffffff;
+	int force_erase = 0;
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -2550,6 +3084,9 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
 
+	if (instr->retries == 0x73092215)
+		force_erase = 1;
+
 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_ERASING);
 
@@ -2586,14 +3123,16 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	instr->state = MTD_ERASING;
 
 	while (len) {
+#ifndef CONFIG_MTD_NAND_BBM
 		/* Check if we have a bad block, we do not erase bad blocks! */
-		if (nand_block_checkbad(mtd, ((loff_t) page) <<
+		if (!force_erase && nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, 0, allowbbt)) {
 			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
 				    __func__, page);
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
 		}
+#endif
 
 		/*
 		 * Invalidate the page cache, if we erase the block which
@@ -2713,6 +3252,11 @@ static void nand_sync(struct mtd_info *mtd)
  */
 static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
+//#ifdef CONFIG_VENDOR_DTV
+	/* Check for invalid offset */
+	if (offs > mtd->size)
+		return -EINVAL;
+//#endif
 	return nand_block_checkbad(mtd, offs, 1, 0);
 }
 
@@ -2788,12 +3332,23 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 		chip->block_bad = nand_block_bad;
 	if (!chip->block_markbad)
 		chip->block_markbad = nand_default_block_markbad;
+#ifdef CONFIG_VENDOR_DTV
+	//speed up
+	if (!chip->write_buf)
+		chip->write_buf = nand_write_buf32;
+	if (!chip->read_buf)
+		chip->read_buf = nand_read_buf32;
+	if (!chip->verify_buf)
+		chip->verify_buf = nand_verify_buf32;
+#else
 	if (!chip->write_buf)
 		chip->write_buf = busw ? nand_write_buf16 : nand_write_buf;
 	if (!chip->read_buf)
 		chip->read_buf = busw ? nand_read_buf16 : nand_read_buf;
 	if (!chip->verify_buf)
 		chip->verify_buf = busw ? nand_verify_buf16 : nand_verify_buf;
+#endif
+
 	if (!chip->scan_bbt)
 		chip->scan_bbt = nand_default_bbt;
 
@@ -2851,6 +3406,22 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
 		return 0;
 
+#ifdef CONFIG_TANGOX
+	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
+	for (i = 0; i < 3; i++) {
+		int j = 0;
+
+		for ( j = 0; j < sizeof(*p); j++ ) {
+			*(((uint8_t *)p)+j) = chip->read_byte(mtd);
+		}
+
+		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
+				le16_to_cpu(p->crc)) {
+			pr_info("ONFI param page %d valid\n", i);
+			break;
+		}
+	}
+#else
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
 	for (i = 0; i < 3; i++) {
 		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
@@ -2860,6 +3431,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 			break;
 		}
 	}
+#endif
 
 	if (i == 3)
 		return 0;
@@ -2888,16 +3460,29 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	sanitize_string(p->model, sizeof(p->model));
 	if (!mtd->name)
 		mtd->name = p->model;
+
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
-	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
+
+	/*
+	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
+	 * (don't ask me who thought of this...). MTD assumes that these
+	 * dimensions will be power-of-2, so just truncate the remaining area.
+	 */
+	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
+	mtd->erasesize *= mtd->writesize;
+
 	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
-	chip->chipsize = le32_to_cpu(p->blocks_per_lun);
+
+	/* See erasesize comment */
+	chip->chipsize = 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
 	*busw = 0;
 	if (le16_to_cpu(p->features) & 1)
 		*busw = NAND_BUSWIDTH_16;
 
-	chip->options |= NAND_NO_READRDY | NAND_NO_AUTOINCR;
+	chip->options &= ~NAND_CHIPOPTIONS_MSK;
+	chip->options |= (NAND_NO_READRDY |
+			NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
 
 	pr_info("ONFI flash detected\n");
 	return 1;
@@ -2915,6 +3500,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	int i, maf_idx;
 	u8 id_data[8];
 	int ret;
+	char onfi_version[3];
 
 	/* Select the device */
 	chip->select_chip(mtd, 0);
@@ -2941,7 +3527,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < 8; i++)
 		id_data[i] = chip->read_byte(mtd);
 
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
@@ -2954,12 +3540,12 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (!type)
 		type = nand_flash_ids;
 
-	for (; type->name != NULL; type++)
+	for (; (type->name != NULL) && (type->id != 0); type++)
 		if (*dev_id == type->id)
 			break;
 
 	chip->onfi_version = 0;
-	if (!type->name || !type->pagesize) {
+	if (!type->name || !type->id || !type->pagesize) {
 		/* Check is chip is ONFI compliant */
 		ret = nand_flash_detect_onfi(mtd, chip, &busw);
 		if (ret)
@@ -2973,7 +3559,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	for (i = 0; i < 8; i++)
 		id_data[i] = chip->read_byte(mtd);
 
-	if (!type->name)
+	if ((!type->name) || (!type->id))
 		return ERR_PTR(-ENODEV);
 
 	if (!mtd->name)
@@ -2981,7 +3567,32 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->chipsize = (uint64_t)type->chipsize << 20;
 
-	if (!type->pagesize && chip->init_size) {
+#ifdef CONFIG_VENDOR_DTV
+	chip->ecc.bytes = type->eccbits;
+
+	/* Newer devices have all the information in additional id bytes */
+	/* add judgment for support Micron flash, or you can fix it use ONFI to get the chip info */
+
+	if(*maf_id ==0x2c )
+	{
+		busw = type->options & NAND_BUSWIDTH_16;
+
+		mtd->oobsize = 224;
+		mtd->writesize = 4096;
+
+		if(*dev_id == 0x38)
+			mtd->erasesize = 0x80000;
+		else if(*dev_id == 0xd3)
+			mtd->erasesize = 0x40000;
+		else if(*dev_id == 0x48)
+			mtd->erasesize = 0x100000;
+		else
+			printk("%s[%d] ERROR: unknown dev_id!\n", __func__, __LINE__);
+	}
+#else
+	if (0);
+#endif
+	else if (!type->pagesize && chip->init_size) {
 		/* Set the pagesize, oobsize, erasesize by the driver */
 		busw = chip->init_size(mtd, chip, id_data);
 	} else if (!type->pagesize) {
@@ -2995,14 +3606,17 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		 * Field definitions are in the following datasheets:
 		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
 		 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
+		 * Micron      (5 byte ID): Micron MT29F16G08MAA (p.24)
+		 *      Note: Micron rule is based on heuristics for
+		 *            newer chips
 		 *
 		 * Check for wraparound + Samsung ID + nonzero 6th byte
 		 * to decide what to do.
 		 */
-		if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
+		if ((id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
 				id_data[0] == NAND_MFR_SAMSUNG &&
 				(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
-				id_data[5] != 0x00) {
+				id_data[5] != 0x00) || (id_data[0] == NAND_MFR_MIRA)) {
 			/* Calc pagesize */
 			mtd->writesize = 2048 << (extid & 0x03);
 			extid >>= 2;
@@ -3026,27 +3640,71 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			mtd->erasesize = (128 * 1024) <<
 				(((extid >> 1) & 0x04) | (extid & 0x03));
 			busw = 0;
-		} else {
+		} else if (id_data[0] == NAND_MFR_ESMT) {
 			/* Calc pagesize */
 			mtd->writesize = 1024 << (extid & 0x03);
 			extid >>= 2;
 			/* Calc oobsize */
-			mtd->oobsize = (8 << (extid & 0x01)) *
-				(mtd->writesize >> 9);
+			mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize / 512) ;
 			extid >>= 2;
-			/* Calc blocksize. Blocksize is multiples of 64KiB */
+			/* Calc blocksize */
 			mtd->erasesize = (64 * 1024) << (extid & 0x03);
+			busw = 0;
+		} else {
+			/* Calc pagesize */
+			mtd->writesize = 1024 << (extid & 0x03);
 			extid >>= 2;
-			/* Get buswidth information */
-			busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+
+			/* Check for 5 byte ID + Micron + read more 0x00 */
+			if (id_data[0] == NAND_MFR_MICRON && id_data[4] != 0x00
+					&& mtd->writesize >= 4096
+					&& id_data[5] == 0x00
+					&& id_data[6] == 0x00) {
+				/* OOB is 218B/224B per 4KiB pagesize */
+				mtd->oobsize = ((extid & 0x03) == 0x03 ? 218 :
+						224) << (mtd->writesize >> 13);
+				extid >>= 3;
+				/* Blocksize is multiple of 64KiB */
+				mtd->erasesize = mtd->writesize <<
+					(extid & 0x03) << 6;
+				/* All Micron have busw x8? */
+				printk("[%s] All Micron : %d\n", __func__, extid);
+				busw = 0;
+			} else {
+				/* Calc oobsize */
+				mtd->oobsize = (8 << (extid & 0x01)) *
+					(mtd->writesize >> 9);
+				extid >>= 2;
+				/* Calc blocksize (multiples of 64KiB) */
+				mtd->erasesize = (64 * 1024) << (extid & 0x03);
+				extid >>= 2;
+				/* Get buswidth information */
+				busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
+			}
 		}
+#ifdef CONFIG_VENDOR_DTV
+	} else if (*maf_id == 0xad && dev_id == 0xd5 ){  //hynix
+				busw = type->options & NAND_BUSWIDTH_16;
+				mtd->oobsize = 448;
+				mtd->writesize = 8192;
+				mtd->erasesize = 0x200000;
+				chip->ecc.bytes = type->eccbits;
+				printk(KERN_DEBUG "chip->ecc.bytes is 0x%x\n",chip->ecc.bytes);
+#endif
 	} else {
 		/*
 		 * Old devices have chip data hardcoded in the device id table.
 		 */
 		mtd->erasesize = type->erasesize;
 		mtd->writesize = type->pagesize;
+#ifdef CONFIG_VENDOR_DTV
+		if(type->oobsize)
+			mtd->oobsize = type->oobsize;
+		else
+			mtd->oobsize = mtd->writesize / 32;
+#else
 		mtd->oobsize = mtd->writesize / 32;
+#endif
 		busw = type->options & NAND_BUSWIDTH_16;
 
 		/*
@@ -3062,8 +3720,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			mtd->erasesize <<= ((id_data[3] & 0x03) << 1);
 		}
 	}
-	/* Get chip options */
-	chip->options |= type->options;
+	/* Get chip options, preserve non chip based options */
+	chip->options &= ~NAND_CHIPOPTIONS_MSK;
+	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
 
 	/*
 	 * Check if chip is not a Samsung device. Do not clear the
@@ -3129,10 +3788,14 @@ ident_done:
 	 */
 	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			(*maf_id == NAND_MFR_SAMSUNG ||
+			 *maf_id == NAND_MFR_MIRA ||
+			 *maf_id == NAND_MFR_ESMT ||
 			 *maf_id == NAND_MFR_HYNIX))
 		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
 	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 				(*maf_id == NAND_MFR_SAMSUNG ||
+				 *maf_id == NAND_MFR_MIRA ||
+				 *maf_id == NAND_MFR_ESMT ||
 				 *maf_id == NAND_MFR_HYNIX ||
 				 *maf_id == NAND_MFR_TOSHIBA ||
 				 *maf_id == NAND_MFR_AMD ||
@@ -3141,6 +3804,7 @@ ident_done:
 			 *maf_id == NAND_MFR_MICRON))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
 		chip->erase_cmd = multi_erase_cmd;
@@ -3156,7 +3820,42 @@ ident_done:
 		nand_manuf_ids[maf_idx].name,
 		chip->onfi_version ? chip->onfi_params.model : type->name);
 
+	if (chip->onfi_version)
+		snprintf(onfi_version, sizeof(onfi_version), "%d.%d",
+					chip->onfi_version / 10,
+					chip->onfi_version % 10);
+	else
+		snprintf(onfi_version, sizeof(onfi_version), "%s", "0");
+
+	/* ID Data Mapping */
+	for (i = 0; i < 8; i++)
+	{
+		mtd->id_data[i] = id_data[i];
+	}
+
+	mtd->onfi_version = kstrdup(onfi_version, GFP_KERNEL);
+	if (!mtd->onfi_version)
+		return ERR_PTR(-ENOMEM);
+
+	mtd->nand_manufacturer = kstrdup(nand_manuf_ids[maf_idx].name, GFP_KERNEL);
+	if (!mtd->nand_manufacturer) {
+		ret = -ENOMEM;
+		goto out_onfi_version;
+	}
+
+	mtd->nand_type = kstrdup(type->name, GFP_KERNEL);
+	if (!mtd->nand_type) {
+		ret = -ENOMEM;
+		goto out_nand_type;
+	}
+
 	return type;
+
+out_nand_type:
+	kfree(mtd->nand_type);
+out_onfi_version:
+	kfree(mtd->onfi_version);
+	return ERR_PTR(ret);
 }
 
 /**
@@ -3176,6 +3875,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	int i, busw, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
+	int err;
 
 	/* Get buswidth to select the correct functions */
 	busw = chip->options & NAND_BUSWIDTH_16;
@@ -3190,7 +3890,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
 		chip->select_chip(mtd, -1);
-		return PTR_ERR(type);
+		err = PTR_ERR(type);
+		goto out_error;
 	}
 
 	/* Check for a chip array */
@@ -3212,7 +3913,20 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	chip->numchips = i;
 	mtd->size = i * chip->chipsize;
 
+	chip->maf_id = nand_maf_id;
+	chip->dev_id = type->id;
+
 	return 0;
+
+out_error:
+	if (mtd->nand_type)
+		kfree(mtd->nand_type);
+	if (mtd->nand_manufacturer)
+		kfree(mtd->nand_manufacturer);
+	if (mtd->onfi_version)
+		kfree(mtd->onfi_version);
+
+	return err;
 }
 EXPORT_SYMBOL(nand_scan_ident);
 
@@ -3254,11 +3968,28 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.layout = &nand_oob_16;
 			break;
 		case 64:
+#if defined(CONFIG_MTD_NAND_MLC_BCH) && defined(CONFIG_VENDOR_DTV)
+			chip->ecc.layout = &nand_oob_mlcbch_64;
+#else
 			chip->ecc.layout = &nand_oob_64;
+#endif
 			break;
 		case 128:
 			chip->ecc.layout = &nand_oob_128;
 			break;
+		case 224:
+			chip->ecc.layout = &nand_oob_mlcbch_224;
+			//8 bit bch ecc for Micron 1G flash, 224 oobsize use 128 for ecc
+			//for(i=224-112,k=0;i<224;k++,i++)
+			//	chip->ecc.layout->eccpos[k]=i;
+			//chip->ecc.layout->oobfree[0].offset=3;
+			//chip->ecc.layout->oobfree[0].length=(224-112-3);
+			break;
+#ifndef CONFIG_MTD_NAND_ECC_512
+		case 448:
+			chip->ecc.layout = &nand_oob_mlcbch_448;
+			break;
+#endif
 		default:
 			pr_warn("No oob scheme defined for oobsize %d\n",
 				   mtd->oobsize);
@@ -3300,6 +4031,37 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.read_oob = nand_read_oob_std;
 		if (!chip->ecc.write_oob)
 			chip->ecc.write_oob = nand_write_oob_std;
+#ifdef CONFIG_VENDOR_DTV
+		chip->ecc.size = 256;
+		chip->ecc.bytes = 3;
+		break;
+
+#ifdef CONFIG_MTD_NAND_MLC_BCH
+	case NAND_MLC_BCH:
+			chip->ecc.read_page = nand_read_page_mlcbch;
+			chip->ecc.write_page = nand_write_page_mlcbch;
+			chip->ecc.read_oob = nand_read_oob_std;
+			chip->ecc.read_page_raw = nand_read_page_raw;
+			chip->ecc.write_page_raw = nand_write_page_raw;
+			chip->ecc.write_oob = nand_write_oob_std;
+
+		// do ECC control reset. REG_BCH_ECC_CONTROL  = 0xfb002200
+		WriteRegWord((u32 __iomem *)0xfb002200, (ReadRegWord((u32 __iomem *)0xfb002200)&(~0x4)));
+		WriteRegWord((u32 __iomem *)0xfb002200, 0x1000);
+		while(ReadRegWord((u32 __iomem *)0xfb002200)&0x1000!=0)
+			;
+		WriteRegWord((u32 __iomem *)0xfb002200, 0x02);
+
+		#ifdef CONFIG_MTD_NAND_ECC_512
+			printk(KERN_DEBUG "NAND: BCH ECC,size 512B.\n");
+			chip->ecc.size = 512;
+		#else
+			printk(KERN_DEBUG "NAND: BCH ECC,size 1024B.\n");
+			chip->ecc.size = 1024;
+		#endif
+			break;
+#endif
+#endif //ifdef CONFIG_VENDOR_DTV
 
 	case NAND_ECC_HW_SYNDROME:
 		if ((!chip->ecc.calculate || !chip->ecc.correct ||
@@ -3437,12 +4199,20 @@ int nand_scan_tail(struct mtd_info *mtd)
 	    !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
 		switch (chip->ecc.steps) {
 		case 2:
+#if defined(CONFIG_MTD_UBI) && defined(CONFIG_VENDOR_DTV)
+			mtd->subpage_sft = 0; //fix me, to simplify ubi config
+#else
 			mtd->subpage_sft = 1;
+#endif
 			break;
 		case 4:
 		case 8:
 		case 16:
+#if defined(CONFIG_MTD_UBI) && defined(CONFIG_VENDOR_DTV)
+			mtd->subpage_sft = 0; //fix me, to simplify ubi config
+#else
 			mtd->subpage_sft = 2;
+#endif
 			break;
 		}
 	}
@@ -3517,6 +4287,44 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 {
 	int ret;
 
+#ifdef CONFIG_VENDOR_DTV
+	struct nand_chip *chip;
+#ifdef CONFIG_MIPS_TRIDENT_FUSION_ANDROID
+	//protect NAND init
+	NAND_spin_lock_hw_dump(SPIN_REG_ADDR);
+#endif
+
+#ifdef CONFIG_NAND_MODE
+	/* switch the nand source clock from 100Hz to 200Hz for this version of NAND mode setting
+	* if the souce clock is not match the NAND mode, will cause the DMA read time out error */
+
+	unsigned char nand_clock = ReadRegByte((void*)0xf500e849);
+	nand_clock &= 0xcf;
+	nand_clock |= 0x20;
+	WriteRegByte((void*)0xf500e849,nand_clock);
+
+	/* switch the nand source clock 200Hz clock for write,
+	if the clock is not match the NAND init setting such like 1b002004 = 0x21, will cause WP*/
+	WriteRegWord((void*)0xfb002004, 0x00000067);
+
+	unsigned int write_clock = ReadRegWord((void*)0xfb002070);
+	write_clock |= 0x100;
+	WriteRegWord((void*)0xfb002070,write_clock);
+
+	write_clock = ReadRegWord((void*)0xfb002020);
+	write_clock &= 0xffff3f3f;
+	WriteRegWord((void*)0xfb002020,write_clock);
+
+	/*we set 205c only here,it changed in UXL*/
+#ifdef CONFIG_MIPS_TRIDENT_UXL
+	WriteRegWord((void*)0xfb00205c, 0x40193333);
+#else
+	WriteRegWord((void*)0xfb00205c, 0x40193333);
+#endif
+
+#endif //ifdef CONFIG_NAND_MODE
+#endif //ifdef CONFIG_VENDOR_DTV
+
 	/* Many callers got this wrong, so check for it for a while... */
 	if (!mtd->owner && caller_is_module()) {
 		pr_crit("%s called with NULL mtd->owner!\n", __func__);
@@ -3526,7 +4334,25 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 	ret = nand_scan_ident(mtd, maxchips, NULL);
 	if (!ret)
 		ret = nand_scan_tail(mtd);
+
+#ifdef CONFIG_MIPS_TRIDENT_FUSION_ANDROID
+	NAND_spin_unlock_hw(SPIN_REG_ADDR);
+#endif
+
+#ifdef CONFIG_VENDOR_DTV
+	chip = mtd->priv;
+
+	if (chip->options & NAND_SKIP_BBTSCAN)
+		return ret;
+/*scan_bbt will be processed in nand_scan_tail*/
+//#ifdef CONFIG_MTD_UBI
+//	return chip->scan_bbt(mtd);
+//#else
 	return ret;
+//#endif
+#else
+	return ret;
+#endif
 }
 EXPORT_SYMBOL(nand_scan);
 
@@ -3541,7 +4367,9 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->ecc.mode == NAND_ECC_SOFT_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
+#ifndef CONFIG_VENDOR_DTV
 	mtd_device_unregister(mtd);
+#endif
 
 	/* Free bad block table memory */
 	kfree(chip->bbt);
@@ -3552,6 +4380,10 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->badblock_pattern && chip->badblock_pattern->options
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
+
+	kfree(mtd->nand_type);
+	kfree(mtd->nand_manufacturer);
+	kfree(mtd->onfi_version);
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index af4fe8ca7b5e..03c687c3b8a4 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -23,6 +23,232 @@
 */
 struct nand_flash_dev nand_flash_ids[] = {
 
+#ifdef CONFIG_VENDOR_DTV
+#ifdef CONFIG_MTD_NAND_MLC_BCH
+#ifdef CONFIG_MTD_NAND_MUSEUM_IDS
+//	unsigned long eccbits;
+	{"NAND 1MiB 5V 8-bit",		0x0,0x6e, 256, 1, 0x1000, 0x0,0,14},
+	{"NAND 2MiB 5V 8-bit",		0x0,0x64, 256, 2, 0x1000, 0x0,0,14},
+	{"NAND 4MiB 5V 8-bit",		0x0,0x6b, 512, 4, 0x2000, 0x0,0,14},
+	{"NAND 1MiB 3,3V 8-bit",	0x0,0xe8, 256, 1, 0x1000, 0x0,0,14},
+	{"NAND 1MiB 3,3V 8-bit",	0x0,0xec, 256, 1, 0x1000, 0x0,0,14},
+	{"NAND 2MiB 3,3V 8-bit",	0x0,0xea, 256, 2, 0x1000, 0x0,0,14},
+	{"NAND 4MiB 3,3V 8-bit",	0xff,0xd5, 512, 4, 0x2000, 0x0,0,14},
+	{"NAND 4MiB 3,3V 8-bit",	0x0,0xe3, 512, 4, 0x2000, 0x0,0,14},
+	{"NAND 4MiB 3,3V 8-bit",	0x0,0xe5, 512, 4, 0x2000, 0x0,0,14},
+	{"NAND 8MiB 3,3V 8-bit",	0x0,0xd6, 512, 8, 0x2000, 0x0,0,14},
+
+	{"NAND 8MiB 1,8V 8-bit",	0x0,0x39, 512, 8, 0x2000, 0x0,0,14},
+	{"NAND 8MiB 3,3V 8-bit",	0x0,0xe6, 512, 8, 0x2000, 0x0,0,14},
+	{"NAND 8MiB 1,8V 16-bit",	0x0,0x49, 512, 8, 0x2000, 0x0,NAND_BUSWIDTH_16,14},
+	{"NAND 8MiB 3,3V 16-bit",	0x0,0x59, 512, 8, 0x2000, 0x0,NAND_BUSWIDTH_16,14},
+#endif
+
+	{"NAND 16MiB 1,8V 8-bit",	0x0,0x33, 512, 16, 0x4000, 0x0,0,14},
+	{"NAND 16MiB 3,3V 8-bit",	0x0,0x73, 512, 16, 0x4000, 0x0,0,14},
+	{"NAND 16MiB 1,8V 16-bit",	0x0,0x43, 512, 16, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+	{"NAND 16MiB 3,3V 16-bit",	0x0,0x53, 512, 16, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+
+	{"NAND 32MiB 1,8V 8-bit",	0x0,0x35, 512, 32, 0x4000, 0x0,0,14},
+	{"NAND 32MiB 3,3V 8-bit",	0x0,0x75, 512, 32, 0x4000, 0x0,0,14},
+	{"NAND 32MiB 1,8V 16-bit",	0x0,0x45, 512, 32, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+	{"NAND 32MiB 3,3V 16-bit",	0x0,0x55, 512, 32, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+
+	{"NAND 64MiB 1,8V 8-bit",	0x0,0x36, 512, 64, 0x4000, 0x0,0,14},
+	{"NAND 64MiB 3,3V 8-bit",	0x0,0x76, 512, 64, 0x4000, 0x0,0,14},
+	{"NAND 64MiB 1,8V 16-bit",	0x0,0x46, 512, 64, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+	{"NAND 64MiB 3,3V 16-bit",	0x0,0x56, 512, 64, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+
+	{"NAND 128MiB 1,8V 8-bit",	0x0,0x78, 512, 128, 0x4000, 0x0,0,14},
+	{"NAND 128MiB 1,8V 8-bit",	0x0,0x39, 512, 128, 0x4000, 0x0,0,14},
+	{"NAND 128MiB 3,3V 8-bit",	0x0,0x79, 512, 128, 0x4000, 0x0,0,14},
+	{"NAND 128MiB 1,8V 16-bit",	0x0,0x72, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+	{"NAND 128MiB 1,8V 16-bit",	0x0,0x49, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+	{"NAND 128MiB 3,3V 16-bit",	0x0,0x74, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+	{"NAND 128MiB 3,3V 16-bit",	0x0,0x59, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16,14},
+
+	{"NAND 256MiB 3,3V 8-bit",	0x0,0x71, 512, 256, 0x4000, 0x0,0,14},
+
+	/*
+	 * These are the new chips with large page size. The pagesize and the
+	 * erasesize is determined from the extended id bytes
+	 */
+#define LP_OPTIONS (NAND_SAMSUNG_LP_OPTIONS | NAND_NO_READRDY | NAND_NO_AUTOINCR)
+#define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
+
+	/*512 Megabit */
+	{"NAND 64MiB 1,8V 8-bit",	0x0,0xA2, 0,  64, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 64MiB 3,3V 8-bit",	0x0,0xF2, 0,  64, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 64MiB 1,8V 16-bit",	0x0,0xB2, 0,  64, 0, 0x0,LP_OPTIONS16,14},
+	{"NAND 64MiB 3,3V 16-bit",	0x0,0xC2, 0,  64, 0, 0x0,LP_OPTIONS16,14},
+
+	/* 1 Gigabit */
+	{"NAND 128MiB 1,8V 8-bit",	0x0,0xA1, 0, 128, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 128MiB 3,3V 8-bit", 	0x0,0xF1, 2048, 128, 0x20000,0x0, LP_OPTIONS,14},
+	{"NAND 128MiB 1,8V 16-bit",	0x0,0xB1, 0, 128, 0, 0x0,LP_OPTIONS16,14},
+	{"NAND 128MiB 3,3V 16-bit",	0x0,0xC1, 0, 128, 0, 0x0,LP_OPTIONS16,14},
+
+	/* 2 Gigabit */
+	{"NAND 256MiB 1,8V 8-bit",	0x0,0xAA, 0, 256, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 256MiB 3,3V 8-bit",	0x0,0xDA, 0, 256, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 256MiB 1,8V 16-bit",	0x0,0xBA, 0, 256, 0, 0x0,LP_OPTIONS16,14},
+	{"NAND 256MiB 3,3V 16-bit",	0x0,0xCA, 0, 256, 0, 0x0,LP_OPTIONS16,14},
+
+	/* 4 Gigabit */
+	{"NAND 512MiB 1,8V 8-bit",	0x0,0xAC, 0, 512, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 512MiB 3,3V 8-bit",	0xff,0xDC, 0, 512, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 512MiB 1,8V 16-bit",	0x0,0xBC, 0, 512, 0, 0x0,LP_OPTIONS16,14},
+	{"NAND 512MiB 3,3V 16-bit",	0x0,0xCC, 0, 512, 0, 0x0,LP_OPTIONS16,14},
+
+	/* 8 Gigabit */
+	{"NAND 1GiB 1,8V 8-bit",	0x0,0xA3, 0, 1024, 0, 0x0,LP_OPTIONS,14},
+	{"NAND 1GiB 3,3V 8-bit",	0x2c,0xD3, 4096, 1024, 0x80000, 224,LP_OPTIONS,14},
+	{"NAND 1GiB 3,3V 8-bit",   	0x2c,0x38,4096, 1024, 0x80000,224,LP_OPTIONS,14},
+	{"NAND 1GiB 3,3V 8-bit",	0x0,0x38,4096, 1024, 0x80000,0x0,LP_OPTIONS,14},
+
+	{"NAND 1GiB 1,8V 16-bit",	0x0,0xB3, 0, 1024, 0, 0x0,LP_OPTIONS16,14},
+	{"NAND 1GiB 3,3V 16-bit",	0x0,0xC3, 0, 1024, 0, 0x0,LP_OPTIONS16,14},
+
+	//samsung chip, same dev id , different chip size
+	{"NAND 1GiB/2GiB 3,3V 8-bit",	0xec,0xD3, 0, 0, 0, 0,LP_OPTIONS,14},
+
+	/* 16 Gigabit */
+	{"NAND 2GiB 1,8V 8-bit",	0x0,0xA5, 0, 2048, 0, 0x0,LP_OPTIONS,42},
+	{"NAND 2GiB 3,3V 8-bit",	0xec,0xD5, 8192, 2048, 0x100000, 512,LP_OPTIONS,42},
+	{"NAND 2GiB 3,3V 8-bit",	0xad,0xD5, 8192, 2048, 0x200000, 448,LP_OPTIONS|NAND_MLC,42},
+	{"NAND 2GiB 1,8V 16-bit",	0x0,0xB5, 0, 2048, 0, 0x0,LP_OPTIONS16,42},
+	{"NAND 2GiB 3,3V 16-bit",	0x0,0xC5, 0, 2048, 0, 0x0,LP_OPTIONS16,42},
+
+	/*2013.4.2 add for Micron MT29F16G*/
+	{"NAND 2GiB 3,3V 8-bit",        0x2c, 0x48, 4096, 2048, 0x100000,224, LP_OPTIONS|NAND_MLC,42},
+	/*
+	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
+	 * have a strange page/block layout !  The chosen minimum erasesize is
+	 * 4 * 2 * 2048 = 16384 Byte, as those chips have an array of 4 page
+	 * planes 1 block = 2 pages, but due to plane arrangement the blocks
+	 * 0-3 consists of page 0 + 4,1 + 5, 2 + 6, 3 + 7 Anyway JFFS2 would
+	 * increase the eraseblock size so we chose a combined one which can be
+	 * erased in one go There are more speed improvements for reads and
+	 * writes possible, but not implemented now
+	 */
+
+	{"AND 128MiB 3,3V 8-bit",	0x0,0x01, 2048, 128, 0x4000,0x0,
+	 NAND_IS_AND | NAND_NO_AUTOINCR |NAND_NO_READRDY | NAND_4PAGE_ARRAY |
+	 BBT_AUTO_REFRESH,14},
+
+#else /*not define  CONFIG_MTD_NAND_MLC_BCH*/
+#ifdef CONFIG_MTD_NAND_MUSEUM_IDS
+	{"NAND 1MiB 5V 8-bit",		0x0,0x6e, 256, 1, 0x1000, 0x0,0},
+	{"NAND 2MiB 5V 8-bit",		0x0,0x64, 256, 2, 0x1000, 0x0,0},
+	{"NAND 4MiB 5V 8-bit",		0x0,0x6b, 512, 4, 0x2000, 0x0,0},
+	{"NAND 1MiB 3,3V 8-bit",	0x0,0xe8, 256, 1, 0x1000, 0x0,0},
+	{"NAND 1MiB 3,3V 8-bit",	0x0,0xec, 256, 1, 0x1000, 0x0,0},
+	{"NAND 2MiB 3,3V 8-bit",	0x0,0xea, 256, 2, 0x1000, 0x0,0},
+	{"NAND 4MiB 3,3V 8-bit",	0xff,0xd5, 512, 4, 0x2000, 0x0,0},
+	{"NAND 4MiB 3,3V 8-bit",	0x0,0xe3, 512, 4, 0x2000, 0x0,0},
+	{"NAND 4MiB 3,3V 8-bit",	0x0,0xe5, 512, 4, 0x2000, 0x0,0},
+	{"NAND 8MiB 3,3V 8-bit",	0x0,0xd6, 512, 8, 0x2000, 0x0,0},
+
+	{"NAND 8MiB 1,8V 8-bit",	0x0,0x39, 512, 8, 0x2000, 0x0,0},
+	{"NAND 8MiB 3,3V 8-bit",	0x0,0xe6, 512, 8, 0x2000, 0x0,0},
+	{"NAND 8MiB 1,8V 16-bit",	0x0,0x49, 512, 8, 0x2000, 0x0,NAND_BUSWIDTH_16},
+	{"NAND 8MiB 3,3V 16-bit",	0x0,0x59, 512, 8, 0x2000, 0x0,NAND_BUSWIDTH_16},
+#endif
+
+	{"NAND 16MiB 1,8V 8-bit",	0x0,0x33, 512, 16, 0x4000, 0x0,0},
+	{"NAND 16MiB 3,3V 8-bit",	0x0,0x73, 512, 16, 0x4000, 0x0,0},
+	{"NAND 16MiB 1,8V 16-bit",	0x0,0x43, 512, 16, 0x4000, 0x0,NAND_BUSWIDTH_16},
+	{"NAND 16MiB 3,3V 16-bit",	0x0,0x53, 512, 16, 0x4000, 0x0,NAND_BUSWIDTH_16},
+
+	{"NAND 32MiB 1,8V 8-bit",	0x0,0x35, 512, 32, 0x4000, 0x0,0},
+	{"NAND 32MiB 3,3V 8-bit",	0x0,0x75, 512, 32, 0x4000, 0x0,0},
+	{"NAND 32MiB 1,8V 16-bit",	0x0,0x45, 512, 32, 0x4000, 0x0,NAND_BUSWIDTH_16},
+	{"NAND 32MiB 3,3V 16-bit",	0x0,0x55, 512, 32, 0x4000, 0x0,NAND_BUSWIDTH_16},
+
+	{"NAND 64MiB 1,8V 8-bit",	0x0,0x36, 512, 64, 0x4000, 0x0,0},
+	{"NAND 64MiB 3,3V 8-bit",	0x0,0x76, 512, 64, 0x4000, 0x0,0},
+	{"NAND 64MiB 1,8V 16-bit",	0x0,0x46, 512, 64, 0x4000, 0x0,NAND_BUSWIDTH_16},
+	{"NAND 64MiB 3,3V 16-bit",	0x0,0x56, 512, 64, 0x4000, 0x0,NAND_BUSWIDTH_16},
+
+	{"NAND 128MiB 1,8V 8-bit",	0x0,0x78, 512, 128, 0x4000, 0x0,0},
+	{"NAND 128MiB 1,8V 8-bit",	0x0,0x39, 512, 128, 0x4000, 0x0,0},
+	{"NAND 128MiB 3,3V 8-bit",	0x0,0x79, 512, 128, 0x4000, 0x0,0},
+	{"NAND 128MiB 1,8V 16-bit",	0x0,0x72, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16},
+	{"NAND 128MiB 1,8V 16-bit",	0x0,0x49, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16},
+	{"NAND 128MiB 3,3V 16-bit",	0x0,0x74, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16},
+	{"NAND 128MiB 3,3V 16-bit",	0x0,0x59, 512, 128, 0x4000, 0x0,NAND_BUSWIDTH_16},
+
+	{"NAND 256MiB 3,3V 8-bit",	0x0,0x71, 512, 256, 0x4000, 0x0,0},
+
+	/*
+	 * These are the new chips with large page size. The pagesize and the
+	 * erasesize is determined from the extended id bytes
+	 */
+#define LP_OPTIONS (NAND_SAMSUNG_LP_OPTIONS | NAND_NO_READRDY | NAND_NO_AUTOINCR)
+#define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
+
+	/*512 Megabit */
+	{"NAND 64MiB 1,8V 8-bit",	0x0,0xA2, 0,  64, 0, 0x0,LP_OPTIONS},
+	{"NAND 64MiB 3,3V 8-bit",	0x0,0xF2, 0,  64, 0, 0x0,LP_OPTIONS},
+	{"NAND 64MiB 1,8V 16-bit",	0x0,0xB2, 0,  64, 0, 0x0,LP_OPTIONS16},
+	{"NAND 64MiB 3,3V 16-bit",	0x0,0xC2, 0,  64, 0, 0x0,LP_OPTIONS16},
+
+	/* 1 Gigabit */
+	{"NAND 128MiB 1,8V 8-bit",	0x0,0xA1, 0, 128, 0, 0x0,LP_OPTIONS},
+	{"NAND 128MiB 3,3V 8-bit", 	0x0,0xF1, 2048, 128, 0x20000,0x0, LP_OPTIONS},
+	{"NAND 128MiB 1,8V 16-bit",	0x0,0xB1, 0, 128, 0, 0x0,LP_OPTIONS16},
+	{"NAND 128MiB 3,3V 16-bit",	0x0,0xC1, 0, 128, 0, 0x0,LP_OPTIONS16},
+
+	/* 2 Gigabit */
+	{"NAND 256MiB 1,8V 8-bit",	0x0,0xAA, 0, 256, 0, 0x0,LP_OPTIONS},
+	{"NAND 256MiB 3,3V 8-bit",	0x0,0xDA, 0, 256, 0, 0x0,LP_OPTIONS},
+	{"NAND 256MiB 1,8V 16-bit",	0x0,0xBA, 0, 256, 0, 0x0,LP_OPTIONS16},
+	{"NAND 256MiB 3,3V 16-bit",	0x0,0xCA, 0, 256, 0, 0x0,LP_OPTIONS16},
+
+	/* 4 Gigabit */
+	{"NAND 512MiB 1,8V 8-bit",	0x0,0xAC, 0, 512, 0, 0x0,LP_OPTIONS},
+	{"NAND 512MiB 3,3V 8-bit",	0xff,0xDC, 0, 512, 0, 0x0,LP_OPTIONS},
+	{"NAND 512MiB 1,8V 16-bit",	0x0,0xBC, 0, 512, 0, 0x0,LP_OPTIONS16},
+	{"NAND 512MiB 3,3V 16-bit",	0x0,0xCC, 0, 512, 0, 0x0,LP_OPTIONS16},
+
+	/* 8 Gigabit */
+	{"NAND 1GiB 1,8V 8-bit",	0x0,0xA3, 0, 1024, 0, 0x0,LP_OPTIONS},
+	{"NAND 1GiB 3,3V 8-bit",	0x2c,0xD3, 4096, 1024, 0x80000, 224,LP_OPTIONS},
+	{"NAND 1GiB 3,3V 8-bit",   	0x2c,0x38,4096, 1024, 0x80000,224,LP_OPTIONS},
+	{"NAND 1GiB 3,3V 8-bit",	0x0,0x38,4096, 1024, 0x80000,0x0,LP_OPTIONS},
+
+	{"NAND 1GiB 1,8V 16-bit",	0x0,0xB3, 0, 1024, 0, 0x0,LP_OPTIONS16},
+	{"NAND 1GiB 3,3V 16-bit",	0x0,0xC3, 0, 1024, 0, 0x0,LP_OPTIONS16},
+
+	//samsung chip, same dev id , different chip size
+	{"NAND 1GiB/2GiB 3,3V 8-bit",	0xec,0xD3, 0, 0, 0, 0,LP_OPTIONS},
+
+	/* 16 Gigabit */
+	{"NAND 2GiB 1,8V 8-bit",	0x0,0xA5, 0, 2048, 0, 0x0,LP_OPTIONS},
+	{"NAND 2GiB 3,3V 8-bit",	0xec,0xD5, 8192, 2048, 0x100000, 512,LP_OPTIONS},
+	{"NAND 2GiB 3,3V 8-bit",	0xad,0xD5, 8192, 2048, 0x200000, 448,LP_OPTIONS},
+	{"NAND 2GiB 1,8V 16-bit",	0x0,0xB5, 0, 2048, 0, 0x0,LP_OPTIONS16},
+	{"NAND 2GiB 3,3V 16-bit",	0x0,0xC5, 0, 2048, 0, 0x0,LP_OPTIONS16},
+
+	/*
+	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
+	 * have a strange page/block layout !  The chosen minimum erasesize is
+	 * 4 * 2 * 2048 = 16384 Byte, as those chips have an array of 4 page
+	 * planes 1 block = 2 pages, but due to plane arrangement the blocks
+	 * 0-3 consists of page 0 + 4,1 + 5, 2 + 6, 3 + 7 Anyway JFFS2 would
+	 * increase the eraseblock size so we chose a combined one which can be
+	 * erased in one go There are more speed improvements for reads and
+	 * writes possible, but not implemented now
+	 */
+
+	{"AND 128MiB 3,3V 8-bit",	0x0,0x01, 2048, 128, 0x4000,0x0,
+	 NAND_IS_AND | NAND_NO_AUTOINCR |NAND_NO_READRDY | NAND_4PAGE_ARRAY |
+	 BBT_AUTO_REFRESH
+	},
+
+#endif /* not define  CONFIG_MTD_NAND_MLC_BCH */
+
+#else /* not define CONFIG_VENDOR_DTV */
 #ifdef CONFIG_MTD_NAND_MUSEUM_IDS
 	{"NAND 1MiB 5V 8-bit",		0x6e, 256, 1, 0x1000, 0},
 	{"NAND 2MiB 5V 8-bit",		0x64, 256, 2, 0x1000, 0},
@@ -90,7 +316,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 128MiB 3,3V 8-bit",	0xD1, 0, 128, 0, LP_OPTIONS},
 	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
 	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
-	{"NAND 128MiB 1,8V 16-bit",     0xAD, 0, 128, 0, LP_OPTIONS16},
+	{"NAND 128MiB 1,8V 16-bit", 0xAD, 0, 128, 0, LP_OPTIONS16},
 
 	/* 2 Gigabit */
 	{"NAND 256MiB 1,8V 8-bit",	0xAA, 0, 256, 0, LP_OPTIONS},
@@ -107,22 +333,26 @@ struct nand_flash_dev nand_flash_ids[] = {
 	/* 8 Gigabit */
 	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
 	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
+	{"NAND 1GiB 3,3V 8-bit",	0x38, 0, 1024, 0, LP_OPTIONS},
 	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
 	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
 
 	/* 16 Gigabit */
 	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
 	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
+	{"NAND 2GiB 3,3V 8-bit",	0x48, 0, 2048, 0, LP_OPTIONS},
 	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
 	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
 
 	/* 32 Gigabit */
+	{"NAND 4GiB 3,3V 8-bit",	0x68, 0, 4096, 0, LP_OPTIONS},
 	{"NAND 4GiB 1,8V 8-bit",	0xA7, 0, 4096, 0, LP_OPTIONS},
 	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS},
 	{"NAND 4GiB 1,8V 16-bit",	0xB7, 0, 4096, 0, LP_OPTIONS16},
 	{"NAND 4GiB 3,3V 16-bit",	0xC7, 0, 4096, 0, LP_OPTIONS16},
 
 	/* 64 Gigabit */
+	{"NAND 8GiB 3,3V 8-bit",	0x88, 0, 8192, 0, LP_OPTIONS},
 	{"NAND 8GiB 1,8V 8-bit",	0xAE, 0, 8192, 0, LP_OPTIONS},
 	{"NAND 8GiB 3,3V 8-bit",	0xDE, 0, 8192, 0, LP_OPTIONS},
 	{"NAND 8GiB 1,8V 16-bit",	0xBE, 0, 8192, 0, LP_OPTIONS16},
@@ -135,6 +365,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
 
 	/* 256 Gigabit */
+	{"NAND 32GiB 3,3V 8-bit",	0xA8, 0, 32768, 0, LP_OPTIONS},
 	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
 	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
 	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},
@@ -161,7 +392,23 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 BBT_AUTO_REFRESH
 	},
 
-	{NULL,}
+	/*
+	 * Fill-in gaps, may be refilled at the runtime
+	 */
+	{"                                ", 0, },
+	{"                                ", 0, },
+	{"                                ", 0, },
+	{"                                ", 0, },
+	{"                                ", 0, },
+	{"                                ", 0, },
+	{"                                ", 0, },
+	{"                                ", 0, },
+#endif /* not define CONFIG_VENDOR_DTV */
+
+	/*
+	 * Terminates the table
+	 */
+	{NULL, },
 };
 
 /*
@@ -178,6 +425,8 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_MICRON, "Micron"},
 	{NAND_MFR_AMD, "AMD"},
 	{NAND_MFR_MACRONIX, "Macronix"},
+	{NAND_MFR_ESMT, "ESMT"},
+	{NAND_MFR_MIRA, "MIRA"},
 	{0x0, "Unknown"}
 };
 
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index b9cbd65f49b5..a3b0336dc374 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -654,7 +654,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	}
 
 	/* Detect how many ID bytes the NAND chip outputs */
-        for (i = 0; nand_flash_ids[i].name != NULL; i++) {
+        for (i = 0; (nand_flash_ids[i].name != NULL) && (nand_flash_ids[i].id != 0); i++) {
                 if (second_id_byte != nand_flash_ids[i].id)
                         continue;
 		if (!(nand_flash_ids[i].options & NAND_NO_AUTOINCR))
diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
old mode 100644
new mode 100755
index f6a7d7ac4b98..475fd0063b12
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -63,6 +63,13 @@ int ubi_check_volume(struct ubi_device *ubi, int vol_id)
 	void *buf;
 	int err = 0, i;
 	struct ubi_volume *vol = ubi->volumes[vol_id];
+#ifdef CONFIG_VENDOR_DTV
+	/* 
+	   Do not check the volume when the volume is static,in order to reduce the 
+	   time of attach mtd device when the device include big static volume
+	*/
+	return 0;
+#endif
 
 	if (vol->vol_type != UBI_STATIC_VOLUME)
 		return 0;
