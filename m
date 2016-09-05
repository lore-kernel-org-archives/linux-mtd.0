Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgo7c-00052B-7k
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 07:15:13 +0000
Date: Mon, 5 Sep 2016 09:14:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Sebastian Frias <sf84@laposte.net>, Jean-Baptiste Lescher
 <jblescher@gmail.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>,
 Mason <slash.tmp@free.fr>
Subject: Re: [PATCH v1] mtd: nand: tango: import driver for tango controller
Message-ID: <20160905091450.017e4aa3@bbrezillon>
In-Reply-To: <57C94E33.6070304@sigmadesigns.com>
References: <57C94E33.6070304@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 Sep 2016 12:02:27 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> This driver supports the NAND Flash controller embedded in recent
> Tango chips, such as SMP8758 and SMP8759.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/mtd/nand/Kconfig      |   6 +
>  drivers/mtd/nand/Makefile     |   1 +
>  drivers/mtd/nand/tango_nand.c | 376 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 383 insertions(+)
>  create mode 100644 drivers/mtd/nand/tango_nand.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f05e0e9eb2f7..22eb5457c9f7 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -205,6 +205,12 @@ config MTD_NAND_S3C2410_CLKSTOP
>  	  when the is NAND chip selected or released, but will save
>  	  approximately 5mA of power when there is nothing happening.
>  
> +config MTD_NAND_TANGO
> +	tristate "NAND Flash support for Tango chips"
> +	depends on ARCH_TANGO
> +	help
> +	  Enables the NAND Flash controller on Tango chips.
> +
>  config MTD_NAND_DISKONCHIP
>  	tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND reimplementation)"
>  	depends on HAS_IOMEM
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index f55335373f7c..647f727223ef 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_MTD_NAND_DENALI_DT)	+= denali_dt.o
>  obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
>  obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
>  obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
> +obj-$(CONFIG_MTD_NAND_TANGO)		+= tango_nand.o
>  obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
>  obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
>  obj-$(CONFIG_MTD_NAND_DOCG4)		+= docg4.o
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> new file mode 100644
> index 000000000000..dfd27081d5ec
> --- /dev/null
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -0,0 +1,376 @@
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +
> +/* Offsets relative to chip->base */
> +#define PBUS_CMD	0
> +#define PBUS_ADDR	4
> +#define PBUS_DATA	8
> +
> +/* Offsets relative to reg_base */
> +#define NFC_STATUS_REG	0x00
> +#define NFC_FLASH_CMD	0x04
> +#define NFC_DEVICE_CFG	0x08
> +#define NFC_TIMING1	0x0c
> +#define NFC_TIMING2	0x10
> +#define NFC_XFER_CFG	0x14
> +#define NFC_PKT_0_CFG	0x18
> +#define NFC_PKT_N_CFG	0x1c
> +#define NFC_BB_CFG	0x20
> +#define NFC_ADDR_PAGE	0x24
> +#define NFC_ADDR_OFFSET	0x28
> +#define NFC_XFER_STATUS	0x2c
> +
> +/* NFC_FLASH_CMD values */
> +#define NFC_READ	1
> +#define NFC_WRITE	2
> +
> +/* NFC_XFER_STATUS values */
> +#define PAGE_IS_EMPTY	BIT(16)
> +
> +/* Offsets relative to mem_base */
> +#define ERROR_REPORT	0x1c0
> +
> +/* ERROR_REPORT values */
> +#define DECODE_ERR_ON_PKT_0(v)	(~v & BIT(7))
> +#define DECODE_ERR_ON_PKT_N(v)	(~v & BIT(15))

Is this really packed N? I'd say it's packet 1.

How about:

#define DECODE_ERR_ON_PKT(pkt, v)	(~(v) & BIT(((pkt) * 8) + 7))

> +#define ERR_COUNT_PKT_0(v)	((v >> 0) & 0x3f)
> +#define ERR_COUNT_PKT_N(v)	((v >> 8) & 0x3f)

Ditto.

> +
> +/* Offsets relative to pbus_base */
> +#define PBUS_CS_CTRL	0x83c
> +#define PBUS_PAD_MODE	0x8f0
> +
> +/* PBUS_CS_CTRL values */
> +#define PBUS_IORDY	BIT(31)
> +
> +/* PBUS_PAD_MODE values */
> +#define MODE_RAW	0
> +#define MODE_MLC	BIT(31)
> +
> +#define METADATA_SIZE	4
> +#define BBM_SIZE	6
> +#define FIELD_ORDER	15
> +
> +#define MAX_CS		4
> +
> +struct tango_nfc {
> +	struct nand_hw_control hw;
> +	void __iomem *reg_base, *mem_base, *pbus_base;
> +	struct tango_chip *chips[MAX_CS];
> +	struct dma_chan *chan;
> +};
> +
> +#define to_tango_nfc(ptr) container_of(ptr, struct tango_nfc, hw)
> +
> +struct tango_chip {
> +	struct nand_chip chip;
> +	void __iomem *base;

I think it better to encode the CS id, and calculate the __iomem offset
based on that at run-time. Especially if you want to support multi-CS
(multi dies) chips, which you don't seem to support here.

> +	u32 timing1, timing2, xfer_cfg, pkt_0_cfg, pkt_n_cfg, bb_cfg;

Please, one field per line in struct definitions.

> +};
> +
> +#define to_tango_chip(ptr) container_of(ptr, struct tango_chip, chip)
> +
> +#define XFER_CFG(cs, page_count, steps, metadata_size)	\
> +	((cs) << 24 | (page_count) << 16 | (steps) << 8 | (metadata_size) << 0)
> +
> +#define PKT_CFG(size, strength) ((size) << 16 | (strength) << 0)
> +
> +#define BB_CFG(bb_offset, bb_size) ((bb_offset) << 16 | (bb_size) << 0)
> +
> +#define TIMING(t0, t1, t2, t3) (t0 << 24 | t1 << 16 | t2 << 8 | t3)
> +
> +#define NFC_BUSY(base) (readl_relaxed(base + NFC_STATUS_REG) & 0xf)

I'd turn that one into an inline function taking a nand_chip pointer in
parameter. Or drop it completely, since you only have one user.

And please document why you use this 0xf mask? I guess there's one bit
per CS, so masking with 0xf is not necessarily a good idea...

> +
> +static void tango_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
> +{
> +	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
> +
> +	if (ctrl & NAND_CLE)
> +		writeb_relaxed(dat, chip->base + PBUS_CMD);
> +
> +	if (ctrl & NAND_ALE)
> +		writeb_relaxed(dat, chip->base + PBUS_ADDR);
> +}
> +
> +static int tango_dev_ready(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
> +
> +	return readl_relaxed(nfc->pbus_base + PBUS_CS_CTRL) & PBUS_IORDY;
> +}
> +
> +static uint8_t tango_read_byte(struct mtd_info *mtd)
> +{
> +	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
> +
> +	return readb_relaxed(chip->base + PBUS_DATA);
> +}
> +
> +static void tango_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	struct tango_chip *chip = to_tango_chip(mtd_to_nand(mtd));
> +
> +	ioread8_rep(chip->base + PBUS_DATA, buf, len);
> +}
> +
> +static int decode_error_report(struct tango_nfc *nfc)
> +{
> +	u32 status, res;
> +
> +	status = readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
> +	if (status & PAGE_IS_EMPTY)
> +		return 0;
> +
> +	res = readl_relaxed(nfc->mem_base + ERROR_REPORT);
> +
> +	if (DECODE_ERR_ON_PKT_0(res) || DECODE_ERR_ON_PKT_N(res))
> +		return -EBADMSG;

Hm, you're assuming you'll always have 2 packets in your layout, is
this true? Don't you have layouts where you only have one packet (2k
pages with 2k packets) ?

> +
> +	return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
> +}
> +
> +static void tango_dma_callback(void *arg)
> +{
> +	complete(arg);
> +}
> +
> +static int do_dma(struct nand_chip *nand, int dir, int cmd, void *buf, int len, int page)
> +{
> +	struct tango_nfc *nfc = to_tango_nfc(nand->controller);
> +	struct tango_chip *chip = to_tango_chip(nand);
> +	struct dma_async_tx_descriptor *desc;
> +	struct scatterlist sg;
> +	struct completion tx_done;
> +	int err = -EIO;
> +
> +	sg_init_one(&sg, buf, len);
> +	if (dma_map_sg(nfc->chan->device->dev, &sg, 1, dir) != 1)
> +		goto leave;
> +
> +	desc = dmaengine_prep_slave_sg(nfc->chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
> +	if (!desc)
> +		goto dma_unmap;
> +
> +	desc->callback = tango_dma_callback;
> +	desc->callback_param = &tx_done;
> +	init_completion(&tx_done);
> +
> +	writel_relaxed(MODE_MLC, nfc->pbus_base + PBUS_PAD_MODE);

Not sure I understand what MLC means here? Can you give more detail?

> +
> +	err = 0;
> +	dmaengine_submit(desc);
> +	dma_async_issue_pending(nfc->chan);
> +
> +	writel_relaxed(chip->timing1,	nfc->reg_base + NFC_TIMING1);
> +	writel_relaxed(chip->timing2,	nfc->reg_base + NFC_TIMING2);
> +	writel_relaxed(chip->xfer_cfg,	nfc->reg_base + NFC_XFER_CFG);
> +	writel_relaxed(chip->pkt_0_cfg,	nfc->reg_base + NFC_PKT_0_CFG);
> +	writel_relaxed(chip->pkt_n_cfg,	nfc->reg_base + NFC_PKT_N_CFG);
> +	writel_relaxed(chip->bb_cfg,	nfc->reg_base + NFC_BB_CFG);
> +	writel_relaxed(page, nfc->reg_base + NFC_ADDR_PAGE);
> +	writel_relaxed(0, nfc->reg_base + NFC_ADDR_OFFSET);
> +	writel(cmd, nfc->reg_base + NFC_FLASH_CMD);
> +
> +	wait_for_completion(&tx_done);
> +
> +	while (NFC_BUSY(nfc->reg_base))
> +		cpu_relax();
> +
> +	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
> +dma_unmap:
> +	dma_unmap_sg(nfc->chan->device->dev, &sg, 1, dir);
> +leave:
> +	return err;
> +}
> +
> +static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> +			uint8_t *buf, int oob_required, int page)
> +{
> +	int err, len = mtd->writesize;
> +
> +	err = do_dma(chip, DMA_FROM_DEVICE, NFC_READ, buf, len, page);
> +	if (err)
> +		return err;
> +
> +	return decode_error_report(to_tango_nfc(chip->controller));
> +}
> +
> +static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> +			const uint8_t *buf, int oob_required, int page)
> +{
> +	int len = mtd->writesize;
> +
> +	return do_dma(chip, DMA_TO_DEVICE, NFC_WRITE, (void *)buf, len, page);
> +}
> +
> +static u32 to_ticks(int kHz, int ps)
> +{
> +	return DIV_ROUND_UP_ULL((u64)kHz * ps, NSEC_PER_SEC);
> +}
> +
> +static int set_timings(struct tango_chip *p, int kHz)
> +{
> +	u32 Trdy, Textw, Twc, Twpw, Tacc, Thold, Trpw, Textr;
> +	const struct nand_sdr_timings *sdr;
> +	int mode = onfi_get_async_timing_mode(&p->chip);
> +
> +	if (mode & ONFI_TIMING_MODE_UNKNOWN)
> +		return -ENODEV;
> +
> +	sdr = onfi_async_timing_mode_to_sdr_timings(fls(mode) - 1);
> +
> +	Trdy	= to_ticks(kHz, sdr->tCEA_max - sdr->tREA_max);
> +	Textw	= to_ticks(kHz, sdr->tWB_max);
> +	Twc	= to_ticks(kHz, sdr->tWC_min);
> +	Twpw	= to_ticks(kHz, sdr->tWC_min - sdr->tWP_min);
> +
> +	Tacc	= to_ticks(kHz, sdr->tREA_max);
> +	Thold	= to_ticks(kHz, sdr->tREH_min);
> +	Trpw	= to_ticks(kHz, sdr->tRC_min - sdr->tREH_min);
> +	Textr	= to_ticks(kHz, sdr->tRHZ_max);
> +
> +	p->timing1 = TIMING(Trdy, Textw, Twc, Twpw);
> +	p->timing2 = TIMING(Tacc, Thold, Trpw, Textr);
> +
> +	return 0;
> +}
> +
> +static int chip_init(struct device *dev, struct device_node *np, int kHz)
> +{
> +	int err;
> +	u32 cs, ecc_bits;
> +	struct nand_ecc_ctrl *ecc;
> +	struct tango_nfc *nfc = dev_get_drvdata(dev);
> +	struct tango_chip *p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	err = of_property_read_u32_index(np, "reg", 0, &cs);
> +	if (err)
> +		return err;
> +
> +	if (cs >= MAX_CS)
> +		return -ERANGE;
> +
> +	p->chip.read_byte	= tango_read_byte;
> +	p->chip.read_buf	= tango_read_buf;
> +	p->chip.cmd_ctrl	= tango_cmd_ctrl;
> +	p->chip.dev_ready	= tango_dev_ready;
> +	/* p->chip.options	= NAND_MAGIC_FOO */
> +	p->chip.controller	= &nfc->hw;
> +	p->base			= nfc->pbus_base + (cs * 256);
> +
> +	ecc		= &p->chip.ecc;
> +	ecc->mode	= NAND_ECC_HW;
> +	ecc->algo	= NAND_ECC_BCH;
> +	ecc->read_page	= tango_read_page;
> +	ecc->write_page	= tango_write_page;
> +
> +	nand_set_flash_node(&p->chip, np);
> +	err = nand_scan(&p->chip.mtd, 1);
> +	if (err)
> +		return err;
> +
> +	ecc_bits = p->chip.ecc.strength * FIELD_ORDER;

Are you sure the field order is always 15? I thought the ECC controller
was adapting it depending on the packet size (512 bytes packets => 13,
1024 bytes => 14, 2k => 15), but maybe I'm wrong.

> +	p->chip.ecc.bytes = DIV_ROUND_UP(ecc_bits, 8);
> +	set_timings(p, kHz);
> +
> +	err = mtd_device_register(&p->chip.mtd, NULL, 0);
> +	if (err)
> +		return err;
> +
> +	nfc->chips[cs] = p;
> +
> +	p->xfer_cfg	= XFER_CFG(cs, 1, ecc->steps, METADATA_SIZE);
> +	p->pkt_0_cfg	= PKT_CFG(ecc->size + METADATA_SIZE, ecc->strength);
> +	p->pkt_n_cfg	= PKT_CFG(ecc->size, ecc->strength);
> +	p->bb_cfg	= BB_CFG(p->chip.mtd.writesize, BBM_SIZE);
> +
> +	return 0;
> +}
> +
> +static int tango_nand_probe(struct platform_device *pdev)
> +{
> +	int i, kHz;
> +	struct resource *res;
> +	void __iomem *addr[3];
> +	struct tango_nfc *nfc;
> +	struct device_node *np;
> +
> +	struct clk *clk = clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < 3; ++i) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> +		addr[i] = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(addr[i]))
> +			return PTR_ERR(addr[i]);
> +	}
> +
> +	platform_set_drvdata(pdev, nfc);
> +	nand_hw_control_init(&nfc->hw);
> +	kHz = clk_get_rate(clk) / 1000;
> +
> +	nfc->reg_base	= addr[0];
> +	nfc->mem_base	= addr[1];
> +	nfc->pbus_base	= addr[2];

Why not doing

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	nfc->reg_base = devm_ioremap_resource(&pdev->dev, res);

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	nfc->mem_base = devm_ioremap_resource(&pdev->dev, res);
...

> +
> +	for_each_child_of_node(pdev->dev.of_node, np) {
> +		int err = chip_init(&pdev->dev, np, kHz);
> +		if (err)
> +			return err;
> +	}
> +
> +	nfc->chan = dma_request_chan(&pdev->dev, "mlc_flash_0");
> +	if (IS_ERR(nfc->chan))
> +		return PTR_ERR(nfc->chan);
> +
> +	/* TODO: tweak (?) Peripheral Bus setup (timings and CS config) */
> +
> +	return 0;
> +}
> +
> +static int tango_nand_remove(struct platform_device *pdev)
> +{
> +	int cs;
> +	struct tango_nfc *nfc = platform_get_drvdata(pdev);
> +
> +	dma_release_channel(nfc->chan);
> +	for (cs = 0; cs < MAX_CS; ++cs)
> +		if (nfc->chips[cs] != NULL)
> +			nand_release(&nfc->chips[cs]->chip.mtd);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tango_nand_ids[] = {
> +	{ .compatible = "sigma,smp8758-nand" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver tango_nand_driver = {
> +	.probe	= tango_nand_probe,
> +	.remove	= tango_nand_remove,
> +	.driver	= {
> +		.name		= "tango-nand",
> +		.of_match_table	= tango_nand_ids,
> +	},
> +};
> +
> +module_platform_driver(tango_nand_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Sigma Designs");
> +MODULE_DESCRIPTION("Tango4 NAND Flash controller driver");
