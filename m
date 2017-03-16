Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coP1S-0008Rp-QY
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 06:36:34 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v3 4/8] nand: spi: add basic operations support
Date: Thu, 16 Mar 2017 14:47:33 +0800
Message-ID: <1489646857-10112-5-git-send-email-peterpandong@micron.com>
In-Reply-To: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
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
writeoob and erase operations in the new spi nand
framework.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/core.c | 741 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |   2 +
 2 files changed, 743 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 12a6eef..7834c3d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -109,6 +109,232 @@ static int spinand_read_status(struct spinand_device *chip, uint8_t *status)
 }
 
 /*
+ * spinand_get_cfg - get configuration register value
+ * @chip: SPI NAND device structure
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
+/*
+ * spinand_set_cfg - set value to configuration register
+ * @chip: SPI NAND device structure
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
+/*
+ * spinand_enable_ecc - enable internal ECC
+ * @chip: SPI NAND device structure
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
+/*
+ * spinand_disable_ecc - disable internal ECC
+ * @chip: SPI NAND device structure
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
+/*
+ * spinand_write_enable - send command 06h to enable write or erase the
+ * NAND cells
+ * @chip: SPI NAND device structure
+ */
+static int spinand_write_enable(struct spinand_device *chip)
+{
+	struct spinand_op op;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_WR_ENABLE;
+
+	return spinand_exec_op(chip, &op);
+}
+
+/*
+ * spinand_read_page_to_cache - send command 13h to read data from NAND array
+ * to cache
+ * @chip: SPI NAND device structure
+ * @page_addr: page to read
+ */
+static int spinand_read_page_to_cache(struct spinand_device *chip,
+				      u32 page_addr)
+{
+	struct spinand_op op;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_PAGE_READ;
+	op.n_addr = 3;
+	op.addr[0] = (u8)(page_addr >> 16);
+	op.addr[1] = (u8)(page_addr >> 8);
+	op.addr[2] = (u8)page_addr;
+
+	return spinand_exec_op(chip, &op);
+}
+
+/*
+ * spinand_get_address_bits - return address should be transferred
+ * by how many bits
+ * @opcode: command's operation code
+ */
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
+/*
+ * spinand_get_data_bits - return data should be transferred by how many bits
+ * @opcode: command's operation code
+ */
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
+/*
+ * spinand_read_from_cache - read data out from cache register
+ * @chip: SPI NAND device structure
+ * @page_addr: page to read
+ * @column: the location to read from the cache
+ * @len: number of bytes to read
+ * @rbuf: buffer held @len bytes
+ */
+static int spinand_read_from_cache(struct spinand_device *chip, u32 page_addr,
+				   u32 column, size_t len, u8 *rbuf)
+{
+	struct spinand_op op;
+
+	spinand_op_init(&op);
+	op.cmd = chip->read_cache_op;
+	op.n_addr = 2;
+	op.addr[0] = (u8)(column >> 8);
+	op.addr[1] = (u8)column;
+	op.addr_nbits = spinand_get_address_bits(chip->read_cache_op);
+	op.n_rx = len;
+	op.rx_buf = rbuf;
+	op.data_nbits = spinand_get_data_bits(chip->read_cache_op);
+	if (chip->manufacturer.manu->ops->prepare_op)
+		chip->manufacturer.manu->ops->prepare_op(chip, &op,
+							 page_addr, column);
+
+	return spinand_exec_op(chip, &op);
+}
+
+/*
+ * spinand_write_to_cache - write data to cache register
+ * @chip: SPI NAND device structure
+ * @page_addr: page to write
+ * @column: the location to write to the cache
+ * @len: number of bytes to write
+ * @wrbuf: buffer held @len bytes
+ */
+static int spinand_write_to_cache(struct spinand_device *chip, u32 page_addr,
+				  u32 column, size_t len, const u8 *wbuf)
+{
+	struct spinand_op op;
+
+	spinand_op_init(&op);
+	op.cmd = chip->write_cache_op;
+	op.n_addr = 2;
+	op.addr[0] = (u8)(column >> 8);
+	op.addr[1] = (u8)column;
+	op.addr_nbits = spinand_get_address_bits(chip->write_cache_op);
+	op.n_tx = len;
+	op.tx_buf = wbuf;
+	op.data_nbits = spinand_get_data_bits(chip->write_cache_op);
+	if (chip->manufacturer.manu->ops->prepare_op)
+		chip->manufacturer.manu->ops->prepare_op(chip, &op,
+							 page_addr, column);
+
+	return spinand_exec_op(chip, &op);
+}
+
+/*
+ * spinand_program_execute - send command 10h to write a page from
+ * cache to the NAND array
+ * @chip: SPI NAND device structure
+ * @page_addr: the physical page location to write the page.
+ */
+static int spinand_program_execute(struct spinand_device *chip, u32 page_addr)
+{
+	struct spinand_op op;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_PROG_EXC;
+	op.n_addr = 3;
+	op.addr[0] = (u8)(page_addr >> 16);
+	op.addr[1] = (u8)(page_addr >> 8);
+	op.addr[2] = (u8)page_addr;
+
+	return spinand_exec_op(chip, &op);
+}
+
+/*
+ * spinand_erase_block_erase - send command D8h to erase a block
+ * @chip: SPI NAND device structure
+ * @page_addr: the start page address of block to be erased.
+ */
+static int spinand_erase_block(struct spinand_device *chip, u32 page_addr)
+{
+	struct spinand_op op;
+
+	spinand_op_init(&op);
+	op.cmd = SPINAND_CMD_BLK_ERASE;
+	op.n_addr = 3;
+	op.addr[0] = (u8)(page_addr >> 16);
+	op.addr[1] = (u8)(page_addr >> 8);
+	op.addr[2] = (u8)page_addr;
+
+	return spinand_exec_op(chip, &op);
+}
+
+/*
  * spinand_wait - wait until the command is done
  * @chip: SPI NAND device structure
  * @s: buffer to store status register value (can be NULL)
@@ -193,6 +419,516 @@ static int spinand_lock_block(struct spinand_device *chip, u8 lock)
 }
 
 /*
+ * spinand_get_ecc_status - get ecc correction information from status register
+ * @chip: SPI NAND device structure
+ * @status: status register value
+ * @corrected: corrected bit flip number
+ * @ecc_error: ecc correction error or not
+ */
+static void spinand_get_ecc_status(struct spinand_device *chip,
+				   unsigned int status,
+				   unsigned int *corrected,
+				   unsigned int *ecc_error)
+{
+	return chip->ecc.engine->ops->get_ecc_status(chip, status, corrected,
+						     ecc_error);
+}
+
+/*
+ * spinand_do_read_page - read page from device to buffer
+ * @mtd: MTD device structure
+ * @page_addr: page address/raw address
+ * @ecc_off: without ecc or not
+ * @corrected: how many bit flip corrected
+ * @oob_only: read OOB only or the whole page
+ */
+static int spinand_do_read_page(struct mtd_info *mtd, u32 page_addr,
+				bool ecc_off, int *corrected, bool oob_only)
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
+		       ret, page_addr);
+		return ret;
+	}
+	if (!oob_only)
+		spinand_read_from_cache(chip, page_addr, 0,
+					nand_page_size(nand) +
+					nand_per_page_oobsize(nand),
+					chip->buf);
+	else
+		spinand_read_from_cache(chip, page_addr, nand_page_size(nand),
+					nand_per_page_oobsize(nand),
+					chip->oobbuf);
+	if (!ecc_off) {
+		spinand_get_ecc_status(chip, status, corrected, &ecc_error);
+		/*
+		 * If there's an ECC error, print a message and notify MTD
+		 * about it. Then complete the read, to load actual data on
+		 * the buffer (instead of the status result).
+		 */
+		if (ecc_error) {
+			pr_err("internal ECC error reading page 0x%x\n",
+			       page_addr);
+			mtd->ecc_stats.failed++;
+		} else if (*corrected) {
+			mtd->ecc_stats.corrected += *corrected;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * spinand_do_write_page - write data from buffer to device
+ * @mtd: MTD device structure
+ * @page_addr: page address/raw address
+ * @oob_only: write OOB only or the whole page
+ */
+static int spinand_do_write_page(struct mtd_info *mtd, u32 page_addr,
+				 bool oob_only)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	u8 status;
+	int ret = 0;
+
+	spinand_write_enable(chip);
+	if (!oob_only)
+		spinand_write_to_cache(chip, page_addr, 0,
+				       nand_page_size(nand) +
+				       nand_per_page_oobsize(nand), chip->buf);
+	else
+		spinand_write_to_cache(chip, page_addr, nand_page_size(nand),
+				       nand_per_page_oobsize(nand),
+				       chip->oobbuf);
+	spinand_program_execute(chip, page_addr);
+	ret = spinand_wait(chip, &status);
+	if (ret < 0) {
+		pr_err("error %d reading page 0x%x from cache\n",
+		       ret, page_addr);
+		return ret;
+	}
+	if ((status & STATUS_P_FAIL_MASK) == STATUS_P_FAIL) {
+		pr_err("program page 0x%x failed\n", page_addr);
+		ret = -EIO;
+	}
+	return ret;
+}
+
+/*
+ * spinand_transfer_oob - transfer oob to client buffer
+ * @chip: SPI NAND device structure
+ * @oob: oob destination address
+ * @ops: oob ops structure
+ * @len: size of oob to transfer
+ */
+static int spinand_transfer_oob(struct spinand_device *chip, u8 *oob,
+				struct mtd_oob_ops *ops, size_t len)
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
+/*
+ * spinand_fill_oob - transfer client buffer to oob
+ * @chip: SPI NAND device structure
+ * @oob: oob data buffer
+ * @len: oob data write length
+ * @ops: oob ops structure
+ */
+static int spinand_fill_oob(struct spinand_device *chip, uint8_t *oob,
+			    size_t len, struct mtd_oob_ops *ops)
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
+/*
+ * spinand_read_pages - read data from device to buffer
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob operations description structure
+ * @max_bitflips: maximum bitflip count
+ */
+static int spinand_read_pages(struct mtd_info *mtd, loff_t from,
+			      struct mtd_oob_ops *ops,
+			      unsigned int *max_bitflips)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int size, ret;
+	unsigned int corrected = 0;
+	bool ecc_off = ops->mode == MTD_OPS_RAW;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		     mtd->oobavail : mtd->oobsize;
+	bool oob_only = !ops->datbuf;
+	struct nand_page_iter iter;
+
+	ops->retlen = 0;
+	ops->oobretlen = 0;
+	*max_bitflips = 0;
+
+	nand_for_each_page(nand, from, ops->len, ops->ooboffs, ops->ooblen,
+			   ooblen, &iter) {
+		ret = spinand_do_read_page(mtd, iter.page, ecc_off,
+					   &corrected, oob_only);
+		if (ret)
+			break;
+		*max_bitflips = max(*max_bitflips, corrected);
+		if (ops->datbuf) {
+			size = min_t(int, from + ops->len - iter.offs,
+				     nand_page_size(nand) - iter.pageoffs);
+			memcpy(ops->datbuf + ops->retlen,
+			       chip->buf + iter.pageoffs, size);
+			ops->retlen += size;
+		}
+		if (ops->oobbuf) {
+			size = min_t(int, iter.oobleft, ooblen);
+			ret = spinand_transfer_oob(chip,
+						   ops->oobbuf + ops->oobretlen,
+						   ops, size);
+			if (ret) {
+				pr_err("Transfer oob error %d\n", ret);
+				return ret;
+			}
+			ops->oobretlen += size;
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * spinand_do_read_ops - read data from device to buffer
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob operations description structure
+ */
+static int spinand_do_read_ops(struct mtd_info *mtd, loff_t from,
+			       struct mtd_oob_ops *ops)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+	struct mtd_ecc_stats stats;
+	unsigned int max_bitflips = 0;
+	bool ecc_off = ops->mode == MTD_OPS_RAW;
+
+	if (!valid_nand_address(nand, from)) {
+		pr_err("%s: invalid read address\n", __func__);
+		return -EINVAL;
+	}
+	if ((ops->ooblen > 0) && !valid_nand_oob_ops(nand, from, ops)) {
+		pr_err("%s: invalid oob operation input\n", __func__);
+		return -EINVAL;
+	}
+	mutex_lock(&chip->lock);
+	stats = mtd->ecc_stats;
+	if (ecc_off)
+		spinand_disable_ecc(chip);
+	ret = spinand_read_pages(mtd, from, ops, &max_bitflips);
+	if (ecc_off)
+		spinand_enable_ecc(chip);
+	if (ret)
+		goto out;
+
+	if (mtd->ecc_stats.failed - stats.failed) {
+		ret = -EBADMSG;
+		goto out;
+	}
+	ret = max_bitflips;
+
+out:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
+/*
+ * spinand_write_pages - write data from buffer to device
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ */
+static int spinand_write_pages(struct mtd_info *mtd, loff_t to,
+			       struct mtd_oob_ops *ops)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret = 0;
+	int size = 0;
+	int oob_size = 0;
+	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
+		     mtd->oobavail : mtd->oobsize;
+	bool oob_only = !ops->datbuf;
+	struct nand_page_iter iter;
+
+	ops->retlen = 0;
+	ops->oobretlen = 0;
+
+	nand_for_each_page(nand, to, ops->len, ops->ooboffs, ops->ooblen,
+			   ooblen, &iter) {
+		memset(chip->buf, 0xff,
+		       nand_page_size(nand) + nand_per_page_oobsize(nand));
+		if (ops->oobbuf) {
+			oob_size = min_t(int, iter.oobleft, ooblen);
+			ret = spinand_fill_oob(chip,
+					       ops->oobbuf + ops->oobretlen,
+					       oob_size, ops);
+			if (ret) {
+				pr_err("Fill oob error %d\n", ret);
+				return ret;
+			}
+		}
+		if (ops->datbuf) {
+			size = min_t(int, to + ops->len - iter.offs,
+				     nand_page_size(nand) - iter.pageoffs);
+			memcpy(chip->buf + iter.pageoffs,
+			       ops->datbuf + ops->retlen, size);
+		}
+		ret = spinand_do_write_page(mtd, iter.page, oob_only);
+		if (ret) {
+			pr_err("error %d writing page 0x%x\n",
+			       ret, iter.page);
+			return ret;
+		}
+		if (ops->datbuf)
+			ops->retlen += size;
+		if (ops->oobbuf)
+			ops->oobretlen += oob_size;
+	}
+
+	return ret;
+}
+
+/*
+ * spinand_do_write_ops - write data from buffer to device
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ */
+static int spinand_do_write_ops(struct mtd_info *mtd, loff_t to,
+				struct mtd_oob_ops *ops)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret = 0;
+	bool ecc_off = ops->mode == MTD_OPS_RAW;
+
+	if (!valid_nand_address(nand, to)) {
+		pr_err("%s: invalid read address\n", __func__);
+		return -EINVAL;
+	}
+	if ((ops->ooblen > 0) && !valid_nand_oob_ops(nand, to, ops)) {
+		pr_err("%s: invalid oob operation input\n", __func__);
+		return -EINVAL;
+	}
+	if (nand_oob_ops_across_page(mtd_to_nand(mtd), ops)) {
+		pr_err("%s: try to across page when writing with OOB\n",
+		       __func__);
+		return -EINVAL;
+	}
+
+	mutex_lock(&chip->lock);
+	if (ecc_off)
+		spinand_disable_ecc(chip);
+	ret = spinand_write_pages(mtd, to, ops);
+	if (ecc_off)
+		spinand_enable_ecc(chip);
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+/*
+ * spinand_read - [MTD Interface] read page data
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @len: number of bytes to read
+ * @retlen: pointer to variable to store the number of read bytes
+ * @buf: the databuffer to put data
+ */
+static int spinand_read(struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, u8 *buf)
+{
+	struct mtd_oob_ops ops;
+	int ret;
+
+	memset(&ops, 0, sizeof(ops));
+	ops.len = len;
+	ops.datbuf = buf;
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ret = spinand_do_read_ops(mtd, from, &ops);
+	*retlen = ops.retlen;
+
+	return ret;
+}
+
+/*
+ * spinand_write - [MTD Interface] write page data
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @len: number of bytes to write
+ * @retlen: pointer to variable to store the number of written bytes
+ * @buf: the data to write
+ */
+static int spinand_write(struct mtd_info *mtd, loff_t to, size_t len,
+			 size_t *retlen, const u8 *buf)
+{
+	struct mtd_oob_ops ops;
+	int ret;
+
+	memset(&ops, 0, sizeof(ops));
+	ops.len = len;
+	ops.datbuf = (uint8_t *)buf;
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ret =  spinand_do_write_ops(mtd, to, &ops);
+	*retlen = ops.retlen;
+
+	return ret;
+}
+
+/*
+ * spinand_read_oob - [MTD Interface] read page data and/or out-of-band
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob operation description structure
+ */
+static int spinand_read_oob(struct mtd_info *mtd, loff_t from,
+			    struct mtd_oob_ops *ops)
+{
+	int ret = -ENOTSUPP;
+
+	ops->retlen = 0;
+	switch (ops->mode) {
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
+	case MTD_OPS_RAW:
+		ret = spinand_do_read_ops(mtd, from, ops);
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * spinand_write_oob - [MTD Interface] write page data and/or out-of-band
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operation description structure
+ */
+static int spinand_write_oob(struct mtd_info *mtd, loff_t to,
+			     struct mtd_oob_ops *ops)
+{
+	int ret = -ENOTSUPP;
+
+	ops->retlen = 0;
+	switch (ops->mode) {
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
+	case MTD_OPS_RAW:
+		ret = spinand_do_write_ops(mtd, to, ops);
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * spinand_erase - [MTD Interface] erase block(s)
+ * @mtd: MTD device structure
+ * @einfo: erase instruction
+ */
+static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	loff_t offs = einfo->addr, len = einfo->len;
+	u8 status;
+	int ret = 0;
+
+	if (!valid_nand_erase_ops(nand, einfo)) {
+		pr_err("%s: invalid erase operation input\n", __func__);
+		return -EINVAL;
+	}
+
+	mutex_lock(&chip->lock);
+	einfo->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
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
+	mutex_unlock(&chip->lock);
+
+	/* Do call back function */
+	if (!ret)
+		mtd_erase_callback(einfo);
+
+	return ret;
+}
+
+/*
  * spinand_set_rd_wr_op - choose the best read write command
  * @chip: SPI NAND device structure
  * Description:
@@ -401,6 +1137,11 @@ int spinand_init(struct spinand_device *chip)
 	if (ret < 0)
 		ret = 0;
 	mtd->oobavail = ret;
+	mtd->_erase = spinand_erase;
+	mtd->_read = spinand_read;
+	mtd->_write = spinand_write;
+	mtd->_read_oob = spinand_read_oob;
+	mtd->_write_oob = spinand_write_oob;
 
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 4e785da..4e0fae4 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -131,6 +131,8 @@ struct spinand_manufacturer_ops {
 	bool (*detect)(struct spinand_device *chip, u8 *raw_id, u8 *id);
 	int (*init)(struct spinand_device *chip);
 	void (*cleanup)(struct spinand_device *chip);
+	void (*prepare_op)(struct spinand_device *chip, struct spinand_op *op,
+			   u32 page, u32 column);
 };
 
 struct spinand_manufacturer {
-- 
1.9.1
