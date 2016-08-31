Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf8XK-0004c0-KK
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 16:38:52 +0000
Subject: Re: [RFC preliminary v0.1] nfc driver for tango platform
To: linux-mtd <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
References: <57C58252.50902@free.fr>
From: Mason <slash.tmp@free.fr>
Message-ID: <57C707F3.5080301@free.fr>
Date: Wed, 31 Aug 2016 18:38:11 +0200
MIME-Version: 1.0
In-Reply-To: <57C58252.50902@free.fr>
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

On 30/08/2016 14:55, Mason wrote:
> Hello linux-mtd,
> 
> I've been writing a driver for the custom NAND Flash controller embedded
> in tango chips, such as smp8758.
> 
> I'd like to hear every and all feedback on what I did wrong so that I can
> eventually submit the work upstream. Please bear in mind that this is a
> preliminary version, so there are still a few rough edges.

I didn't have time to finish, and make a proper patch, as Boris requested.
But I did fix all the hard-coded values, and I wanted to post the result,
as a reference.

I will try to fix the two hard-coded timings. (Since these are chip-dependent
parameters, I thought they should be passed via the device tree, but Boris
thinks it might be possible to deduce at run-time?)

I'm hoping to post a proper patch (with Kconfig and Makefile updated) some
time tomorrow.

Regards.


#include <linux/io.h>
#include <linux/of.h>
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
	u32 timing1, timing2, xfer_cfg, pkt_0_cfg, pkt_n_cfg, bb_cfg;
};

#define to_tango_chip(ptr) container_of(ptr, struct tango_chip, chip)

/* Offsets relative to chip->base */
#define PBUS_CMD	0
#define PBUS_ADDR	4
#define PBUS_DATA	8

/* Offsets relative to reg_base */
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

/* NFC_FLASH_CMD values */
#define NFC_READ	1
#define NFC_WRITE	2

/* NFC_XFER_STATUS values */
#define PAGE_IS_EMPTY	BIT(16)

/* Offsets relative to mem_base */
#define ERROR_REPORT	0x1c0

/* ERROR_REPORT values */
#define DECODE_ERR_ON_PKT_0(v)	(~v & BIT(7))
#define DECODE_ERR_ON_PKT_N(v)	(~v & BIT(15))
#define ERR_COUNT_PKT_0(v)	((v >> 0) & 0x3f)
#define ERR_COUNT_PKT_N(v)	((v >> 8) & 0x3f)

/* Offsets relative to pbus_base */
#define PBUS_CS_CTRL	0x83c
#define PBUS_PAD_MODE	0x8f0

/* PBUS_CS_CTRL values */
#define PBUS_IORDY	BIT(31)

/* PBUS_PAD_MODE values */
#define MODE_RAW	0
#define MODE_MLC	BIT(31)

#define METADATA_SIZE	4
#define BBM_SIZE	6
#define FIELD_ORDER	15

#define XFER_CFG(cs, page_count, steps, metadata_size) \
	((cs) << 24 | (page_count) << 16 | (steps) << 8 | (metadata_size) << 0)

#define PKT_CFG(size, strength) ((size) << 16 | (strength) << 0)

#define BB_CFG(bb_offset, bb_size) ((bb_offset) << 16 | (bb_size) << 0)

#define NFC_BUSY(base) (readl_relaxed(base + NFC_STATUS_REG) & 0xf)

static void tango_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
{
	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));

	if (ctrl & NAND_CLE)
		writeb_relaxed(dat, chip->base + PBUS_CMD);

	if (ctrl & NAND_ALE)
		writeb_relaxed(dat, chip->base + PBUS_ADDR);
}

static int tango_dev_ready(struct mtd_info *mtd)
{
	struct nand_chip *chip = mtd_to_nand(mtd);
	struct tango_nfc *nfc = to_tango_nfc(chip->controller);

	return readl_relaxed(nfc->pbus_base + PBUS_CS_CTRL) & PBUS_IORDY;
}

static uint8_t tango_read_byte(struct mtd_info *mtd)
{
	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));

	return readb_relaxed(chip->base + PBUS_DATA);
}

static void tango_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
{
	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));

	ioread8_rep(chip->base + PBUS_DATA, buf, len);
}

static int decode_error_report(struct tango_nfc *nfc)
{
	u32 status, res;

	status = readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
	if (status & PAGE_IS_EMPTY)
		return 0;

	res = readl_relaxed(nfc->mem_base + ERROR_REPORT);

	if (DECODE_ERR_ON_PKT_0(res) || DECODE_ERR_ON_PKT_N(res))
		return -EBADMSG;

	return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
}

static void tango_dma_callback(void *arg)
{
	complete(arg);
}

static int do_dma(struct nand_chip *nand, int dir, int cmd, void *buf, int len, int page)
{
	struct tango_nfc *nfc = to_tango_nfc(nand->controller);
	struct tango_chip *chip = to_tango_chip(nand);
	struct dma_async_tx_descriptor *desc;
	struct scatterlist sg;
	struct completion tx_done;
	int err = -EIO;

	sg_init_one(&sg, buf, len);
	if (dma_map_sg(nfc->chan->device->dev, &sg, 1, dir) != 1)
		goto leave;

	desc = dmaengine_prep_slave_sg(nfc->chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
	if (!desc)
		goto dma_unmap;

	desc->callback = tango_dma_callback;
	desc->callback_param = &tx_done;
	init_completion(&tx_done);

	writel_relaxed(MODE_MLC, nfc->pbus_base + PBUS_PAD_MODE);

	err = 0;
	dmaengine_submit(desc);
	dma_async_issue_pending(nfc->chan);

	writel_relaxed(chip->timing1,	nfc->reg_base + NFC_TIMING1);
	writel_relaxed(chip->timing2,	nfc->reg_base + NFC_TIMING2);
	writel_relaxed(chip->xfer_cfg,	nfc->reg_base + NFC_XFER_CFG);
	writel_relaxed(chip->pkt_0_cfg,	nfc->reg_base + NFC_PKT_0_CFG);
	writel_relaxed(chip->pkt_n_cfg,	nfc->reg_base + NFC_PKT_N_CFG);
	writel_relaxed(chip->bb_cfg,	nfc->reg_base + NFC_BB_CFG);
	writel_relaxed(page, nfc->reg_base + NFC_ADDR_PAGE);
	writel_relaxed(0, nfc->reg_base + NFC_ADDR_OFFSET);
	writel(cmd, nfc->reg_base + NFC_FLASH_CMD);

	wait_for_completion(&tx_done);

	while (NFC_BUSY(nfc->reg_base))
		cpu_relax();

	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
dma_unmap:
	dma_unmap_sg(nfc->chan->device->dev, &sg, 1, dir);
leave:
	return err;
}

static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
			uint8_t *buf, int oob_required, int page)
{
	int err;

	err = do_dma(chip, DMA_FROM_DEVICE, NFC_READ, buf, mtd->writesize, page);
	if (err)
		return err;

	return decode_error_report(to_tango_nfc(chip->controller));
}

static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
			const uint8_t *buf, int oob_required, int page)
{
	return do_dma(chip, DMA_TO_DEVICE, NFC_WRITE, (void *)buf, mtd->writesize, page);
}

static int chip_init(struct device *dev, struct tango_nfc *nfc, struct device_node *np)
{
	int err;
	u32 cs, ecc_bits;
	struct nand_ecc_ctrl *ecc;
	struct tango_chip *p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
	if (!p)
		return -ENOMEM;

	nand_set_flash_node(&p->chip, np);
	err = of_property_read_u32_index(np, "reg", 0, &cs);
	if (err)
		return err;

	if (cs >= 4)
		return -ERANGE;

	p->chip.read_byte	= tango_read_byte;
	p->chip.read_buf	= tango_read_buf;
	p->chip.cmd_ctrl	= tango_cmd_ctrl;
	p->chip.dev_ready	= tango_dev_ready;
	//p->chip.options	= NAND_SKIP_BBTSCAN;
	p->chip.controller	= &nfc->hw;
	p->base			= nfc->pbus_base + (cs * 256);

	ecc		= &p->chip.ecc;
	ecc->mode	= NAND_ECC_HW;
	ecc->algo	= NAND_ECC_BCH;
	ecc->read_page	= tango_read_page;
	ecc->write_page	= tango_write_page;


	err = nand_scan_ident(&p->chip.mtd, 1, NULL);
	if (err)
		return err;

	err = nand_scan_tail(&p->chip.mtd);
	if (err)
		return err;

	ecc_bits = p->chip.ecc.strength * FIELD_ORDER;
	p->chip.ecc.bytes = DIV_ROUND_UP(ecc_bits, 8);

	err = mtd_device_register(&p->chip.mtd, NULL, 0);
	if (err)
		return err;

	nfc->chips[cs] = p;

	p->timing1	= 0x052d0905;
	p->timing2	= 0x0804062d;
	p->xfer_cfg	= XFER_CFG(cs, 1, ecc->steps, METADATA_SIZE);
	p->pkt_0_cfg	= PKT_CFG(ecc->size + METADATA_SIZE, ecc->strength);
	p->pkt_n_cfg	= PKT_CFG(ecc->size, ecc->strength);
	p->bb_cfg	= BB_CFG(p->chip.mtd.writesize, BBM_SIZE);

	return 0;
}

static int tango_nand_probe(struct platform_device *pdev)
{
	int i;
	struct resource *res;
	void __iomem *addr[3];
	struct tango_nfc *nfc;
	struct device_node *np;


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

	for_each_child_of_node(pdev->dev.of_node, np) {
		int err = chip_init(&pdev->dev, nfc, np);
		if (err)
			return err;
	}

	nfc->chan = dma_request_chan(&pdev->dev, "mlc_flash_0");
	if (IS_ERR(nfc->chan))
		return PTR_ERR(nfc->chan);

	// TODO: tweak (?) Peripheral Bus setup (timings and CS config)

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
MODULE_DESCRIPTION("Tango4 NAND Flash controller driver");
