Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNl2v-0004Yt-HS
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 17:35:39 +0000
Subject: Re: RFC on large number of hacks in mtd core files
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Sebastian Frias <sf84@laposte.net>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr>
From: Mason <slash.tmp@free.fr>
Message-ID: <56A65CBA.9050705@free.fr>
Date: Mon, 25 Jan 2016 18:34:50 +0100
MIME-Version: 1.0
In-Reply-To: <56A35BA2.3040906@free.fr>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23/01/2016 11:53, Mason wrote:

> I'll spend a few hours to clean up the diffs and keep only what seems relevant.

OK, here's my second attempt at presenting the information.
I'm grateful if anyone has comments regarding the changes
in core files, or even the driver itself.

Regards.


$ git diff --stat -p v3.4.39 HEAD drivers/mtd include/linux/mtd

 drivers/mtd/Kconfig                 |   14 +-
 drivers/mtd/chips/cfi_cmdset_0002.c |  127 ++-
 drivers/mtd/devices/m25p80.c        |  100 +-
 drivers/mtd/maps/Kconfig            |   11 +-
 drivers/mtd/maps/physmap.c          |  193 +++-
 drivers/mtd/mtdchar.c               |   54 +
 drivers/mtd/mtdcore.c               |   48 +-
 drivers/mtd/mtdpart.c               |    6 +
 drivers/mtd/nand/Kconfig            |   18 +-
 drivers/mtd/nand/Makefile           |    1 +
 drivers/mtd/nand/nand_base.c        |  230 +++-
 drivers/mtd/nand/nand_ids.c         |   24 +-
 drivers/mtd/nand/nandsim.c          |    2 +-
 drivers/mtd/nand/smp8xxx_nand.c     | 1974 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/map.h             |    1 +
 include/linux/mtd/mtd.h             |    6 +
 include/linux/mtd/nand.h            |   10 +
 17 files changed, 2776 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 27143e042af5..a2661a490f3c 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -22,9 +22,21 @@ config MTD_TESTS
 
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
@@ -75,7 +87,7 @@ endif # MTD_REDBOOT_PARTS
 
 config MTD_CMDLINE_PARTS
 	bool "Command line partition table parsing"
-	depends on MTD = "y"
+	depends on MTD = "y" && !XENV_PARTITION
 	---help---
 	  Allow generic configuration of the MTD partition tables via the kernel
 	  command line. Multiple flash resources are supported for hardware where
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d02592e6a0f0..20563518fdd9 100644
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
@@ -1934,7 +2050,12 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
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
index 21b0b713cacb..b6de1b0db528 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -21,6 +21,44 @@
 #include <linux/mtd/concat.h>
 #include <linux/io.h>
 
+#if defined(CONFIG_TANGOX) && defined(CONFIG_TANGOX_XENV_READ)
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
@@ -33,6 +71,29 @@ struct physmap_flash_info {
 
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
@@ -57,7 +118,7 @@ static int physmap_flash_remove(struct platform_device *dev)
 
 	if (physmap_data->exit)
 		physmap_data->exit(dev);
-
+#endif
 	return 0;
 }
 
@@ -93,14 +154,128 @@ static const char *rom_probe_types[] = {
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
@@ -199,6 +374,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 err_out:
 	physmap_flash_remove(dev);
 	return err;
+#endif /* CONFIG_TANGOX && CONFIG_TANGOX_XENV_READ */
 }
 
 #ifdef CONFIG_PM
@@ -218,7 +394,9 @@ static void physmap_flash_shutdown(struct platform_device *dev)
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
@@ -261,11 +439,20 @@ static int __init physmap_init(void)
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
index c837507dfb1c..83085b6169d6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -250,6 +250,49 @@ static ssize_t mtd_name_show(struct device *dev,
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
@@ -260,6 +303,10 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_oobsize.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
+	&dev_attr_nand_type.attr,
+	&dev_attr_nand_manufacturer.attr,
+	&dev_attr_nand_id.attr,
+	&dev_attr_onfi_version.attr,
 	NULL,
 };
 
@@ -321,7 +368,6 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mtd->index = i;
 	mtd->usecount = 0;
-
 	if (is_power_of_2(mtd->erasesize))
 		mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
 	else
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index bf24aa77175d..2e8ba4091dbb 100644
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
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 7d17cecad69d..e27256885ec1 100644
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
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index d4b4d8739bd8..1a2ce2cca9f6 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MTD_NAND_SPIA)		+= spia.o
 obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
 obj-$(CONFIG_MTD_NAND_AUTCPU12)		+= autcpu12.o
 obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
+obj-$(CONFIG_MTD_NAND_TANGOX)		+= smp8xxx_nand.o
 obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
 obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
 obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)	+= ppchameleonevb.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index eb9f5fb02eef..7a98ccef937c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -47,7 +47,10 @@
 #include <linux/bitops.h>
 #include <linux/leds.h>
 #include <linux/io.h>
+
+#ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
+#endif
 
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
@@ -64,8 +67,11 @@ static struct nand_ecclayout nand_oob_16 = {
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
@@ -75,8 +81,11 @@ static struct nand_ecclayout nand_oob_64 = {
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
 };
 
 static struct nand_ecclayout nand_oob_128 = {
@@ -123,6 +132,12 @@ static int check_offs_len(struct mtd_info *mtd,
 		ret = -EINVAL;
 	}
 
+	/* Do not allow past end of device */
+	if (ofs + len > mtd->size) {
+		pr_debug( "%s: Past end of device\n",__func__);
+		ret = -EINVAL;
+	}
+
 	return ret;
 }
 
@@ -646,7 +661,11 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	 * Apply this short delay always to ensure that we do wait tWB in
 	 * any case on any machine.
 	 */
+#ifdef CONFIG_TANGOX
+	udelay(1); /* needs to make it much longer than tWB */
+#else
 	ndelay(100);
+#endif
 
 	nand_wait_ready(mtd);
 }
@@ -768,7 +787,11 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	 * Apply this short delay always to ensure that we do wait tWB in
 	 * any case on any machine.
 	 */
+#ifdef CONFIG_TANGOX
+	udelay(1); /* needs to make it much longer than tWB */
+#else
 	ndelay(100);
+#endif
 
 	nand_wait_ready(mtd);
 }
@@ -803,6 +826,7 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
 	spinlock_t *lock = &chip->controller->lock;
 	wait_queue_head_t *wq = &chip->controller->wq;
 	DECLARE_WAITQUEUE(wait, current);
+
 retry:
 	spin_lock(lock);
 
@@ -882,7 +906,11 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
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
@@ -1493,15 +1521,18 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 		if (realpage != chip->pagebuf || oob) {
 			bufpoi = aligned ? buf : chip->buffers->databuf;
 
+#if defined(CONFIG_TANGOX)
 			if (likely(sndcmd)) {
 				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
 				sndcmd = 0;
 			}
+#endif
 
 			/* Now read the page into the buffer */
-			if (unlikely(ops->mode == MTD_OPS_RAW))
+			if (unlikely(ops->mode == MTD_OPS_RAW)){
 				ret = chip->ecc.read_page_raw(mtd, chip,
 							      bufpoi, page);
+			}
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
 							col, bytes, bufpoi);
@@ -1614,6 +1645,12 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
+	/* Do not allow reads past end of device */
+	if ((from + len) > mtd->size)
+		return -EINVAL;
+	if (!len)
+		return 0;
+
 	nand_get_device(chip, mtd, FL_READING);
 	ops.len = len;
 	ops.datbuf = buf;
@@ -2541,6 +2578,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	struct nand_chip *chip = mtd->priv;
 	loff_t rewrite_bbt[NAND_MAX_CHIPS] = {0};
 	unsigned int bbt_masked_page = 0xffffffff;
+	int force_erase = 0;
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -2550,6 +2588,9 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
 
+	if (instr->retries == 0x73092215)
+		force_erase = 1;
+
 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_ERASING);
 
@@ -2586,14 +2627,16 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
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
@@ -2713,6 +2756,9 @@ static void nand_sync(struct mtd_info *mtd)
  */
 static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
+	/* Check for invalid offset */
+	if (offs > mtd->size)
+		return -EINVAL;
 	return nand_block_checkbad(mtd, offs, 1, 0);
 }
 
@@ -2851,6 +2897,22 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -2860,6 +2922,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 			break;
 		}
 	}
+#endif
 
 	if (i == 3)
 		return 0;
@@ -2888,16 +2951,29 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -2915,6 +2991,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	int i, maf_idx;
 	u8 id_data[8];
 	int ret;
+	char onfi_version[3];
 
 	/* Select the device */
 	chip->select_chip(mtd, 0);
@@ -2941,7 +3018,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < 8; i++)
 		id_data[i] = chip->read_byte(mtd);
 
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
@@ -2954,12 +3031,12 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
@@ -2973,7 +3050,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	for (i = 0; i < 8; i++)
 		id_data[i] = chip->read_byte(mtd);
 
-	if (!type->name)
+	if ((!type->name) || (!type->id))
 		return ERR_PTR(-ENODEV);
 
 	if (!mtd->name)
@@ -2995,14 +3072,17 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
@@ -3026,19 +3106,47 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
 	} else {
 		/*
@@ -3062,8 +3170,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
@@ -3129,10 +3238,14 @@ ident_done:
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
@@ -3141,6 +3254,7 @@ ident_done:
 			 *maf_id == NAND_MFR_MICRON))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
 		chip->erase_cmd = multi_erase_cmd;
@@ -3156,7 +3270,42 @@ ident_done:
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
@@ -3176,6 +3325,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	int i, busw, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
+	int err;
 
 	/* Get buswidth to select the correct functions */
 	busw = chip->options & NAND_BUSWIDTH_16;
@@ -3190,7 +3340,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
 		chip->select_chip(mtd, -1);
-		return PTR_ERR(type);
+		err = PTR_ERR(type);
+		goto out_error;
 	}
 
 	/* Check for a chip array */
@@ -3212,7 +3363,20 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
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
 
@@ -3259,6 +3423,19 @@ int nand_scan_tail(struct mtd_info *mtd)
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
@@ -3526,6 +3703,7 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 	ret = nand_scan_ident(mtd, maxchips, NULL);
 	if (!ret)
 		ret = nand_scan_tail(mtd);
+
 	return ret;
 }
 EXPORT_SYMBOL(nand_scan);
@@ -3552,6 +3730,10 @@ void nand_release(struct mtd_info *mtd)
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
index af4fe8ca7b5e..2f14ff5efb4c 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -107,22 +107,26 @@ struct nand_flash_dev nand_flash_ids[] = {
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
@@ -135,6 +139,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
 
 	/* 256 Gigabit */
+	{"NAND 32GiB 3,3V 8-bit",	0xA8, 0, 32768, 0, LP_OPTIONS},
 	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
 	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
 	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},
@@ -161,7 +166,22 @@ struct nand_flash_dev nand_flash_ids[] = {
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
+
+	/*
+	 * Terminates the table
+	 */
+	{NULL, },
 };
 
 /*
@@ -178,6 +198,8 @@ struct nand_manufacturers nand_manuf_ids[] = {
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
diff --git a/drivers/mtd/nand/smp8xxx_nand.c b/drivers/mtd/nand/smp8xxx_nand.c
new file mode 100644
index 000000000000..769144ffca44
--- /dev/null
+++ b/drivers/mtd/nand/smp8xxx_nand.c
@@ -0,0 +1,1974 @@
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/ioport.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/sched.h>
+#include <linux/ctype.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/partitions.h>
+#include <linux/dma-mapping.h>
+
+#include <asm/io.h>
+
+#include <mach/rmdefs.h>
+#include <mach/tango4.h>
+#include <mach/tango4api.h>
+
+/**
+	NAND access register
+*/
+#define SMP8XXX_REG_CMD				0
+#define SMP8XXX_REG_ADDR			4
+#define SMP8XXX_REG_DATA			8
+
+#define tReset					5 //us
+
+#define PB_IORDY	0x80000000
+
+/* Enabling AUTOPIO operations */
+#define USE_AUTOPIO
+/* Enabling CTRLER specific IRQ */
+#define USE_CTRLER_IRQ
+
+enum PAD_MODES
+{
+	PAD_MODE_PB,
+	PAD_MODE_MLC
+};
+
+enum nand_controller
+{
+    PB_NAND_CTRLER = 0,
+    MLC_NAND_CTRLER,
+    MLC2_NAND_CTRLER
+};
+
+#define STR_NAND_CONTROLLER_TYPE(x)	(x == PB_NAND_CTRLER)?		"PB Controller":	\
+									(x == MLC_NAND_CTRLER)?		"MLC Controller":	\
+									(x == MLC2_NAND_CTRLER)?	"MLC2 Controller": "Unknown Controller"
+
+static enum nand_controller controller_type = MLC_NAND_CTRLER; /* use new controller as default */
+static int max_page_shift = 13;	/* up to 8KB page */
+
+/* Definitions used by new controller */
+#define MAXPAGES 16
+/**
+	New NAND interface
+ */
+#define MLC_CHA_REG 				0x4400
+#define MLC_CHB_REG 				0x4440
+#define MLC_CHA_MEM 				0x4800
+#define MLC_CHB_MEM 				0x4a00
+#define MLC_ECCREPORT_OFFSET 		0x1c0
+
+#define MLC2_CHA_REG				0xC000
+#define MLC2_CHB_REG				0xC040
+#define MLC2_CHA_MEM				0xD000
+#define MLC2_CHB_MEM				0xD800
+#define MLC2_ECCREPORT_OFFSET		(MLC_ECCREPORT_OFFSET)
+
+/* channnel A/B are tied to CS0/1 */
+static unsigned int chx_reg[2];
+static unsigned int chx_mem[2];
+static const unsigned int sbox_tgt[2] = { SBOX_PCIMASTER, SBOX_PCISLAVE };
+
+#define STATUS_REG(b)		((b) + 0x0)
+#define FLASH_CMD(b)		((b) + 0x4)
+#define DEVICE_CFG(b)		((b) + 0x8)
+#define TIMING1(b)			((b) + 0xc)
+#define TIMING2(b)			((b) + 0x10)
+#define XFER_CFG(b)			((b) + 0x14)
+#define PACKET_0_CFG(b)		((b) + 0x18)
+#define PACKET_N_CFG(b)		((b) + 0x1c)
+#define BAD_BLOCK_CFG(b)	((b) + 0x20)
+#define ADD_PAGE(b)			((b) + 0x24)
+#define ADD_OFFSET(b)		((b) + 0x28)
+
+/**
+	gbus access micro
+*/
+#define RD_HOST_REG32(r)	\
+	gbus_read_reg32(REG_BASE_host_interface + (r))
+
+#define WR_HOST_REG32(r, v)	\
+		gbus_write_reg32(REG_BASE_host_interface + (r), (v))
+
+#define RD_HOST_REG16(r)	\
+		gbus_read_reg16(REG_BASE_host_interface + (r))
+
+#define WR_HOST_REG16(r, v) \
+		gbus_write_reg16(REG_BASE_host_interface + (r), (v))
+
+#define RD_HOST_REG8(r)	\
+		gbus_read_reg8(REG_BASE_host_interface + (r))
+
+#define WR_HOST_REG8(r, v)	\
+		gbus_write_reg8(REG_BASE_host_interface + (r), (v))
+
+#define SMP_NAND_DEV_NAME	"tangox-nand"
+#define SMP_NAND_DRV_VERSION	"0.3"
+
+/**
+	PB Chip Select
+*/
+#define MAX_CS			8	/* Maximum number of CS */
+#define MAX_PARTITIONS	16	/* Maximum partitions per CS */
+#define MAX_NAND_DEVS	8	/* Maximum number of NAND devices, needs to be in sync with the gap in nand_ids.c */
+
+#if defined(CONFIG_XENV_PARTITION)
+/* XENV keys to be used */
+#define CS_RESERVED		"a.cs%d_rsvd_pblk"
+#define CS_PARTS		"a.cs%d_pblk_parts"
+#define CS_PART_SIZE	"a.cs%d_pblk_part%d_size"
+#define CS_PART_OFFSET	"a.cs%d_pblk_part%d_offset"
+#define CS_PART_NAME	"a.cs%d_pblk_part%d_name"
+#endif
+
+#define CS_TIMING1	"a.cs%d_nand_timing1"
+#define CS_TIMING2	"a.cs%d_nand_timing2"
+#define CS_DEVCFG	"a.cs%d_nand_devcfg"
+#define NAND_PARAM	"a.nandpart%d_params"
+#define HIGH_32		"_hi"
+
+
+#define BUFSIZE		256
+
+
+/* Prototype of routine that gets XENV and others .. */
+unsigned long tangox_chip_id(void);
+extern int zxenv_get(char *recordname, void *dst, u32 *datasize);
+extern unsigned long tangox_virt_to_phys(void *pvaddr);
+
+/* Internal data structure */
+static struct mtd_info smp8xxx_mtds[MAX_CS];
+static struct nand_chip smp8xxx_chips[MAX_CS];
+
+#if defined(CONFIG_XENV_PARTITION)
+static struct mtd_partition *smp8xxx_partitions[MAX_CS];
+#elif defined(CONFIG_MTD_CMDLINE_PARTS)
+static const char *part_probes[] = { "cmdlinepart", NULL };
+#else
+static struct mtd_partition smp8xxx_partitions[] = {
+	{
+		name	:	SMP_NAND_DEV_NAME,
+		offset	:	0,
+		size	:	MTDPART_SIZ_FULL
+	}
+};
+#endif
+
+static struct nand_hw_control smp8xxx_hw_control;
+static int cs_avail[MAX_CS], cs_parts[MAX_CS];
+static int cs_offset;
+static unsigned long chip_szs[MAX_CS] = { 0, };
+static int max_chips = MAX_CS;
+static unsigned long chip_id = 0x8670;
+module_param_array(chip_szs, ulong, &max_chips, 0000);
+MODULE_PARM_DESC(chip_szs, "Overridden value of chip sizes");
+
+struct chip_private
+{
+	unsigned int cs;	/* chip select */
+	uint8_t *bbuf;		/* bounce buffer */
+};
+
+static struct chip_private chip_privs[MAX_CS];
+
+/* OOB layout for devices on new controller */
+/* for 512B page, typically with 16B OOB, and we use 4bit ECC */
+static struct nand_ecclayout smp8xxx_nand_ecclayout512_16_4 = { // may not be supported
+	.eccbytes = 7,
+	.eccpos = {6, 7, 8, 9, 10, 11, 12},
+	.oobfree = {
+		{.offset = 13, .length = 3}
+	},
+};
+
+/* for 2KB page, typically with 64B OOB, and we use 8bit ECC */
+static struct nand_ecclayout smp8xxx_nand_ecclayout2048_64_8 = {
+	.eccbytes = 13,
+	.eccpos = {49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61},
+	.oobfree = {
+		{.offset = 62, .length = 2}
+	},
+};
+
+/* MLC2 Nand Controller */
+static struct nand_ecclayout smp8xxx_nand_ecclayout2048_64_14 = {
+	.eccbytes = 27,
+	.eccpos = {	37, 38, 39, 40, 41, 42, 43, 44,
+				45, 46, 47, 48, 49, 50, 51, 52,
+				53, 54, 55, 56, 57, 58, 59, 60,
+				61, 62, 63
+			  },
+	.oobfree = {
+		{.offset = 0, .length = 0}
+	},
+};
+
+
+/* for 4KB page, typically with 128B OOB, and we use 9bit ECC */
+static struct nand_ecclayout smp8xxx_nand_ecclayout4096_128_9 = {
+	.eccbytes = 15,
+	.eccpos = {110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124},
+	.oobfree = {
+		{.offset = 125, .length = 3}
+	},
+};
+
+/* for 4KB page, typically with 218B OOB or above, and we use 16bit ECC */
+static struct nand_ecclayout smp8xxx_nand_ecclayout4096_218_16 = {
+	.eccbytes = 26,
+	.eccpos = {187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212},
+	.oobfree = {
+		{.offset = 213, .length = 5}
+	},
+};
+
+/* for 4KB page, typically with 232B OOB or above, and we use 27bit ECC */
+static struct nand_ecclayout smp8xxx_nand_ecclayout4096_232_51 = {
+	.eccbytes = 51,
+	.eccpos = { 163, 164, 165, 166, 167, 168, 169, 170, 171, 172,
+                173, 174, 175, 176, 177, 178, 179, 180, 181, 182,
+                183, 184, 185, 186, 187, 188, 189, 190, 191, 192,
+                193, 194, 195, 196, 197, 198, 199, 200, 201, 202,
+                203, 204, 205, 206, 207, 209, 210, 211, 212, 213,
+                214
+               },
+	.oobfree = {
+		{.offset = 214, .length = 18}
+	},
+};
+
+/* for 8KB page, typically with 448 OOB, and we use 16bit ECC */
+static struct nand_ecclayout smp8xxx_nand_ecclayout8192_448_16 = {
+	.eccbytes = 26,
+	.eccpos = {395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405 ,406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420},
+	.oobfree = {
+		{.offset = 421, .length = 27}
+	}
+};
+
+static struct nand_ecclayout smp8xxx_nand_ecclayout8192_448_53 = {
+    .eccbytes = 53,
+	.eccpos = { 381, 382, 383, 384, 385, 386, 387, 388, 389, 390,
+                391, 392, 393, 394, 395, 396, 397, 398, 399, 400,
+                401, 402, 403, 404, 405, 406, 407, 408, 409, 410,
+                411, 412, 413, 414, 415, 416, 417, 418, 419, 420,
+                421, 422, 423, 424, 425, 426, 427, 428, 429, 430,
+                431, 432, 433
+            },
+	.oobfree = {
+		{.offset = 434, .length = 14}
+	}
+};
+
+/* OOB layout for devices on old controller */
+/* for 512B page, typically with 16B OOB */
+static struct nand_ecclayout smp8xxx_oobinfo_16 = {
+	.eccbytes = 3,
+	.eccpos = {10, 11, 12},
+	.oobfree = {
+		{.offset = 6, .length = 4},
+	},
+};
+
+/* for 2KB page, typically with 64B OOB */
+static struct nand_ecclayout smp8xxx_oobinfo_64 = {
+	.eccbytes = 12,
+	.eccpos = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21},
+	.oobfree = {
+		{.offset = 6, .length = 4},
+		{.offset = 22, .length = 38},
+	},
+};
+
+
+/*
+ * MTD structure for NAND controller
+ */
+static const char *smp_nand_devname = SMP_NAND_DEV_NAME;
+
+/* sets pad mode */
+static inline void smp8xxx_set_padmode( int pad_mode )
+{
+    /* filter out unnecessary setup */
+    if (( (chip_id & 0x0000ff00) != 0x8700 ) && ( (chip_id & 0x0000ff00) != 0x2400 ))
+        return;
+
+	switch( pad_mode )
+	{
+		case PAD_MODE_PB:
+			gbus_write_reg32(REG_BASE_host_interface + PB_padmode_pbusB, 0x00000000);
+			break;
+
+		case PAD_MODE_MLC:
+			gbus_write_reg32(REG_BASE_host_interface + PB_padmode_pbusB, 0x80000000);
+			break;
+
+		default:
+			break;
+	}
+}
+
+
+/**
+ * smp8xxx_read_byte -  read one byte from the chip
+ * @mtd:	MTD device structure
+ *
+ *  read function for 8bit buswidth
+ */
+static u_char smp8xxx_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+
+	smp8xxx_set_padmode( PAD_MODE_PB );
+
+	return RD_HOST_REG8((u32)this->IO_ADDR_R + SMP8XXX_REG_DATA);
+}
+
+#ifdef USE_AUTOPIO
+static int mbus_done = 0;
+static DECLARE_WAIT_QUEUE_HEAD(mbus_wq);
+static void pbi_mbus_intr(int irq, void *arg)
+{
+	mbus_done = 1;
+	wake_up_interruptible(&mbus_wq);
+}
+#endif
+
+/**
+ * smp8xxx_write_buf -  write buffer to chip
+ * @mtd:	MTD device structure
+ * @buf:	data buffer
+ * @len:	number of bytes to write
+ *
+ *  write function for 8bit buswidth
+ */
+static void smp8xxx_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+	int i;
+	struct nand_chip *this = (struct nand_chip *)mtd->priv;
+
+#ifdef USE_AUTOPIO
+	unsigned int cs = ((struct chip_private *)this->priv)->cs;
+	unsigned long g_mbus_reg = 0;
+	dma_addr_t dma_addr;
+
+	if ((in_atomic()) || (len <= mtd->oobsize))
+		goto pio;
+#ifdef CONFIG_MIPS
+	else if ((((u32)buf) < KSEG0) || (((u32)buf) >= KSEG2))
+		goto pio;
+#elif CONFIG_ARM
+	else if (!virt_addr_valid(buf))
+		goto pio;
+#endif
+	else if (em86xx_mbus_alloc_dma(SBOX_IDEFLASH, 0, &g_mbus_reg, NULL, 0))
+		goto pio;
+
+	/* check and set pad mode */
+	smp8xxx_set_padmode( PAD_MODE_MLC );
+
+	dma_addr = dma_map_single(NULL, (void *)buf, len, DMA_TO_DEVICE);
+
+	gbus_write_reg32(REG_BASE_host_interface + PB_automode_control + 4, 0);
+	gbus_write_reg32(REG_BASE_host_interface + PB_automode_start_address, SMP8XXX_REG_DATA);
+	/* 22:nand 17:8bit width 16:DRAM to PB len:number of PB accesses */
+	gbus_write_reg32(REG_BASE_host_interface + PB_automode_control, (cs << 24) | (2 << 22) | (1 << 17) | (0 << 16) | len);
+
+	em86xx_mbus_setup_dma(g_mbus_reg, dma_addr, len, pbi_mbus_intr, NULL, 1);
+
+	wait_event_interruptible(mbus_wq, mbus_done != 0);
+	while (gbus_read_reg32(REG_BASE_host_interface + PB_automode_control) & 0xffff)
+		; /* wait for AUTOPIO completion */
+	mbus_done = 0;
+
+	em86xx_mbus_free_dma(g_mbus_reg, SBOX_IDEFLASH);
+	dma_unmap_single(NULL, dma_addr, len, DMA_TO_DEVICE);
+
+	goto done;
+
+pio:
+#endif
+	/* set pad mode to pb */
+	smp8xxx_set_padmode( PAD_MODE_PB );
+
+	for (i = 0; i < len; i++)
+		WR_HOST_REG8((u32)this->IO_ADDR_W + SMP8XXX_REG_DATA, buf[i]);
+
+#ifdef USE_AUTOPIO
+done:
+#endif
+	return;
+}
+
+/**
+ * smp8xxx_read_buf -  read chip data into buffer
+ * @mtd:	MTD device structure
+ * @buf:	buffer to store data
+ * @len:	number of bytes to read
+ *
+ *  read function for 8bit buswith
+ */
+static void smp8xxx_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+{
+	int i;
+	struct nand_chip *this = mtd->priv;
+
+#ifdef USE_AUTOPIO
+	unsigned int cs = ((struct chip_private *)this->priv)->cs;
+	unsigned long g_mbus_reg = 0;
+	dma_addr_t dma_addr;
+
+	if ((in_atomic()) || (len <= mtd->oobsize))
+		goto pio;
+#ifdef CONFIG_MIPS
+	else if ((((u32)buf) < KSEG0) || (((u32)buf) >= KSEG2))
+		goto pio;
+#elif CONFIG_ARM
+	else if (!virt_addr_valid(buf))
+		goto pio;
+#endif
+	else if (em86xx_mbus_alloc_dma(SBOX_IDEFLASH, 1, &g_mbus_reg, NULL, 0))
+		goto pio;
+
+	/* check and set pad mode */
+	smp8xxx_set_padmode( PAD_MODE_MLC );
+
+	dma_addr = dma_map_single(NULL, (void *)buf, len, DMA_FROM_DEVICE);
+
+	gbus_write_reg32(REG_BASE_host_interface + PB_automode_control + 4, 0);
+	gbus_write_reg32(REG_BASE_host_interface + PB_automode_start_address, SMP8XXX_REG_DATA);
+	/* 22:nand 17:8bit width 16:DRAM to PB len:number of PB accesses */
+	gbus_write_reg32(REG_BASE_host_interface + PB_automode_control, (cs << 24) | (2 << 22) | (1 << 17) | (1 << 16) | len);
+
+	em86xx_mbus_setup_dma(g_mbus_reg, dma_addr, len, pbi_mbus_intr, NULL, 1);
+
+	wait_event_interruptible(mbus_wq, mbus_done != 0);
+	while (gbus_read_reg32(REG_BASE_host_interface + PB_automode_control) & 0xffff)
+		; /* wait for AUTOPIO completion */
+	mbus_done = 0;
+
+	em86xx_mbus_free_dma(g_mbus_reg, SBOX_IDEFLASH);
+	dma_unmap_single(NULL, dma_addr, len, DMA_FROM_DEVICE);
+
+	goto done;
+pio:
+#endif
+
+	/* set pad mode to pb */
+	smp8xxx_set_padmode( PAD_MODE_PB );
+
+	for (i = 0; i < len; i++)
+		buf[i] = RD_HOST_REG8((u32)this->IO_ADDR_R + SMP8XXX_REG_DATA);
+
+#ifdef USE_AUTOPIO
+done:
+#endif
+	return;
+}
+
+static void smp8xxx_nand_bug(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct mtd_ecc_stats ecc_stats = mtd->ecc_stats;
+	unsigned int cs = ((struct chip_private *)chip->priv)->cs;
+	printk("[%s] cs = %d, options = 0x%x\n", smp_nand_devname, cs, chip->options);
+	printk("[%s] ecc stats: corrected = %d, failed = %d, badblocks = %d, bbtblocks = %d\n",
+		smp_nand_devname, ecc_stats.corrected, ecc_stats.failed, ecc_stats.badblocks, ecc_stats.bbtblocks);
+	printk("[%s] to be resolved, here's the call-stack: \n", smp_nand_devname);
+	dump_stack();
+}
+
+static int smp8xxx_nand_bug_calculate(struct mtd_info *mtd, const uint8_t *dat, uint8_t *ecc_code)
+{
+	smp8xxx_nand_bug(mtd);
+	return 0;	/* should have no need to calculate */
+}
+
+static int smp8xxx_nand_bug_correct(struct mtd_info *mtd, uint8_t *dat, uint8_t *read_ecc, uint8_t *calc_ecc)
+{
+	smp8xxx_nand_bug(mtd);
+	return 0;	/* should have no need to correct */
+}
+
+static void smp8xxx_nand_hwctl(struct mtd_info *mtd, int mode)
+{
+	register struct nand_chip *chip = mtd->priv;
+	unsigned int cs = ((struct chip_private *)chip->priv)->cs;
+	while ((RD_HOST_REG32(STATUS_REG(chx_reg[cs])) & 0x80000000) == 0)
+		; /* unlikely it's not ready */
+}
+
+static void nand_command(struct mtd_info *mtd, unsigned int command, int column, int page_addr)
+{
+	register struct nand_chip *chip = mtd->priv;
+	int ctrl = NAND_CTRL_CLE | NAND_CTRL_CHANGE;
+
+	/*
+	 * Write out the command to the device.
+	 */
+	if (command == NAND_CMD_SEQIN) {
+		int readcmd;
+		if (column >= mtd->writesize) {
+			/* OOB area */
+			column -= mtd->writesize;
+			readcmd = NAND_CMD_READOOB;
+		} else if (column < 256) {
+			/* First 256 bytes --> READ0 */
+			readcmd = NAND_CMD_READ0;
+		} else {
+			column -= 256;
+			readcmd = NAND_CMD_READ1;
+		}
+		chip->cmd_ctrl(mtd, readcmd, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
+	}
+	chip->cmd_ctrl(mtd, command, ctrl);
+
+	/*
+	 * Address cycle, when necessary
+	 */
+	ctrl = NAND_CTRL_ALE | NAND_CTRL_CHANGE;
+	/* Serially input address */
+	if (column != -1) {
+		/* Adjust columns for 16 bit buswidth */
+		if (chip->options & NAND_BUSWIDTH_16)
+			column >>= 1;
+		chip->cmd_ctrl(mtd, column, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
+	}
+	if (page_addr != -1) {
+		chip->cmd_ctrl(mtd, page_addr, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
+		chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);
+		/* One more address cycle for devices > 32MiB */
+		if (chip->chipsize > (32 << 20))
+			chip->cmd_ctrl(mtd, page_addr >> 16, ctrl);
+	}
+	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+
+	/*
+	 * program and erase have their own busy handlers
+	 * status and sequential in needs no delay
+	 */
+	switch (command) {
+
+	case NAND_CMD_PAGEPROG:
+	case NAND_CMD_ERASE1:
+	case NAND_CMD_ERASE2:
+	case NAND_CMD_SEQIN:
+	case NAND_CMD_STATUS:
+		return;
+
+	case NAND_CMD_RESET:
+		if (chip->dev_ready)
+			break;
+		udelay(chip->chip_delay);
+		chip->cmd_ctrl(mtd, NAND_CMD_STATUS, NAND_CTRL_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+		while (!(chip->read_byte(mtd) & NAND_STATUS_READY)) ;
+		return;
+
+		/* This applies to read commands */
+	default:
+		/*
+		 * If we don't have access to the busy pin, we apply the given
+		 * command delay
+		 */
+		if (!chip->dev_ready) {
+			udelay(chip->chip_delay);
+			return;
+		}
+	}
+	/* Apply this short delay always to ensure that we do wait tWB in
+	 * any case on any machine. */
+	udelay(1); /* needs to make it much longer than tWB */
+
+	nand_wait_ready(mtd);
+}
+
+static void nand_command_lp(struct mtd_info *mtd, unsigned int command, int column, int page_addr)
+{
+	register struct nand_chip *chip = mtd->priv;
+
+	/* Emulate NAND_CMD_READOOB */
+	if (command == NAND_CMD_READOOB) {
+		column += mtd->writesize;
+		command = NAND_CMD_READ0;
+	}
+
+	/* Command latch cycle */
+	chip->cmd_ctrl(mtd, command & 0xff, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+
+	if ((column != -1) || (page_addr != -1)) {
+		int ctrl = NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;
+
+		/* Serially input address */
+		if (column != -1) {
+			/* Adjust columns for 16 bit buswidth */
+			if (chip->options & NAND_BUSWIDTH_16)
+				column >>= 1;
+			chip->cmd_ctrl(mtd, column, ctrl);
+			ctrl &= ~NAND_CTRL_CHANGE;
+			chip->cmd_ctrl(mtd, column >> 8, ctrl);
+		}
+		if (page_addr != -1) {
+			chip->cmd_ctrl(mtd, page_addr, ctrl);
+			chip->cmd_ctrl(mtd, page_addr >> 8, NAND_NCE | NAND_ALE);
+			/* One more address cycle for devices > 128MiB */
+			if (chip->chipsize > (128 << 20))
+				chip->cmd_ctrl(mtd, page_addr >> 16, NAND_NCE | NAND_ALE);
+		}
+	}
+	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+
+	/*
+	 * program and erase have their own busy handlers
+	 * status, sequential in, and deplete1 need no delay
+	 */
+	switch (command) {
+
+	case NAND_CMD_CACHEDPROG:
+	case NAND_CMD_PAGEPROG:
+	case NAND_CMD_ERASE1:
+	case NAND_CMD_ERASE2:
+	case NAND_CMD_SEQIN:
+	case NAND_CMD_RNDIN:
+	case NAND_CMD_STATUS:
+	case NAND_CMD_DEPLETE1:
+		return;
+
+	/*
+	 * read error status commands require only a short delay
+	 */
+	case NAND_CMD_STATUS_ERROR:
+	case NAND_CMD_STATUS_ERROR0:
+	case NAND_CMD_STATUS_ERROR1:
+	case NAND_CMD_STATUS_ERROR2:
+	case NAND_CMD_STATUS_ERROR3:
+		udelay(chip->chip_delay);
+		return;
+
+	case NAND_CMD_RESET:
+		if (chip->dev_ready)
+			break;
+		udelay(chip->chip_delay);
+		chip->cmd_ctrl(mtd, NAND_CMD_STATUS, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+		while (!(chip->read_byte(mtd) & NAND_STATUS_READY))
+			;
+		return;
+
+	case NAND_CMD_RNDOUT:
+		/* No ready / busy check necessary */
+		chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+		return;
+
+	case NAND_CMD_READ0:
+		chip->cmd_ctrl(mtd, NAND_CMD_READSTART, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+
+		/* This applies to read commands */
+	default:
+		/*
+		 * If we don't have access to the busy pin, we apply the given
+		 * command delay
+		 */
+		if (!chip->dev_ready) {
+			udelay(chip->chip_delay);
+			return;
+		}
+	}
+
+	/* Apply this short delay always to ensure that we do wait tWB in
+	 * any case on any machine. */
+	udelay(10); /* needs to make it much longer than tWB */
+
+	nand_wait_ready(mtd);
+}
+
+/**
+ * smp8xxx_command - Send command to NAND device
+ * @mtd:	MTD device structure
+ * @command:	the command to be sent
+ * @column:	the column address for this command, -1 if none
+ * @page_addr:	the page address for this command, -1 if none
+ *
+ * Send command to NAND device. This function is used for small and large page
+ * devices (256/512/2K/4K/8K Bytes per page)
+ */
+static void smp8xxx_command(struct mtd_info *mtd, unsigned int command, int column, int page_addr)
+{
+	register struct nand_chip *chip = mtd->priv;
+	unsigned int cs = ((struct chip_private *)chip->priv)->cs;
+
+	switch(mtd->writesize) {
+	case 512:
+		/* 512B writesize may not be supported by current nand filesystems */
+		nand_command(mtd, command, column, page_addr);
+		break;
+	case 2048:
+	case 4096:
+	case 8192:
+		nand_command_lp(mtd, command, column, page_addr);
+		break;
+	default: /* very unlikely */
+		smp8xxx_nand_bug(mtd);
+		break;
+	}
+
+	/* set New Controller address */
+	WR_HOST_REG32(ADD_PAGE(chx_reg[cs]), page_addr); // page address
+	WR_HOST_REG32(ADD_OFFSET(chx_reg[cs]), 0);	 // offset always 0
+}
+
+/*
+ * Function for register configurations
+ */
+static int smp8xxx_packet_config(int page_size, int spare_size, int cs)
+{
+	unsigned int csel = cs << 24;
+	int ret = -1;
+
+	if (controller_type == MLC2_NAND_CTRLER)
+	{
+		/* 2K packet */
+		switch(page_size)
+		{
+			case 512:
+				/* TODO */
+				ret = 0;
+				break;
+			case 2048:
+                WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x00010204 | csel);	//xfer
+                WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x0404000E);		//packet_0
+                WR_HOST_REG32(PACKET_N_CFG(chx_reg[cs]), 0x0400000E);		//packet_N
+                WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x08000006);		//bad_block
+                ret = 0;
+                break;
+			case 4096:
+				WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x00010404 | csel);	//xfer
+				WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x0404001b);		//packet_0
+				WR_HOST_REG32(PACKET_N_CFG(chx_reg[cs]), 0x0400001b);		//packet_N
+				WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x10000006);		//bad_block
+				ret = 0;
+				break;
+			case 8192:
+				WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x00010804 | csel);	//xfer
+				WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x0404001c);		//packet_0
+				WR_HOST_REG32(PACKET_N_CFG(chx_reg[cs]), 0x0400001c);		//packet_N
+				WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x10000006);		//bad_block
+				ret = 0;
+				break;
+		}
+	}
+	else {
+		switch (page_size)
+	    {
+	    case 512:	/* 4 bit ECC per 512B packet */
+		    // May not be supported by current nand filesystems
+		    WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x10010104 | csel);//xfer
+		    WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x02040004);	//packet_0
+		    WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x02040002);	//bad_block
+		    ret = 0;
+		    break;
+
+	    case 2048:	/* 8 bit ECC per 512 packet */
+		    WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x00010404 | csel);//xfer
+		    WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x02040008);	//packet_0
+		    WR_HOST_REG32(PACKET_N_CFG(chx_reg[cs]), 0x02000008);	//packet_N
+		    WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x08000006);	//bad_block
+		    ret = 0;
+		    break;
+
+	    case 4096:	/* 9 or 16 bit ECC per 512 packet depends on OOB size */
+		    if ((spare_size >= 128) && (spare_size < 218)) {
+			    WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x00010804 | csel);//xfer
+			    WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x02040009);	//packet_0
+			    WR_HOST_REG32(PACKET_N_CFG(chx_reg[cs]), 0x02000009);	//packet_N
+			    WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x10000001);	//bad_block
+			    ret = 0;
+		    } else if (spare_size >= 218) {
+			    WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x00010804 | csel);//xfer
+			    WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x02040010);	//packet_0
+			    WR_HOST_REG32(PACKET_N_CFG(chx_reg[cs]), 0x02000010);	//packet_N
+			    WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x10000001);	//bad_block
+			    ret = 0;
+		    }
+		    break;
+
+	    case 8192:	/* 16 bit ECC per 512 packet */
+		    //packet number 16 exceeds amount of reserved bits -
+		    //spec is wrong and is being changed ...
+		    WR_HOST_REG32(XFER_CFG(chx_reg[cs]), 0x00011004 | csel);//xfer
+		    WR_HOST_REG32(PACKET_0_CFG(chx_reg[cs]), 0x02040010);	//packet_0
+		    WR_HOST_REG32(PACKET_N_CFG(chx_reg[cs]), 0x02000010);	//packet_N
+		    WR_HOST_REG32(BAD_BLOCK_CFG(chx_reg[cs]), 0x20000001);	//bad_block
+		    ret = 0;
+		    break;
+	    }
+	}
+
+	if (ret != 0)
+		printk("[%s] unsupported Packet Config on CS%d.\n", SMP_NAND_DEV_NAME, cs);
+
+	return ret;
+}
+
+/* Check ECC correction validity
+ * Return 0 : valid
+ *        1 : valid, error free
+ *        2 : valid, error corrected
+ */
+static int smp8xxx_validecc(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
+	unsigned int cs = ((struct chip_private *)chip->priv)->cs, len = mtd->writesize;
+	unsigned int code = RD_HOST_REG32(chx_mem[cs] + MLC_ECCREPORT_OFFSET) & ((len == 512) ? 0x00ff : 0xffff), mask = ((len == 512) ? 0x80 : 0x8080);
+
+	if (((code & mask) != mask) && (code != 0)) { /* (code == 0) is most likey blank page */
+		if (printk_ratelimit())
+			printk(KERN_WARNING "[%s] ecc error detected (code=0x%x)\n", smp_nand_devname, code);
+
+		return 0;
+	}
+	else {
+		/* check to see if errors are corrected */
+		if ( (code & 0x1f1f) != 0 )
+			return 2;
+	}
+	return 1;
+}
+
+#ifdef USE_CTRLER_IRQ
+static int chx_mbus_done[2] = { 0, 0 };
+static DECLARE_WAIT_QUEUE_HEAD(cha_mbus_wq);
+static DECLARE_WAIT_QUEUE_HEAD(chb_mbus_wq);
+static wait_queue_head_t *wqueues[2] = { &cha_mbus_wq, &chb_mbus_wq };
+static void cha_mbus_intr(int irq, void *arg)
+{
+	chx_mbus_done[0] = 1;
+	wake_up_interruptible(wqueues[0]);
+}
+static void chb_mbus_intr(int irq, void *arg)
+{
+	chx_mbus_done[1] = 1;
+	wake_up_interruptible(wqueues[1]);
+}
+typedef void (*CALLBACK_PTR)(int, void *);
+static CALLBACK_PTR callbacks[2] = { cha_mbus_intr, chb_mbus_intr };
+#endif
+
+/**
+ * smp8xxx_read_page_hwecc - hardware ecc based page write function
+ * @mtd:	MTD device info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer to store read data
+ * @page:	page number
+ */
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,32)
+static int smp8xxx_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buffer)
+#else
+static int smp8xxx_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buffer, int page)
+#endif
+{
+	unsigned int cs = ((struct chip_private *)chip->priv)->cs;
+	int len = mtd->writesize;
+	unsigned long g_mbus_reg = 0;
+	uint8_t *buf = buffer;
+	uint8_t *bbuf = ((struct chip_private *)chip->priv)->bbuf;
+	dma_addr_t dma_addr;
+	int report;
+
+	if ((in_atomic()) || (len <= mtd->oobsize))
+		return -EIO;
+
+#ifdef CONFIG_MIPS
+	if ((((u32)buf) < KSEG0) || (((u32)buf) >= KSEG2)) {
+#elif CONFIG_ARM
+	if (1 /* Shadow Address */) {
+#endif
+		buf = bbuf;	/* use bounce buffer */
+	}
+
+	// Channel A used in soft for CS0 channel B used in soft for CS1
+	if (em86xx_mbus_alloc_dma(sbox_tgt[cs], 1, &g_mbus_reg, NULL, 1) < 0)
+		return -EIO;
+
+	dma_addr = dma_map_single(NULL, (void *)buf, len, DMA_FROM_DEVICE);
+	if (dma_mapping_error(NULL, dma_addr)) {
+		printk(KERN_DEBUG "[%s] dma mapping error\n", SMP_NAND_DEV_NAME);
+	}
+
+	/* set pad muxing */
+    smp8xxx_set_padmode( PAD_MODE_MLC );
+
+	// poll ready status
+	while ((RD_HOST_REG32(STATUS_REG(chx_reg[cs])) & 0x80000000) == 0)
+		; /* unlikely it's not ready */
+
+	// launch New Controller read command
+	WR_HOST_REG32(FLASH_CMD(chx_reg[cs]), 0x1);
+
+#ifdef USE_CTRLER_IRQ
+	em86xx_mbus_setup_dma(g_mbus_reg, dma_addr, len, callbacks[cs], NULL, 1);
+	wait_event_interruptible(*wqueues[cs], chx_mbus_done[cs] != 0);
+#else
+	em86xx_mbus_setup_dma(g_mbus_reg, dma_addr, len, NULL, NULL, 1);
+#endif
+
+	// poll ready status
+	while ((RD_HOST_REG32(STATUS_REG(chx_reg[cs])) & 0x80000000) == 0)
+		; /* wait for completion */
+
+#ifdef USE_CTRLER_IRQ
+	chx_mbus_done[cs] = 0;
+#endif
+
+	em86xx_mbus_free_dma(g_mbus_reg, sbox_tgt[cs]);
+	dma_unmap_single(NULL, dma_addr, len, DMA_FROM_DEVICE);
+
+#ifdef CONFIG_MIPS
+	if (buf == bbuf) {
+#elif CONFIG_ARM
+	if (1 /* Shadow Address */) {
+#endif
+		/* copy back */
+		memcpy(buffer, buf, len);
+	}
+
+	report = smp8xxx_validecc(mtd);
+	switch (report) {
+		case 0: /* fail to correct error */
+			mtd->ecc_stats.failed++;
+			break;
+		case 2: /* error corrected */
+			mtd->ecc_stats.corrected++;
+			break;
+		case 1: /* error free */
+		default:
+			break;
+	}
+
+	return 0;
+}
+
+/**
+ * smp8xxx_write_page_hwecc - hardware ecc based page write function
+ * @mtd:	MTD device info structure
+ * @chip:	nand chip info structure
+ * @buf:	data buffer
+ */
+static void smp8xxx_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip, const uint8_t *buffer)
+{
+	unsigned int cs = ((struct chip_private *)chip->priv)->cs;
+	int len = mtd->writesize;
+	unsigned long g_mbus_reg = 0;
+	uint8_t *buf = (uint8_t *)buffer;
+	uint8_t *bbuf = ((struct chip_private *)chip->priv)->bbuf;
+	dma_addr_t dma_addr;
+
+	if ((in_atomic()) || (len <= mtd->oobsize)) {
+		smp8xxx_nand_bug(mtd);
+		return /* TODO: -EIO? */;
+	}
+
+#ifdef CONFIG_MIPS
+	if ((((u32)buf) < KSEG0) || (((u32)buf) >= KSEG2)) {
+#elif CONFIG_ARM
+	if (1 /* Shadow Address */) {
+#endif
+		buf = bbuf;	/* use bounce buffer */
+		memcpy(buf, buffer, len);
+	}
+
+	// Channel A used in soft for CS0 channel B used in soft for CS1
+	if (em86xx_mbus_alloc_dma(sbox_tgt[cs], 0, &g_mbus_reg, NULL, 1) < 0) {
+		smp8xxx_nand_bug(mtd);
+		return /* TODO: -EIO? */;
+	}
+
+	dma_addr = dma_map_single(NULL, (void *)buf, len, DMA_TO_DEVICE);
+
+	if (dma_mapping_error(NULL, dma_addr)) {
+		printk(KERN_DEBUG "[%s] dma mapping error\n", SMP_NAND_DEV_NAME);
+	}
+
+	 /* set pad muxing */
+	smp8xxx_set_padmode( PAD_MODE_MLC );
+
+	// poll ready status
+	while ((RD_HOST_REG32(STATUS_REG(chx_reg[cs])) & 0x80000000) == 0)
+		; /* unlikely it's not ready */
+
+	// launch New Controller write command
+	WR_HOST_REG32(FLASH_CMD(chx_reg[cs]), 0x2);
+
+#ifdef USE_CTRLER_IRQ
+	em86xx_mbus_setup_dma(g_mbus_reg, dma_addr, len, callbacks[cs], NULL, 1);
+	wait_event_interruptible(*wqueues[cs], chx_mbus_done[cs] != 0);
+#else
+	em86xx_mbus_setup_dma(g_mbus_reg, dma_addr, len, NULL, NULL, 1);
+#endif
+	// poll ready status
+	while ((RD_HOST_REG32(STATUS_REG(chx_reg[cs])) & 0x80000000) == 0)
+		; /* wait for completion */
+
+#ifdef USE_CTRLER_IRQ
+	chx_mbus_done[cs] = 0;
+#endif
+
+	em86xx_mbus_free_dma(g_mbus_reg, sbox_tgt[cs]);
+	dma_unmap_single(NULL, dma_addr, len, DMA_TO_DEVICE);
+
+	return;
+}
+
+/**
+ * smp8xxx_verify_buf -  Verify chip data against buffer
+ * @mtd:	MTD device structure
+ * @buf:	buffer containing the data to compare
+ * @len:	number of bytes to compare
+ *
+ *  verify function for 8bit buswith
+ */
+static int smp8xxx_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
+{
+#ifdef USE_AUTOPIO
+	u_char *tmpbuf = kmalloc(2048, GFP_KERNEL | GFP_DMA);	/* up to 2KB */
+	int ret;
+	if (tmpbuf == NULL)
+		return -ENOMEM;
+	smp8xxx_read_buf(mtd, tmpbuf, len);
+	ret = (memcmp(buf, tmpbuf, len) == 0) ? 0 : -EIO;
+	kfree(tmpbuf);
+	return ret;
+#else
+	int i;
+	struct nand_chip *this = mtd->priv;
+	for (i = 0; i < len; i++) {
+		if (buf[i] != RD_HOST_REG8((u32)this->IO_ADDR_R + SMP8XXX_REG_DATA))
+			return -EIO;
+	}
+	return 0;
+#endif
+}
+
+/* smp8xxx_nand_hwcontrol
+ *
+ * Issue command and address cycles to the chip
+ */
+static void smp8xxx_nand_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
+{
+	register struct nand_chip *this = mtd->priv;
+
+	/* set pad mode to pb */
+	smp8xxx_set_padmode( PAD_MODE_PB );
+
+	if (cmd == NAND_CMD_NONE)
+		return;
+
+	if (ctrl & NAND_CLE)
+		WR_HOST_REG8((u32)this->IO_ADDR_W + SMP8XXX_REG_CMD, cmd & 0xFF);
+	else
+		WR_HOST_REG8((u32)this->IO_ADDR_W + SMP8XXX_REG_ADDR, cmd & 0xFF);
+}
+
+/* smp8xxx_nand_devready()
+ *
+ * returns 0 if the nand is busy, 1 if it is ready
+ */
+static int smp8xxx_nand_devready(struct mtd_info *mtd)
+{
+	if (controller_type != PB_NAND_CTRLER) {
+		register struct nand_chip *chip = mtd->priv;
+		unsigned int cs = ((struct chip_private *)chip->priv)->cs;
+
+		/* MLC or MLC2 NAND CONTROLLER TIMING WORKAROUND */
+		udelay(10);
+
+		return ((RD_HOST_REG32(PB_CS_ctrl) & PB_IORDY) != 0) &&
+			((RD_HOST_REG32(STATUS_REG(chx_reg[cs])) & 0x80000000) != 0);
+	} else
+		return (RD_HOST_REG32(PB_CS_ctrl) & PB_IORDY) != 0;
+}
+
+/* ECC handling functions */
+static inline int mu_count_bits(u32 v)
+{
+	int i, count;
+	for (count = i = 0; (i < 32) && (v != 0); i++, v >>= 1)
+		count += (v & 1);
+	return count;
+}
+
+/* correct 512B packet */
+static int ecc_correct_512(struct mtd_info *mtd, u_char *dat, u_char *read_ecc, u_char *calc_ecc)
+{
+	u32 mem, reg;
+	mem = read_ecc[0] | ((read_ecc[1] & 0x0f) << 8) | ((read_ecc[1] & 0xf0) << 12) | (read_ecc[2] << 20);
+	reg = calc_ecc[0] | ((calc_ecc[1] & 0x0f) << 8) | ((calc_ecc[1] & 0xf0) << 12) | (calc_ecc[2] << 20);
+
+	if (likely(mem == reg))
+		return 0;
+	else {
+		u16 pe, po, is_ecc_ff;
+		is_ecc_ff = ((mem & 0x0fff0fff) == 0x0fff0fff);
+		mem ^= reg;
+
+		switch(mu_count_bits(mem)) {
+			case 0:
+				return 0;
+			case 1:
+				return -1;
+			case 12:
+				po = (u16)(mem & 0xffff);
+				pe = (u16)((mem >> 16) & 0xffff);
+				po = pe ^ po;
+				if (po == 0x0fff) {
+					dat[pe >> 3] ^= (1 << (pe & 7));
+					return 1;	/* corrected data */
+				} else
+					return -1;	/* failed to correct */
+			default:
+				return (is_ecc_ff && (reg == 0)) ? 0 : -1;
+		}
+	}
+	return -1;	/* should not be here */
+}
+
+/* correct 512B * 4 packets */
+static int ecc_correct_2048(struct mtd_info *mtd, u_char *dat, u_char *read_ecc, u_char *calc_ecc)
+{
+	int ret0, ret1, ret2, ret3;
+
+	ret0 = ecc_correct_512(mtd, dat, read_ecc, calc_ecc);
+	ret1 = ecc_correct_512(mtd, dat + 512, read_ecc + 3, calc_ecc + 3);
+	ret2 = ecc_correct_512(mtd, dat + 1024, read_ecc + 6, calc_ecc + 6);
+	ret3 = ecc_correct_512(mtd, dat + 1536, read_ecc + 9, calc_ecc + 9);
+
+	if ((ret0 < 0) || (ret1 < 0) || (ret2 << 0) || (ret3 << 0))
+		return -1;
+	else
+		return (ret0 + ret1 + ret2 + ret3);
+}
+
+/* ECC functions
+ *
+ * These allow the smp8xxx to use the controller's ECC
+ * generator block to ECC the data as it passes through]
+*/
+static int smp8xxx_nand_calculate_ecc_512(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
+{
+	ecc_code[0] = RD_HOST_REG8(PB_ECC_code0 + 0);
+	ecc_code[1] = RD_HOST_REG8(PB_ECC_code0 + 1);
+	ecc_code[2] = RD_HOST_REG8(PB_ECC_code0 + 2);
+
+	pr_debug("%s: returning ecc %02x%02x%02x\n", __func__, ecc_code[0], ecc_code[1], ecc_code[2]);
+
+	return 0;
+}
+
+static int smp8xxx_nand_calculate_ecc_2048(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
+{
+	ecc_code[0] = RD_HOST_REG8(PB_ECC_code0 + 0);
+	ecc_code[1] = RD_HOST_REG8(PB_ECC_code0 + 1);
+	ecc_code[2] = RD_HOST_REG8(PB_ECC_code0 + 2);
+	pr_debug("%s: returning ecc %02x%02x%02x", __func__, ecc_code[0], ecc_code[1], ecc_code[2]);
+
+	ecc_code[3] = RD_HOST_REG8(PB_ECC_code1 + 0);
+	ecc_code[4] = RD_HOST_REG8(PB_ECC_code1 + 1);
+	ecc_code[5] = RD_HOST_REG8(PB_ECC_code1 + 2);
+	pr_debug("%02x%02x%02x", ecc_code[3], ecc_code[4], ecc_code[5]);
+
+	ecc_code[6] = RD_HOST_REG8(PB_ECC_code2 + 0);
+	ecc_code[7] = RD_HOST_REG8(PB_ECC_code2 + 1);
+	ecc_code[8] = RD_HOST_REG8(PB_ECC_code2 + 2);
+	pr_debug("%02x%02x%02x", ecc_code[6], ecc_code[7], ecc_code[8]);
+
+	ecc_code[9] = RD_HOST_REG8(PB_ECC_code3 + 0);
+	ecc_code[10] = RD_HOST_REG8(PB_ECC_code3 + 1);
+	ecc_code[11] = RD_HOST_REG8(PB_ECC_code3 + 2);
+	pr_debug("%02x%02x%02x\n", ecc_code[9], ecc_code[10], ecc_code[11]);
+
+	return 0;
+}
+
+/**
+ * function to control hardware ecc generator.
+ * Must only be provided if an hardware ECC is available
+ */
+static void smp8xxx_nand_enable_hwecc(struct mtd_info *mtd, int mode)
+{
+	struct nand_chip *chip = mtd->priv;
+	unsigned int cs = ((struct chip_private *)chip->priv)->cs;
+	WR_HOST_REG32(PB_ECC_clear, 0x80000008 | cs);
+}
+
+#if defined(CONFIG_XENV_PARTITION)
+static void smp8xxx_select_chip(struct mtd_info *mtd, int chipnr)
+{
+	static int cs_cnt = 0; /* workaround asymetric select/de-select */
+
+	if (chipnr >= 0) {
+		if (cs_cnt == 0) {
+			if (tangox_mutex_lock(MUTEX_PBI)) {
+				printk("[%s] mutex acquisition failure.\n", SMP_NAND_DEV_NAME);
+			} else
+				cs_cnt++;
+		}
+	} else {
+		if (cs_cnt > 0) {
+			cs_cnt--;
+			tangox_mutex_unlock(MUTEX_PBI);
+		}
+	}
+}
+#elif defined(CONFIG_MTD_CMDLINE_PARTS)
+static void smp8xxx_select_chip(struct mtd_info *mtd, int chipnr)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	if(chipnr >= max_chips)
+		return;
+
+	if(chipnr >= 0)
+    {
+    	/* Pad Mode */
+		smp8xxx_set_padmode( PAD_MODE_PB );
+		chip->IO_ADDR_R         = (void __iomem *)(chipnr * cs_offset);
+		chip->IO_ADDR_W         = chip->IO_ADDR_R;
+		((struct chip_private*)chip->priv)->cs = chipnr;
+    }
+}
+#else
+static void smp8xxx_select_chip(struct mtd_info *mtd, int chipnr)
+{
+	static int cs_cnt = 0; /* workaround asymetric select/de-select */
+
+	if (chipnr >= 0) {
+		if (cs_cnt == 0) {
+			if (tangox_mutex_lock(MUTEX_PBI)) {
+				printk("[%s] mutex acquisition failure.\n", SMP_NAND_DEV_NAME);
+			} else
+				cs_cnt++;
+		}
+	} else {
+		if (cs_cnt > 0) {
+			cs_cnt--;
+			tangox_mutex_unlock(MUTEX_PBI);
+		}
+	}
+}
+#endif
+
+#if defined(CONFIG_XENV_PARTITION)
+/* Loading partiton information from XENV */
+static void smp8xxx_nand_load_part_info(void)
+{
+	char buf[BUFSIZE], pname[BUFSIZE];
+	u32 dsize, rsvd_blks;
+	u32 cs, part, parts, cnt;
+	u64 rsvd_sz, psz, poff, blkmask;
+	static const char *h32str = HIGH_32;
+
+	for (cs = 0; cs < MAX_CS; cs++) {
+
+		if (cs_avail[cs] == 0)	/* not available */
+			continue;
+
+		sprintf(buf, CS_RESERVED, cs);
+		dsize = sizeof(u32);
+		if ((zxenv_get(buf, &rsvd_blks, &dsize) < 0) || (dsize != sizeof(u32))) {
+			cs_avail[cs] = 0;
+			continue;
+		}
+
+		/* find out the size of reservation zone */
+		smp8xxx_mtds[cs].size = rsvd_sz = min((u64)smp8xxx_mtds[cs].erasesize * (u64)rsvd_blks, smp8xxx_mtds[cs].size);
+		blkmask = ~(u64)(smp8xxx_mtds[cs].erasesize - 1);
+
+		sprintf(buf, CS_PARTS, cs);
+		dsize = sizeof(u32);
+		if ((zxenv_get(buf, &parts, &dsize) < 0) || (dsize != sizeof(u32)))
+			continue;
+		else if (parts > MAX_PARTITIONS)
+			parts = MAX_PARTITIONS;
+
+		if ((smp8xxx_partitions[cs] = kmalloc(sizeof(struct mtd_partition) * parts, GFP_KERNEL)) == NULL) {
+			cs_avail[cs] = 0;
+			continue;
+		}
+		memset(smp8xxx_partitions[cs], 0, sizeof(struct mtd_partition) * parts);
+
+		for (part = cnt = 0; part < parts; part++) {
+			u32 pl, ph;
+
+			pl = ph = 0;
+			sprintf(buf, CS_PART_SIZE, cs, part + 1);
+			dsize = sizeof(u32);
+			if ((zxenv_get(buf, &pl, &dsize) < 0) || (dsize != sizeof(u32)))
+				goto next;
+			strcat(buf, h32str);
+			if ((zxenv_get(buf, &ph, &dsize) < 0) || (dsize != sizeof(u32)))
+				ph = 0;
+
+			psz = ((((u64)ph) << 32) | (u64)pl) & blkmask; /* make it align to block boundary */
+			if (psz == 0)
+				goto next;
+			smp8xxx_partitions[cs][cnt].size = psz;
+
+			pl = ph = 0;
+			sprintf(buf, CS_PART_OFFSET, cs, part + 1);
+			dsize = sizeof(u32);
+			if ((zxenv_get(buf, &pl, &dsize) < 0) || (dsize != sizeof(u32)))
+				goto next;
+			strcat(buf, h32str);
+			if ((zxenv_get(buf, &ph, &dsize) < 0) || (dsize != sizeof(u32)))
+				ph = 0;
+			poff = (((u64)ph) << 32) | (u64)pl;
+
+			if ((poff & (u64)(smp8xxx_mtds[cs].erasesize - 1)) != 0)	/* not aligned to block boundary */
+				goto next;
+			smp8xxx_partitions[cs][cnt].offset = poff;
+
+			/* check if partition is out of reservation zone */
+			if ((poff >= rsvd_sz) || ((poff + psz) > rsvd_sz)) {
+				printk("[%s] CS%d partition%d (0x%llx-0x%llx) out of reserved zone.\n", SMP_NAND_DEV_NAME, cs, part + 1, poff, poff + psz);
+				goto next;
+			}
+
+			sprintf(buf, CS_PART_NAME, cs, part + 1);
+			dsize = BUFSIZE;
+			memset(pname, 0, BUFSIZE);
+			if ((zxenv_get(buf, pname, &dsize) == 0) && (dsize > 0)) {	/* partition name is given */
+				char *p;
+				u32 i;
+				for (i = 0, p = pname; (*p != '\0') && (i < dsize); p++, i++) {
+					if (!isspace(*p))
+						break;
+				}
+				if (*p == '\"') {	/* found leading '\"', try strip out trailing '\"' */
+					char *e;
+					p++;
+					for (i = strnlen(p, BUFSIZE - i), e = p + (i - 1); i > 0; i--, e--) {
+						if (isspace(*e))
+							*e = '\0';
+						else {
+							if (*e == '\"')
+								*e = '\0';
+							break;
+						}
+					}
+				}
+				smp8xxx_partitions[cs][cnt].name = kmalloc(strnlen(p, BUFSIZE) + 1, GFP_KERNEL);
+				if (smp8xxx_partitions[cs][cnt].name)
+					strncpy(smp8xxx_partitions[cs][cnt].name, p, strnlen(p, BUFSIZE) + 1);
+				else
+					goto next;
+			} else {	/* cooked-up partition name here */
+				sprintf(buf, "CS%d/PBPart%d", cs, part + 1);
+				smp8xxx_partitions[cs][cnt].name = kmalloc(16, GFP_KERNEL);
+				if (smp8xxx_partitions[cs][cnt].name)
+					strncpy(smp8xxx_partitions[cs][cnt].name, buf, 16);
+				else
+					goto next;
+			}
+
+			cnt++;
+			continue;	/* next partition */
+next:
+			smp8xxx_partitions[cs][cnt].size = smp8xxx_partitions[cs][cnt].offset = 0;
+		}
+
+		cs_parts[cs] = cnt;
+	}
+}
+#endif
+
+static void __init smp8xxx_set_nand_ctrler(void)
+{
+	chx_reg[0] = MLC_CHA_REG;
+	chx_reg[1] = MLC_CHB_REG;
+
+	chx_mem[0] = MLC_CHA_MEM;
+	chx_mem[1] = MLC_CHB_MEM;
+
+	switch(chip_id) {
+		case 0x8910:
+		case 0x8734:
+		case 0x2400:
+			controller_type = MLC_NAND_CTRLER;
+			if(max_chips > 2)
+				max_chips = 2;
+
+			break;
+		case 0x8756:
+		case 0x8758:
+			controller_type = MLC2_NAND_CTRLER;
+            chx_reg[0] = MLC2_CHA_REG;
+            chx_reg[1] = MLC2_CHB_REG;
+
+            chx_mem[0] = MLC2_CHA_MEM;
+            chx_mem[1] = MLC2_CHB_MEM;
+
+            if(max_chips > 2)
+				max_chips = 2;
+
+			break;
+		default:
+			controller_type = PB_NAND_CTRLER;	/* use old controller */
+            if(max_chips > 2)
+				max_chips = 2;
+
+			break;
+	}
+}
+
+
+/* appending more entries from XENV to the table */
+static void __init append_nand_flash_ids(void)
+{
+	int i, id, maf;
+	struct nand_flash_dev *type = nand_flash_ids, *ptr;
+	char buf[BUFSIZE];
+	u32 dsize, params[6];
+
+#define LP_OPTIONS (NAND_SAMSUNG_LP_OPTIONS | NAND_NO_READRDY | NAND_NO_AUTOINCR)
+	for (i = 0; i < MAX_NAND_DEVS; i++) {
+		sprintf(buf, NAND_PARAM, i);
+		dsize = sizeof(params);
+
+		/* get entry from XENV */
+		memset(params, 0, dsize);
+		if ((zxenv_get(buf, params, &dsize) < 0) && (dsize == 0))
+			continue;
+
+		if ((id = (params[0] >> 16) & 0xff) == 0)
+			continue;
+		maf = (params[0] >> 24) & 0xff;
+
+		/* going to the end of table or matching entry found */
+		for (ptr = type; ptr->id; ptr++) {
+			if (ptr->id == id)
+				break;
+		}
+
+		if ((!ptr->name) || (ptr->id == id))
+			continue;	/* end of table, or found the entry in the table */
+
+		/* append new entry to the table */
+		ptr->id = id;
+		if (((params[2] >> 16) & 0xf) >= 10) { /* >=2KB page size */
+			ptr->options = LP_OPTIONS;
+			ptr->erasesize = ptr->pagesize = 0; /* let MTD autodetect */
+		} else {
+			ptr->options = 0;
+			ptr->pagesize = 1 << (((params[2] >> 16) & 0xf) + 1);
+			ptr->erasesize = 1 << ((((params[2] >> 16) & 0xf) + 1) + (((params[2] >> 20) & 0xf) + 1));
+		}
+		ptr->chipsize = 1 << (((((params[2] >> 16) & 0xf) + 1) + (((params[2] >> 20) & 0xf) + 1) + (((params[2] >> 24) & 0xf) + 1)) - 20);
+		sprintf(ptr->name, "Unknown device %ldMiB (%02x:%02x)", ptr->chipsize, maf, ptr->id);
+	}
+}
+
+static int __init smp8xxx_nand_init(void)
+{
+	struct nand_chip *this = NULL;
+	u32 mem_staddr;
+	u8 local_pb_cs_ctrl;
+	u32 local_pb_cs_config, local_pb_cs_config1;
+	int cs, chip_cnt = 0;
+	const char *part_type;
+
+	/* Get Chip ID */
+	chip_id = (tangox_chip_id() >> 16) & 0x0000fffe;
+
+	/* append the id table from XENV first, if any */
+	append_nand_flash_ids();
+
+	memset(smp8xxx_mtds, 0, sizeof(struct mtd_info) * MAX_CS);
+	memset(smp8xxx_chips, 0, sizeof(struct nand_chip) * MAX_CS);
+#if defined(CONFIG_XENV_PARTITION)
+	memset(smp8xxx_partitions, 0, sizeof(struct mtd_partition *) * MAX_CS);
+#endif
+	memset(cs_avail, 0, sizeof(int) * MAX_CS);
+	memset(cs_parts, 0, sizeof(int) * MAX_CS);
+
+	/* find nand controller type */
+	smp8xxx_set_nand_ctrler();
+
+	printk("[%s] SMP8xxx NAND Driver %s (multi-bits ECC: %s)\n", smp_nand_devname, SMP_NAND_DRV_VERSION, STR_NAND_CONTROLLER_TYPE(controller_type));
+
+	local_pb_cs_ctrl = RD_HOST_REG8(PB_CS_ctrl);
+	local_pb_cs_config = RD_HOST_REG32(PB_CS_config);
+	local_pb_cs_config1 = RD_HOST_REG32(PB_CS_config1);
+	switch((local_pb_cs_ctrl >> 4) & 7) {
+		case 0: cs_offset = 0x200;
+			break;
+		case 1:
+		case 2: cs_offset = 0x100;
+			break;
+		default:
+			printk("No NAND flash is available (0x%x).\n", local_pb_cs_ctrl);
+			return -EIO;
+	}
+
+	for (cs = 0; cs < 4; cs++) {
+		if ((local_pb_cs_config >> (20 + cs)) & 1)
+			cs_avail[cs] = 1;
+	}
+
+#if (MAX_CS >= 4)
+	for (cs = 0; cs < 4; cs++) {
+		if ((local_pb_cs_config1 >> (20 + cs)) & 1)
+			cs_avail[cs + 4] = 1;
+	}
+#endif
+
+	spin_lock_init(&smp8xxx_hw_control.lock);
+	init_waitqueue_head(&smp8xxx_hw_control.wq);
+
+#if defined(CONFIG_MTD_CMDLINE_PARTS)
+	for (cs = 0; cs < 1; cs++) {
+#else
+	for (cs = 0; cs < MAX_CS; cs++) {
+#endif
+		int i;
+		unsigned long pg_size, oob_size, blk_size;
+		uint64_t chip_size;
+		u32 dsize, params[10];
+		char buf[BUFSIZE];
+
+		if (cs_avail[cs] == 0)
+			goto next;
+		if (controller_type != PB_NAND_CTRLER) { /* bounce buffer may be needed with new controller */
+			if ((chip_privs[cs].bbuf = kmalloc(NAND_MAX_PAGESIZE, GFP_KERNEL | GFP_DMA)) == NULL) {	/* up to 8KB */
+				cs_avail[cs] = 0;
+				goto next;
+			}
+		} else
+			chip_privs[cs].bbuf = NULL;
+
+		chip_privs[cs].cs = cs;
+		smp8xxx_mtds[cs].priv = &smp8xxx_chips[cs];
+		smp8xxx_mtds[cs].owner = THIS_MODULE;
+		smp8xxx_mtds[cs].name = SMP_NAND_DEV_NAME;
+		this = &smp8xxx_chips[cs];
+		this->priv = &chip_privs[cs];
+
+		mem_staddr = cs * cs_offset;
+
+		/* 30 us command delay time */
+		this->chip_delay   = 30;
+
+		this->ecc.mode     = NAND_ECC_SOFT;
+		this->options      = NAND_NO_AUTOINCR | BBT_AUTO_REFRESH;
+		this->controller   = &smp8xxx_hw_control;
+
+		this->read_byte    = smp8xxx_read_byte;
+		this->read_buf     = smp8xxx_read_buf;
+		this->write_buf    = smp8xxx_write_buf;
+		this->verify_buf   = smp8xxx_verify_buf;
+
+		this->cmd_ctrl     = smp8xxx_nand_hwcontrol;
+		this->dev_ready    = smp8xxx_nand_devready;
+		this->select_chip  = smp8xxx_select_chip;
+
+		this->IO_ADDR_W	   = this->IO_ADDR_R = (void __iomem *)mem_staddr;
+
+		/* Pad Mode */
+		smp8xxx_set_padmode( PAD_MODE_PB );
+
+		/* nand reset */
+#if defined(CONFIG_MTD_CMDLINE_PARTS)
+		{
+			/* Multiple Nand Reset */
+			for (i = 0 ; i < max_chips ; i++) {
+				WR_HOST_REG8((u32)this->IO_ADDR_W + (i * cs_offset) + SMP8XXX_REG_CMD, NAND_CMD_RESET);
+			}
+		}
+#else
+		WR_HOST_REG8((u32)this->IO_ADDR_W + SMP8XXX_REG_CMD, NAND_CMD_RESET);
+#endif
+		udelay(tReset);
+
+#if !defined(CONFIG_MTD_CMDLINE_PARTS)
+		printk("[%s] checking NAND device on CS%d ..\n", SMP_NAND_DEV_NAME, cs);
+#endif
+
+		/* Scan to find existence of the device */
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,32)
+#if defined(CONFIG_MTD_CMDLINE_PARTS)
+		if (nand_scan_ident(&smp8xxx_mtds[cs], max_chips))
+#else
+		if (nand_scan_ident(&smp8xxx_mtds[cs], 1))
+#endif
+#else
+#if defined(CONFIG_MTD_CMDLINE_PARTS)
+		if (nand_scan_ident(&smp8xxx_mtds[cs], max_chips, NULL))
+#else
+		if (nand_scan_ident(&smp8xxx_mtds[cs], 1, NULL))
+#endif
+#endif
+			goto next;
+
+		/* checking XENV to see if parameters are given ... */
+		for (i = 0; i < MAX_NAND_DEVS; i++) {
+			sprintf(buf, NAND_PARAM, i);
+			dsize = sizeof(params);
+
+			memset(params, 0, dsize);
+			if ((zxenv_get(buf, params, &dsize) < 0) && (dsize == 0))
+				continue;
+
+			/* matching maf_id and dev_id?? */
+			if ((smp8xxx_chips[cs].maf_id == ((params[0] >> 24) & 0xff)) && (smp8xxx_chips[cs].dev_id == ((params[0] >> 16) & 0xff)))
+			{
+				printk("[%s] Match found: %d\n", SMP_NAND_DEV_NAME, (int)i);
+				break;
+			}
+		}
+
+		/* saving information from XENV */
+		chip_size = pg_size = oob_size = blk_size = 0;
+		if (i < MAX_NAND_DEVS) {
+			oob_size = params[2] & 0xffff;
+			pg_size = 1 << (((params[2] >> 16) & 0xf) + 1);
+			blk_size = pg_size * (1 << (((params[2] >> 20) & 0xf) + 1));
+			chip_size = ((uint64_t)1) << ((((params[2] >> 16) & 0xf) + 1) + (((params[2] >> 20) & 0xf) + 1) + (((params[2] >> 24) & 0xf) + 1));
+		}
+
+		if (controller_type != PB_NAND_CTRLER) {
+#define DEF_TIMING1_MLC	0x1b162c16	/* conservative timing1 */
+#define DEF_TIMING2_MLC	0x120e1f58	/* conservative timing2 */
+#define DEF_DEVCFG_MLC	0x35		/* default devcfg, may not be correct */
+
+//taken from  ApplicationNote64MLC2 MLC schemes DEFAULT. boot-everywhere format
+#define DEF_TIMING1_MLC2 0x4c4c261c	/* conservative timing1 */
+#define DEF_TIMING2_MLC2 0x1c12194c	/* conservative timing2 */
+#define DEF_DEVCFG_MLC2  0x061d1135 /* default devcfg, may not be correct */
+
+			u32 def_timing1;
+			u32 def_timing2;
+			u32 def_devcfg;
+			u32 timing1, timing2, devcfg;
+
+			if (controller_type == MLC2_NAND_CTRLER) {
+				def_timing1 = DEF_TIMING1_MLC2;
+				def_timing2 = DEF_TIMING2_MLC2;
+				def_devcfg  = DEF_DEVCFG_MLC2;
+			}
+			else {
+				//controller_type == MLC_NAND_CTRLER
+				def_timing1 = DEF_TIMING1_MLC;
+				def_timing2 = DEF_TIMING2_MLC;
+				def_devcfg  = DEF_DEVCFG_MLC;
+			}
+
+			sprintf(buf, CS_TIMING1, cs);
+			dsize = sizeof(u32);
+			if ((zxenv_get(buf, &timing1, &dsize) < 0) || (dsize != sizeof(u32)))
+				timing1 = (params[3] ? params[3] : def_timing1);
+			sprintf(buf, CS_TIMING2, cs);
+			dsize = sizeof(u32);
+			if ((zxenv_get(buf, &timing2, &dsize) < 0) || (dsize != sizeof(u32)))
+				timing2 = (params[4] ? params[4] : def_timing2);
+			sprintf(buf, CS_DEVCFG, cs);
+			dsize = sizeof(u32);
+			if ((zxenv_get(buf, &devcfg, &dsize) < 0) || (dsize != sizeof(u32)))
+				devcfg = (params[5] ? params[5] : def_devcfg);
+
+			if (controller_type == MLC2_NAND_CTRLER && params[2]) {
+				//according to thimble parsing
+				u32 l2_pg_per_blk  = (params[2] >> 20 & 0xf) + 1;
+				u32 l2_blk_per_dev = (params[2] >> 24 & 0xf) + 1;
+				u32 pagesize   = (params[2] >> 16 & 0xf) + 1;
+				u32 blocksize = pagesize + l2_pg_per_blk;
+				u32 wholesize = blocksize + l2_blk_per_dev;
+				u32 scheme_no = (params[2] >> 28 & 0xf);
+
+				devcfg = (scheme_no << 24 ) |  (wholesize << 16) | (blocksize << 8) | (devcfg & 0xFF);
+			}
+
+#if defined(CONFIG_MTD_CMDLINE_PARTS)
+			{
+				int i = 0;
+
+				for (i = 0 ; i < max_chips ; i++) {
+					WR_HOST_REG32(DEVICE_CFG(chx_reg[i]), devcfg);
+					WR_HOST_REG32(TIMING1(chx_reg[i]), timing1);
+					WR_HOST_REG32(TIMING2(chx_reg[i]), timing2);
+
+					printk("[%s] using devcfg(0x%08x), timing1(0x%08x), timing2(0x%08x)\n", SMP_NAND_DEV_NAME
+																						  , devcfg
+																						  , timing1
+																						  , timing2);
+				}
+			}
+#else
+			WR_HOST_REG32(DEVICE_CFG(chx_reg[cs]), devcfg);
+			WR_HOST_REG32(TIMING1(chx_reg[cs]), timing1);
+			WR_HOST_REG32(TIMING2(chx_reg[cs]), timing2);
+
+			printk("[%s] using devcfg(0x%08x), timing1(0x%08x), timing2(0x%08x)\n", SMP_NAND_DEV_NAME
+																				  , devcfg
+																				  , timing1
+																				  , timing2);
+#endif
+		}
+
+		this->ecc.mode     = NAND_ECC_HW;
+		this->ecc.steps    = 1;
+		this->ecc.hwctl    = smp8xxx_nand_enable_hwecc;
+
+		if (controller_type != PB_NAND_CTRLER) {
+			this->ecc.write_page = smp8xxx_write_page_hwecc;
+			this->ecc.read_page  = smp8xxx_read_page_hwecc;
+			this->cmdfunc        = smp8xxx_command;
+			this->ecc.calculate  = smp8xxx_nand_bug_calculate;
+			this->ecc.correct    = smp8xxx_nand_bug_correct;
+			this->ecc.hwctl      = smp8xxx_nand_hwctl;
+		}
+
+		switch (smp8xxx_mtds[cs].writesize) {
+			case 512:
+				if (controller_type == MLC2_NAND_CTRLER ) {
+					/* TODO */
+				}
+				else if (controller_type == MLC_NAND_CTRLER) {
+					this->ecc.layout = &smp8xxx_nand_ecclayout512_16_4;
+					this->ecc.layout->oobfree[0].length = smp8xxx_mtds[cs].oobsize
+										- this->ecc.layout->oobfree[0].offset;
+				}
+				else {
+					this->ecc.calculate = smp8xxx_nand_calculate_ecc_512;
+					this->ecc.correct = ecc_correct_512;
+					this->ecc.bytes = this->ecc.total = 3;
+					this->ecc.layout = &smp8xxx_oobinfo_16;
+				}
+				this->ecc.size = 512;
+				break;
+
+			case 2048:
+				if (controller_type == MLC2_NAND_CTRLER ) {
+					this->ecc.layout =  &smp8xxx_nand_ecclayout2048_64_14;
+					this->ecc.layout->oobfree[0].length = 0;
+				}
+				else if (controller_type == MLC_NAND_CTRLER) {
+					this->ecc.layout = &smp8xxx_nand_ecclayout2048_64_8;
+					this->ecc.layout->oobfree[0].length = smp8xxx_mtds[cs].oobsize
+										- this->ecc.layout->oobfree[0].offset;
+				}
+				else {
+					this->ecc.calculate = smp8xxx_nand_calculate_ecc_2048;
+					this->ecc.correct = ecc_correct_2048;
+					this->ecc.bytes = this->ecc.total = 12;
+					this->ecc.layout = &smp8xxx_oobinfo_64;
+				}
+				this->ecc.size = 2048;
+				break;
+
+			case 4096:
+				if (controller_type == MLC2_NAND_CTRLER ) {
+					if ( smp8xxx_mtds[cs].oobsize == 232 ) {
+						this->ecc.layout = &smp8xxx_nand_ecclayout4096_232_51;
+						this->ecc.layout->oobfree[0].length = smp8xxx_mtds[cs].oobsize
+											- this->ecc.layout->oobfree[0].offset;
+					}
+					this->ecc.size = 4096;
+				}
+				else if (controller_type == MLC_NAND_CTRLER) {
+					if ((smp8xxx_mtds[cs].oobsize >= 128) && (smp8xxx_mtds[cs].oobsize < 218)) {
+						this->ecc.layout = &smp8xxx_nand_ecclayout4096_128_9;
+						this->ecc.layout->oobfree[0].length = smp8xxx_mtds[cs].oobsize
+											- this->ecc.layout->oobfree[0].offset;
+					} else if (smp8xxx_mtds[cs].oobsize >= 218) {
+						this->ecc.layout = &smp8xxx_nand_ecclayout4096_218_16;
+						this->ecc.layout->oobfree[0].length = smp8xxx_mtds[cs].oobsize
+											- this->ecc.layout->oobfree[0].offset;
+					} else {
+						printk("[%s] unsupported NAND on CS%d.\n", SMP_NAND_DEV_NAME, cs);
+						printk("[%s] oobsize (%d) unsupported on CS%d (pagesize: %d, erasesize: %d).\n", SMP_NAND_DEV_NAME, smp8xxx_mtds[cs].oobsize, cs, smp8xxx_mtds[cs].writesize, smp8xxx_mtds[cs].erasesize);
+						goto next;
+					}
+					this->ecc.size = 4096;
+				} else
+					goto next;
+				break;
+
+			case 8192:
+				if (controller_type == MLC2_NAND_CTRLER ) {
+					this->ecc.layout = &smp8xxx_nand_ecclayout8192_448_53;
+					this->ecc.layout->oobfree[0].length = smp8xxx_mtds[cs].oobsize
+										- this->ecc.layout->oobfree[0].offset;
+					this->ecc.size = 8192;
+				}
+				else if ((controller_type == MLC_NAND_CTRLER) && (max_page_shift >= 13)) {
+					this->ecc.layout = &smp8xxx_nand_ecclayout8192_448_16;
+					this->ecc.layout->oobfree[0].length = smp8xxx_mtds[cs].oobsize
+										- this->ecc.layout->oobfree[0].offset;
+					this->ecc.size = 8192;
+				}
+				else
+					goto next;
+				break;
+
+			default:
+				printk("[%s] unsupported NAND on CS%d.\n", SMP_NAND_DEV_NAME, cs);
+				goto next;
+		}
+
+		if (nand_scan_tail(&smp8xxx_mtds[cs]))
+			goto next;
+
+		if (this->ecc.mode == NAND_ECC_HW) {
+			/*
+			 * For HW ECC, subpage size set to page size
+			 * as subpage operations not supporting.
+			 */
+			smp8xxx_mtds[cs].subpage_sft = 0;
+			smp8xxx_chips[cs].subpagesize = smp8xxx_mtds[cs].writesize >>
+				smp8xxx_mtds[cs].subpage_sft;
+		}
+
+#if defined(CONFIG_MTD_CMDLINE_PARTS)
+		{
+			int i = 0;
+
+			for (i = 0 ; i < max_chips ; i++) {
+				smp8xxx_packet_config(smp8xxx_mtds[cs].writesize, smp8xxx_mtds[cs].oobsize, i);
+			}
+		}
+#else
+		smp8xxx_packet_config(smp8xxx_mtds[cs].writesize, smp8xxx_mtds[cs].oobsize, cs);
+#endif
+
+		printk("[%s] detected %d NAND, %lldMiB(%d x %lldMiB), erasesize %dKiB, pagesize %dB, oobsize %dB, oobavail %dB\n",
+			SMP_NAND_DEV_NAME, smp8xxx_chips[cs].numchips, smp8xxx_mtds[cs].size >> 20,
+			smp8xxx_chips[cs].numchips, smp8xxx_chips[cs].chipsize  >> 20,
+			smp8xxx_mtds[cs].erasesize >> 10, smp8xxx_mtds[cs].writesize,
+			smp8xxx_mtds[cs].oobsize, smp8xxx_mtds[cs].oobavail);
+
+		if (controller_type != PB_NAND_CTRLER) {
+			u32 p_cyc, e_cyc, devcfg;
+			if (smp8xxx_mtds[cs].writesize < 2048) {	/* small page */
+				e_cyc = ((smp8xxx_mtds[cs].size >> 20) > 32) ? 3 : 2;
+				p_cyc = e_cyc + 1;
+			} else {
+				e_cyc = ((smp8xxx_mtds[cs].size >> 20) > 128) ? 3 : 2;
+				p_cyc = e_cyc + 2;
+			}
+			devcfg = (e_cyc << 4) | p_cyc;
+			if ((RD_HOST_REG32(DEVICE_CFG(chx_reg[cs])) & 0xff) != devcfg) {
+				printk(KERN_WARNING "[%s] CS%d devcfg mismatch detected (0x%x specified, 0x%x detected)\n",
+					SMP_NAND_DEV_NAME, cs, RD_HOST_REG32(DEVICE_CFG(chx_reg[cs])) & 0xff, devcfg);
+				WR_HOST_REG32(DEVICE_CFG(chx_reg[cs]), devcfg);
+			}
+		}
+
+#ifndef CONFIG_MTD_CMDLINE_PARTS
+		/* Check against the saved information from XENV */
+		if (chip_size && chip_size != smp8xxx_mtds[cs].size)
+			printk(KERN_WARNING "[%s] CS%d size mismatch detected (%lldMiB specified, %lldMiB detected)\n",
+				SMP_NAND_DEV_NAME, cs, chip_size >> 20, smp8xxx_mtds[cs].size >> 20);
+		if (blk_size && blk_size != smp8xxx_mtds[cs].erasesize)
+			printk(KERN_WARNING "[%s] CS%d erasesize mismatch detected (%ldKiB specified, %dKiB detected)\n",
+				SMP_NAND_DEV_NAME, cs, blk_size >> 10, smp8xxx_mtds[cs].erasesize >> 10);
+		if (pg_size && pg_size != smp8xxx_mtds[cs].writesize)
+			printk(KERN_WARNING "[%s] CS%d pagesize mismatch detected (%ldB specified, %dB detected)\n",
+				SMP_NAND_DEV_NAME, cs, pg_size, smp8xxx_mtds[cs].writesize);
+		if (oob_size && oob_size != smp8xxx_mtds[cs].oobsize)
+			printk(KERN_WARNING "[%s] CS%d oobsize mismatch detected (%ldB specified, %dB detected)\n",
+				SMP_NAND_DEV_NAME, cs, oob_size, smp8xxx_mtds[cs].oobsize);
+#endif
+
+		cs_avail[cs] = 1;
+		chip_cnt++;
+		continue;
+next:
+		cs_avail[cs] = 0;
+		continue;
+	}
+
+	if (chip_cnt) {
+#if defined(CONFIG_XENV_PARTITION)
+		smp8xxx_nand_load_part_info();
+		for (cs = 0; cs < MAX_CS; cs++) {
+			/* Register the partitions */
+			if (cs_avail[cs]) {
+				/* check if chip sizes are passed in as parameters */
+				if ((chip_szs[cs] != 0) && (chip_szs[cs] <= smp8xxx_chips[cs].chipsize))
+					smp8xxx_mtds[cs].size = chip_szs[cs];	/* use what's been specified */
+				if (cs_parts[cs]) {
+					if (smp8xxx_mtds[cs].size)
+						mtd_device_register(&smp8xxx_mtds[cs], NULL, 0);
+					printk("[%s] load partition information for CS%d ..\n", SMP_NAND_DEV_NAME, cs);
+					mtd_device_register(&smp8xxx_mtds[cs], smp8xxx_partitions[cs], cs_parts[cs]);
+				} else {
+					if (smp8xxx_mtds[cs].size)
+						mtd_device_register(&smp8xxx_mtds[cs], NULL, 0);
+				}
+			}
+		}
+		part_type = "xenv";
+#elif defined(CONFIG_MTD_CMDLINE_PARTS)
+		part_type = "command line";
+		mtd_device_parse_register(&smp8xxx_mtds[0], part_probes, NULL, NULL, 0);
+#else
+		part_type = "static";
+		mtd_device_register(&smp8xxx_mtds[cs], smp8xxx_partitions, 1);
+#endif
+		printk("[%s] detection completed, using %s partition definition..\n", SMP_NAND_DEV_NAME, part_type);
+
+		return 0;
+	} else {
+		printk("[%s] No NAND flash is detected.\n", SMP_NAND_DEV_NAME);
+		return -EIO;
+	}
+}
+
+static void __exit smp8xxx_nand_exit(void)
+{
+	int cs;
+
+	for (cs = 0; cs < MAX_CS; cs++) {
+		/* Release resources, unregister device */
+		if (cs_avail[cs]) {
+			nand_release(&smp8xxx_mtds[cs]);
+#if defined(CONFIG_XENV_PARTITION)
+			if (smp8xxx_partitions[cs]) {
+				int i;
+
+				for (i = 0; i < cs_parts[cs]; i++) {
+					if (smp8xxx_partitions[cs][i].name)
+						kfree(smp8xxx_partitions[cs][i].name);
+				}
+				kfree(smp8xxx_partitions[cs]);
+			}
+#endif
+			if (chip_privs[cs].bbuf)
+				kfree(chip_privs[cs].bbuf);
+		}
+	}
+}
+
+module_init(smp8xxx_nand_init);
+module_exit(smp8xxx_nand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SMP8xxx MTD NAND driver");
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 3595a0236b0f..cc3fc12a2fc3 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -329,6 +329,7 @@ static inline int map_word_bitsset(struct map_info *map, map_word val1, map_word
 static inline map_word map_word_load(struct map_info *map, const void *ptr)
 {
 	map_word r;
+	memset(&r, 0, sizeof(map_word));
 
 	if (map_bankwidth_is_1(map))
 		r.x[0] = *(unsigned char *)ptr;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cf5ea8cdcf8e..90b5caf8cacd 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -157,6 +157,12 @@ struct mtd_info {
 	unsigned int erasesize_mask;
 	unsigned int writesize_mask;
 
+	/* NAND related attributes */
+	const char *nand_type;
+	const char *nand_manufacturer;
+	const char *onfi_version;
+	u8 id_data[8];
+
 	// Kernel-only stuff starts here.
 	const char *name;
 	int index;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 248351344718..f58f617ea562 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -215,6 +215,9 @@ typedef enum {
 #define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT) \
 					&& (chip->page_shift > 9))
 
+/* Mask to zero out the chip options, which come from the id table */
+#define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
+
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	0x00010000
@@ -471,6 +474,8 @@ struct nand_buffers {
  * @controller:		[REPLACEABLE] a pointer to a hardware controller
  *			structure which is shared among multiple independent
  *			devices.
+ * @maf_id:		[OPTOINAL] manufacture ID 
+ * @dev_id:		[OPTIONAL] device ID
  * @priv:		[OPTIONAL] pointer to private chip data
  * @errstat:		[OPTIONAL] hardware specific function to perform
  *			additional error status checks (determine if errors are
@@ -540,6 +545,9 @@ struct nand_chip {
 
 	struct nand_bbt_descr *badblock_pattern;
 
+	int maf_id;
+	int dev_id;
+
 	void *priv;
 };
 
@@ -556,6 +564,8 @@ struct nand_chip {
 #define NAND_MFR_MICRON		0x2c
 #define NAND_MFR_AMD		0x01
 #define NAND_MFR_MACRONIX	0xc2
+#define NAND_MFR_ESMT		0x92
+#define NAND_MFR_MIRA		0xc8
 
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
