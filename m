Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VORT0-0005Ip-Fv
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 12:11:47 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] drivers: mtd: m25p80: Add quad read support.
Date: Tue, 24 Sep 2013 17:40:47 +0530
Message-ID: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Sourav Poddar <sourav.poddar@ti.com>, broonie@kernel.org, balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some flash like spansion flash also support quad read mode.
This patch add support for enabling quad mode in m25p80.

Patch enables quad mode bit on the flash device, add an api
for quad read defines a communuication 
parameter(t[1].rx_nbits = SPI_NBITS_QUAD) to let know the
spi controller that quad read should be used.

Tested on DRA7 board with S25fl256s spansion device by doing a 
flash erase, write and read.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 drivers/mtd/devices/m25p80.c |  102 +++++++++++++++++++++++++++++++++++++-----
 1 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 26b14f9..2b6ee4b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -41,6 +41,7 @@
 #define	OPCODE_WRSR		0x01	/* Write status register 1 byte */
 #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low frequency) */
 #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */
+#define	OPCODE_QUAD_READ	0x6b	/* QUAD READ */
 #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
 #define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
 #define	OPCODE_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
@@ -52,6 +53,7 @@
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define	OPCODE_NORM_READ_4B	0x13	/* Read data bytes (low frequency) */
 #define	OPCODE_FAST_READ_4B	0x0c	/* Read data bytes (high frequency) */
+#define	OPCODE_QUAD_READ_4B     0x6c    /* Read data bytes */
 #define	OPCODE_PP_4B		0x12	/* Page program (up to 256 bytes) */
 #define	OPCODE_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
@@ -95,6 +97,7 @@ struct m25p {
 	u8			program_opcode;
 	u8			*command;
 	bool			fast_read;
+	bool			quad_read;
 };
 
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
@@ -336,6 +339,75 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return 0;
 }
 
+static int quad_enable(struct m25p *flash)
+{
+	u8 cmd[3];
+	cmd[0] = OPCODE_WRSR;
+	cmd[1] = 0x00;
+	cmd[2] = 0x02;
+
+	write_enable(flash);
+
+	spi_write(flash->spi, &cmd, 3);
+
+	if (wait_till_ready(flash))
+		return 1;
+
+	return 0;
+}
+
+static int m25p80_quad_read(struct mtd_info *mtd, loff_t from, size_t len,
+	size_t *retlen, u_char *buf)
+{
+	struct m25p *flash = mtd_to_m25p(mtd);
+	struct spi_transfer t[2];
+	struct spi_message m;
+	uint8_t opcode;
+
+	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
+			__func__, (u32)from, len);
+
+	spi_message_init(&m);
+	memset(t, 0, (sizeof(t)));
+
+	t[0].tx_buf = flash->command;
+	t[0].len = m25p_cmdsz(flash) + (flash->quad_read ? 1 : 0);
+	spi_message_add_tail(&t[0], &m);
+
+	t[1].rx_buf = buf;
+	t[1].len = len;
+	t[1].rx_nbits = SPI_NBITS_QUAD;
+	spi_message_add_tail(&t[1], &m);
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
+	/* FIXME switch to OPCODE_QUAD_READ.  It's required for higher
+	 * clocks; and at this writing, every chip this driver handles
+	 * supports that opcode.
+	*/
+
+	/* Set up the write data buffer. */
+	opcode = flash->read_opcode;
+	flash->command[0] = opcode;
+	m25p_addr2cmd(flash, from, flash->command);
+
+	spi_sync(flash->spi, &m);
+
+	*retlen = m.actual_length - m25p_cmdsz(flash) -
+			(flash->quad_read ? 1 : 0);
+
+	mutex_unlock(&flash->lock);
+
+	return 0;
+}
+
 /*
  * Read an address range from the flash chip.  The address range
  * may be any size provided it is within the physical boundaries.
@@ -979,15 +1051,9 @@ static int m25p_probe(struct spi_device *spi)
 		}
 	}
 
-	flash = kzalloc(sizeof *flash, GFP_KERNEL);
+	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
 	if (!flash)
 		return -ENOMEM;
-	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
-					GFP_KERNEL);
-	if (!flash->command) {
-		kfree(flash);
-		return -ENOMEM;
-	}
 
 	flash->spi = spi;
 	mutex_init(&flash->lock);
@@ -1015,7 +1081,14 @@ static int m25p_probe(struct spi_device *spi)
 	flash->mtd.flags = MTD_CAP_NORFLASH;
 	flash->mtd.size = info->sector_size * info->n_sectors;
 	flash->mtd._erase = m25p80_erase;
-	flash->mtd._read = m25p80_read;
+
+	flash->quad_read = false;
+	if (spi->mode && SPI_RX_QUAD) {
+		quad_enable(flash);
+		flash->mtd._read = m25p80_quad_read;
+		flash->quad_read = true;
+	} else
+		flash->mtd._read = m25p80_read;
 
 	/* flash protection support for STmicro chips */
 	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ST) {
@@ -1067,6 +1140,13 @@ static int m25p_probe(struct spi_device *spi)
 
 	flash->program_opcode = OPCODE_PP;
 
+	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 :
+				(flash->quad_read ? 1 : 0)), GFP_KERNEL);
+	if (!flash->command) {
+		kfree(flash);
+		return -ENOMEM;
+	}
+
 	if (info->addr_width)
 		flash->addr_width = info->addr_width;
 	else if (flash->mtd.size > 0x1000000) {
@@ -1074,9 +1154,9 @@ static int m25p_probe(struct spi_device *spi)
 		flash->addr_width = 4;
 		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
 			/* Dedicated 4-byte command set */
-			flash->read_opcode = flash->fast_read ?
-				OPCODE_FAST_READ_4B :
-				OPCODE_NORM_READ_4B;
+			flash->read_opcode = (flash->fast_read ?
+				OPCODE_FAST_READ_4B : (flash->quad_read ?
+				OPCODE_QUAD_READ_4B : OPCODE_NORM_READ_4B));
 			flash->program_opcode = OPCODE_PP_4B;
 			/* No small sector erase for 4-byte command set */
 			flash->erase_opcode = OPCODE_SE_4B;
-- 
1.7.1
