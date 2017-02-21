Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5Cr-0007px-3M
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:49:58 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 03/11] nand: spi: Abstract SPI NAND cmd set to functions
Date: Tue, 21 Feb 2017 16:00:02 +0800
Message-ID: <1487664010-25926-4-git-send-email-peterpandong@micron.com>
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit abstracts basic SPI NAND commands to
functions in spi-nand-base.c. Because command sets
have difference by vendors, we create spi-nand-cmd.c
to define this difference by command config table.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/Kconfig             |   1 +
 drivers/mtd/nand/Makefile            |   1 +
 drivers/mtd/nand/spi/Kconfig         |   5 +
 drivers/mtd/nand/spi/Makefile        |   2 +
 drivers/mtd/nand/spi/spi-nand-base.c | 368 +++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/spi-nand-cmd.c  |  69 +++++++
 include/linux/mtd/spi-nand.h         |  34 ++++
 7 files changed, 480 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/spi-nand-base.c
 create mode 100644 drivers/mtd/nand/spi/spi-nand-cmd.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 1c1a1f4..7695fd8 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -2,3 +2,4 @@ config MTD_NAND_CORE
 	tristate
 
 source "drivers/mtd/nand/raw/Kconfig"
+source "drivers/mtd/nand/spi/Kconfig"
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index fe430d9..6221958 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 nandcore-objs :=  bbt.o
 
 obj-y	+= raw/
+obj-$(CONFIG_MTD_SPI_NAND)	+= spi/
diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
new file mode 100644
index 0000000..04a7b71
--- /dev/null
+++ b/drivers/mtd/nand/spi/Kconfig
@@ -0,0 +1,5 @@
+menuconfig MTD_SPI_NAND
+	tristate "SPI-NAND device Support"
+	depends on MTD_NAND
+	help
+	  This is the framework for the SPI NAND device drivers.
diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
new file mode 100644
index 0000000..3c617d6
--- /dev/null
+++ b/drivers/mtd/nand/spi/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MTD_SPI_NAND) += spi-nand-base.o
+obj-$(CONFIG_MTD_SPI_NAND) += spi-nand-cmd.o
diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
new file mode 100644
index 0000000..b75e5cd
--- /dev/null
+++ b/drivers/mtd/nand/spi/spi-nand-base.c
@@ -0,0 +1,368 @@
+/**
+* spi-nand-base.c
+*
+* Copyright (c) 2009-2017 Micron Technology, Inc.
+*
+* This program is free software; you can redistribute it and/or
+* modify it under the terms of the GNU General Public License
+* as published by the Free Software Foundation; either version 2
+* of the License, or (at your option) any later version.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+* GNU General Public License for more details.
+*/
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/mtd/spi-nand.h>
+
+static inline int spi_nand_issue_cmd(struct spi_nand_chip *chip,
+				struct spi_nand_cmd *cmd)
+{
+	return chip->command_fn(chip, cmd);
+}
+
+/**
+ * spi_nand_read_reg - send command 0Fh to read register
+ * @chip: SPI-NAND device structure
+ * @reg; register to read
+ * @buf: buffer to store value
+ */
+static int spi_nand_read_reg(struct spi_nand_chip *chip,
+			uint8_t reg, uint8_t *buf)
+{
+	struct spi_nand_cmd cmd;
+	int ret;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_GET_FEATURE;
+	cmd.n_addr = 1;
+	cmd.addr[0] = reg;
+	cmd.n_rx = 1;
+	cmd.rx_buf = buf;
+
+	ret = spi_nand_issue_cmd(chip, &cmd);
+	if (ret < 0)
+		pr_err("err: %d read register %d\n", ret, reg);
+
+	return ret;
+}
+
+/**
+ * spi_nand_write_reg - send command 1Fh to write register
+ * @chip: SPI-NAND device structure
+ * @reg; register to write
+ * @buf: buffer stored value
+ */
+static int spi_nand_write_reg(struct spi_nand_chip *chip,
+			uint8_t reg, uint8_t *buf)
+{
+	struct spi_nand_cmd cmd;
+	int ret;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_SET_FEATURE;
+	cmd.n_addr = 1;
+	cmd.addr[0] = reg;
+	cmd.n_tx = 1,
+	cmd.tx_buf = buf,
+
+	ret = spi_nand_issue_cmd(chip, &cmd);
+	if (ret < 0)
+		pr_err("err: %d write register %d\n", ret, reg);
+
+	return ret;
+}
+
+/**
+ * spi_nand_read_status - get status register value
+ * @chip: SPI-NAND device structure
+ * @status: buffer to store value
+ * Description:
+ *   After read, write, or erase, the Nand device is expected to set the
+ *   busy status.
+ *   This function is to allow reading the status of the command: read,
+ *   write, and erase.
+ *   Once the status turns to be ready, the other status bits also are
+ *   valid status bits.
+ */
+static int spi_nand_read_status(struct spi_nand_chip *chip, uint8_t *status)
+{
+	return spi_nand_read_reg(chip, REG_STATUS, status);
+}
+
+/**
+ * spi_nand_get_cfg - get configuration register value
+ * @chip: SPI-NAND device structure
+ * @cfg: buffer to store value
+ * Description:
+ *   Configuration register includes OTP config, Lock Tight enable/disable
+ *   and Internal ECC enable/disable.
+ */
+static int spi_nand_get_cfg(struct spi_nand_chip *chip, u8 *cfg)
+{
+	return spi_nand_read_reg(chip, REG_CFG, cfg);
+}
+
+/**
+ * spi_nand_set_cfg - set value to configuration register
+ * @chip: SPI-NAND device structure
+ * @cfg: buffer stored value
+ * Description:
+ *   Configuration register includes OTP config, Lock Tight enable/disable
+ *   and Internal ECC enable/disable.
+ */
+static int spi_nand_set_cfg(struct spi_nand_chip *chip, u8 *cfg)
+{
+	return spi_nand_write_reg(chip, REG_CFG, cfg);
+}
+
+/**
+ * spi_nand_enable_ecc - enable internal ECC
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
+ *   Enable chip internal ECC, set the bit to 1
+ *   Disable chip internal ECC, clear the bit to 0
+ */
+static void spi_nand_enable_ecc(struct spi_nand_chip *chip)
+{
+	u8 cfg = 0;
+
+	spi_nand_get_cfg(chip, &cfg);
+	if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE)
+		return;
+	cfg |= CFG_ECC_ENABLE;
+	spi_nand_set_cfg(chip, &cfg);
+}
+
+/**
+ * spi_nand_disable_ecc - disable internal ECC
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
+ *   Enable chip internal ECC, set the bit to 1
+ *   Disable chip internal ECC, clear the bit to 0
+ */
+static void spi_nand_disable_ecc(struct spi_nand_chip *chip)
+{
+	u8 cfg = 0;
+
+	spi_nand_get_cfg(chip, &cfg);
+	if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE) {
+		cfg &= ~CFG_ECC_ENABLE;
+		spi_nand_set_cfg(chip, &cfg);
+	}
+}
+
+/**
+ * spi_nand_write_enable - send command 06h to enable write or erase the
+ * Nand cells
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   Before write and erase the Nand cells, the write enable has to be set.
+ *   After the write or erase, the write enable bit is automatically
+ *   cleared (status register bit 2)
+ *   Set the bit 2 of the status register has the same effect
+ */
+static int spi_nand_write_enable(struct spi_nand_chip *chip)
+{
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_WR_ENABLE;
+
+	return spi_nand_issue_cmd(chip, &cmd);
+}
+
+/**
+ * spi_nand_read_page_to_cache - send command 13h to read data from Nand
+ * to cache
+ * @chip: SPI-NAND device structure
+ * @page_addr: page to read
+ */
+static int spi_nand_read_page_to_cache(struct spi_nand_chip *chip,
+					u32 page_addr)
+{
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_PAGE_READ;
+	cmd.n_addr = 3;
+	cmd.addr[0] = (u8)(page_addr >> 16);
+	cmd.addr[1] = (u8)(page_addr >> 8);
+	cmd.addr[2] = (u8)page_addr;
+
+	return spi_nand_issue_cmd(chip, &cmd);
+}
+
+/**
+ * spi_nand_read_from_cache - read data out from cache register
+ * @chip: SPI-NAND device structure
+ * @page_addr: page to read
+ * @column: the location to read from the cache
+ * @len: number of bytes to read
+ * @rbuf: buffer held @len bytes
+ * Description:
+ *   Command can be 03h, 0Bh, 3Bh, 6Bh, BBh, EBh
+ *   The read can specify 1 to (page size + spare size) bytes of data read at
+ *   the corresponding locations.
+ *   No tRd delay.
+ */
+static int spi_nand_read_from_cache(struct spi_nand_chip *chip,
+		u32 page_addr, u32 column, size_t len, u8 *rbuf)
+{
+	struct nand_device *nand = &chip->base;
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = chip->read_cache_op;
+	cmd.n_addr = 2;
+	cmd.addr[0] = (u8)(column >> 8);
+	if (chip->options & SPINAND_NEED_PLANE_SELECT)
+		cmd.addr[0] |= (u8)((nand_page_to_eraseblock(nand, page_addr)
+				& 0x1) << 4);
+	cmd.addr[1] = (u8)column;
+	cmd.n_rx = len;
+	cmd.rx_buf = rbuf;
+
+	return spi_nand_issue_cmd(chip, &cmd);
+}
+
+/**
+ * spi_nand_program_data_to_cache - write data to cache register
+ * @chip: SPI-NAND device structure
+ * @page_addr: page to write
+ * @column: the location to write to the cache
+ * @len: number of bytes to write
+ * @wrbuf: buffer held @len bytes
+ * @clr_cache: clear cache register or not
+ * Description:
+ *   Command can be 02h, 32h, 84h, 34h
+ *   02h and 32h will clear the cache with 0xff value first
+ *   Since it is writing the data to cache, there is no tPROG time.
+ */
+static int spi_nand_program_data_to_cache(struct spi_nand_chip *chip,
+			u32 page_addr, u32 column, size_t len, const u8 *wbuf)
+{
+	struct nand_device *nand = &chip->base;
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = chip->write_cache_op;
+	cmd.n_addr = 2;
+	cmd.addr[0] = (u8)(column >> 8);
+	if (chip->options & SPINAND_NEED_PLANE_SELECT)
+		cmd.addr[0] |= (u8)((nand_page_to_eraseblock(nand, page_addr)
+				& 0x1) << 4);
+	cmd.addr[1] = (u8)column;
+	cmd.n_tx = len;
+	cmd.tx_buf = wbuf;
+
+	return spi_nand_issue_cmd(chip, &cmd);
+}
+
+/**
+ * spi_nand_program_execute - send command 10h to write a page from
+ * cache to the Nand array
+ * @chip: SPI-NAND device structure
+ * @page_addr: the physical page location to write the page.
+ * Description:
+ *   Need to wait for tPROG time to finish the transaction.
+ */
+static int spi_nand_program_execute(struct spi_nand_chip *chip, u32 page_addr)
+{
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_PROG_EXC;
+	cmd.n_addr = 3;
+	cmd.addr[0] = (u8)(page_addr >> 16);
+	cmd.addr[1] = (u8)(page_addr >> 8);
+	cmd.addr[2] = (u8)page_addr;
+
+	return spi_nand_issue_cmd(chip, &cmd);
+}
+
+
+/**
+ * spi_nand_erase_block_erase - send command D8h to erase a block
+ * @chip: SPI-NAND device structure
+ * @page_addr: the page to erase.
+ * Description:
+ *   Need to wait for tERS.
+ */
+static int spi_nand_erase_block(struct spi_nand_chip *chip,
+					u32 page_addr)
+{
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_BLK_ERASE;
+	cmd.n_addr = 3;
+	cmd.addr[0] = (u8)(page_addr >> 16);
+	cmd.addr[1] = (u8)(page_addr >> 8);
+	cmd.addr[2] = (u8)page_addr;
+
+	return spi_nand_issue_cmd(chip, &cmd);
+}
+
+/**
+ * spi_nand_read_id - send 9Fh command to get ID
+ * @chip: SPI-NAND device structure
+ * @buf: buffer to store id
+ */
+static int spi_nand_read_id(struct spi_nand_chip *chip, u8 *buf)
+{
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_READ_ID;
+	cmd.n_rx = 2;
+	cmd.rx_buf = buf;
+
+	return spi_nand_issue_cmd(chip, &cmd);
+}
+
+/**
+ * spi_nand_reset - send command FFh to reset chip.
+ * @chip: SPI-NAND device structure
+ */
+static int spi_nand_reset(struct spi_nand_chip *chip)
+{
+	struct spi_nand_cmd cmd;
+
+	memset(&cmd, 0, sizeof(struct spi_nand_cmd));
+	cmd.cmd = SPINAND_CMD_RESET;
+
+	if (spi_nand_issue_cmd(chip, &cmd) < 0)
+		pr_err("spi_nand reset failed!\n");
+
+	/* elapse 2ms before issuing any other command */
+	udelay(2000);
+
+	return 0;
+}
+
+/**
+ * spi_nand_lock_block - write block lock register to
+ * lock/unlock device
+ * @spi: spi device structure
+ * @lock: value to set to block lock register
+ * Description:
+ *   After power up, all the Nand blocks are locked.  This function allows
+ *   one to unlock the blocks, and so it can be written or erased.
+ */
+static int spi_nand_lock_block(struct spi_nand_chip *chip, u8 lock)
+{
+	return spi_nand_write_reg(chip, REG_BLOCK_LOCK, &lock);
+}
+
+MODULE_DESCRIPTION("SPI NAND framework");
+MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/nand/spi/spi-nand-cmd.c b/drivers/mtd/nand/spi/spi-nand-cmd.c
new file mode 100644
index 0000000..d63741e
--- /dev/null
+++ b/drivers/mtd/nand/spi/spi-nand-cmd.c
@@ -0,0 +1,69 @@
+/**
+* spi-nand-cmd.c
+*
+* Copyright (c) 2009-2017 Micron Technology, Inc.
+*
+* This program is free software; you can redistribute it and/or
+* modify it under the terms of the GNU General Public License
+* as published by the Free Software Foundation; either version 2
+* of the License, or (at your option) any later version.
+*
+* This program is distributed in the hope that it will be useful,
+* but WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+* GNU General Public License for more details.
+*/
+#include <linux/mtd/spi-nand.h>
+#include <linux/kernel.h>
+
+static struct spi_nand_cmd_cfg *cmd_table;
+
+static struct spi_nand_cmd_cfg micron_cmd_cfg_table[] = {
+/*opcode	addr_bytes	addr_bits	dummy_bytes	data_nbits*/
+	{SPINAND_CMD_GET_FEATURE,		1,	1,	0,	1},
+	{SPINAND_CMD_SET_FEATURE,		1,	1,	0,	1},
+	{SPINAND_CMD_PAGE_READ,			3,	1,	0,	0},
+	{SPINAND_CMD_READ_FROM_CACHE,		2,	1,	1,	1},
+	{SPINAND_CMD_READ_FROM_CACHE_FAST,	2,	1,	1,	1},
+	{SPINAND_CMD_READ_FROM_CACHE_X2,	2,	1,	1,	2},
+	{SPINAND_CMD_READ_FROM_CACHE_DUAL_IO,	2,	2,	1,	2},
+	{SPINAND_CMD_READ_FROM_CACHE_X4,	2,	1,	1,	4},
+	{SPINAND_CMD_READ_FROM_CACHE_QUAD_IO,	2,	4,	2,	4},
+	{SPINAND_CMD_BLK_ERASE,			3,	1,	0,	0},
+	{SPINAND_CMD_PROG_EXC,			3,	1,	0,	0},
+	{SPINAND_CMD_PROG_LOAD,			2,	1,	0,	1},
+	{SPINAND_CMD_PROG_LOAD_RDM_DATA,	2,	1,	0,	1},
+	{SPINAND_CMD_PROG_LOAD_X4,		2,	1,	0,	4},
+	{SPINAND_CMD_PROG_LOAD_RDM_DATA_X4,	2,	1,	0,	4},
+	{SPINAND_CMD_WR_ENABLE,			0,	0,	0,	0},
+	{SPINAND_CMD_WR_DISABLE,		0,	0,	0,	0},
+	{SPINAND_CMD_READ_ID,			0,	0,	1,	1},
+	{SPINAND_CMD_RESET,			0,	0,	0,	0},
+	{SPINAND_CMD_END},
+};
+
+struct spi_nand_cmd_cfg *spi_nand_get_cmd_cfg(u8 opcode)
+{
+	struct spi_nand_cmd_cfg *index = cmd_table;
+
+	for (; index->opcode != SPINAND_CMD_END; index++) {
+		if (index->opcode == opcode)
+			return index;
+	}
+
+	pr_err("Invalid spi nand opcode %x\n", opcode);
+	BUG();
+}
+
+int spi_nand_set_cmd_cfg_table(int mfr)
+{
+	switch (mfr) {
+	case SPINAND_MFR_MICRON:
+		cmd_table = micron_cmd_cfg_table;
+		break;
+	default:
+		pr_err("Unknown device\n");
+		return -ENODEV;
+	}
+	return 0;
+}
diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
index 23b16f0..1fcbad7 100644
--- a/include/linux/mtd/spi-nand.h
+++ b/include/linux/mtd/spi-nand.h
@@ -115,6 +115,9 @@
 #define SPI_NAND_MT29F_ECC_7_8_BIT	0x50
 #define SPI_NAND_MT29F_ECC_UNCORR	0x20
 
+
+struct spi_nand_cmd;
+
 /**
  * struct spi_nand_chip - SPI-NAND Private Flash Chip Data
  * @base:		[INTERN] NAND device instance
@@ -128,6 +131,7 @@
  * @state:		[INTERN] the current state of the SPI-NAND device
  * @read_cache_op:	[REPLACEABLE] Opcode of read from cache
  * @write_cache_op:	[REPLACEABLE] Opcode of program load
+ * @command_fn:		[BOARDSPECIFIC] function to handle command transfer
  * @buf:		[INTERN] buffer for read/write data
  * @oobbuf:		[INTERN] buffer for read/write oob
  * @controller_caps:	[INTERN] capacities of SPI NAND controller
@@ -147,6 +151,8 @@ struct spi_nand_chip {
 	flstate_t	state;
 	u8		read_cache_op;
 	u8		write_cache_op;
+	int (*command_fn)(struct spi_nand_chip *this,
+			struct spi_nand_cmd *cmd);
 	u8		*buf;
 	u8		*oobbuf;
 	u32		controller_caps;
@@ -176,4 +182,32 @@ static inline void spi_nand_set_controller_data(struct spi_nand_chip *chip,
 {
 	chip->priv = priv;
 }
+
+#define SPINAND_MAX_ADDR_LEN		4
+
+struct spi_nand_cmd {
+	u8		cmd;
+	u8		n_addr;		/* Number of address */
+	u8		addr[SPINAND_MAX_ADDR_LEN];	/* Reg Offset */
+	u32		n_tx;		/* Number of tx bytes */
+	const u8	*tx_buf;	/* Tx buf */
+	u32		n_rx;		/* Number of rx bytes */
+	u8		*rx_buf;	/* Rx buf */
+};
+
+struct spi_nand_cmd_cfg {
+	u8		opcode;
+	u8		addr_bytes;
+	u8		addr_bits;
+	u8		dummy_bytes;
+	u8		data_bits;
+};
+
+/*SPI NAND chip options*/
+#define SPINAND_NEED_PLANE_SELECT	(1 << 0)
+
+/*SPI NAND manufacture ID definition*/
+#define SPINAND_MFR_MICRON		0x2C
+int spi_nand_set_cmd_cfg_table(int mfr);
+struct spi_nand_cmd_cfg *spi_nand_get_cmd_cfg(u8 opcode);
 #endif /* __LINUX_MTD_SPI_NAND_H */
-- 
1.9.1
