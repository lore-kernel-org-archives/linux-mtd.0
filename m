Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sn1lV-00027N-HL
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 06:11:43 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] [RFC] mtd: m25p80: Make fast read configurable via DT
Date: Fri,  6 Jul 2012 08:10:27 +0200
Message-Id: <1341555027-17462-3-git-send-email-marex@denx.de>
In-Reply-To: <1341555027-17462-1-git-send-email-marex@denx.de>
References: <1341555027-17462-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add DT property "m25p,fast-read" that signalises the particular
chip supports "fast read" opcode.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: David Woodhouse <david.woodhouse@intel.com>
---
 drivers/mtd/devices/m25p80.c |   32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

NOTE: I'm not sure where to document this property, as m25p80 is
      a simple DT device. Any hints please?

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 28e841d..08019b8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -73,14 +73,6 @@
 #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
 #define	MAX_CMD_SIZE		5
 
-#ifdef CONFIG_M25PXX_USE_FAST_READ
-#define OPCODE_READ 	OPCODE_FAST_READ
-#define FAST_READ_DUMMY_BYTE 1
-#else
-#define OPCODE_READ 	OPCODE_NORM_READ
-#define FAST_READ_DUMMY_BYTE 0
-#endif
-
 #define JEDEC_MFR(_jedec_id)	((_jedec_id) >> 16)
 
 /****************************************************************************/
@@ -93,6 +85,7 @@ struct m25p {
 	u16			addr_width;
 	u8			erase_opcode;
 	u8			*command;
+	bool			fast_read;
 };
 
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
@@ -342,6 +335,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct m25p *flash = mtd_to_m25p(mtd);
 	struct spi_transfer t[2];
 	struct spi_message m;
+	uint8_t opcode;
 
 	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)from, len);
@@ -354,7 +348,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	 * Should add 1 byte DUMMY_BYTE.
 	 */
 	t[0].tx_buf = flash->command;
-	t[0].len = m25p_cmdsz(flash) + FAST_READ_DUMMY_BYTE;
+	t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
@@ -376,12 +370,14 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	 */
 
 	/* Set up the write data buffer. */
-	flash->command[0] = OPCODE_READ;
+	opcode = flash->fast_read ? OPCODE_FAST_READ : OPCODE_NORM_READ;
+	flash->command[0] = opcode;
 	m25p_addr2cmd(flash, from, flash->command);
 
 	spi_sync(flash->spi, &m);
 
-	*retlen = m.actual_length - m25p_cmdsz(flash) - FAST_READ_DUMMY_BYTE;
+	*retlen = m.actual_length - m25p_cmdsz(flash) -
+			(flash->fast_read ? 1 : 0);
 
 	mutex_unlock(&flash->lock);
 
@@ -803,9 +799,10 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	struct flash_info		*info;
 	unsigned			i;
 	struct mtd_part_parser_data	ppdata;
+	struct device_node		*np = spi->dev.of_node;
 
 #ifdef CONFIG_MTD_OF_PARTS
-	if (!of_device_is_available(spi->dev.of_node))
+	if (!of_device_is_available(np))
 		return -ENODEV;
 #endif
 
@@ -857,7 +854,8 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash = kzalloc(sizeof *flash, GFP_KERNEL);
 	if (!flash)
 		return -ENOMEM;
-	flash->command = kmalloc(MAX_CMD_SIZE + FAST_READ_DUMMY_BYTE, GFP_KERNEL);
+	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
+					GFP_KERNEL);
 	if (!flash->command) {
 		kfree(flash);
 		return -ENOMEM;
@@ -914,6 +912,14 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash->page_size = info->page_size;
 	flash->mtd.writebufsize = flash->page_size;
 
+	flash->fast_read = false;
+	if (np && of_find_property(np, "m25p,fast-read", NULL))
+		flash->fast_read = true;
+
+#ifdef CONFIG_M25PXX_USE_FAST_READ
+	flash->fast_read = true;
+#endif
+
 	if (info->addr_width)
 		flash->addr_width = info->addr_width;
 	else {
-- 
1.7.10
