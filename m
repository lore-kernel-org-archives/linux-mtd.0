Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Krr7r-0006zm-6U
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 09:32:36 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K9100AOD6I32D@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 18:32:27 +0900 (KST)
Received: from spapp01.rdscm.com ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K9100JXA6I3A6@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 18:32:27 +0900 (KST)
Date: Mon, 20 Oct 2008 18:32:20 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [REFERENCE PATCH][OneNAND] S3C64XX support
To: linux-mtd@lists.infradead.org
Message-id: <20081020093220.GA18312@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PLEASE DON'T COMMIT IT

Hi,

It's OneNAND support on New Samsung Mobile CPU S3C64XX series 
Now it's only tested with s3c6410 with UBI & UBIFS.
If you want to use it on s3c6400, you should change some values.

There's some ugly hack for support s3c64xx. It will be handled more fancy later.

Any comments are welcome

Thank you,
Kyungmin Park
---
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index cb41cbc..1a4b8f7 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -27,6 +27,12 @@ config MTD_ONENAND_GENERIC
 	help
 	  Support for OneNAND flash via platform device driver.
 
+config MTD_ONENAND_S3C64XX
+	tristate "S3C64XX OneNAND Controller support"
+	depends on CPU_S3C64XX
+	help
+	  The S3C64XX has own OneNAND controller.
+
 config MTD_ONENAND_OTP
 	bool "OneNAND OTP Support"
 	help
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile
index 4d2eacf..cba6eea 100644
--- a/drivers/mtd/onenand/Makefile
+++ b/drivers/mtd/onenand/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_MTD_ONENAND)		+= onenand.o
 
 # Board specific.
 obj-$(CONFIG_MTD_ONENAND_GENERIC)	+= generic.o
+obj-$(CONFIG_MTD_ONENAND_S3C64XX)	+= s3c64xx.o
 
 # Simulator
 obj-$(CONFIG_MTD_ONENAND_SIM)		+= onenand_sim.o
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 926cf3a..5811999 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -636,6 +636,9 @@ static int onenand_check_bufferram(struct mtd_info *mtd, loff_t addr)
 	int blockpage, found = 0;
 	unsigned int i;
 
+	if (this->options & ONENAND_DONT_USE_BUFFERRAM)
+		return 0;
+
 	if (ONENAND_IS_2PLANE(this))
 		blockpage = onenand_get_2x_blockpage(mtd, addr);
 	else
@@ -832,7 +835,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	size_t ooblen = ops->ooblen;
 	u_char *buf = ops->datbuf;
 	u_char *oobbuf = ops->oobbuf;
-	int read = 0, column, thislen;
+	int read = 0, column, thislen, nextlen;
 	int oobread = 0, oobcolumn, thisooblen, oobsize;
 	int ret = 0, boundary = 0;
 	int writesize = this->writesize;
@@ -858,10 +861,16 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 
  	/* Read-while-load method */
 
+	thislen = min_t(int, writesize, len - read);
+	column = from & (writesize - 1);
+	if (column + thislen > writesize)
+		thislen = writesize - column;
+
  	/* Do first load to bufferRAM */
  	if (read < len) {
  		if (!onenand_check_bufferram(mtd, from)) {
-			this->command(mtd, ONENAND_CMD_READ, from, writesize);
+			this->main_buf = buf;
+			this->command(mtd, ONENAND_CMD_READ, from, thislen);
  			ret = this->wait(mtd, FL_READING);
  			onenand_update_bufferram(mtd, from, !ret);
 			if (ret == -EBADMSG)
@@ -869,16 +878,13 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
  		}
  	}
 
-	thislen = min_t(int, writesize, len - read);
-	column = from & (writesize - 1);
-	if (column + thislen > writesize)
-		thislen = writesize - column;
-
  	while (!ret) {
  		/* If there is more to load then start next load */
  		from += thislen;
  		if (read + thislen < len) {
-			this->command(mtd, ONENAND_CMD_READ, from, writesize);
+			this->main_buf = buf + thislen;
+			nextlen = min_t(int, writesize, len - thislen - read);
+			this->command(mtd, ONENAND_CMD_READ, from, nextlen);
  			/*
  			 * Chip boundary handling in DDP
  			 * Now we issued chip 1 read and pointed chip 1
@@ -999,6 +1005,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 		thislen = oobsize - column;
 		thislen = min_t(int, thislen, len);
 
+		this->spare_buf = buf;
 		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
 
 		onenand_update_bufferram(mtd, from, 0);
@@ -1129,11 +1136,8 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
-		if (ecc & ONENAND_ECC_2BIT_ALL) {
-			printk(KERN_INFO "onenand_bbt_wait: ecc error = 0x%04x"
-				", controller error 0x%04x\n", ecc, ctrl);
+		if (ecc & ONENAND_ECC_2BIT_ALL)
 			return ONENAND_BBT_READ_ERROR;
-		}
 	} else {
 		printk(KERN_ERR "onenand_bbt_wait: read timeout!"
 			"ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
@@ -1189,11 +1193,12 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 		thislen = mtd->oobsize - column;
 		thislen = min_t(int, thislen, len);
 
+		this->spare_buf = buf;
 		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
 
 		onenand_update_bufferram(mtd, from, 0);
 
-		ret = onenand_bbt_wait(mtd, FL_READING);
+		ret = this->bbt_wait(mtd, FL_READING);
 		if (ret)
 			break;
 
@@ -2116,6 +2121,9 @@ static void onenand_unlock_all(struct mtd_info *mtd)
 		    & ONENAND_CTRL_ONGO)
 			continue;
 
+		if (this->options & ONENAND_SKIP_UNLOCK_CHECK)
+			return;
+
 		/* Check lock status */
 		if (onenand_check_lock_status(this))
 			return;
@@ -2699,6 +2707,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 		this->command = onenand_command;
 	if (!this->wait)
 		onenand_setup_wait(mtd);
+	if (!this->bbt_wait)
+		this->bbt_wait = onenand_bbt_wait;
+	if (!this->unlock_all)
+		this->unlock_all = onenand_unlock_all;
 
 	if (!this->read_bufferram)
 		this->read_bufferram = onenand_read_bufferram;
@@ -2812,7 +2824,7 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	mtd->owner = THIS_MODULE;
 
 	/* Unlock whole block */
-	onenand_unlock_all(mtd);
+	this->unlock_all(mtd);
 
 	return this->scan_bbt(mtd);
 }
diff --git a/drivers/mtd/onenand/s3c64xx.c b/drivers/mtd/onenand/s3c64xx.c
new file mode 100644
index 0000000..1983ad5
--- /dev/null
+++ b/drivers/mtd/onenand/s3c64xx.c
@@ -0,0 +1,652 @@
+/*
+ *  linux/drivers/mtd/onenand/s3c64xx.c
+ *
+ *  Copyright (C) 2008 Samsung Electronics
+ *  Kyungmin Park <kyungmin.park@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/onenand.h>
+#include <linux/mtd/partitions.h>
+
+#include <asm/mach/flash.h>
+#include <asm/plat-s3c/s3c64xx-onenand.h>
+
+#include <asm/io.h>
+
+#if 0
+#define DPRINTK(format, args...)					\
+do {									\
+	printk("%s[%d]: " format "\n", __func__, __LINE__, ##args);	\
+} while (0)
+#else
+#define DPRINTK(...)			do { } while (0)
+#endif
+
+/* b0010000 << 26 */
+#define AHB_ADDR			0x20000000
+
+#define ONENAND_ERASE_STATUS		0x00
+#define ONENAND_MULTI_ERASE_SET		0x01
+#define ONENAND_ERASE_START		0x03
+
+#define ONENAND_UNLOCK_START		0x08
+#define ONENAND_UNLOCK_END		0x09
+#define ONENAND_LOCK_START		0x0A
+#define ONENAND_LOCK_END		0x0B
+#define ONENAND_LOCK_TIGHT_START	0x0C
+#define ONENAND_LOCK_TIGHT_END		0x0D
+#define ONENAND_UNLOCK_ALL		0x0E
+
+#define MAP_00				(0x0 << 24)
+#define MAP_01				(0x1 << 24)
+#define MAP_10				(0x2 << 24)
+#define MAP_11				(0x3 << 24)
+
+#define MEM_ADDR(fba, fpa, fsa)		(((fba) << 12 | (fpa) << 6 | (fsa) << 4) & 0xffffff)
+
+/* The 'addr' is byte address. It makes a 16-bit word */
+#define CMD_MAP_00(addr)		(AHB_ADDR | MAP_00 | ((addr) << 1))
+#define CMD_MAP_01(mem_addr)	 	(AHB_ADDR | MAP_01 | (mem_addr))
+#define CMD_MAP_10(mem_addr)		(AHB_ADDR | MAP_10 | (mem_addr))
+#define CMD_MAP_11(addr)		(AHB_ADDR | MAP_11 | ((addr) << 2))
+
+struct s3c64xx_onenand {
+	struct mtd_info	*mtd;
+
+	int		sync_mode;
+
+	void __iomem	*base;
+	void __iomem	*ahb_addr;
+
+	int		command_mask;
+	int		bootram_command;
+
+	int		mem_addr;
+	unsigned char	*page_buf;
+	unsigned char	oobbuf[64];
+};
+
+static struct s3c64xx_onenand *onenand;
+
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probes[] = { "cmdlinepart", NULL, };
+#endif
+
+static inline int s3c64xx_read_reg(int offset)
+{
+	return readl(onenand->base + offset);
+}
+
+static inline void s3c64xx_write_reg(int value, int offset)
+{
+	writel(value, onenand->base + offset);
+}
+
+static inline int s3c64xx_read_cmd(unsigned int cmd)
+{
+	return readl(onenand->ahb_addr + ((cmd) & onenand->command_mask));
+}
+
+static inline void s3c64xx_write_cmd(int value, unsigned int cmd)
+{
+	writel(value, onenand->ahb_addr + ((cmd) & onenand->command_mask));
+}
+
+static void s3c64xx_onenand_reset(void)
+{
+	int stat;
+
+	s3c64xx_write_reg(ONENAND_MEM_RESET_COLD, MEM_RESET0_OFFSET);
+	while (1) {
+		stat = s3c64xx_read_reg(INT_ERR_STAT0_OFFSET);
+		if (stat & INT_ACT)
+			break;
+	}
+	s3c64xx_write_reg(stat, INT_ERR_ACK0_OFFSET);
+
+	/* Clear interrupt */
+	s3c64xx_write_reg(0x0, INT_ERR_ACK0_OFFSET);
+	/* Clear the ECC status */
+	s3c64xx_write_reg(0x0, ECC_ERR_STAT0_OFFSET);
+}
+
+static unsigned short s3c64xx_onenand_readw(void __iomem *addr)
+{
+	struct onenand_chip *this = onenand->mtd->priv;
+	int reg = addr - this->base;
+	int word_addr = reg >> 1;
+
+	/* It's used for probing time */
+	switch (reg) {
+	case ONENAND_REG_MANUFACTURER_ID:
+		return s3c64xx_read_reg(MANUFACT_ID0_OFFSET);
+	case ONENAND_REG_DEVICE_ID:
+		return s3c64xx_read_reg(DEVICE_ID0_OFFSET);
+	case ONENAND_REG_VERSION_ID:
+		return s3c64xx_read_reg(FLASH_VER_ID0_OFFSET);
+	case ONENAND_REG_DATA_BUFFER_SIZE:
+		return s3c64xx_read_reg(DATA_BUF_SIZE0_OFFSET);
+	case ONENAND_REG_SYS_CFG1:
+		return s3c64xx_read_reg(MEM_CFG0_OFFSET);
+
+	default:
+		break;
+	}
+
+	/* BootRAM access control */
+	if ((unsigned int) addr < ONENAND_DATARAM && onenand->bootram_command) {
+		if (word_addr == 0)
+			return s3c64xx_read_reg(MANUFACT_ID0_OFFSET);
+		if (word_addr == 1)
+			return s3c64xx_read_reg(DEVICE_ID0_OFFSET);
+		if (word_addr == 2)
+			return s3c64xx_read_reg(FLASH_VER_ID0_OFFSET);
+	}
+
+	DPRINTK("illegal reg 0x%x, -> 0x%x 0x%x", word_addr, s3c64xx_read_cmd(CMD_MAP_11(word_addr)), s3c64xx_read_reg(INT_ERR_STAT0_OFFSET));
+	return s3c64xx_read_cmd(CMD_MAP_11(word_addr)) & 0xffff;
+}
+
+static void s3c64xx_onenand_writew(unsigned short value, void __iomem *addr)
+{
+	struct onenand_chip *this = onenand->mtd->priv;
+	int reg = addr - this->base;
+	int word_addr = reg >> 1;
+
+	/* It's used for probing time */
+	switch (reg) {
+	case ONENAND_REG_SYS_CFG1:
+		s3c64xx_write_reg(value, MEM_CFG0_OFFSET);
+		return;
+
+	/* Lock/lock-tight/unlock/unlock_all */
+	case ONENAND_REG_START_BLOCK_ADDRESS:
+		return;
+
+	default:
+		break;
+	}
+
+	/* BootRAM access control */
+	if ((unsigned int) addr < ONENAND_DATARAM) {
+		if (value == ONENAND_CMD_READID) {
+			onenand->bootram_command = 1;
+			return;
+		}
+		if (value == ONENAND_CMD_RESET) {
+			s3c64xx_write_reg(ONENAND_MEM_RESET_COLD, MEM_RESET0_OFFSET);
+			onenand->bootram_command = 0;
+			return;
+		}
+	}
+
+	DPRINTK("illegal reg 0x%x, value 0x%x", word_addr, value);
+	s3c64xx_write_cmd(value, CMD_MAP_11(word_addr));
+}
+
+static int s3c64xx_onenand_wait(struct mtd_info *mtd, int state)
+{
+	unsigned long timeout;
+	unsigned int flags = INT_ACT;
+	unsigned int stat, ecc;
+
+	/* The 20 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(20);
+	while (time_before(jiffies, timeout)) {
+		stat = s3c64xx_read_reg(INT_ERR_STAT0_OFFSET);
+		if (stat & flags)
+			break;
+
+		if (state != FL_READING)
+			cond_resched();
+	}
+	/* To get correct interrupt status in timeout case */
+	stat = s3c64xx_read_reg(INT_ERR_STAT0_OFFSET);
+
+	s3c64xx_write_reg(stat, INT_ERR_ACK0_OFFSET);
+	if (stat & (LOCKED_BLK | ERS_FAIL | PGM_FAIL | INT_TO | LD_FAIL_ECC_ERR)) {
+		printk(KERN_INFO "s3c64xx_onenand_wait: controller error = 0x%04x\n", stat);
+		if (stat & LOCKED_BLK)
+			printk(KERN_INFO "s3c64xx_onenand_wait: it's locked error\n");
+
+		return -EIO;
+	}
+
+	if (stat & LOAD_CMP) {
+		ecc = s3c64xx_read_reg(ECC_ERR_STAT0_OFFSET);
+		if (ecc & ONENAND_ECC_2BIT_ALL) {
+			printk(KERN_INFO "onenand_wait: ECC error = 0x%04x\n", ecc);
+			return -EBADMSG;
+		}
+	}
+
+	return 0;
+}
+
+static int s3c64xx_onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
+                           size_t len)
+{
+	struct onenand_chip *this = mtd->priv;
+	unsigned int *m, *s;
+	int fba, fpa, fsa = 0;
+	int mem_addr;
+	int i, count;
+	int writesize = this->writesize;
+	int column;
+	int dummy, copy = 0;
+
+	fba = (int) (addr >> this->erase_shift);
+	fpa = (int) (addr >> this->page_shift);
+	fpa &= this->page_mask;
+
+	mem_addr = MEM_ADDR(fba, fpa, fsa);
+
+#if 0
+	if (cmd != ONENAND_CMD_READOOB) // && (addr & 0x1ff || len & 0x1ff))
+		printk("cmd 0x%x, addr 0x%x, fba %d, fpa %d, len 0x%x\n", cmd, (unsigned int) addr, fba, fpa, len);
+#endif
+
+	switch (cmd) {
+	case ONENAND_CMD_READ:
+		column = addr & (writesize - 1);
+
+		/* Check it's already read */
+#if 0
+		if (onenand->mem_addr == mem_addr) {
+			memcpy(this->main_buf, onenand->page_buf + column, len);
+			return 0;
+		}
+#endif
+		if (len == mtd->writesize)
+			m = (unsigned int *) this->main_buf;
+		else {
+			m = (unsigned int *) onenand->page_buf;
+			copy = 1;
+		}
+
+		count = mtd->writesize >> 2;
+		for (i = 0; i < count; i++)
+			*m++ = s3c64xx_read_cmd(CMD_MAP_01(mem_addr));
+
+		if (copy) {
+			memcpy(this->main_buf, onenand->page_buf + column, len);
+			onenand->mem_addr = mem_addr;
+		} else
+			onenand->mem_addr = -1;
+		return 0;
+
+	case ONENAND_CMD_READOOB:
+		s3c64xx_write_reg(TSRF, TRANS_SPARE0_OFFSET);
+
+		/* Main */
+		count = mtd->writesize >> 2;
+		for (i = 0; i < count; i++)
+			dummy = s3c64xx_read_cmd(CMD_MAP_01(mem_addr));
+
+		/* Spare */
+		memset(onenand->oobbuf, 0xff, mtd->oobsize);
+		s = (unsigned int *) onenand->oobbuf;
+		count = mtd->oobsize >> 2;
+		for (i = 0; i < count; i++)
+			*s++ = s3c64xx_read_cmd(CMD_MAP_01(mem_addr));
+
+		m = (unsigned int *) this->spare_buf;
+		s = (unsigned int *) onenand->oobbuf;
+		count = len >> 2;
+		for (i = 0; i < count; i++)
+			*m++ = *s++;
+
+		s3c64xx_write_reg(~TSRF, TRANS_SPARE0_OFFSET);
+		return 0;
+
+	case ONENAND_CMD_PROG:
+//		s3c64xx_write_reg(TSRF, TRANS_SPARE0_OFFSET);
+		m = (unsigned int *) this->main_buf;
+		if (len != mtd->writesize)
+			printk(KERN_ERR "length error %d", len);
+		DPRINTK("write buffer 0x%x\n", (unsigned int) this->main_buf);
+		count = len >> 2;
+		for (i = 0; i < count; i++)
+			s3c64xx_write_cmd(*m++, CMD_MAP_01(mem_addr));
+		/* FIXME how to write oob together */
+#if 0
+		s = (unsigned int *) this->spare_buf;
+		count = mtd->oobsize >> 2;
+		for (i = 0; i < count; i++)
+			s3c64xx_write_cmd(*s++, CMD_MAP_01(mem_addr));
+#endif
+//		s3c64xx_write_reg(~TSRF, TRANS_SPARE0_OFFSET);
+		return 0;
+
+	case ONENAND_CMD_PROGOOB:
+		s3c64xx_write_reg(TSRF, TRANS_SPARE0_OFFSET);
+
+		/* Main */
+		count = mtd->writesize >> 2;
+		for (i = 0; i < count; i++)
+			s3c64xx_write_cmd(0xffffffff, CMD_MAP_01(mem_addr));
+
+		/* Copy spare buffer to oob buffer */
+		memset(onenand->oobbuf, 0xff, mtd->oobsize);
+		memcpy(onenand->oobbuf, this->spare_buf, len);
+
+		/* Spare */
+		s = (unsigned int *) onenand->oobbuf;
+		count = mtd->oobsize >> 2;
+		for (i = 0; i < count; i++)
+			s3c64xx_write_cmd(*s++, CMD_MAP_01(mem_addr));
+
+		s3c64xx_write_reg(~TSRF, TRANS_SPARE0_OFFSET);
+		return 0;
+
+	case ONENAND_CMD_UNLOCK_ALL:
+		s3c64xx_write_cmd(ONENAND_UNLOCK_ALL, CMD_MAP_10(mem_addr));
+		return 0;
+
+	case ONENAND_CMD_ERASE:
+		s3c64xx_write_cmd(ONENAND_ERASE_START, CMD_MAP_10(mem_addr));
+		return 0;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int s3c64xx_read_bufferram(struct mtd_info *mtd, int area,
+				  unsigned char *buffer, int offset,
+				  size_t count)
+{
+#if 0
+	if (area == ONENAND_DATARAM && (offset & 0x1ff || count & 0x1ff))
+		printk("0x%x, 0x%x, 0x%x, 0x%x\n", area, (unsigned int) buffer, offset, count);
+#endif
+	return 0;
+}
+
+static int s3c64xx_write_bufferram(struct mtd_info *mtd, int area,
+				   const unsigned char *buffer, int offset,
+				   size_t count)
+{
+	struct onenand_chip *this = mtd->priv;
+
+	DPRINTK("0x%x, 0x%x, 0x%x, 0x%x", area, (unsigned int) buffer, offset, (unsigned int) count);
+	if (area == ONENAND_DATARAM)
+		this->main_buf = (unsigned char *) buffer;
+	else 
+		this->spare_buf = (unsigned char *) buffer;
+
+	return 0;
+}
+
+static int s3c64xx_onenand_bbt_wait(struct mtd_info *mtd, int state)
+{
+	unsigned long timeout;
+	unsigned int flags = INT_ACT;
+	unsigned int stat;
+
+	/* The 20 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(20);
+	while (time_before(jiffies, timeout)) {
+		stat = s3c64xx_read_reg(INT_ERR_STAT0_OFFSET);
+		if (stat & flags)
+			break;
+
+		if (state != FL_READING)
+			cond_resched();
+	}
+	/* To get correct interrupt status in timeout case */
+	stat = s3c64xx_read_reg(INT_ERR_STAT0_OFFSET);
+
+	s3c64xx_write_reg(stat, INT_ERR_ACK0_OFFSET);
+	if (stat & LD_FAIL_ECC_ERR) {
+		s3c64xx_onenand_reset();
+		return ONENAND_BBT_READ_ERROR;
+	}
+
+	if (stat & LOAD_CMP) {
+		int ecc = s3c64xx_read_reg(ECC_ERR_STAT0_OFFSET);
+		if (ecc & ONENAND_ECC_2BIT_ALL) {
+			s3c64xx_onenand_reset();
+			return ONENAND_BBT_READ_ERROR;
+		}
+	} else
+		return ONENAND_BBT_READ_FATAL_ERROR;
+
+	return 0;
+}
+
+void s3c64xx_set_width_regs(struct onenand_chip *this)
+{
+	int dev_id, ddp, density;
+	int dbs_dfs, fba, fpa, fsa;
+
+	dev_id = s3c64xx_read_reg(DEVICE_ID0_OFFSET);
+
+	ddp = dev_id & ONENAND_DEVICE_IS_DDP;
+	density = (dev_id >> ONENAND_DEVICE_DENSITY_SHIFT) & 0xf;
+
+	dbs_dfs = 0;
+	fba = density + 7;
+	fpa = 6;
+	fsa = 2;
+
+	if (ddp) {
+		dbs_dfs = 1;
+		fba--;
+	}
+
+	s3c64xx_write_reg(fba, FBA_WIDTH0_OFFSET); 
+	s3c64xx_write_reg(fpa, FPA_WIDTH0_OFFSET); 
+	s3c64xx_write_reg(fsa, FSA_WIDTH0_OFFSET); 
+	s3c64xx_write_reg(dbs_dfs, DBS_DFS_WIDTH0_OFFSET); 
+}
+
+void s3c64xx_onenand_setup(struct mtd_info *mtd)
+{
+	struct onenand_chip *this = mtd->priv;
+
+	onenand->mtd = mtd;
+
+	/* XXX use cpu_is_s3c6400 style function if provided */
+	/* S3C6400 */
+	onenand->command_mask = 0x0ffffff;
+	/* S3C6410 */
+	onenand->command_mask = 0x3ffffff;
+
+	this->read_word = s3c64xx_onenand_readw;
+	this->write_word = s3c64xx_onenand_writew;
+
+	this->wait = s3c64xx_onenand_wait;
+	this->bbt_wait = s3c64xx_onenand_bbt_wait;
+	this->command = s3c64xx_onenand_command;
+
+	this->read_bufferram = s3c64xx_read_bufferram;
+	this->write_bufferram = s3c64xx_write_bufferram;
+
+	this->options |= ONENAND_SKIP_UNLOCK_CHECK;
+	this->options |= ONENAND_DONT_USE_BUFFERRAM;
+}
+
+static int s3c64xx_onenand_probe(struct platform_device *pdev)
+{
+	struct flash_platform_data *pdata;
+	struct onenand_chip *this;
+	struct mtd_info *mtd;
+	struct resource *r;
+	int size, err;
+
+	pdata = pdev->dev.platform_data;
+	if (!pdata) {
+		dev_err(&pdev->dev, "no platform data defined\n");
+		return -ENODEV;
+	}
+
+	size = sizeof(struct mtd_info) + sizeof(struct onenand_chip);
+	mtd = kzalloc(size, GFP_KERNEL);
+	if (!mtd) {
+		dev_err(&pdev->dev, "failed to allocate memory\n");
+		return -ENOMEM;
+	}
+
+	onenand = kzalloc(sizeof(struct s3c64xx_onenand), GFP_KERNEL);
+	if (!onenand) {
+		err = -ENOMEM;
+		goto onenand_fail;
+	}
+
+	this = (struct onenand_chip *) &mtd[1];
+	mtd->priv = this;
+
+	s3c64xx_onenand_setup(mtd);
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(&pdev->dev, "no resource defined\n");
+		return -ENXIO;
+		goto resource_failed;
+	}
+
+	r = request_mem_region(r->start, r->end - r->start + 1, pdev->name);
+	if (!r) {
+		dev_err(&pdev->dev, "failed to request memory resource\n");
+		err = -EBUSY;
+		goto request_failed;
+	}
+
+	onenand->base = ioremap(r->start, r->end - r->start + 1);
+	if (!onenand->base) {
+		err = -EFAULT;
+		goto ioremap_failed;
+	}
+
+	onenand->ahb_addr = ioremap(AHB_ADDR, SZ_256M);
+	if (!onenand->ahb_addr) {
+		err = -EINVAL;
+		goto ahb_failed;
+	}
+
+	platform_set_drvdata(pdev, mtd);
+
+	if (onenand_scan(mtd, 1)) {
+		err = -EFAULT;
+		goto scan_failed;
+	}
+	
+	onenand->page_buf = kzalloc(mtd->writesize, GFP_KERNEL);
+	if (!onenand->page_buf) {
+		err = -ENOMEM;
+		goto page_buf_fail;
+	}
+	onenand->mem_addr = -1;
+
+	/* S3C64XX don't handle subpage write */
+	mtd->subpage_sft = 0;
+	this->subpagesize = mtd->writesize;
+
+	if (s3c64xx_read_reg(MEM_CFG0_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ) {
+		printk(KERN_INFO "OneNAND Sync. Burst Read enabled\n");
+		onenand->sync_mode = 1;
+	}
+
+	s3c64xx_set_width_regs(this);
+
+#ifdef CONFIG_MTD_PARTITIONS
+	err = parse_mtd_partitions(mtd, part_probes, &pdata->parts, 0);
+	if (err > 0)
+		add_mtd_partitions(mtd, pdata->parts, err);
+	else if (pdata->parts)
+		add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+	else
+#endif
+		err = add_mtd_device(mtd);
+
+	return 0;
+page_buf_fail:
+	onenand_release(mtd);
+scan_failed:
+	iounmap(onenand->ahb_addr);
+ahb_failed:
+	iounmap(onenand->base);
+ioremap_failed:
+	release_mem_region(r->start, r->end - r->start + 1);
+request_failed:
+resource_failed:
+	kfree(onenand);
+onenand_fail:
+	kfree(mtd);
+	return err;
+}
+
+static int s3c64xx_onenand_remove(struct platform_device *pdev)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+
+	onenand_release(mtd);
+	iounmap(onenand->base);
+	platform_set_drvdata(pdev, NULL);
+	kfree(onenand->page_buf);
+	kfree(onenand);
+	kfree(mtd);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int s3c64xx_onenand_suspend(struct platform_device *pdev, pm_message_t pm)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct onenand_chip *this = mtd->priv;
+
+	this->wait(mtd, FL_PM_SUSPENDED);
+	return mtd->suspend(mtd);
+}
+
+static int s3c64xx_onenand_resume(struct platform_device *pdev)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+	struct onenand_chip *this = mtd->priv;
+
+	mtd->resume(mtd);
+	this->unlock_all(mtd);
+	return 0;
+}
+#else
+#define s3c64xx_onenand_suspend		NULL
+#define s3c64xx_onenand_resume		NULL
+#endif
+
+static struct platform_driver s3c64xx_onenand_driver = {
+	.driver		= {
+		.name		= "s3c64xx-onenand",
+	},
+	.probe		= s3c64xx_onenand_probe,
+	.remove		= s3c64xx_onenand_remove,
+	.suspend	= s3c64xx_onenand_suspend,
+	.resume		= s3c64xx_onenand_resume,
+};
+
+static int __init s3c64xx_onenand_init(void)
+{
+	return platform_driver_register(&s3c64xx_onenand_driver);
+}
+
+static void __exit s3c64xx_onenand_exit(void)
+{
+	platform_driver_unregister(&s3c64xx_onenand_driver);
+}
+
+module_init(s3c64xx_onenand_init);
+module_exit(s3c64xx_onenand_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
+MODULE_DESCRIPTION("Samsung S3C64XX OneNAND controller support");
diff --git a/include/asm-arm/plat-s3c/s3c64xx-onenand.h b/include/asm-arm/plat-s3c/s3c64xx-onenand.h
new file mode 100644
index 0000000..d478019
--- /dev/null
+++ b/include/asm-arm/plat-s3c/s3c64xx-onenand.h
@@ -0,0 +1,77 @@
+#ifndef __S3C64XX_ONENAND_H__
+#define __S3C64XX_ONENAND_H__
+
+#include <mach/hardware.h>
+
+/*
+ * OneNAND Controller
+ */
+#define S3C64XX_ONENAND_BASE	0x70100000
+
+#define MEM_CFG0_OFFSET		0x0000
+#define BURST_LEN0_OFFSET	0x0010
+#define MEM_RESET0_OFFSET	0x0020
+#define INT_ERR_STAT0_OFFSET	0x0030
+#define INT_ERR_MASK0_OFFSET	0x0040
+#define INT_ERR_ACK0_OFFSET	0x0050
+#define ECC_ERR_STAT0_OFFSET	0x0060
+#define MANUFACT_ID0_OFFSET	0x0070
+#define DEVICE_ID0_OFFSET	0x0080
+#define DATA_BUF_SIZE0_OFFSET	0x0090
+#define BOOT_BUF_SIZE0_OFFSET	0x00A0
+#define BUF_AMOUNT0_OFFSET	0x00B0
+#define TECH0_OFFSET		0x00C0
+#define FBA_WIDTH0_OFFSET	0x00D0
+#define FPA_WIDTH0_OFFSET	0x00E0
+#define FSA_WIDTH0_OFFSET	0x00F0
+#define TRANS_SPARE0_OFFSET	0x0140
+#define DBS_DFS_WIDTH0_OFFSET	0x0160
+#define INT_PIN_ENABLE0_OFFSET	0x01A0
+#define ACC_CLOCK0_OFFSET	0x01C0
+#define FLASH_VER_ID0_OFFSET	0x01F0
+#define FLASH_AUX_CNTRL0_OFFSET	0x0300
+
+#ifndef __KERNEL__
+#define MEM_CFG0_REG		__REG(S3C64XX_ONENAND_BASE + MEM_CFG0_OFFSET)
+#define BURST_LEN0_REG		__REG(S3C64XX_ONENAND_BASE + BURST_LEN0_OFFSET)
+#define MEM_RESET0_REG		__REG(S3C64XX_ONENAND_BASE + MEM_RESET0_OFFSET)
+#define INT_ERR_STAT0_REG	__REG(S3C64XX_ONENAND_BASE + INT_ERR_STAT0_OFFSET)
+#define INT_ERR_MASK0_REG	__REG(S3C64XX_ONENAND_BASE + INT_ERR_MASK0_OFFSET)
+#define INT_ERR_ACK0_REG	__REG(S3C64XX_ONENAND_BASE + INT_ERR_ACK0_OFFSET)
+#define ECC_ERR_STAT0_REG	__REG(S3C64XX_ONENAND_BASE + ECC_ERR_STAT0_OFFSET)
+#define MANUFACT_ID0_REG	__REG(S3C64XX_ONENAND_BASE + MANUFACT_ID0_OFFSET)
+#define DEVICE_ID0_REG		__REG(S3C64XX_ONENAND_BASE + DEVICE_ID0_OFFSET)
+#define DATA_BUF_SIZE0_REG	__REG(S3C64XX_ONENAND_BASE + DATA_BUF_SIZE0_OFFSET)
+#define FBA_WIDTH0_REG		__REG(S3C64XX_ONENAND_BASE + FBA_WIDTH0_OFFSET)
+#define FPA_WIDTH0_REG		__REG(S3C64XX_ONENAND_BASE + FPA_WIDTH0_OFFSET)
+#define FSA_WIDTH0_REG		__REG(S3C64XX_ONENAND_BASE + FSA_WIDTH0_OFFSET)
+#define TRANS_SPARE0_REG	__REG(S3C64XX_ONENAND_BASE + TRANS_SPARE0_OFFSET)
+#define DBS_DFS_WIDTH0_REG	__REG(S3C64XX_ONENAND_BASE + DBS_DFS_WIDTH0_OFFSET)
+#define INT_PIN_ENABLE0_REG	__REG(S3C64XX_ONENAND_BASE + INT_PIN_ENABLE0_OFFSET)
+#define ACC_CLOCK0_REG		__REG(S3C64XX_ONENAND_BASE + ACC_CLOCK0_OFFSET)
+#define FLASH_VER_ID0_REG	__REG(S3C64XX_ONENAND_BASE + FLASH_VER_ID0_OFFSET)
+#define FLASH_AUX_CNTRL0_REG	__REG(S3C64XX_ONENAND_BASE + FLASH_AUX_CNTRL0_OFFSET)
+#endif
+
+#define ONENAND_MEM_RESET_HOT	0x3
+#define ONENAND_MEM_RESET_COLD	0x2
+#define ONENAND_MEM_RESET_WARM	0x1
+
+#define CACHE_OP_ERR    (1 << 13)
+#define RST_CMP         (1 << 12)
+#define RDY_ACT         (1 << 11)
+#define INT_ACT         (1 << 10)
+#define UNSUP_CMD       (1 << 9)
+#define LOCKED_BLK      (1 << 8)
+#define BLK_RW_CMP      (1 << 7)
+#define ERS_CMP         (1 << 6)
+#define PGM_CMP         (1 << 5)
+#define LOAD_CMP        (1 << 4)
+#define ERS_FAIL        (1 << 3)
+#define PGM_FAIL        (1 << 2)
+#define INT_TO          (1 << 1)
+#define LD_FAIL_ECC_ERR (1 << 0)
+
+#define TSRF		(1 << 0)
+
+#endif
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 9aa2a91..64f173a 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -108,6 +108,8 @@ struct onenand_chip {
 
 	int (*command)(struct mtd_info *mtd, int cmd, loff_t address, size_t len);
 	int (*wait)(struct mtd_info *mtd, int state);
+	int (*bbt_wait)(struct mtd_info *mtd, int state);
+	void (*unlock_all)(struct mtd_info *mtd);
 	int (*read_bufferram)(struct mtd_info *mtd, int area,
 			unsigned char *buffer, int offset, size_t count);
 	int (*write_bufferram)(struct mtd_info *mtd, int area,
@@ -121,6 +123,9 @@ struct onenand_chip {
 	struct completion	complete;
 	int			irq;
 
+	unsigned char		*main_buf;
+	unsigned char		*spare_buf;
+
 	spinlock_t		chip_lock;
 	wait_queue_head_t	wq;
 	onenand_state_t		state;
@@ -169,6 +174,8 @@ struct onenand_chip {
 #define ONENAND_HAS_CONT_LOCK		(0x0001)
 #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
 #define ONENAND_HAS_2PLANE		(0x0004)
+#define ONENAND_SKIP_UNLOCK_CHECK	(0x0010)
+#define ONENAND_DONT_USE_BUFFERRAM	(0x0020)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
 
