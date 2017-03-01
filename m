Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizpi-0002Ot-Ny
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:42:09 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v2 2/6] nand: spi: add basic operations support
Date: Wed, 1 Mar 2017 16:52:06 +0800
Message-ID: <1488358330-23832-3-git-send-email-peterpandong@micron.com>
In-Reply-To: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
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

This commit is to support read, readoob, write,
writeoob and erase operations in spi nand framwork.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spinand_base.c | 887 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h         |   2 +
 2 files changed, 889 insertions(+)

diff --git a/drivers/mtd/nand/spi/spinand_base.c b/drivers/mtd/nand/spi/spinand_base.c
index 97d47146..1bc57e9 100644
--- a/drivers/mtd/nand/spi/spinand_base.c
+++ b/drivers/mtd/nand/spi/spinand_base.c
@@ -25,6 +25,31 @@
 #include <linux/slab.h>
 
 
+static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo);
+
+/**
+ * spinand_get_device - [GENERIC] Get chip for selected access
+ * @mtd: MTD device structure
+ * @new_state: the state which is requested
+ *
+ * Get the device and lock it for exclusive access
+ */
+static void spinand_get_device(struct spinand_device *chip)
+{
+	mutex_lock(&chip->lock);
+}
+
+/**
+ * spinand_release_device - [GENERIC] release chip
+ * @mtd: MTD device structure
+ *
+ * Deselect, release chip lock and wake up anyone waiting on the device
+ */
+static void spinand_release_device(struct spinand_device *chip)
+{
+	mutex_unlock(&chip->lock);
+}
+
 static u64 spinand_get_chip_size(struct spinand_device *chip)
 {
 	struct nand_device *nand = &chip->base;
@@ -115,6 +140,258 @@ static int spinand_read_status(struct spinand_device *chip, uint8_t *status)
 }
 
 /**
+ * spinand_get_cfg - get configuration register value
+ * @chip: SPI-NAND device structure
+ * @cfg: buffer to store value
+ * Description:
+ *   Configuration register includes OTP config, Lock Tight enable/disable
+ *   and Internal ECC enable/disable.
+ */
+static int spinand_get_cfg(struct spinand_device *chip, u8 *cfg)
+{
+	return spinand_read_reg(chip, REG_CFG, cfg);
+}
+
+/**
+ * spinand_set_cfg - set value to configuration register
+ * @chip: SPI-NAND device structure
+ * @cfg: buffer stored value
+ * Description:
+ *   Configuration register includes OTP config, Lock Tight enable/disable
+ *   and Internal ECC enable/disable.
+ */
+static int spinand_set_cfg(struct spinand_device *chip, u8 *cfg)
+{
+	return spinand_write_reg(chip, REG_CFG, cfg);
+}
+
+/**
+ * spinand_enable_ecc - enable internal ECC
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
+ *   Enable chip internal ECC, set the bit to 1
+ *   Disable chip internal ECC, clear the bit to 0
+ */
+static void spinand_enable_ecc(struct spinand_device *chip)
+{
+	u8 cfg = 0;
+
+	spinand_get_cfg(chip, &cfg);
+	if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE)
+		return;
+	cfg |= CFG_ECC_ENABLE;
+	spinand_set_cfg(chip, &cfg);
+}
+
+/**
+ * spinand_disable_ecc - disable internal ECC
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   There is one bit( bit 0x10 ) to set or to clear the internal ECC.
+ *   Enable chip internal ECC, set the bit to 1
+ *   Disable chip internal ECC, clear the bit to 0
+ */
+static void spinand_disable_ecc(struct spinand_device *chip)
+{
+	u8 cfg = 0;
+
+	spinand_get_cfg(chip, &cfg);
+	if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE) {
+		cfg &= ~CFG_ECC_ENABLE;
+		spinand_set_cfg(chip, &cfg);
+	}
+}
+
+/**
+ * spinand_write_enable - send command 06h to enable write or erase the
+ * Nand cells
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   Before write and erase the Nand cells, the write enable has to be set.
+ *   After the write or erase, the write enable bit is automatically
+ *   cleared (status register bit 2)
+ *   Set the bit 2 of the status register has the same effect
+ */
+static int spinand_write_enable(struct spinand_device *chip)
+{
+	struct spinand_op cmd;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_WR_ENABLE;
+
+	return spinand_exec_cmd(chip, &cmd);
+}
+
+/**
+ * spinand_read_page_to_cache - send command 13h to read data from Nand
+ * to cache
+ * @chip: SPI-NAND device structure
+ * @page_addr: page to read
+ */
+static int spinand_read_page_to_cache(struct spinand_device *chip,
+					u32 page_addr)
+{
+	struct spinand_op cmd;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_PAGE_READ;
+	cmd.n_addr = 3;
+	cmd.addr[0] = (u8)(page_addr >> 16);
+	cmd.addr[1] = (u8)(page_addr >> 8);
+	cmd.addr[2] = (u8)page_addr;
+
+	return spinand_exec_cmd(chip, &cmd);
+}
+
+static int spinand_get_address_bits(u8 opcode)
+{
+	switch (opcode) {
+	case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
+		return 4;
+	case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
+		return 2;
+	default:
+		return 1;
+	}
+}
+
+static int spinand_get_data_bits(u8 opcode)
+{
+	switch (opcode) {
+	case SPINAND_CMD_READ_FROM_CACHE_QUAD_IO:
+	case SPINAND_CMD_READ_FROM_CACHE_X4:
+	case SPINAND_CMD_PROG_LOAD_X4:
+	case SPINAND_CMD_PROG_LOAD_RDM_DATA_X4:
+		return 4;
+	case SPINAND_CMD_READ_FROM_CACHE_DUAL_IO:
+	case SPINAND_CMD_READ_FROM_CACHE_X2:
+		return 2;
+	default:
+		return 1;
+	}
+}
+
+/**
+ * spinand_read_from_cache - read data out from cache register
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
+static int spinand_read_from_cache(struct spinand_device *chip,
+		u32 page_addr, u32 column, size_t len, u8 *rbuf)
+{
+	struct spinand_op cmd;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = chip->read_cache_op;
+	if (chip->manufacturer.ops->build_column_addr) {
+		chip->manufacturer.ops->build_column_addr(chip, &cmd,
+						          page_addr, column);
+	} else {
+		cmd.n_addr = 2;
+		cmd.addr[0] = (u8)(column >> 8);
+		cmd.addr[1] = (u8)column;
+	}
+	if (chip->manufacturer.ops->get_dummy)
+		cmd.dummy_bytes = chip->manufacturer.ops->get_dummy(chip, &cmd);
+	cmd.addr_nbits = spinand_get_address_bits(chip->read_cache_op);
+	cmd.n_rx = len;
+	cmd.rx_buf = rbuf;
+	cmd.data_nbits = spinand_get_data_bits(chip->read_cache_op);
+
+	return spinand_exec_cmd(chip, &cmd);
+}
+
+/**
+ * spinand_program_data_to_cache - write data to cache register
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
+static int spinand_program_data_to_cache(struct spinand_device *chip,
+			u32 page_addr, u32 column, size_t len, const u8 *wbuf)
+{
+	struct spinand_op cmd;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = chip->write_cache_op;
+	if (chip->manufacturer.ops->build_column_addr) {
+		chip->manufacturer.ops->build_column_addr(chip, &cmd,
+						          page_addr, column);
+	} else {
+		cmd.n_addr = 2;
+		cmd.addr[0] = (u8)(column >> 8);
+		cmd.addr[1] = (u8)column;
+	}
+	cmd.addr_nbits = spinand_get_address_bits(chip->write_cache_op);
+	cmd.n_tx = len;
+	cmd.tx_buf = wbuf;
+	cmd.data_nbits = spinand_get_data_bits(chip->write_cache_op);
+
+	return spinand_exec_cmd(chip, &cmd);
+}
+
+/**
+ * spinand_program_execute - send command 10h to write a page from
+ * cache to the Nand array
+ * @chip: SPI-NAND device structure
+ * @page_addr: the physical page location to write the page.
+ * Description:
+ *   Need to wait for tPROG time to finish the transaction.
+ */
+static int spinand_program_execute(struct spinand_device *chip, u32 page_addr)
+{
+	struct spinand_op cmd;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_PROG_EXC;
+	cmd.n_addr = 3;
+	cmd.addr[0] = (u8)(page_addr >> 16);
+	cmd.addr[1] = (u8)(page_addr >> 8);
+	cmd.addr[2] = (u8)page_addr;
+
+	return spinand_exec_cmd(chip, &cmd);
+}
+
+
+/**
+ * spinand_erase_block_erase - send command D8h to erase a block
+ * @chip: SPI-NAND device structure
+ * @page_addr: the page to erase.
+ * Description:
+ *   Need to wait for tERS.
+ */
+static int spinand_erase_block(struct spinand_device *chip,
+					u32 page_addr)
+{
+	struct spinand_op cmd;
+
+	spinand_op_init(&cmd);
+	cmd.cmd = SPINAND_CMD_BLK_ERASE;
+	cmd.n_addr = 3;
+	cmd.addr[0] = (u8)(page_addr >> 16);
+	cmd.addr[1] = (u8)(page_addr >> 8);
+	cmd.addr[2] = (u8)page_addr;
+
+	return spinand_exec_cmd(chip, &cmd);
+}
+
+/**
  * spinand_wait - wait until the command is done
  * @chip: SPI-NAND device structure
  * @s: buffer to store status register(can be NULL)
@@ -197,6 +474,611 @@ static int spinand_lock_block(struct spinand_device *chip, u8 lock)
 	return spinand_write_reg(chip, REG_BLOCK_LOCK, &lock);
 }
 
+static void spinand_get_ecc_status(struct spinand_device *chip,
+	unsigned int status, unsigned int *corrected, unsigned int *ecc_errors)
+{
+	return chip->ecc_engine.ops->get_ecc_status(chip, status, corrected, ecc_errors);
+}
+
+/**
+ * spinand_do_read_page - read page from flash to buffer
+ * @mtd: MTD device structure
+ * @page_addr: page address/raw address
+ * @column: column address
+ * @ecc_off: without ecc or not
+ * @corrected: how many bit error corrected
+ * @buf: data buffer
+ * @len: data length to read
+ */
+static int spinand_do_read_page(struct mtd_info *mtd, u32 page_addr,
+			bool ecc_off, int *corrected, bool oob_only)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret, ecc_error = 0;
+	u8 status;
+
+	spinand_read_page_to_cache(chip, page_addr);
+	ret = spinand_wait(chip, &status);
+	if (ret < 0) {
+		pr_err("error %d waiting page 0x%x to cache\n",
+			ret, page_addr);
+		return ret;
+	}
+	if (!oob_only)
+		spinand_read_from_cache(chip, page_addr, 0,
+		nand_page_size(nand) + nand_per_page_oobsize(nand), chip->buf);
+	else
+		spinand_read_from_cache(chip, page_addr, nand_page_size(nand),
+				nand_per_page_oobsize(nand), chip->oobbuf);
+	if (!ecc_off) {
+		spinand_get_ecc_status(chip, status, corrected, &ecc_error);
+		/*
+		 * If there's an ECC error, print a message and notify MTD
+		 * about it. Then complete the read, to load actual data on
+		 * the buffer (instead of the status result).
+		 */
+		if (ecc_error) {
+			pr_err("internal ECC error reading page 0x%x\n",
+				page_addr);
+			mtd->ecc_stats.failed++;
+		} else if (*corrected) {
+			mtd->ecc_stats.corrected += *corrected;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * spinand_do_write_page - write data from buffer to flash
+ * @mtd: MTD device structure
+ * @page_addr: page address/raw address
+ * @column: column address
+ * @buf: data buffer
+ * @len: data length to write
+ * @clr_cache: clear cache register with 0xFF or not
+ */
+static int spinand_do_write_page(struct mtd_info *mtd, u32 page_addr,
+						bool oob_only)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	u8 status;
+	int ret = 0;
+
+	spinand_write_enable(chip);
+	if (!oob_only)
+		spinand_program_data_to_cache(chip, page_addr, 0,
+		nand_page_size(nand) + nand_per_page_oobsize(nand), chip->buf);
+	else
+		spinand_program_data_to_cache(chip, page_addr, nand_page_size(nand),
+				nand_per_page_oobsize(nand), chip->oobbuf);
+	spinand_program_execute(chip, page_addr);
+	ret = spinand_wait(chip, &status);
+	if (ret < 0) {
+		pr_err("error %d reading page 0x%x from cache\n",
+			ret, page_addr);
+		return ret;
+	}
+	if ((status & STATUS_P_FAIL_MASK) == STATUS_P_FAIL) {
+		pr_err("program page 0x%x failed\n", page_addr);
+		ret = -EIO;
+	}
+	return ret;
+}
+
+/**
+ * spinand_transfer_oob - transfer oob to client buffer
+ * @chip: SPI-NAND device structure
+ * @oob: oob destination address
+ * @ops: oob ops structure
+ * @len: size of oob to transfer
+ */
+static int spinand_transfer_oob(struct spinand_device *chip, u8 *oob,
+				  struct mtd_oob_ops *ops, size_t len)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+	int ret = 0;
+
+	switch (ops->mode) {
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_RAW:
+		memcpy(oob, chip->oobbuf + ops->ooboffs, len);
+		break;
+	case MTD_OPS_AUTO_OOB:
+		ret = mtd_ooblayout_get_databytes(mtd, oob, chip->oobbuf,
+						  ops->ooboffs, len);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
+/**
+ * spinand_fill_oob - transfer client buffer to oob
+ * @chip: SPI-NAND device structure
+ * @oob: oob data buffer
+ * @len: oob data write length
+ * @ops: oob ops structure
+ */
+static int spinand_fill_oob(struct spinand_device *chip, uint8_t *oob,
+				size_t len, struct mtd_oob_ops *ops)
+{
+	struct mtd_info *mtd = spinand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret = 0;
+
+	memset(chip->oobbuf, 0xff, nand_per_page_oobsize(nand));
+	switch (ops->mode) {
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_RAW:
+		memcpy(chip->oobbuf + ops->ooboffs, oob, len);
+		break;
+	case MTD_OPS_AUTO_OOB:
+		ret = mtd_ooblayout_set_databytes(mtd, oob, chip->oobbuf,
+						  ops->ooboffs, len);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
+/**
+ * spinand_read_pages - read data from flash to buffer
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob operations description structure
+ * @max_bitflips: maximum bitflip count
+ * Description:
+ *   Normal read function, read one page to buffer before issue
+ *   another.
+ */
+static int spinand_read_pages(struct mtd_info *mtd, loff_t from,
+			  struct mtd_oob_ops *ops, unsigned int *max_bitflips)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int page_addr, page_offset, size, ret;
+	unsigned int corrected = 0;
+	int readlen = ops->len;
+	int oobreadlen = ops->ooblen;
+	bool ecc_off = ops->mode == MTD_OPS_RAW;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		mtd->oobavail : mtd->oobsize;
+	bool oob_only = ops->datbuf == NULL;
+
+	page_addr = nand_offs_to_page(nand, from);
+	page_offset = from & (nand_page_size(nand) - 1);
+	ops->retlen = 0;
+	*max_bitflips = 0;
+
+	while (1) {
+		ret = spinand_do_read_page(mtd, page_addr, ecc_off,
+						&corrected, oob_only);
+		if (ret)
+			break;
+		*max_bitflips = max(*max_bitflips, corrected);
+		if (ops->datbuf) {
+			size = min_t(int, readlen, nand_page_size(nand) - page_offset);
+			memcpy(ops->datbuf + ops->retlen,
+				chip->buf + page_offset, size);
+			ops->retlen += size;
+			readlen -= size;
+			page_offset = 0;
+			if (!readlen)
+				break;
+		}
+		if (ops->oobbuf) {
+			size = min(oobreadlen, ooblen);
+			ret = spinand_transfer_oob(chip,
+				ops->oobbuf + ops->oobretlen, ops, size);
+			if (ret) {
+				pr_err("Transfer oob error %d\n", ret);
+				return ret;
+			}
+			ops->oobretlen += size;
+			oobreadlen -= size;
+			if (!oobreadlen)
+				break;
+		}
+		page_addr++;
+	}
+
+	return ret;
+}
+
+/**
+ * spinand_do_read_ops - read data from flash to buffer
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob ops structure
+ * Description:
+ *   Disable internal ECC before reading when MTD_OPS_RAW set.
+ */
+static int spinand_do_read_ops(struct mtd_info *mtd, loff_t from,
+			  struct mtd_oob_ops *ops)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+	struct mtd_ecc_stats stats;
+	unsigned int max_bitflips = 0;
+	int oobreadlen = ops->ooblen;
+	bool ecc_off = ops->mode == MTD_OPS_RAW;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		mtd->oobavail : mtd->oobsize;
+
+	if (unlikely(from >= mtd->size)) {
+		pr_err("%s: attempt to read beyond end of device\n",
+				__func__);
+		return -EINVAL;
+	}
+	if (oobreadlen > 0) {
+		if (unlikely(ops->ooboffs >= ooblen)) {
+			pr_err("%s: attempt to start read outside oob\n",
+					__func__);
+			return -EINVAL;
+		}
+		if (unlikely(ops->ooboffs + oobreadlen >
+		(nand_len_to_pages(nand, mtd->size) - nand_offs_to_page(nand, from))
+		* ooblen)) {
+			pr_err("%s: attempt to read beyond end of device\n",
+					__func__);
+			return -EINVAL;
+		}
+		ooblen -= ops->ooboffs;
+		ops->oobretlen = 0;
+	}
+	stats = mtd->ecc_stats;
+	if (ecc_off)
+		spinand_disable_ecc(chip);
+	ret = spinand_read_pages(mtd, from, ops, &max_bitflips);
+	if (ecc_off)
+		spinand_enable_ecc(chip);
+	if (ret)
+		return ret;
+
+	if (mtd->ecc_stats.failed - stats.failed)
+		return -EBADMSG;
+
+	return max_bitflips;
+}
+
+/**
+ * spinand_write_pages - write data from buffer to flash
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ * @max_bitflips: maximum bitflip count
+ * Description:
+ *   Normal read function, read one page to buffer before issue
+ *   another.
+ */
+static int spinand_write_pages(struct mtd_info *mtd, loff_t to,
+			  struct mtd_oob_ops *ops)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int page_addr, page_offset, ret;
+	int size = 0;
+	int oob_size = 0;
+	int writelen = ops->len;
+	int oobwritelen = ops->ooblen;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		mtd->oobavail : mtd->oobsize;
+	bool oob_only = ops->datbuf == NULL;
+
+	page_addr = nand_offs_to_page(nand, to);
+	page_offset = to & (nand_page_size(nand) - 1);
+	ops->retlen = 0;
+
+	while (1) {
+		memset(chip->buf, 0xff, nand_page_size(nand) + nand_per_page_oobsize(nand));
+		if (ops->oobbuf) {
+			oob_size = min(oobwritelen, ooblen);
+			ret = spinand_fill_oob(chip, ops->oobbuf + ops->oobretlen,
+					oob_size, ops);
+			if (ret) {
+				pr_err("Fill oob error %d\n", ret);
+				return ret;
+			}
+		}
+		if (ops->datbuf) {
+			size = min_t(int, writelen, nand_page_size(nand) - page_offset);
+			memcpy(chip->buf + page_offset,
+				ops->datbuf + ops->retlen, size);
+		}
+		ret = spinand_do_write_page(mtd, page_addr, oob_only);
+		if (ret) {
+			pr_err("error %d writing page 0x%x\n",
+				ret, page_addr);
+			return ret;
+		}
+		if (ops->datbuf) {
+			ops->retlen += size;
+			writelen -= size;
+			page_offset = 0;
+			if (!writelen)
+				break;
+		}
+		if (ops->oobbuf) {
+			ops->oobretlen += oob_size;
+			oobwritelen -= oob_size;
+			if (!oobwritelen)
+				break;
+		}
+		page_addr++;
+	}
+
+	return ret;
+}
+
+/**
+ * spinand_do_write_ops - write data from buffer to flash
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ * Description:
+ *   Disable internal ECC before writing when MTD_OPS_RAW set.
+ */
+static int spinand_do_write_ops(struct mtd_info *mtd, loff_t to,
+			 struct mtd_oob_ops *ops)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int page_addr, page_offset;
+	int oobwritelen = ops->ooblen;
+	int ret = 0;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		mtd->oobavail : mtd->oobsize;
+	bool ecc_off = ops->mode == MTD_OPS_RAW;
+
+	/* Do not allow reads past end of device */
+	if (unlikely(to >= mtd->size)) {
+		pr_err("%s: attempt to write beyond end of device\n",
+				__func__);
+		return -EINVAL;
+	}
+
+	page_addr = nand_offs_to_page(nand, to);
+	page_offset = to & (nand_page_size(nand) - 1);
+	ops->retlen = 0;
+
+	/* for oob */
+	if (oobwritelen > 0) {
+		/* Do not allow write past end of page */
+		if ((ops->ooboffs + oobwritelen) > ooblen) {
+			pr_err("%s: attempt to write past end of page\n",
+					__func__);
+			return -EINVAL;
+		}
+
+		if (unlikely(ops->ooboffs >= ooblen)) {
+			pr_err("%s: attempt to start write outside oob\n",
+					__func__);
+			return -EINVAL;
+		}
+		if (unlikely(ops->ooboffs + oobwritelen >
+		(nand_len_to_pages(nand, mtd->size) - nand_offs_to_page(nand, to))
+			* ooblen)) {
+			pr_err("%s: attempt to write beyond end of device\n",
+					__func__);
+			return -EINVAL;
+		}
+		ooblen -= ops->ooboffs;
+		ops->oobretlen = 0;
+	}
+
+	if (ecc_off)
+		spinand_disable_ecc(chip);
+	ret = spinand_write_pages(mtd, to, ops);
+	if (ecc_off)
+		spinand_enable_ecc(chip);
+
+	return ret;
+}
+
+/**
+ * spinand_read - [MTD Interface] SPI-NAND read
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @len: number of bytes to read
+ * @retlen: pointer to variable to store the number of read bytes
+ * @buf: the databuffer to put data
+ */
+static int spinand_read(struct mtd_info *mtd, loff_t from, size_t len,
+	size_t *retlen, u8 *buf)
+{
+	struct mtd_oob_ops ops;
+	int ret;
+
+	spinand_get_device(mtd_to_spinand(mtd));
+
+	memset(&ops, 0, sizeof(ops));
+	ops.len = len;
+	ops.datbuf = buf;
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ret = spinand_do_read_ops(mtd, from, &ops);
+
+	*retlen = ops.retlen;
+
+	spinand_release_device(mtd_to_spinand(mtd));
+
+	return ret;
+}
+
+/**
+ * spinand_write - [MTD Interface] SPI-NAND write
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @len: number of bytes to write
+ * @retlen: pointer to variable to store the number of written bytes
+ * @buf: the data to write
+ */
+static int spinand_write(struct mtd_info *mtd, loff_t to, size_t len,
+	size_t *retlen, const u8 *buf)
+{
+	struct mtd_oob_ops ops;
+	int ret;
+
+	spinand_get_device(mtd_to_spinand(mtd));
+
+	memset(&ops, 0, sizeof(ops));
+	ops.len = len;
+	ops.datbuf = (uint8_t *)buf;
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ret =  spinand_do_write_ops(mtd, to, &ops);
+
+	*retlen = ops.retlen;
+
+	spinand_release_device(mtd_to_spinand(mtd));
+
+	return ret;
+}
+
+/**
+ * spinand_read_oob - [MTD Interface] read data and/or out-of-band
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob operation description structure
+ */
+static int spinand_read_oob(struct mtd_info *mtd, loff_t from,
+			struct mtd_oob_ops *ops)
+{
+	int ret = -ENOTSUPP;
+
+	ops->retlen = 0;
+	spinand_get_device(mtd_to_spinand(mtd));
+
+	switch (ops->mode) {
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
+	case MTD_OPS_RAW:
+		break;
+
+	default:
+		goto out;
+	}
+
+	ret = spinand_do_read_ops(mtd, from, ops);
+
+out:
+	spinand_release_device(mtd_to_spinand(mtd));
+
+	return ret;
+}
+
+/**
+ * spinand_write_oob - [MTD Interface] write data and/or out-of-band
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operation description structure
+ */
+static int spinand_write_oob(struct mtd_info *mtd, loff_t to,
+			  struct mtd_oob_ops *ops)
+{
+	int ret = -ENOTSUPP;
+
+	ops->retlen = 0;
+	spinand_get_device(mtd_to_spinand(mtd));
+
+	switch (ops->mode) {
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
+	case MTD_OPS_RAW:
+		break;
+
+	default:
+		goto out;
+	}
+
+	ret = spinand_do_write_ops(mtd, to, ops);
+
+out:
+	spinand_release_device(mtd_to_spinand(mtd));
+
+	return ret;
+}
+
+
+/**
+ * spinand_erase - [MTD Interface] erase block(s)
+ * @mtd: MTD device structure
+ * @einfo: erase instruction
+ *
+ * Erase one ore more blocks
+ */
+static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	loff_t offs = einfo->addr, len = einfo->len;
+	u8 status;
+	int ret = 0;
+
+	/* check address align on block boundary */
+	if (offs & (nand_eraseblock_size(nand) - 1)) {
+		pr_err("%s: Unaligned address\n", __func__);
+		return -EINVAL;
+	}
+
+	if (len & (nand_eraseblock_size(nand) - 1)) {
+		pr_err("%s: Length not block aligned\n", __func__);
+		return -EINVAL;
+	}
+
+	/* Do not allow erase past end of device */
+	if ((offs + len) > mtd->size) {
+		pr_err("%s: Erase past end of device\n", __func__);
+		return -EINVAL;
+	}
+
+	einfo->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+
+	/* Grab the lock and see if the device is available */
+	spinand_get_device(chip);
+
+	einfo->state = MTD_ERASING;
+
+	while (len) {
+		spinand_write_enable(chip);
+		spinand_erase_block(chip, nand_offs_to_page(nand, offs));
+		ret = spinand_wait(chip, &status);
+		if (ret < 0) {
+			pr_err("block erase command wait failed\n");
+			einfo->state = MTD_ERASE_FAILED;
+			goto erase_exit;
+		}
+		if ((status & STATUS_E_FAIL_MASK) == STATUS_E_FAIL) {
+			pr_err("erase block 0x%012llx failed\n", offs);
+			einfo->state = MTD_ERASE_FAILED;
+			einfo->fail_addr = offs;
+			goto erase_exit;
+		}
+
+		/* Increment page address and decrement length */
+		len -= nand_eraseblock_size(nand);
+		offs += nand_eraseblock_size(nand);
+	}
+
+	einfo->state = MTD_ERASE_DONE;
+
+erase_exit:
+
+	ret = einfo->state == MTD_ERASE_DONE ? 0 : -EIO;
+
+	spinand_release_device(mtd_to_spinand(mtd));
+
+	/* Do call back function */
+	if (!ret)
+		mtd_erase_callback(einfo);
+
+	/* Return more or less happy */
+	return ret;
+}
 /**
  * spinand_scan_id_table - scan chip info in id table
  * @chip: SPI-NAND device structure
@@ -415,6 +1297,11 @@ int spinand_scan_tail(struct spinand_device *chip)
 	if (ret < 0)
 		ret = 0;
 	mtd->oobavail = ret;
+	mtd->_erase = spinand_erase;
+	mtd->_read = spinand_read;
+	mtd->_write = spinand_write;
+	mtd->_read_oob = spinand_read_oob;
+	mtd->_write_oob = spinand_write_oob;
 
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index f3d0351..ee447c1 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -135,6 +135,8 @@ struct spinand_manufacturer_ops {
 	bool(*detect)(struct spinand_device *chip);
 	int (*init)(struct spinand_device *chip);
 	void (*cleanup)(struct spinand_device *chip);
+	void (*build_column_addr)(struct spinand_device *chip,
+				  struct spinand_op *op, u32 page, u32 column);
 	int (*get_dummy)(struct spinand_device *chip, struct spinand_op *op);
 };
 
-- 
1.9.1
