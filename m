Received: from [210.94.41.89] (helo=july7)
	by canuck.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HUBWV-0001j7-9t
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 20:51:24 -0400
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH/RFC] OneNAND simulator support
Date: Thu, 22 Mar 2007 09:51:20 +0900
Message-ID: <00bf01c76c1c$36997820$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch simulate various OneNAND flash chips for the MTD onenand layer.
It's simple implementation, only basic operations.
It don't support the recent changes in NANDSIM such as lazy block allocation,
bitflip, and so on.

Any comments are welcome.

Thank you,
Kyungmin Park

diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 373bddc..714b5bd 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -43,4 +43,11 @@ config MTD_ONENAND_OTP
 
 	  OTP block is fully-guaranteed to be a valid block.
 
+config MTD_ONENAND_SIM
+	tristate "OneNAND simulator support"
+        depends on MTD_ONENAND && MTD_PARTITIONS
+        help
+          The simulator may simulate various OneNAND flash chips for the
+          MTD onenand layer.
+
 endmenu
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile
index 269cfe4..4d2eacf 100644
--- a/drivers/mtd/onenand/Makefile
+++ b/drivers/mtd/onenand/Makefile
@@ -8,4 +8,7 @@ obj-$(CONFIG_MTD_ONENAND)		+= onenand.o
 # Board specific.
 obj-$(CONFIG_MTD_ONENAND_GENERIC)	+= generic.o
 
+# Simulator
+obj-$(CONFIG_MTD_ONENAND_SIM)		+= onenand_sim.o
+
 onenand-objs = onenand_base.o onenand_bbt.o
diff --git a/drivers/mtd/onenand/onenand_sim.c
b/drivers/mtd/onenand/onenand_sim.c
new file mode 100644
index 0000000..986ffb2
--- /dev/null
+++ b/drivers/mtd/onenand/onenand_sim.c
@@ -0,0 +1,487 @@
+/*
+ *  linux/drivers/mtd/onenand/onenand_sim.c
+ *
+ *  The OneNAND simulator
+ *
+ *  Copyright(C) 2005-2007 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/vmalloc.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/onenand.h>
+
+#include <asm/io.h>
+#include <asm/sizes.h>
+
+#ifndef CONFIG_ONENAND_SIM_MANUFACTURER
+#define CONFIG_ONENAND_SIM_MANUFACTURER         0xec
+#endif
+#ifndef CONFIG_ONENAND_SIM_DEVICE_ID
+#define CONFIG_ONENAND_SIM_DEVICE_ID            0x04
+#endif
+#ifndef CONFIG_ONENAND_SIM_VERSION_ID
+#define CONFIG_ONENAND_SIM_VERSION_ID           0x1e
+#endif
+
+static int manuf_id	= CONFIG_ONENAND_SIM_MANUFACTURER;
+static int device_id	= CONFIG_ONENAND_SIM_DEVICE_ID;
+static int version_id	= CONFIG_ONENAND_SIM_VERSION_ID;
+
+struct onenand_flash {
+	void __iomem *base;
+	void __iomem *data;
+};
+
+#define ONENAND_CORE(flash)		(flash->data)
+
+#define ONENAND_MAIN_AREA(this,
offset)					\
+	(this->base + ONENAND_DATARAM + offset)
+
+#define ONENAND_SPARE_AREA(this, offset)				\
+	(this->base + ONENAND_SPARERAM + offset)
+
+#define ONENAND_GET_WP_STATUS(this)					\
+	(readw(this->base + ONENAND_REG_WP_STATUS))
+
+#define ONENAND_SET_WP_STATUS(v, this)					\
+	(writew(v, this->base + ONENAND_REG_WP_STATUS))
+
+/* It has all 0xff chars */
+#define MAX_ONENAND_PAGESIZE		(2048 + 64)
+static unsigned char *ffchars;
+
+static struct mtd_partition os_partitions[] = {
+	{
+		.name		= "OneNAND simulator partition",
+		.offset		= 0,
+		.size		= MTDPART_SIZ_FULL,
+	},
+};
+
+/*
+ * OneNAND simulator mtd
+ */
+struct onenand_info {
+	struct mtd_info		mtd;
+	struct mtd_partition	*parts;
+	struct onenand_chip	onenand;
+	struct onenand_flash	flash;
+};
+
+struct onenand_info *info;
+
+#define DPRINTK(format, args...)					\
+do {									\
+	printk("%s[%d]: " format "\n", __func__, __LINE__, ##args);	\
+} while (0)
+
+/**
+ * onenand_lock_handle - Handle Lock scheme
+ * @param this		OneNAND device structure
+ * @param cmd		The command to be sent
+ *
+ * Send lock command to OneNAND device.
+ * The lock scheme is depends on chip type.
+ */
+static void onenand_lock_handle(struct onenand_chip *this, int cmd)
+{
+	int block_lock_scheme;
+	int status;
+
+	status = ONENAND_GET_WP_STATUS(this);
+	block_lock_scheme = !(this->options & ONENAND_HAS_CONT_LOCK);
+
+	switch (cmd) {
+	case ONENAND_CMD_UNLOCK:
+		if (block_lock_scheme)
+			ONENAND_SET_WP_STATUS(ONENAND_WP_US, this);
+		else
+			ONENAND_SET_WP_STATUS(status | ONENAND_WP_US, this);
+		break;
+
+	case ONENAND_CMD_LOCK:
+		if (block_lock_scheme)
+			ONENAND_SET_WP_STATUS(ONENAND_WP_LS, this);
+		else
+			ONENAND_SET_WP_STATUS(status | ONENAND_WP_LS, this);
+		break;
+
+	case ONENAND_CMD_LOCK_TIGHT:
+		if (block_lock_scheme)
+			ONENAND_SET_WP_STATUS(ONENAND_WP_LTS, this);
+		else
+			ONENAND_SET_WP_STATUS(status | ONENAND_WP_LTS, this);
+		break;
+
+	default:
+		break;
+	}
+}
+
+/**
+ * onenand_bootram_handle - Handle BootRAM area
+ * @param this		OneNAND device structure
+ * @param cmd		The command to be sent
+ *
+ * Emulate BootRAM area. It is possible to do basic operation using BootRAM.
+ */
+static void onenand_bootram_handle(struct onenand_chip *this, int cmd)
+{
+	switch (cmd) {
+	case ONENAND_CMD_READID:
+		writew(manuf_id, this->base);
+		writew(device_id, this->base + 2);
+		writew(version_id, this->base + 4);
+		break;
+
+	default:
+		/* REVIST: Handle other commands */
+		break;
+	}
+}
+
+/**
+ * onenand_update_interrupt - Set interrupt register
+ * @param this         OneNAND device structure
+ * @param cmd          The command to be sent
+ *
+ * Update interrupt register. The status is depends on command.
+ */
+static void onenand_update_interrupt(struct onenand_chip *this, int cmd)
+{
+	int interrupt = ONENAND_INT_MASTER;
+
+	switch (cmd) {
+	case ONENAND_CMD_READ:
+	case ONENAND_CMD_READOOB:
+		interrupt |= ONENAND_INT_READ;
+		break;
+
+	case ONENAND_CMD_PROG:
+	case ONENAND_CMD_PROGOOB:
+		interrupt |= ONENAND_INT_WRITE;
+		break;
+
+	case ONENAND_CMD_ERASE:
+		interrupt |= ONENAND_INT_ERASE;
+		break;
+
+	case ONENAND_CMD_RESET:
+		interrupt |= ONENAND_INT_RESET;
+		break;
+
+	default:
+		break;
+	}
+
+	writew(interrupt, this->base + ONENAND_REG_INTERRUPT);
+}
+
+/**
+ * onenand_check_overwrite - Check over-write if happend
+ * @param dest		The destination pointer
+ * @param src		The source pointer
+ * @param count		The length to be check
+ * @return		0 on same, otherwise 1
+ *
+ * Compare the source with destination
+ */
+static int onenand_check_overwrite(void *dest, void *src, size_t count)
+{
+	unsigned int *s = (unsigned int *) src;
+	unsigned int *d = (unsigned int *) dest;
+	int i;
+
+	count >>= 2;
+	for (i = 0; i < count; i++)
+		if ((*s++ ^ *d++) != 0)
+			return 1;
+
+	return 0;
+}
+
+/**
+ * onenand_data_handle - Handle OneNAND Core and DataRAM
+ * @param this		OneNAND device structure
+ * @param cmd		The command to be sent
+ * @param dataram	Which dataram used
+ * @param offset	The offset to OneNAND Core
+ *
+ * Copy data from OneNAND Core to DataRAM (read)
+ * Copy data from DataRAM to OneNAND Core (write)
+ * Erase the OneNAND Core (erase)
+ */
+static void onenand_data_handle(struct onenand_chip *this, int cmd,
+				int dataram, unsigned int offset)
+{
+	struct onenand_flash *flash = this->priv;
+	int main_offset, spare_offset;
+	void __iomem *src;
+	void __iomem *dest;
+
+	if (dataram) {
+		main_offset = info->mtd.writesize;
+		spare_offset = info->mtd.oobsize;
+	} else {
+		main_offset = 0;
+		spare_offset = 0;
+	}
+
+	switch (cmd) {
+	case ONENAND_CMD_READ:
+		src = ONENAND_CORE(flash) + offset;
+		dest = ONENAND_MAIN_AREA(this, main_offset);
+		memcpy(dest, src, info->mtd.writesize);
+		/* Fall through */
+
+	case ONENAND_CMD_READOOB:
+		src = ONENAND_CORE(flash) + this->chipsize + (offset >> 5);
+		dest = ONENAND_SPARE_AREA(this, spare_offset);
+		memcpy(dest, src, info->mtd.oobsize);
+		break;
+
+	case ONENAND_CMD_PROG:
+		src = ONENAND_MAIN_AREA(this, main_offset);
+		dest = ONENAND_CORE(flash) + offset;
+		if (memcmp(dest, ffchars, info->mtd.writesize) &&
+		    onenand_check_overwrite(dest, src, info->mtd.writesize))
+			printk(KERN_ERR "over-write happend at 0x%08x\n",
+			       offset);
+		memcpy(dest, src, info->mtd.writesize);
+		/* Fall through */
+
+	case ONENAND_CMD_PROGOOB:
+		src = ONENAND_SPARE_AREA(this, spare_offset);
+		/* Check all data is 0xff chars */
+		if (!memcmp(src, ffchars, info->mtd.oobsize))
+			break;
+
+		dest = ONENAND_CORE(flash) + this->chipsize + (offset >> 5);
+		if (memcmp(dest, ffchars, info->mtd.oobsize) &&
+		    onenand_check_overwrite(dest, src, info->mtd.oobsize))
+			printk(KERN_ERR "OOB: over-write happend at 0x%08x\n",
+			       offset);
+		memcpy(dest, src, info->mtd.oobsize);
+		break;
+
+	case ONENAND_CMD_ERASE:
+		memset(ONENAND_CORE(flash) + offset, 0xff,
+		       (1 << this->erase_shift));
+		memset(ONENAND_CORE(flash) + this->chipsize + (offset >> 5),
0xff,
+		       ((1 << this->erase_shift) >> 5));
+		break;
+
+	default:
+		break;
+	}
+}
+
+/**
+ * onenand_command_handle - Handle command
+ * @param this		OneNAND device structure
+ * @param cmd		The command to be sent
+ *
+ * Emulate OneNAND command.
+ */
+static void onenand_command_handle(struct onenand_chip *this, int cmd)
+{
+	unsigned long offset = 0;
+	int block = -1, page = -1, bufferram = -1;
+	int dataram = 0;
+
+	switch (cmd) {
+	case ONENAND_CMD_UNLOCK:
+	case ONENAND_CMD_LOCK:
+	case ONENAND_CMD_LOCK_TIGHT:
+	case ONENAND_CMD_UNLOCK_ALL:
+		onenand_lock_handle(this, cmd);
+		break;
+
+	case ONENAND_CMD_BUFFERRAM:
+		/* Do nothing */
+		return;
+
+	default:
+		block = (int) readw(this->base + ONENAND_REG_START_ADDRESS1);
+		if (block & (1 << ONENAND_DDP_SHIFT)) {
+			block &= ~(1 << ONENAND_DDP_SHIFT);
+			/* The half of chip block */
+			block += this->chipsize >> (this->erase_shift + 1);
+		}
+		if (cmd == ONENAND_CMD_ERASE)
+			break;
+
+		page = (int) readw(this->base + ONENAND_REG_START_ADDRESS8);
+		page = (page >> ONENAND_FPA_SHIFT);
+		bufferram = (int) readw(this->base + ONENAND_REG_START_BUFFER);
+		bufferram >>= ONENAND_BSA_SHIFT;
+		bufferram &= ONENAND_BSA_DATARAM1;
+		dataram = (bufferram == ONENAND_BSA_DATARAM1) ? 1 : 0;
+		break;
+	}
+
+	if (block != -1)
+		offset += block << this->erase_shift;
+
+	if (page != -1)
+		offset += page << this->page_shift;
+
+	onenand_data_handle(this, cmd, dataram, offset);
+
+	onenand_update_interrupt(this, cmd);
+}
+
+/**
+ * onenand_writew - [OneNAND Interface] Emulate write operation
+ * @param value		value to write
+ * @param addr		address to write
+ *
+ * Write OneNAND register with value
+ */
+static void onenand_writew(unsigned short value, void __iomem * addr)
+{
+	struct onenand_chip *this = info->mtd.priv;
+
+	/* BootRAM handling */
+	if (addr < this->base + ONENAND_DATARAM) {
+		onenand_bootram_handle(this, value);
+		return;
+	}
+	/* Command handling */
+	if (addr == this->base + ONENAND_REG_COMMAND)
+		onenand_command_handle(this, value);
+
+	writew(value, addr);
+}
+
+/**
+ * flash_init - Initialize OneNAND simulator
+ * @param flash		OneNAND simulaotr data strucutres
+ *
+ * Initialize OneNAND simulator.
+ */
+static int __init flash_init(struct onenand_flash *flash)
+{
+	int density, size;
+	int buffer_size;
+
+	flash->base = kzalloc(SZ_128K, GFP_KERNEL);
+	if (!flash->base) {
+		printk(KERN_ERR "Unalbe to allocate base address.\n");
+		return -ENOMEM;
+	}
+
+	density = device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	size = ((16 << 20) << density);
+
+	ONENAND_CORE(flash) = vmalloc(size + (size >> 5));
+	if (!ONENAND_CORE(flash)) {
+		printk(KERN_ERR "Unalbe to allocate nand core address.\n");
+		kfree(flash->base);
+		return -ENOMEM;
+	}
+
+	memset(ONENAND_CORE(flash), 0xff, size + (size >> 5));
+
+	/* Setup registers */
+	writew(manuf_id, flash->base + ONENAND_REG_MANUFACTURER_ID);
+	writew(device_id, flash->base + ONENAND_REG_DEVICE_ID);
+	writew(version_id, flash->base + ONENAND_REG_VERSION_ID);
+
+	if (density < 2)
+		buffer_size = 0x0400;	/* 1KB page */
+	else
+		buffer_size = 0x0800;	/* 2KB page */
+	writew(buffer_size, flash->base + ONENAND_REG_DATA_BUFFER_SIZE);
+
+	return 0;
+}
+
+/**
+ * flash_exit - Clean up OneNAND simulator
+ * @param flash		OneNAND simulaotr data strucutres
+ *
+ * Clean up OneNAND simulator.
+ */
+static void flash_exit(struct onenand_flash *flash)
+{
+	vfree(ONENAND_CORE(flash));
+	kfree(flash->base);
+	kfree(flash);
+}
+
+static int __init onenand_sim_init(void)
+{
+	/* Allocate all 0xff chars pointer */
+	ffchars = kmalloc(MAX_ONENAND_PAGESIZE, GFP_KERNEL);
+	if (!ffchars) {
+		printk(KERN_ERR "Unable to allocate ff chars.\n");
+		return -ENOMEM;
+	}
+	memset(ffchars, 0xff, MAX_ONENAND_PAGESIZE);
+
+	/* Allocate OneNAND simulator mtd pointer */
+	info = kzalloc(sizeof(struct onenand_info), GFP_KERNEL);
+	if (!info) {
+		printk(KERN_ERR "Unable to allocate core structures.\n");
+		kfree(ffchars);
+		return -ENOMEM;
+	}
+
+	/* Override write_word function */
+	info->onenand.write_word = onenand_writew;
+
+	if (flash_init(&info->flash)) {
+		printk(KERN_ERR "Unable to allocat flash.\n");
+		kfree(ffchars);
+		kfree(info);
+		return -ENOMEM;
+	}
+
+	info->parts = os_partitions;
+
+	info->onenand.base = info->flash.base;
+	info->onenand.priv = &info->flash;
+
+	info->mtd.name = "OneNAND simulator";
+	info->mtd.priv = &info->onenand;
+	info->mtd.owner = THIS_MODULE;
+
+	if (onenand_scan(&info->mtd, 1)) {
+		kfree(ffchars);
+		kfree(info);
+		flash_exit(&info->flash);
+		return -ENXIO;
+	}
+
+	add_mtd_partitions(&info->mtd, info->parts, ARRAY_SIZE(os_partitions));
+
+	return 0;
+}
+
+static void __exit onenand_sim_exit(void)
+{
+	struct onenand_chip *this = info->mtd.priv;
+	struct onenand_flash *flash = this->priv;
+
+	kfree(ffchars);
+	onenand_release(&info->mtd);
+	flash_exit(flash);
+	kfree(info);
+}
+
+module_init(onenand_sim_init);
+module_exit(onenand_sim_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
+MODULE_DESCRIPTION("The OneNAND flash simulator");
