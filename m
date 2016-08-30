Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beiaZ-00077b-Ff
 for linux-mtd@lists.infradead.org; Tue, 30 Aug 2016 12:56:29 +0000
To: linux-mtd <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
From: Mason <slash.tmp@free.fr>
Subject: [RFC preliminary v0.1] nfc driver for tango platform
Message-ID: <57C58252.50902@free.fr>
Date: Tue, 30 Aug 2016 14:55:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello linux-mtd,

I've been writing a driver for the custom NAND Flash controller embedded
in tango chips, such as smp8758.

I'd like to hear every and all feedback on what I did wrong so that I can
eventually submit the work upstream. Please bear in mind that this is a
preliminary version, so there are still a few rough edges.

Regards.


#include <linux/io.h>
#include <linux/module.h>
#include <linux/mtd/nand.h>
#include <linux/dmaengine.h>
#include <linux/dma-mapping.h>
#include <linux/platform_device.h>

struct tango_nfc {
	struct nand_hw_control hw;
	void __iomem *reg_base, *mem_base, *pbus_base;
	struct tango_chip *chips[4];
	struct dma_chan *chan;
};

#define to_tango_nfc(ptr) container_of(ptr, struct tango_nfc, hw)

struct tango_chip {
	struct nand_chip chip;
	void __iomem *base;
	int cs;
};

#define to_tango_chip(ptr) container_of(ptr, struct tango_chip, chip)

#define PBUS_PAD_MODE	0x8f0
#define MODE_RAW	0
#define MODE_MLC	BIT(31)

#define CMD_OFFSET	0
#define ADDR_OFFSET	4
#define DATA_OFFSET	8

#define NFC_STATUS_REG	0x00
#define NFC_FLASH_CMD	0x04
#define NFC_DEVICE_CFG	0x08
#define NFC_TIMING1	0x0c
#define NFC_TIMING2	0x10
#define NFC_XFER_CFG	0x14
#define NFC_PKT_0_CFG	0x18
#define NFC_PKT_N_CFG	0x1c
#define NFC_BB_CFG	0x20
#define NFC_ADDR_PAGE	0x24
#define NFC_ADDR_OFFSET	0x28
#define NFC_XFER_STATUS	0x2c

static void tango_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
{
	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));

	if (ctrl & NAND_CLE)
		writeb(dat, chip->base + CMD_OFFSET);

	if (ctrl & NAND_ALE)
		writeb(dat, chip->base + ADDR_OFFSET);
}

static int tango_dev_ready(struct mtd_info *mtd)
{
	struct nand_chip *chip = mtd_to_nand(mtd);
	struct tango_nfc *nfc = to_tango_nfc(chip->controller);

	return readl_relaxed(nfc->pbus_base + 0x83c) & BIT(31);
}

static uint8_t tango_read_byte(struct mtd_info *mtd)
{
	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));

	return readb_relaxed(chip->base + DATA_OFFSET);
}

static void tango_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
{
	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));

	ioread8_rep(chip->base + DATA_OFFSET, buf, len);
}

static int decode_error_report(struct tango_nfc *nfc)
{
	u32 xfer_status, report, pkt0, pktn;

	xfer_status = readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
	if (xfer_status & BIT(16)) /* page is empty */
		return 0;

	report = readl_relaxed(nfc->mem_base + 0x1c0);

	if ((report & BIT(7)) == 0) /* too many bitflips on first packet */
		return -EBADMSG;

	if ((report & BIT(15)) == 0) /* too many bitflips on another packet */
		return -EBADMSG;

	pkt0 = (report >> 0) & 63;
	pktn = (report >> 8) & 63;

	return max(pkt0, pktn);
}

static void tango_dma_callback(void *arg)
{
	complete(arg);
}

static int do_dma(struct mtd_info *mtd, void *addr, unsigned int len, int page,
		void __iomem *reg_base, struct dma_chan *chan, int dir)
{
	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
	struct dma_async_tx_descriptor *desc;
	struct scatterlist sg;
	struct completion tx_done;
	int err = -EIO;

	sg_init_one(&sg, addr, len);
	if (dma_map_sg(chan->device->dev, &sg, 1, dir) != 1)
		goto L1;

	desc = dmaengine_prep_slave_sg(chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
	if (!desc)
		goto L2;

	desc->callback = tango_dma_callback;
	desc->callback_param = &tx_done;
	init_completion(&tx_done);

	dmaengine_submit(desc);
	dma_async_issue_pending(chan);
	err = 0;

	writel(chip->cs << 24 | 0x00010204, reg_base + NFC_XFER_CFG);
	writel(page, reg_base + NFC_ADDR_PAGE);
	writel(0, reg_base + NFC_ADDR_OFFSET);
	writel(1, reg_base + NFC_FLASH_CMD);

	wait_for_completion(&tx_done);

	while (readl(reg_base + NFC_STATUS_REG) & 0xf)
		cpu_relax();

L2:
	dma_unmap_sg(chan->device->dev, &sg, 1, dir);
L1:
	return err;
}

static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
			uint8_t *buf, int oob_required, int page)
{
	int ret, err, len = mtd->writesize;
	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
	//printk("%s: buf=%p oob_req=%d page=%d\n", __func__, buf, oob_required, page);

	writel(MODE_MLC, nfc->pbus_base + PBUS_PAD_MODE);

	err = do_dma(mtd, buf, len, page, nfc->reg_base, nfc->chan, DMA_FROM_DEVICE);
	ret = err ? err : decode_error_report(nfc);

	writel(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
	return ret;
}

static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
			const uint8_t *buf, int oob_required, int page)
{
	int ret, err, len = mtd->writesize;
	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
	//printk("%s: buf=%p oob_req=%d page=%d\n", __func__, buf, oob_required, page);

	writel(MODE_MLC, nfc->pbus_base + PBUS_PAD_MODE);

	err = do_dma(mtd, (void *)buf, len, page, nfc->reg_base, nfc->chan, DMA_TO_DEVICE);
	ret = err ? err : decode_error_report(nfc);

	writel(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
	return ret;
}

static int chip_init(struct device *dev, struct tango_nfc *nfc, int cs)
{
	int err;
	struct tango_chip *p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
	if (!p)
		return -ENOMEM;


	p->chip.read_byte	= tango_read_byte;
	p->chip.read_buf	= tango_read_buf;
	p->chip.cmd_ctrl	= tango_cmd_ctrl;
	p->chip.dev_ready	= tango_dev_ready;
	//p->chip.options	= NAND_SKIP_BBTSCAN;
	p->chip.controller	= &nfc->hw;

	p->chip.ecc.mode	= NAND_ECC_HW;
	p->chip.ecc.algo	= NAND_ECC_BCH;
	p->chip.ecc.steps	= 2;
	p->chip.ecc.size	= 1024;
	p->chip.ecc.bytes	= 27;
	p->chip.ecc.strength	= 14;
	p->chip.ecc.read_page	= tango_read_page;
	p->chip.ecc.write_page	= tango_write_page;

	p->base		= nfc->pbus_base + (cs * 256);
	p->cs		= cs;

	err = nand_scan(&p->chip.mtd, 0);
	printk("nand_scan=%d\n", err);
	if (err) return err;

	err = mtd_device_register(&p->chip.mtd, NULL, 0);
	printk("mtd_device_register=%d\n", err);
	nfc->chips[cs] = p;

	return err;
}

static int tango_nand_probe(struct platform_device *pdev)
{
	int i;
	struct resource *res;
	void __iomem *addr[3];
	struct tango_nfc *nfc;

	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
	if (!nfc)
		return -ENOMEM;

	for (i = 0; i < 3; ++i) {
		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
		addr[i] = devm_ioremap_resource(&pdev->dev, res);
		if (IS_ERR(addr[i]))
				return PTR_ERR(addr[i]);
	}

	platform_set_drvdata(pdev, nfc);
	nand_hw_control_init(&nfc->hw);

	nfc->reg_base	= addr[0];
	nfc->mem_base	= addr[1];
	nfc->pbus_base	= addr[2];

	for (i = 0; i < 2; ++i) {
		int err = chip_init(&pdev->dev, nfc, i);
		if (err)
			return err;
	}

	nfc->chan = dma_request_chan(&pdev->dev, "mlc_flash_0");
	if (IS_ERR(nfc->chan))
		return PTR_ERR(nfc->chan);

	// TODO: tweak (?) Peripheral Bus setup (timings and CS config)

	writel(0x052d0905, nfc->reg_base + NFC_TIMING1);
	writel(0x0804062d, nfc->reg_base + NFC_TIMING2);
	writel(0x00010204, nfc->reg_base + NFC_XFER_CFG);
	writel(0x0404000e, nfc->reg_base + NFC_PKT_0_CFG);
	writel(0x0400000e, nfc->reg_base + NFC_PKT_N_CFG);
	writel(0x08000006, nfc->reg_base + NFC_BB_CFG);

	return 0;
}

static int tango_nand_remove(struct platform_device *pdev)
{
	int cs;
	struct tango_nfc *nfc = platform_get_drvdata(pdev);

	dma_release_channel(nfc->chan);
	for (cs = 0; cs < 4; ++cs)
		if (nfc->chips[cs] != NULL)
			nand_release(&nfc->chips[cs]->chip.mtd);

	return 0;
}

static const struct of_device_id tango_nand_ids[] = {
	{ .compatible = "sigma,smp8758-nand" },
	{ /* sentinel */ }
};

static struct platform_driver tango_nand_driver = {
	.probe	= tango_nand_probe,
	.remove	= tango_nand_remove,
	.driver	= {
		.name		= "tango-nand",
		.of_match_table	= tango_nand_ids,
	},
};

module_platform_driver(tango_nand_driver);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Sigma Designs");
MODULE_DESCRIPTION("Tango NAND Flash controller driver");
