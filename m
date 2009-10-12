Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxNhR-0001pC-AM
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 16:24:49 +0000
Date: Mon, 12 Oct 2009 20:24:40 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/3] mtd: m25p80: Add support for CAT25xxx serial EEPROMs
Message-ID: <20091012162440.GC30699@oksana.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CAT25 chips (as manufactured by On Semiconductor, previously Catalyst
Semiconductor) are similar to the original M25Px0 chips, except:

- Address width can vary (1-2 bytes, in contrast to 3 bytes in M25P
  chips). So, implement convenient m25p_addr2cmd() and m25p_cmdsz()
  calls, and place address width information into flash_info struct;

- Page size can vary, therefore we shouldn't hardcode it, so get rid
  of FLASH_PAGESIZE definition, and place the page size information
  into flash_info struct;

- CAT25 EEPROMs don't need to be erased, so add NO_ERASE flag, and
  propagate it to the mtd subsystem.

Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
---
 drivers/mtd/devices/m25p80.c |  114 +++++++++++++++++++++++++----------------
 1 files changed, 69 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3c74c3a..d3a27d7 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -29,9 +29,6 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
 
-
-#define FLASH_PAGESIZE		256
-
 /* Flash opcodes. */
 #define	OPCODE_WREN		0x06	/* Write enable */
 #define	OPCODE_RDSR		0x05	/* Read status register */
@@ -61,7 +58,7 @@
 
 /* Define max times to check status register before we give up. */
 #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
-#define	CMD_SIZE		4
+#define	MAX_CMD_SIZE		4
 
 #ifdef CONFIG_M25PXX_USE_FAST_READ
 #define OPCODE_READ 	OPCODE_FAST_READ
@@ -78,8 +75,10 @@ struct m25p {
 	struct mutex		lock;
 	struct mtd_info		mtd;
 	unsigned		partitioned:1;
+	u16			page_size;
+	u16			addr_width;
 	u8			erase_opcode;
-	u8			command[CMD_SIZE + FAST_READ_DUMMY_BYTE];
+	u8			command[MAX_CMD_SIZE + FAST_READ_DUMMY_BYTE];
 };
 
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
@@ -198,6 +197,19 @@ static int erase_chip(struct m25p *flash)
 	return 0;
 }
 
+static void m25p_addr2cmd(struct m25p *flash, unsigned int addr, u8 *cmd)
+{
+	/* opcode is in cmd[0] */
+	cmd[1] = addr >> (flash->addr_width * 8 -  8);
+	cmd[2] = addr >> (flash->addr_width * 8 - 16);
+	cmd[3] = addr >> (flash->addr_width * 8 - 24);
+}
+
+static int m25p_cmdsz(struct m25p *flash)
+{
+	return 1 + flash->addr_width;
+}
+
 /*
  * Erase one sector of flash memory at offset ``offset'' which is any
  * address within the sector which should be erased.
@@ -219,11 +231,9 @@ static int erase_sector(struct m25p *flash, u32 offset)
 
 	/* Set up command buffer. */
 	flash->command[0] = flash->erase_opcode;
-	flash->command[1] = offset >> 16;
-	flash->command[2] = offset >> 8;
-	flash->command[3] = offset;
+	m25p_addr2cmd(flash, offset, flash->command);
 
-	spi_write(flash->spi, flash->command, CMD_SIZE);
+	spi_write(flash->spi, flash->command, m25p_cmdsz(flash));
 
 	return 0;
 }
@@ -325,7 +335,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	 * Should add 1 byte DUMMY_BYTE.
 	 */
 	t[0].tx_buf = flash->command;
-	t[0].len = CMD_SIZE + FAST_READ_DUMMY_BYTE;
+	t[0].len = m25p_cmdsz(flash) + FAST_READ_DUMMY_BYTE;
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
@@ -352,13 +362,11 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	/* Set up the write data buffer. */
 	flash->command[0] = OPCODE_READ;
-	flash->command[1] = from >> 16;
-	flash->command[2] = from >> 8;
-	flash->command[3] = from;
+	m25p_addr2cmd(flash, from, flash->command);
 
 	spi_sync(flash->spi, &m);
 
-	*retlen = m.actual_length - CMD_SIZE - FAST_READ_DUMMY_BYTE;
+	*retlen = m.actual_length - m25p_cmdsz(flash) - FAST_READ_DUMMY_BYTE;
 
 	mutex_unlock(&flash->lock);
 
@@ -396,7 +404,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	memset(t, 0, (sizeof t));
 
 	t[0].tx_buf = flash->command;
-	t[0].len = CMD_SIZE;
+	t[0].len = m25p_cmdsz(flash);
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].tx_buf = buf;
@@ -414,41 +422,36 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* Set up the opcode in the write buffer. */
 	flash->command[0] = OPCODE_PP;
-	flash->command[1] = to >> 16;
-	flash->command[2] = to >> 8;
-	flash->command[3] = to;
+	m25p_addr2cmd(flash, to, flash->command);
 
-	/* what page do we start with? */
-	page_offset = to % FLASH_PAGESIZE;
+	page_offset = to & (flash->page_size - 1);
 
 	/* do all the bytes fit onto one page? */
-	if (page_offset + len <= FLASH_PAGESIZE) {
+	if (page_offset + len <= flash->page_size) {
 		t[1].len = len;
 
 		spi_sync(flash->spi, &m);
 
-		*retlen = m.actual_length - CMD_SIZE;
+		*retlen = m.actual_length - m25p_cmdsz(flash);
 	} else {
 		u32 i;
 
 		/* the size of data remaining on the first page */
-		page_size = FLASH_PAGESIZE - page_offset;
+		page_size = flash->page_size - page_offset;
 
 		t[1].len = page_size;
 		spi_sync(flash->spi, &m);
 
-		*retlen = m.actual_length - CMD_SIZE;
+		*retlen = m.actual_length - m25p_cmdsz(flash);
 
-		/* write everything in PAGESIZE chunks */
+		/* write everything in flash->page_size chunks */
 		for (i = page_size; i < len; i += page_size) {
 			page_size = len - i;
-			if (page_size > FLASH_PAGESIZE)
-				page_size = FLASH_PAGESIZE;
+			if (page_size > flash->page_size)
+				page_size = flash->page_size;
 
 			/* write the next page to flash */
-			flash->command[1] = (to + i) >> 16;
-			flash->command[2] = (to + i) >> 8;
-			flash->command[3] = (to + i);
+			m25p_addr2cmd(flash, to + i, flash->command);
 
 			t[1].tx_buf = buf + i;
 			t[1].len = page_size;
@@ -460,7 +463,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 			spi_sync(flash->spi, &m);
 
 			if (retlen)
-				*retlen += m.actual_length - CMD_SIZE;
+				*retlen += m.actual_length - m25p_cmdsz(flash);
 		}
 	}
 
@@ -492,7 +495,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	memset(t, 0, (sizeof t));
 
 	t[0].tx_buf = flash->command;
-	t[0].len = CMD_SIZE;
+	t[0].len = m25p_cmdsz(flash);
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].tx_buf = buf;
@@ -511,9 +514,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Start write from odd address. */
 	if (actual) {
 		flash->command[0] = OPCODE_BP;
-		flash->command[1] = to >> 16;
-		flash->command[2] = to >> 8;
-		flash->command[3] = to;
+		m25p_addr2cmd(flash, to, flash->command);
 
 		/* write one byte. */
 		t[1].len = 1;
@@ -521,17 +522,15 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ret = wait_till_ready(flash);
 		if (ret)
 			goto time_out;
-		*retlen += m.actual_length - CMD_SIZE;
+		*retlen += m.actual_length - m25p_cmdsz(flash);
 	}
 	to += actual;
 
 	flash->command[0] = OPCODE_AAI_WP;
-	flash->command[1] = to >> 16;
-	flash->command[2] = to >> 8;
-	flash->command[3] = to;
+	m25p_addr2cmd(flash, to, flash->command);
 
 	/* Write out most of the data here. */
-	cmd_sz = CMD_SIZE;
+	cmd_sz = m25p_cmdsz(flash);
 	for (; actual < len - 1; actual += 2) {
 		t[0].len = cmd_sz;
 		/* write two bytes. */
@@ -555,10 +554,8 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (actual != len) {
 		write_enable(flash);
 		flash->command[0] = OPCODE_BP;
-		flash->command[1] = to >> 16;
-		flash->command[2] = to >> 8;
-		flash->command[3] = to;
-		t[0].len = CMD_SIZE;
+		m25p_addr2cmd(flash, to, flash->command);
+		t[0].len = m25p_cmdsz(flash);
 		t[1].len = 1;
 		t[1].tx_buf = buf + actual;
 
@@ -566,7 +563,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ret = wait_till_ready(flash);
 		if (ret)
 			goto time_out;
-		*retlen += m.actual_length - CMD_SIZE;
+		*retlen += m.actual_length - m25p_cmdsz(flash);
 		write_disable(flash);
 	}
 
@@ -595,8 +592,12 @@ struct flash_info {
 	unsigned	sector_size;
 	u16		n_sectors;
 
+	u16		page_size;
+	u16		addr_width;
+
 	u16		flags;
 #define	SECT_4K		0x01		/* OPCODE_BE_4K works uniformly */
+#define	M25P_NO_ERASE	0x02		/* No erase command needed */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -605,9 +606,20 @@ struct flash_info {
 		.ext_id = (_ext_id),					\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
+		.page_size = 256,					\
+		.addr_width = 3,					\
 		.flags = (_flags),					\
 	})
 
+#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
+	((kernel_ulong_t)&(struct flash_info) {				\
+		.sector_size = (_sector_size),				\
+		.n_sectors = (_n_sectors),				\
+		.page_size = (_page_size),				\
+		.addr_width = (_addr_width),				\
+		.flags = M25P_NO_ERASE,					\
+	})
+
 /* NOTE: double check command sets and memory organization when you add
  * more flash chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
@@ -680,6 +692,13 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
+
+	/* Catalyst / On Semiconductor -- non-JEDEC */
+	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1) },
+	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2) },
+	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2) },
+	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2) },
+	{ "cat25128", CAT25_INFO(2048, 8, 64, 2) },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
@@ -835,7 +854,12 @@ static int __devinit m25p_probe(struct spi_device *spi)
 		flash->mtd.erasesize = info->sector_size;
 	}
 
+	if (info->flags & M25P_NO_ERASE)
+		flash->mtd.flags |= MTD_NO_ERASE;
+
 	flash->mtd.dev.parent = &spi->dev;
+	flash->page_size = info->page_size;
+	flash->addr_width = info->addr_width;
 
 	dev_info(&spi->dev, "%s (%lld Kbytes)\n", id->name,
 			(long long)flash->mtd.size >> 10);
-- 
1.6.3.3
