From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] m25p80: memory accessor interface for SPI MTD driver
Date: Mon,  3 Aug 2009 17:02:05 -0400
Message-Id: <1249333325-16750-1-git-send-email-sudhakar.raj@ti.com>
Cc: david-b@pacbell.net, davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On TI's da850/omap-l138 EVM, MAC address is stored in SPI flash.
This patch implements memory accessor interface for SPI MTD
driver which enables the kernel to access flash data.

This patch also changes the initialization sequence of the
drivers by moving mtd and spi ahead of net in drivers/Makefile
thereby enabling da850/omap-l138 ethernet driver to read the
MAC address while booting.

Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
---
 drivers/Makefile             |    4 ++--
 drivers/mtd/devices/m25p80.c |   40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/spi/flash.h    |    2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index bc4205d..2a1d41f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -42,6 +42,8 @@ obj-y				+= macintosh/
 obj-$(CONFIG_IDE)		+= ide/
 obj-$(CONFIG_SCSI)		+= scsi/
 obj-$(CONFIG_ATA)		+= ata/
+obj-$(CONFIG_MTD)		+= mtd/
+obj-$(CONFIG_SPI)		+= spi/
 obj-y				+= net/
 obj-$(CONFIG_ATM)		+= atm/
 obj-$(CONFIG_FUSION)		+= message/
@@ -50,8 +52,6 @@ obj-y				+= ieee1394/
 obj-$(CONFIG_UIO)		+= uio/
 obj-y				+= cdrom/
 obj-y				+= auxdisplay/
-obj-$(CONFIG_MTD)		+= mtd/
-obj-$(CONFIG_SPI)		+= spi/
 obj-$(CONFIG_PCCARD)		+= pcmcia/
 obj-$(CONFIG_DIO)		+= dio/
 obj-$(CONFIG_SBUS)		+= sbus/
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index ae5fe91..9b0f409 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/memory.h>
 #include <linux/mutex.h>
 #include <linux/math64.h>
 
@@ -69,6 +70,7 @@
 
 struct m25p {
 	struct spi_device	*spi;
+	struct memory_accessor	macc;
 	struct mutex		lock;
 	struct mtd_info		mtd;
 	unsigned		partitioned:1;
@@ -548,6 +550,38 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "w25x64", 0xef3017, 0, 64 * 1024, 128, SECT_4K, },
 };
 
+/*
+ * This lets other kernel code access the flash data. For example, it
+ * might hold a board's Ethernet address, or board-specific calibration
+ * data generated on the manufacturing floor.
+ */
+
+static ssize_t m25p_macc_read(struct memory_accessor *macc, char *buf,
+			off_t offset, size_t count)
+{
+	struct m25p *info = container_of(macc, struct m25p, macc);
+	ssize_t ret = -EIO;
+	size_t retlen;
+
+	if (m25p80_read(&info->mtd, offset, count, &retlen, buf) == 0)
+		ret = retlen;
+
+	return ret;
+}
+
+static ssize_t m25p_macc_write(struct memory_accessor *macc, const char *buf,
+			off_t offset, size_t count)
+{
+	struct m25p *info = container_of(macc, struct m25p, macc);
+	ssize_t ret = -EIO;
+	size_t retlen;
+
+	if (m25p80_write(&info->mtd, offset, count, &retlen, buf) == 0)
+		ret = retlen;
+
+	return ret;
+}
+
 static struct flash_info *__devinit jedec_probe(struct spi_device *spi)
 {
 	int			tmp;
@@ -669,6 +703,9 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	flash->mtd.read = m25p80_read;
 	flash->mtd.write = m25p80_write;
 
+	flash->macc.read = m25p_macc_read;
+	flash->macc.write = m25p_macc_write;
+
 	/* prefer "small sector" erase if possible */
 	if (info->flags & SECT_4K) {
 		flash->erase_opcode = OPCODE_BE_4K;
@@ -691,6 +728,9 @@ static int __devinit m25p_probe(struct spi_device *spi)
 		flash->mtd.erasesize, flash->mtd.erasesize / 1024,
 		flash->mtd.numeraseregions);
 
+	if (data->setup)
+		data->setup(&flash->macc, data->context);
+
 	if (flash->mtd.numeraseregions)
 		for (i = 0; i < flash->mtd.numeraseregions; i++)
 			DEBUG(MTD_DEBUG_LEVEL2,
diff --git a/include/linux/spi/flash.h b/include/linux/spi/flash.h
index 3f22932..5e3cbea 100644
--- a/include/linux/spi/flash.h
+++ b/include/linux/spi/flash.h
@@ -24,6 +24,8 @@ struct flash_platform_data {
 	unsigned int	nr_parts;
 
 	char		*type;
+	void		(*setup)(struct memory_accessor *, void *context);
+	void		*context;
 
 	/* we'll likely add more ... use JEDEC IDs, etc */
 };
-- 
1.5.6
