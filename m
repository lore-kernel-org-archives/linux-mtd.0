Received: from a.mx.sdesigns.eu ([78.31.43.6])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blyNY-0006cg-PY
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 13:13:03 +0000
Subject: [PATCH v5] mtd: nand: tango: import driver for tango chips
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon> <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com> <57D2DF96.7060705@sigmadesigns.com>
 <57D5530B.2060209@free.fr> <20160912210810.79ac23c9@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <57DFE444.3000003@sigmadesigns.com>
Date: Mon, 19 Sep 2016 15:12:36 +0200
MIME-Version: 1.0
In-Reply-To: <20160912210810.79ac23c9@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver supports the NAND Flash controller embedded in recent
Tango chips, such as SMP8758 and SMP8759.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
Tests done to validate this driver:
  mtd_stresstest dev=1 count=500000
  mtd_nandbiterrs dev=1
  ubiattach -m 1 -d 3 && runtests.sh /dev/ubi3
---
 drivers/mtd/nand/Kconfig      |   6 +
 drivers/mtd/nand/Makefile     |   1 +
 drivers/mtd/nand/tango_nand.c | 555 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 562 insertions(+)
 create mode 100644 drivers/mtd/nand/tango_nand.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f05e0e9eb2f7..22eb5457c9f7 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -205,6 +205,12 @@ config MTD_NAND_S3C2410_CLKSTOP
 	  when the is NAND chip selected or released, but will save
 	  approximately 5mA of power when there is nothing happening.
 
+config MTD_NAND_TANGO
+	tristate "NAND Flash support for Tango chips"
+	depends on ARCH_TANGO
+	help
+	  Enables the NAND Flash controller on Tango chips.
+
 config MTD_NAND_DISKONCHIP
 	tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND reimplementation)"
 	depends on HAS_IOMEM
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f55335373f7c..647f727223ef 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_MTD_NAND_DENALI_DT)	+= denali_dt.o
 obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
 obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
 obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
+obj-$(CONFIG_MTD_NAND_TANGO)		+= tango_nand.o
 obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
 obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
 obj-$(CONFIG_MTD_NAND_DOCG4)		+= docg4.o
diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
new file mode 100644
index 000000000000..ec18cad546fb
--- /dev/null
+++ b/drivers/mtd/nand/tango_nand.c
@@ -0,0 +1,555 @@
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mtd/nand.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+
+/* Offsets relative to chip->base */
+#define PBUS_CMD	0
+#define PBUS_ADDR	4
+#define PBUS_DATA	8
+
+/* Offsets relative to reg_base */
+#define NFC_STATUS	0x00
+#define NFC_FLASH_CMD	0x04
+#define NFC_DEVICE_CFG	0x08
+#define NFC_TIMING1	0x0c
+#define NFC_TIMING2	0x10
+#define NFC_XFER_CFG	0x14
+#define NFC_PKT_0_CFG	0x18
+#define NFC_PKT_N_CFG	0x1c
+#define NFC_BB_CFG	0x20
+#define NFC_ADDR_PAGE	0x24
+#define NFC_ADDR_OFFSET	0x28
+#define NFC_XFER_STATUS	0x2c
+
+/* NFC_STATUS values */
+#define CMD_READY	BIT(31)
+
+/* NFC_FLASH_CMD values */
+#define NFC_READ	1
+#define NFC_WRITE	2
+
+/* NFC_XFER_STATUS values */
+#define PAGE_IS_EMPTY	BIT(16)
+
+/* Offsets relative to mem_base */
+#define METADATA	0x000
+#define ERROR_REPORT	0x1c0
+
+/*
+ * Error reports are split in two bytes:
+ * byte 0 for the first packet in a page (PKT_0)
+ * byte 1 for other packets in a page (PKT_N, for N > 0)
+ * ERR_COUNT_PKT_N is the max error count over all but the first packet.
+ */
+#define DECODE_OK_PKT_0(v)	(v & BIT(7))
+#define DECODE_OK_PKT_N(v)	(v & BIT(15))
+#define ERR_COUNT_PKT_0(v)	((v >> 0) & 0x3f)
+#define ERR_COUNT_PKT_N(v)	((v >> 8) & 0x3f)
+
+/* Offsets relative to pbus_base */
+#define PBUS_CS_CTRL	0x83c
+#define PBUS_PAD_MODE	0x8f0
+
+/* PBUS_CS_CTRL values */
+#define PBUS_IORDY	BIT(31)
+
+/*
+ * PBUS_PAD_MODE values
+ * In raw mode, the driver communicates directly with the NAND chips.
+ * In NFC mode, the NAND Flash controller manages the communication.
+ * We use NFC mode for read and write; raw mode for everything else.
+ */
+#define MODE_RAW	0
+#define MODE_NFC	BIT(31)
+
+#define METADATA_SIZE	4
+#define BBM_SIZE	6
+#define FIELD_ORDER	15
+
+#define MAX_CS		4
+
+struct tango_nfc {
+	struct nand_hw_control hw;
+	void __iomem *reg_base;
+	void __iomem *mem_base;
+	void __iomem *pbus_base;
+	struct tango_chip *chips[MAX_CS];
+	struct dma_chan *chan;
+};
+
+#define to_tango_nfc(ptr) container_of(ptr, struct tango_nfc, hw)
+
+struct tango_chip {
+	struct nand_chip chip;
+	void __iomem *base;
+	u32 timing1;
+	u32 timing2;
+	u32 xfer_cfg;
+	u32 pkt_0_cfg;
+	u32 pkt_n_cfg;
+	u32 bb_cfg;
+	int cs;
+};
+
+#define to_tango_chip(ptr) container_of(ptr, struct tango_chip, chip)
+
+#define XFER_CFG(cs, page_count, steps, metadata_size)	\
+	((cs) << 24 | (page_count) << 16 | (steps) << 8 | (metadata_size) << 0)
+
+#define PKT_CFG(size, strength) ((size) << 16 | (strength) << 0)
+
+#define BB_CFG(bb_offset, bb_size) ((bb_offset) << 16 | (bb_size) << 0)
+
+#define TIMING(t0, t1, t2, t3) (t0 << 24 | t1 << 16 | t2 << 8 | t3 << 0)
+
+static void tango_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
+{
+	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
+
+	if (ctrl & NAND_CLE)
+		writeb_relaxed(dat, chip->base + PBUS_CMD);
+
+	if (ctrl & NAND_ALE)
+		writeb_relaxed(dat, chip->base + PBUS_ADDR);
+}
+
+static int tango_dev_ready(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
+
+	return readl_relaxed(nfc->pbus_base + PBUS_CS_CTRL) & PBUS_IORDY;
+}
+
+static uint8_t tango_read_byte(struct mtd_info *mtd)
+{
+	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
+
+	return readb_relaxed(chip->base + PBUS_DATA);
+}
+
+static void tango_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
+
+	ioread8_rep(chip->base + PBUS_DATA, buf, len);
+}
+
+static void tango_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
+
+	iowrite8_rep(chip->base + PBUS_DATA, buf, len);
+}
+
+static void tango_select_chip(struct mtd_info *mtd, int idx)
+{
+	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct tango_nfc *nfc = to_tango_nfc(nand->controller);
+	struct tango_chip *chip = to_tango_chip(nand);
+
+	if (idx < 0) {
+		chip->base = NULL;
+		return;
+	}
+
+	chip->base = nfc->pbus_base + (chip->cs * 256);
+
+	writel_relaxed(chip->timing1,	nfc->reg_base + NFC_TIMING1);
+	writel_relaxed(chip->timing2,	nfc->reg_base + NFC_TIMING2);
+	writel_relaxed(chip->xfer_cfg,	nfc->reg_base + NFC_XFER_CFG);
+	writel_relaxed(chip->pkt_0_cfg,	nfc->reg_base + NFC_PKT_0_CFG);
+	writel_relaxed(chip->pkt_n_cfg,	nfc->reg_base + NFC_PKT_N_CFG);
+	writel_relaxed(chip->bb_cfg,	nfc->reg_base + NFC_BB_CFG);
+}
+
+static int decode_error_report(struct tango_nfc *nfc)
+{
+	u32 status, res;
+
+	status = readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
+	if (status & PAGE_IS_EMPTY)
+		return 0;
+
+	res = readl_relaxed(nfc->mem_base + ERROR_REPORT);
+
+	if (DECODE_OK_PKT_0(res) && DECODE_OK_PKT_N(res))
+		return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
+
+	return -EBADMSG;
+}
+
+static void tango_dma_callback(void *arg)
+{
+	complete(arg);
+}
+
+static int do_dma(struct tango_nfc *nfc, int dir, int cmd,
+		const void *buf, int len, int page)
+{
+	struct dma_async_tx_descriptor *desc;
+	struct scatterlist sg;
+	struct completion tx_done;
+	int err = -EIO;
+	u32 res, val;
+
+	sg_init_one(&sg, buf, len);
+	if (dma_map_sg(nfc->chan->device->dev, &sg, 1, dir) != 1)
+		goto leave;
+
+	desc = dmaengine_prep_slave_sg(nfc->chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
+	if (!desc)
+		goto dma_unmap;
+
+	desc->callback = tango_dma_callback;
+	desc->callback_param = &tx_done;
+	init_completion(&tx_done);
+
+	writel_relaxed(MODE_NFC, nfc->pbus_base + PBUS_PAD_MODE);
+
+	writel_relaxed(page, nfc->reg_base + NFC_ADDR_PAGE);
+	writel_relaxed(   0, nfc->reg_base + NFC_ADDR_OFFSET);
+	writel_relaxed( cmd, nfc->reg_base + NFC_FLASH_CMD);
+
+	dmaengine_submit(desc);
+	dma_async_issue_pending(nfc->chan);
+
+	res = wait_for_completion_timeout(&tx_done, HZ);
+	if (res > 0) {
+		void __iomem *addr = nfc->reg_base + NFC_STATUS;
+		err = readl_poll_timeout(addr, val, val & CMD_READY, 0, 1000);
+	}
+
+	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
+dma_unmap:
+	dma_unmap_sg(nfc->chan->device->dev, &sg, 1, dir);
+leave:
+	return err;
+}
+
+static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+		uint8_t *buf, int oob_required, int page)
+{
+	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
+	int err, res, len = mtd->writesize;
+
+	err = do_dma(nfc, DMA_FROM_DEVICE, NFC_READ, buf, len, page);
+	if (err)
+		return err;
+
+	if (oob_required)
+		chip->ecc.read_oob(mtd, chip, page);
+
+	res = decode_error_report(nfc);
+	if (res >= 0)
+		return res;
+
+	chip->ecc.read_oob(mtd, chip, page);
+	res = nand_check_erased_ecc_chunk(buf, len, chip->oob_poi, mtd->oobsize,
+			NULL, 0, chip->ecc.strength);
+	if (res < 0)
+		mtd->ecc_stats.failed++;
+
+	return res;
+}
+
+static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+		const uint8_t *buf, int oob_required, int page)
+{
+	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
+	int err, len = mtd->writesize;
+
+	writel_relaxed(0xffffffff, nfc->mem_base + METADATA);
+	err = do_dma(nfc, DMA_TO_DEVICE, NFC_WRITE, buf, len, page);
+	if (err)
+		return err;
+
+	if (oob_required)
+		chip->ecc.write_oob(mtd, chip, page);
+
+	return 0;
+}
+
+enum { OP_SKIP, OP_READ, OP_WRITE };
+
+static void raw_aux(struct mtd_info *mtd, u8 **buf, int len, int op, int *lim)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	int pos = mtd->writesize - *lim;
+
+	if (op == OP_SKIP)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, pos + len, -1);
+	else if (op == OP_READ)
+		tango_read_buf(mtd, *buf, len);
+	else if (op == OP_WRITE)
+		tango_write_buf(mtd, *buf, len);
+
+	*lim -= len;
+	*buf += len;
+}
+
+static int raw_access(struct mtd_info *mtd, uint8_t *buf, uint8_t *oob, int op)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	int pkt_size = chip->ecc.size;
+	int ecc_size = chip->ecc.bytes;
+	int buf_op = buf ? op : OP_SKIP;
+	int oob_op = oob ? op : OP_SKIP;
+	int rem, lim = mtd->writesize;
+	u8 *oob_orig = oob;
+
+	oob += BBM_SIZE;
+	raw_aux(mtd, &oob, METADATA_SIZE, oob_op, &lim);
+
+	while (lim > pkt_size)
+	{
+		raw_aux(mtd, &buf, pkt_size, buf_op, &lim);
+		raw_aux(mtd, &oob, ecc_size, oob_op, &lim);
+	}
+
+	rem = pkt_size - lim;
+	raw_aux(mtd, &buf, lim, buf_op, &lim);
+	raw_aux(mtd, &oob_orig, BBM_SIZE, oob_op, &lim);
+	raw_aux(mtd, &buf, rem, buf_op, &lim);
+	raw_aux(mtd, &oob, ecc_size, oob_op, &lim);
+
+	return 0;
+}
+
+static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		uint8_t *buf, int oob_required, int page)
+{
+	return raw_access(mtd, buf, chip->oob_poi, OP_READ);
+}
+
+static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+		const uint8_t *buf, int oob_required, int page)
+{
+	return raw_access(mtd, (void *)buf, chip->oob_poi, OP_WRITE);
+}
+
+static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
+{
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+	return raw_access(mtd, NULL, chip->oob_poi, OP_READ);
+}
+
+static int tango_write_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
+{
+	chip->pagebuf = -1;
+	memset(chip->buffers->databuf, 0xff, mtd->writesize);
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
+	raw_access(mtd, chip->buffers->databuf, chip->oob_poi, OP_WRITE);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	chip->waitfunc(mtd, chip);
+	return 0;
+}
+
+static int oob_ecc(struct mtd_info *mtd, int idx, struct mtd_oob_region *res)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (idx >= ecc->steps)
+		return -ERANGE;
+
+	res->offset = BBM_SIZE + METADATA_SIZE + ecc->bytes * idx;
+	res->length = ecc->bytes;
+
+	return 0;
+}
+
+static int oob_free(struct mtd_info *mtd, int idx, struct mtd_oob_region *res)
+{
+	return -ERANGE; /* no free space in spare area */
+}
+
+static const struct mtd_ooblayout_ops tango_nand_ooblayout_ops = {
+	.ecc	= oob_ecc,
+	.free	= oob_free,
+};
+
+static u32 to_ticks(int kHz, int ps)
+{
+	return DIV_ROUND_UP_ULL((u64)kHz * ps, NSEC_PER_SEC);
+}
+
+static int set_timings(struct tango_chip *p, int kHz)
+{
+	u32 Trdy, Textw, Twc, Twpw, Tacc, Thold, Trpw, Textr;
+	const struct nand_sdr_timings *sdr;
+	int mode = onfi_get_async_timing_mode(&p->chip);
+
+	if (mode & ONFI_TIMING_MODE_UNKNOWN)
+		return -ENODEV;
+
+	sdr = onfi_async_timing_mode_to_sdr_timings(fls(mode) - 1);
+
+	Trdy	= to_ticks(kHz, sdr->tCEA_max - sdr->tREA_max);
+	Textw	= to_ticks(kHz, sdr->tWB_max);
+	Twc	= to_ticks(kHz, sdr->tWC_min);
+	Twpw	= to_ticks(kHz, sdr->tWC_min - sdr->tWP_min);
+
+	Tacc	= to_ticks(kHz, sdr->tREA_max);
+	Thold	= to_ticks(kHz, sdr->tREH_min);
+	Trpw	= to_ticks(kHz, sdr->tRC_min - sdr->tREH_min);
+	Textr	= to_ticks(kHz, sdr->tRHZ_max);
+
+	p->timing1 = TIMING(Trdy, Textw, Twc, Twpw);
+	p->timing2 = TIMING(Tacc, Thold, Trpw, Textr);
+
+	return 0;
+}
+
+static int chip_init(struct device *dev, struct device_node *np, int kHz)
+{
+	int err;
+	u32 cs, ecc_bits;
+	struct nand_ecc_ctrl *ecc;
+	struct tango_nfc *nfc = dev_get_drvdata(dev);
+	struct tango_chip *p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	err = of_property_read_u32_index(np, "reg", 0, &cs);
+	if (err)
+		return err;
+
+	if (cs >= MAX_CS)
+		return -ERANGE;
+
+	p->chip.read_byte	= tango_read_byte;
+	p->chip.read_buf	= tango_read_buf;
+	p->chip.select_chip	= tango_select_chip;
+	p->chip.cmd_ctrl	= tango_cmd_ctrl;
+	p->chip.dev_ready	= tango_dev_ready;
+	p->chip.options		= NAND_USE_BOUNCE_BUFFER | NAND_NO_SUBPAGE_WRITE;
+	p->chip.controller	= &nfc->hw;
+
+	ecc			= &p->chip.ecc;
+	ecc->mode		= NAND_ECC_HW;
+	ecc->algo		= NAND_ECC_BCH;
+	ecc->read_page_raw	= tango_read_page_raw;
+	ecc->write_page_raw	= tango_write_page_raw;
+	ecc->read_page		= tango_read_page;
+	ecc->write_page		= tango_write_page;
+	ecc->read_oob		= tango_read_oob;
+	ecc->write_oob		= tango_write_oob;
+
+	nand_set_flash_node(&p->chip, np);
+	mtd_set_ooblayout(&p->chip.mtd, &tango_nand_ooblayout_ops);
+	err = nand_scan_ident(&p->chip.mtd, 1, NULL);
+	if (err)
+		return err;
+
+	ecc_bits = ecc->strength * FIELD_ORDER;
+	p->chip.ecc.bytes = DIV_ROUND_UP(ecc_bits, BITS_PER_BYTE);
+	set_timings(p, kHz);
+
+	err = nand_scan_tail(&p->chip.mtd);
+	if (err)
+		return err;
+
+	err = mtd_device_register(&p->chip.mtd, NULL, 0);
+	if (err)
+		return err;
+
+	nfc->chips[cs] = p;
+
+	p->xfer_cfg	= XFER_CFG(cs, 1, ecc->steps, METADATA_SIZE);
+	p->pkt_0_cfg	= PKT_CFG(ecc->size + METADATA_SIZE, ecc->strength);
+	p->pkt_n_cfg	= PKT_CFG(ecc->size, ecc->strength);
+	p->bb_cfg	= BB_CFG(p->chip.mtd.writesize, BBM_SIZE);
+	p->cs		= cs;
+
+	return 0;
+}
+
+static int tango_nand_probe(struct platform_device *pdev)
+{
+	int kHz;
+	struct clk *clk;
+	struct resource *res;
+	struct tango_nfc *nfc;
+	struct device_node *np;
+
+	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	if (!nfc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nfc->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nfc->reg_base))
+		return PTR_ERR(nfc->reg_base);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	nfc->mem_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nfc->mem_base))
+		return PTR_ERR(nfc->mem_base);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+	nfc->pbus_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(nfc->pbus_base))
+		return PTR_ERR(nfc->pbus_base);
+
+	nfc->chan = dma_request_chan(&pdev->dev, "nfc_sbox");
+	if (IS_ERR(nfc->chan))
+		return PTR_ERR(nfc->chan);
+
+	clk = clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	platform_set_drvdata(pdev, nfc);
+	nand_hw_control_init(&nfc->hw);
+	kHz = clk_get_rate(clk) / 1000;
+
+	for_each_child_of_node(pdev->dev.of_node, np) {
+		int err = chip_init(&pdev->dev, np, kHz);
+		if (err)
+			return err;
+	}
+
+	/* TODO: tweak (?) Peripheral Bus setup (timings and CS config) */
+
+	return 0;
+}
+
+static int tango_nand_remove(struct platform_device *pdev)
+{
+	int cs;
+	struct tango_nfc *nfc = platform_get_drvdata(pdev);
+
+	dma_release_channel(nfc->chan);
+	for (cs = 0; cs < MAX_CS; ++cs)
+		if (nfc->chips[cs] != NULL)
+			nand_release(&nfc->chips[cs]->chip.mtd);
+
+	return 0;
+}
+
+static const struct of_device_id tango_nand_ids[] = {
+	{ .compatible = "sigma,smp8758-nand" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver tango_nand_driver = {
+	.probe	= tango_nand_probe,
+	.remove	= tango_nand_remove,
+	.driver	= {
+		.name		= "tango-nand",
+		.of_match_table	= tango_nand_ids,
+	},
+};
+
+module_platform_driver(tango_nand_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sigma Designs");
+MODULE_DESCRIPTION("Tango4 NAND Flash controller driver");
-- 
2.9.0
