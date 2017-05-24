Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQHy-0000PP-Fl
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:01:16 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 11/15] nand: spi: add basic operations support
Date: Wed, 24 May 2017 15:07:07 +0800
Message-ID: <1495609631-18880-12-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
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
framework. No ECC support right now.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/core.c | 638 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |   3 +
 2 files changed, 641 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 93ce212..6251469 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -108,6 +108,222 @@ static int spinand_read_status(struct spinand_device *spinand, u8 *status)
 }
 
 /**
+ * spinand_get_cfg - get configuration register value
+ * @spinand: SPI NAND device structure
+ * @cfg: buffer to store value
+ * Description:
+ *   Configuration register includes OTP config, Lock Tight enable/disable
+ *   and Internal ECC enable/disable.
+ */
+static int spinand_get_cfg(struct spinand_device *spinand, u8 *cfg)
+{
+	return spinand_read_reg(spinand, REG_CFG, cfg);
+}
+
+/**
+ * spinand_set_cfg - set value to configuration register
+ * @spinand: SPI NAND device structure
+ * @cfg: value to set
+ * Description:
+ *   Configuration register includes OTP config, Lock Tight enable/disable
+ *   and Internal ECC enable/disable.
+ */
+static int spinand_set_cfg(struct spinand_device *spinand, u8 cfg)
+{
+	return spinand_write_reg(spinand, REG_CFG, cfg);
+}
+
+/**
+ * spinand_disable_ecc - disable internal ECC
+ * @spinand: SPI NAND device structure
+ */
+static void spinand_disable_ecc(struct spinand_device *spinand)
+{
+	u8 cfg = 0;
+
+	spinand_get_cfg(spinand, &cfg);
+
+	if ((cfg & CFG_ECC_MASK) == CFG_ECC_ENABLE) {
+		cfg &= ~CFG_ECC_ENABLE;
+		spinand_set_cfg(spinand, cfg);
+	}
+}
+
+/**
+ * spinand_write_enable - send command 06h to enable write or erase the
+ * NAND cells
+ * @spinand: SPI NAND device structure
+ */
+static int spinand_write_enable(struct spinand_device *spinand)
+{
+	struct spinand_op op;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_WR_ENABLE;
+
+	return spinand_exec_op(spinand, &op);
+}
+
+/**
+ * spinand_read_page_to_cache - send command 13h to read data from NAND array
+ * to cache
+ * @spinand: SPI NAND device structure
+ * @page_addr: page to read
+ */
+static int spinand_read_page_to_cache(struct spinand_device *spinand,
+				      u32 page_addr)
+{
+	struct spinand_op op;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_PAGE_READ;
+	op.n_addr = 3;
+	op.addr[0] = (u8)(page_addr >> 16);
+	op.addr[1] = (u8)(page_addr >> 8);
+	op.addr[2] = (u8)page_addr;
+
+	return spinand_exec_op(spinand, &op);
+}
+
+/**
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
+/**
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
+/**
+ * spinand_read_from_cache - read data out from cache register
+ * @spinand: SPI NAND device structure
+ * @page_addr: page to read
+ * @column: the location to read from the cache
+ * @len: number of bytes to read
+ * @rbuf: buffer held @len bytes
+ */
+static int spinand_read_from_cache(struct spinand_device *spinand,
+				   u32 page_addr, u32 column,
+				   size_t len, u8 *rbuf)
+{
+	struct spinand_op op;
+
+	spinand_init_op(&op);
+	op.cmd = spinand->read_cache_op;
+	op.n_addr = 2;
+	op.addr[0] = (u8)(column >> 8);
+	op.addr[1] = (u8)column;
+	op.addr_nbits = spinand_get_address_bits(spinand->read_cache_op);
+	op.n_rx = len;
+	op.rx_buf = rbuf;
+	op.data_nbits = spinand_get_data_bits(spinand->read_cache_op);
+
+	if (spinand->manufacturer.manu->ops->prepare_op)
+		spinand->manufacturer.manu->ops->prepare_op(spinand, &op,
+							    page_addr, column);
+
+	return spinand_exec_op(spinand, &op);
+}
+
+/**
+ * spinand_write_to_cache - write data to cache register
+ * @spinand: SPI NAND device structure
+ * @page_addr: page to write
+ * @column: the location to write to the cache
+ * @len: number of bytes to write
+ * @wrbuf: buffer held @len bytes
+ */
+static int spinand_write_to_cache(struct spinand_device *spinand, u32 page_addr,
+				  u32 column, size_t len, const u8 *wbuf)
+{
+	struct spinand_op op;
+
+	spinand_init_op(&op);
+	op.cmd = spinand->write_cache_op;
+	op.n_addr = 2;
+	op.addr[0] = (u8)(column >> 8);
+	op.addr[1] = (u8)column;
+	op.addr_nbits = spinand_get_address_bits(spinand->write_cache_op);
+	op.n_tx = len;
+	op.tx_buf = wbuf;
+	op.data_nbits = spinand_get_data_bits(spinand->write_cache_op);
+
+	if (spinand->manufacturer.manu->ops->prepare_op)
+		spinand->manufacturer.manu->ops->prepare_op(spinand, &op,
+							    page_addr, column);
+
+	return spinand_exec_op(spinand, &op);
+}
+
+/**
+ * spinand_program_execute - send command 10h to write a page from
+ * cache to the NAND array
+ * @spinand: SPI NAND device structure
+ * @page_addr: the physical page location to write the page.
+ */
+static int spinand_program_execute(struct spinand_device *spinand,
+				   u32 page_addr)
+{
+	struct spinand_op op;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_PROG_EXC;
+	op.n_addr = 3;
+	op.addr[0] = (u8)(page_addr >> 16);
+	op.addr[1] = (u8)(page_addr >> 8);
+	op.addr[2] = (u8)page_addr;
+
+	return spinand_exec_op(spinand, &op);
+}
+
+/**
+ * spinand_erase_block_erase - send command D8h to erase a block
+ * @spinand: SPI NAND device structure
+ * @page_addr: the start page address of block to be erased.
+ */
+static int spinand_erase_block(struct spinand_device *spinand, u32 page_addr)
+{
+	struct spinand_op op;
+
+	spinand_init_op(&op);
+	op.cmd = SPINAND_CMD_BLK_ERASE;
+	op.n_addr = 3;
+	op.addr[0] = (u8)(page_addr >> 16);
+	op.addr[1] = (u8)(page_addr >> 8);
+	op.addr[2] = (u8)page_addr;
+
+	return spinand_exec_op(spinand, &op);
+}
+
+/**
  * spinand_wait - wait until the command is done
  * @spinand: SPI NAND device structure
  * @s: buffer to store status register value (can be NULL)
@@ -193,6 +409,415 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 }
 
 /**
+ * spinand_do_read_page - read page from device to buffer
+ * @mtd: MTD device structure
+ * @page_addr: page address/raw address
+ * @oob_only: read OOB only or the whole page
+ */
+static int spinand_do_read_page(struct mtd_info *mtd, u32 page_addr,
+				bool oob_only)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+
+	spinand_read_page_to_cache(spinand, page_addr);
+
+	ret = spinand_wait(spinand, NULL);
+	if (ret < 0) {
+		dev_err(spinand->dev, "error %d waiting page 0x%x to cache\n",
+			ret, page_addr);
+		return ret;
+	}
+
+	if (!oob_only)
+		spinand_read_from_cache(spinand, page_addr, 0,
+					nand_page_size(nand) +
+					nand_per_page_oobsize(nand),
+					spinand->buf);
+	else
+		spinand_read_from_cache(spinand, page_addr,
+					nand_page_size(nand),
+					nand_per_page_oobsize(nand),
+					spinand->oobbuf);
+
+	return 0;
+}
+
+/**
+ * spinand_do_write_page - write data from buffer to device
+ * @mtd: MTD device structure
+ * @page_addr: page address/raw address
+ * @oob_only: write OOB only or the whole page
+ */
+static int spinand_do_write_page(struct mtd_info *mtd, u32 page_addr,
+				 bool oob_only)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	u8 status;
+	int ret = 0;
+
+	spinand_write_enable(spinand);
+
+	if (!oob_only)
+		spinand_write_to_cache(spinand, page_addr, 0,
+				       nand_page_size(nand) +
+				       nand_per_page_oobsize(nand),
+				       spinand->buf);
+	else
+		spinand_write_to_cache(spinand, page_addr, nand_page_size(nand),
+				       nand_per_page_oobsize(nand),
+				       spinand->oobbuf);
+
+	spinand_program_execute(spinand, page_addr);
+
+	ret = spinand_wait(spinand, &status);
+	if (ret < 0) {
+		dev_err(spinand->dev, "error %d reading page 0x%x from cache\n",
+			ret, page_addr);
+		return ret;
+	}
+
+	if ((status & STATUS_P_FAIL_MASK) == STATUS_P_FAIL) {
+		dev_err(spinand->dev, "program page 0x%x failed\n", page_addr);
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+/**
+ * spinand_read_pages - read data from device to buffer
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob operations description structure
+ */
+static int spinand_read_pages(struct mtd_info *mtd, loff_t from,
+			      struct mtd_oob_ops *ops)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int size, ret;
+	int ooblen = mtd->oobsize;
+	bool oob_only = !ops->datbuf;
+	struct nand_page_iter iter;
+
+	ops->retlen = 0;
+	ops->oobretlen = 0;
+
+	nand_for_each_page(nand, from, ops->len, ops->ooboffs, ops->ooblen,
+			   ooblen, &iter) {
+		ret = spinand_do_read_page(mtd, iter.page, oob_only);
+		if (ret)
+			break;
+
+		if (ops->datbuf) {
+			size = min_t(int, iter.dataleft,
+				     nand_page_size(nand) - iter.pageoffs);
+			memcpy(ops->datbuf + ops->retlen,
+			       spinand->buf + iter.pageoffs, size);
+			ops->retlen += size;
+		}
+
+		if (ops->oobbuf) {
+			size = min_t(int, iter.oobleft, ooblen);
+			memcpy(ops->oobbuf + ops->oobretlen,
+			       spinand->oobbuf + ops->ooboffs, size);
+			ops->oobretlen += size;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * spinand_do_read_ops - read data from device to buffer
+ * @mtd: MTD device structure
+ * @from: offset to read from
+ * @ops: oob operations description structure
+ */
+static int spinand_do_read_ops(struct mtd_info *mtd, loff_t from,
+			       struct mtd_oob_ops *ops)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+
+	ret = nand_check_address(nand, from);
+	if (ret) {
+		dev_err(spinand->dev, "%s: invalid read address\n", __func__);
+		return ret;
+	}
+
+	ret = nand_check_oob_ops(nand, from, ops);
+	if (ret) {
+		dev_err(spinand->dev,
+			"%s: invalid oob operation input\n", __func__);
+		return ret;
+	}
+
+	mutex_lock(&spinand->lock);
+	ret = spinand_read_pages(mtd, from, ops);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+/**
+ * spinand_write_pages - write data from buffer to device
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ */
+static int spinand_write_pages(struct mtd_info *mtd, loff_t to,
+			       struct mtd_oob_ops *ops)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret = 0;
+	int size = 0;
+	int oob_size = 0;
+	int ooblen = mtd->oobsize;
+	bool oob_only = !ops->datbuf;
+	struct nand_page_iter iter;
+
+	ops->retlen = 0;
+	ops->oobretlen = 0;
+
+	nand_for_each_page(nand, to, ops->len, ops->ooboffs, ops->ooblen,
+			   ooblen, &iter) {
+		memset(spinand->buf, 0xff,
+		       nand_page_size(nand) + nand_per_page_oobsize(nand));
+
+		if (ops->oobbuf) {
+			oob_size = min_t(int, iter.oobleft, ooblen);
+			memcpy(spinand->oobbuf + ops->ooboffs,
+			       ops->oobbuf + ops->oobretlen, oob_size);
+		}
+
+		if (ops->datbuf) {
+			size = min_t(int, iter.dataleft,
+				     nand_page_size(nand) - iter.pageoffs);
+			memcpy(spinand->buf + iter.pageoffs,
+			       ops->datbuf + ops->retlen, size);
+		}
+
+		ret = spinand_do_write_page(mtd, iter.page, oob_only);
+		if (ret) {
+			dev_err(spinand->dev, "error %d writing page 0x%x\n",
+				ret, iter.page);
+			return ret;
+		}
+
+		if (ops->datbuf)
+			ops->retlen += size;
+
+		if (ops->oobbuf)
+			ops->oobretlen += oob_size;
+	}
+
+	return ret;
+}
+
+/**
+ * spinand_do_write_ops - write data from buffer to device
+ * @mtd: MTD device structure
+ * @to: offset to write to
+ * @ops: oob operations description structure
+ */
+static int spinand_do_write_ops(struct mtd_info *mtd, loff_t to,
+				struct mtd_oob_ops *ops)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret = 0;
+
+	ret = nand_check_address(nand, to);
+	if (ret) {
+		dev_err(spinand->dev, "%s: invalid write address\n", __func__);
+		return ret;
+	}
+
+	ret = nand_check_oob_ops(nand, to, ops);
+	if (ret) {
+		dev_err(spinand->dev,
+			"%s: invalid oob operation input\n", __func__);
+		return ret;
+	}
+
+	if (nand_oob_ops_across_page(mtd_to_nand(mtd), ops)) {
+		dev_err(spinand->dev,
+			"%s: try to across page when writing with OOB\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	mutex_lock(&spinand->lock);
+	ret = spinand_write_pages(mtd, to, ops);
+	mutex_unlock(&spinand->lock);
+
+	return ret;
+}
+
+/**
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
+/**
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
+/**
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
+/**
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
+/**
+ * spinand_erase - [MTD Interface] erase block(s)
+ * @mtd: MTD device structure
+ * @einfo: erase instruction
+ */
+static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	loff_t offs = einfo->addr, len = einfo->len;
+	u8 status;
+	int ret;
+
+	ret = nand_check_erase_ops(nand, einfo);
+	if (ret) {
+		dev_err(spinand->dev, "invalid erase operation input\n");
+		return ret;
+	}
+
+	mutex_lock(&spinand->lock);
+	einfo->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+	einfo->state = MTD_ERASING;
+
+	while (len) {
+		spinand_write_enable(spinand);
+		spinand_erase_block(spinand, nand_offs_to_page(nand, offs));
+
+		ret = spinand_wait(spinand, &status);
+		if (ret < 0) {
+			dev_err(spinand->dev,
+				"block erase command wait failed\n");
+			einfo->state = MTD_ERASE_FAILED;
+			goto erase_exit;
+		}
+
+		if ((status & STATUS_E_FAIL_MASK) == STATUS_E_FAIL) {
+			dev_err(spinand->dev,
+				"erase block 0x%012llx failed\n", offs);
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
+	mutex_unlock(&spinand->lock);
+
+	/* Do call back function */
+	if (!ret)
+		mtd_erase_callback(einfo);
+
+	return ret;
+}
+
+/**
  * spinand_set_rd_wr_op - choose the best read write command
  * @spinand: SPI NAND device structure
  * Description:
@@ -390,9 +1015,22 @@ int spinand_init(struct spinand_device *spinand)
 	 * area is available for user.
 	 */
 	mtd->oobavail = mtd->oobsize;
+	mtd->_erase = spinand_erase;
+	/*
+	 * Since no ECC support right now, so for spinand_read(),
+	 * spinand_write(), spinand_read_oob() and spinand_write_oob()
+	 * both MTD_OPS_PLACE_OOB and MTD_OPS_AUTO_OOB are treated as
+	 * MTD_OPS_RAW.
+	 */
+	mtd->_read = spinand_read;
+	mtd->_write = spinand_write;
+	mtd->_read_oob = spinand_read_oob;
+	mtd->_write_oob = spinand_write_oob;
 
 	/* After power up, all blocks are locked, so unlock it here. */
 	spinand_lock_block(spinand, BL_ALL_UNLOCKED);
+	/* Right now, we don't support ECC, so disable on-die ECC */
+	spinand_disable_ecc(spinand);
 
 	return 0;
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index dd9da71..04ad1dd 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -103,11 +103,14 @@ struct spinand_controller_ops {
  *          return directly and let others to detect.
  * @init: initialize SPI NAND device.
  * @cleanup: clean SPI NAND device footprint.
+ * @prepare_op: prepara read/write operation.
  */
 struct spinand_manufacturer_ops {
 	bool (*detect)(struct spinand_device *spinand);
 	int (*init)(struct spinand_device *spinand);
 	void (*cleanup)(struct spinand_device *spinand);
+	void (*prepare_op)(struct spinand_device *spinand,
+			   struct spinand_op *op, u32 page, u32 column);
 };
 
 /**
-- 
1.9.1
