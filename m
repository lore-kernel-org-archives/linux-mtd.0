Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5D1-0007tL-33
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:50:06 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 07/11] nand: spi: Add init/release function
Date: Tue, 21 Feb 2017 16:00:06 +0800
Message-ID: <1487664010-25926-8-git-send-email-peterpandong@micron.com>
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

Add SPI NAND initialization and release functions.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spi-nand-base.c | 220 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nand.h         |  52 +++++++++
 2 files changed, 272 insertions(+)

diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
index 5c335e2..c77721d 100644
--- a/drivers/mtd/nand/spi/spi-nand-base.c
+++ b/drivers/mtd/nand/spi/spi-nand-base.c
@@ -22,6 +22,17 @@
 #include <linux/delay.h>
 #include <linux/jiffies.h>
 #include <linux/mtd/spi-nand.h>
+#include <linux/slab.h>
+
+static struct spi_nand_flash spi_nand_table[] = {
+	SPI_NAND_INFO("MT29F4G01ABAGD", 0x2C, 0x36, 2048, 128, 64, 2048,
+			2, 8, SPINAND_NEED_PLANE_SELECT,
+			SPINAND_OP_COMMON),
+	SPI_NAND_INFO("MT29F2G01ABAGD", 0x2C, 0x24, 2048, 128, 64, 2048,
+			1, 8, SPINAND_NEED_PLANE_SELECT,
+			SPINAND_OP_COMMON),
+	{.name = NULL},
+};
 
 /**
  * spi_nand_get_device - [GENERIC] Get chip for selected access
@@ -993,6 +1004,215 @@ static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 	/* Return more or less happy */
 	return ret;
 }
+
+/**
+ * spi_nand_scan_id_table - scan chip info in id table
+ * @chip: SPI-NAND device structure
+ * @id: point to manufacture id and device id
+ * Description:
+ *   If found in id table, config chip with table information.
+ */
+static bool spi_nand_scan_id_table(struct spi_nand_chip *chip, u8 *id)
+{
+	struct nand_device *nand = &chip->base;
+	struct spi_nand_flash *type = spi_nand_table;
+	struct nand_memory_organization *memorg = &nand->memorg;
+
+	for (; type->name; type++) {
+		if (id[0] == type->mfr_id && id[1] == type->dev_id) {
+			chip->name = type->name;
+			chip->size = type->page_size * type->pages_per_blk
+				* type->blks_per_lun * type->luns_per_chip;
+			memorg->eraseblocksize = type->page_size
+					* type->pages_per_blk;
+			memorg->pagesize = type->page_size;
+			memorg->oobsize = type->oob_size;
+			memorg->diesize =
+				memorg->eraseblocksize * type->blks_per_lun;
+			memorg->ndies = type->luns_per_chip;
+			chip->ecc_strength = type->ecc_strength;
+			chip->options = type->options;
+			chip->rw_mode = type->rw_mode;
+
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/**
+ * spi_nand_set_rd_wr_op - Chose the best read write command
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   Chose the fastest r/w command according to spi controller's ability.
+ * Note:
+ *   If 03h/0Bh follows SPI NAND protocol, there is no difference,
+ *   while if follows SPI NOR protocol, 03h command is working under
+ *   <=20Mhz@3.3V,<=5MHz@1.8V; 0Bh command is working under
+ *   133Mhz@3.3v, 83Mhz@1.8V.
+ */
+static void spi_nand_set_rd_wr_op(struct spi_nand_chip *chip)
+{
+	u32 mode = SPINAND_OP_MASK & chip->controller_caps & chip->rw_mode;
+
+	if (mode & SPINAND_RD_QUAD)
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_QUAD_IO;
+	else if (mode & SPINAND_RD_X4)
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X4;
+	else if (mode & SPINAND_RD_DUAL)
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_DUAL_IO;
+	else if (mode & SPINAND_RD_X2)
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_X2;
+	else
+		chip->read_cache_op = SPINAND_CMD_READ_FROM_CACHE_FAST;
+
+	if (mode & SPINAND_WR_X4)
+		chip->write_cache_op = SPINAND_CMD_PROG_LOAD_X4;
+	else
+		chip->write_cache_op = SPINAND_CMD_PROG_LOAD;
+}
+
+/**
+ * spi_nand_scan_ident - [SPI-NAND Interface] Scan for the SPI-NAND device
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   This is the first phase of the initiazation. It reads the flash ID and
+ *   sets up spi_nand_chip fields accordingly.
+ */
+int spi_nand_scan_ident(struct spi_nand_chip *chip)
+{
+	struct nand_device *nand = &chip->base;
+	u8 id[SPINAND_MAX_ID_LEN] = {0};
+	int id_retry = 2;
+
+	spi_nand_reset(chip);
+read_id:
+	spi_nand_read_id(chip, id);
+	if (spi_nand_scan_id_table(chip, id))
+		goto ident_done;
+	if (id_retry--)
+		goto read_id;
+	pr_info("SPI-NAND type mfr_id: %x, dev_id: %x is not in id table.\n",
+				id[0], id[1]);
+
+	return -ENODEV;
+
+ident_done:
+	pr_info("SPI-NAND: %s is found.\n", chip->name);
+	pr_info("Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n", id[0], id[1]);
+	pr_info("%d MiB, block size: %d KiB, page size: %d, OOB size: %d\n",
+		(int)(chip->size >> 20), nand_eraseblock_size(nand) >> 10,
+		nand_page_size(nand), nand_per_page_oobsize(nand));
+
+	chip->mfr_id = id[0];
+	chip->dev_id = id[1];
+	spi_nand_set_rd_wr_op(chip);
+
+	chip->buf = kzalloc(nand_page_size(nand) + nand_per_page_oobsize(nand), GFP_KERNEL);
+	if (!chip->buf)
+		return -ENOMEM;
+
+	chip->oobbuf = chip->buf + nand_page_size(nand);
+	spi_nand_lock_block(chip, BL_ALL_UNLOCKED);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_nand_scan_ident);
+
+/**
+ * spi_nand_scan_tail - [SPI-NAND Interface] Scan for the SPI-NAND device
+ * @chip: SPI-NAND device structure
+ * Description:
+ *   This is the second phase of the initiazation. It fills out all the
+ *   uninitialized fields of spi_nand_chip and mtd fields.
+ */
+int spi_nand_scan_tail(struct spi_nand_chip *chip)
+{
+	struct mtd_info *mtd = spi_nand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+
+	/* Initialize state */
+	chip->state = FL_READY;
+
+	init_waitqueue_head(&chip->wq);
+	spin_lock_init(&chip->chip_lock);
+
+	mtd->name = chip->name;
+	mtd->size = chip->size;
+	mtd->erasesize = nand_eraseblock_size(nand);
+	mtd->writesize = nand_page_size(nand);
+	mtd->writebufsize = mtd->writesize;
+	mtd->owner = THIS_MODULE;
+	mtd->type = MTD_NANDFLASH;
+	mtd->flags = MTD_CAP_NANDFLASH;
+	if (!mtd->ecc_strength)
+		mtd->ecc_strength = chip->ecc_strength ?
+				chip->ecc_strength : 1;
+
+	mtd->oobsize = nand_per_page_oobsize(nand);
+	ret = mtd_ooblayout_count_freebytes(mtd);
+	if (ret < 0)
+		ret = 0;
+	mtd->oobavail = ret;
+	mtd->_erase = spi_nand_erase;
+	mtd->_read = spi_nand_read;
+	mtd->_write = spi_nand_write;
+	mtd->_read_oob = spi_nand_read_oob;
+	mtd->_write_oob = spi_nand_write_oob;
+
+	if (!mtd->bitflip_threshold)
+		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_nand_scan_tail);
+
+/**
+ * spi_nand_scan_ident_release - [SPI-NAND Interface] Free resources
+ * applied by spi_nand_scan_ident
+ * @chip: SPI-NAND device structure
+ */
+int spi_nand_scan_ident_release(struct spi_nand_chip *chip)
+{
+	kfree(chip->buf);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_nand_scan_ident_release);
+
+/**
+ * spi_nand_scan_tail_release - [SPI-NAND Interface] Free resources
+ * applied by spi_nand_scan_tail
+ * @chip: SPI-NAND device structure
+ */
+int spi_nand_scan_tail_release(struct spi_nand_chip *chip)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_nand_scan_tail_release);
+
+/**
+ * spi_nand_release - [SPI-NAND Interface] Free resources held by the SPI-NAND
+ * device
+ * @chip: SPI-NAND device structure
+ */
+int spi_nand_release(struct spi_nand_chip *chip)
+{
+	struct mtd_info *mtd = spi_nand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct nand_bbt_descr *bd = nand->bbt.bbp;
+
+	mtd_device_unregister(mtd);
+	kfree(chip->buf);
+	kfree(nand->bbt.bbt);
+	if (bd->options & NAND_BBT_DYNAMICSTRUCT)
+		kfree(bd);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(spi_nand_release);
+
 MODULE_DESCRIPTION("SPI NAND framework");
 MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
index b61045b..cdacec4 100644
--- a/include/linux/mtd/spi-nand.h
+++ b/include/linux/mtd/spi-nand.h
@@ -116,6 +116,25 @@
 #define SPI_NAND_MT29F_ECC_UNCORR	0x20
 
 
+/* SPI NAND controller and chip supported OP mode */
+#define SPINAND_OP_MASK		0x0000ffff
+#define SPINAND_RD_X1		0x00000001
+#define SPINAND_RD_X2		0x00000002
+#define SPINAND_RD_X4		0x00000004
+#define SPINAND_RD_DUAL		0x00000008
+#define SPINAND_RD_QUAD		0x00000010
+#define SPINAND_WR_X1		0x00000020
+#define SPINAND_WR_X2		0x00000040
+#define SPINAND_WR_X4		0x00000080
+#define SPINAND_WR_DUAL		0x00000100
+#define SPINAND_WR_QUAD		0x00000200
+
+#define SPINAND_RD_COMMON	SPINAND_RD_X1 | SPINAND_RD_X2 | \
+				SPINAND_RD_X4 | SPINAND_RD_DUAL | \
+				SPINAND_RD_QUAD
+#define SPINAND_WR_COMMON	SPINAND_WR_X1 | SPINAND_WR_X4
+#define SPINAND_OP_COMMON	SPINAND_RD_COMMON | SPINAND_WR_COMMON
+
 struct spi_nand_cmd;
 
 /**
@@ -136,6 +155,7 @@
  * @buf:		[INTERN] buffer for read/write data
  * @oobbuf:		[INTERN] buffer for read/write oob
  * @controller_caps:	[INTERN] capacities of SPI NAND controller
+ * @rw_mode:		[BOARDSPECIFIC] read/write mode of SPI NAND chip
  * @size:		[INTERN] the size of chip
  * @options:		[BOARDSPECIFIC] various chip options. They can partly
  *			be set to inform nand_scan about special functionality.
@@ -159,6 +179,7 @@ struct spi_nand_chip {
 	u8		*buf;
 	u8		*oobbuf;
 	u32		controller_caps;
+	u32		rw_mode;
 	u64		size;
 	u32		options;
 	u32		ecc_strength;
@@ -186,6 +207,20 @@ static inline void spi_nand_set_controller_data(struct spi_nand_chip *chip,
 	chip->priv = priv;
 }
 
+struct spi_nand_flash {
+	char		*name;
+	u8		mfr_id;
+	u8		dev_id;
+	u32		page_size;
+	u32		oob_size;
+	u32		pages_per_blk;
+	u32		blks_per_lun;
+	u32		luns_per_chip;
+	u32		ecc_strength;
+	u32		options;
+	u32		rw_mode;
+};
+
 #define SPINAND_MAX_ADDR_LEN		4
 
 struct spi_nand_cmd {
@@ -206,11 +241,28 @@ struct spi_nand_cmd_cfg {
 	u8		data_bits;
 };
 
+#define SPI_NAND_INFO(nm, mid, did, pagesz, oobsz, pg_per_blk,\
+	blk_per_lun, lun_per_chip, ecc_stren, opts, rwmode)	\
+	{ .name = (nm), .mfr_id = (mid), .dev_id = (did),\
+	.page_size = (pagesz), .oob_size = (oobsz),\
+	.pages_per_blk = (pg_per_blk), .blks_per_lun = (blk_per_lun),\
+	.luns_per_chip = (lun_per_chip), .ecc_strength = (ecc_stren),\
+	.options = (opts), .rw_mode = (rwmode) }
+
 /*SPI NAND chip options*/
 #define SPINAND_NEED_PLANE_SELECT	(1 << 0)
 
 /*SPI NAND manufacture ID definition*/
 #define SPINAND_MFR_MICRON		0x2C
+
+#define SPINAND_MAX_ID_LEN		2
+
+
+int spi_nand_scan_ident(struct spi_nand_chip *chip);
+int spi_nand_scan_tail(struct spi_nand_chip *chip);
+int spi_nand_scan_ident_release(struct spi_nand_chip *chip);
+int spi_nand_scan_tail_release(struct spi_nand_chip *chip);
+int spi_nand_release(struct spi_nand_chip *chip);
 int spi_nand_set_cmd_cfg_table(int mfr);
 struct spi_nand_cmd_cfg *spi_nand_get_cmd_cfg(u8 opcode);
 #endif /* __LINUX_MTD_SPI_NAND_H */
-- 
1.9.1
