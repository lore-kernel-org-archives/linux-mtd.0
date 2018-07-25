Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiLom-0000YC-Ox
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 15:35:14 +0000
Date: Wed, 25 Jul 2018 17:34:20 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Wenyou Yang
 <wenyou.yang@microchip.com>, Josh Wu <rainyfeeling@outlook.com>, Stefan
 Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 02/17] mtd: rawnand: cafe: convert driver to nand_scan()
Message-ID: <20180725173420.34bb32db@bbrezillon>
In-Reply-To: <20180725133152.30898-3-miquel.raynal@bootlin.com>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-3-miquel.raynal@bootlin.com>
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

On Wed, 25 Jul 2018 15:31:37 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Two helpers have been added to the core to do all kind of controller
> side configuration/initialization between the detection phase and the
> final NAND scan. Implement these hooks so that we can convert the driver
> to just use nand_scan() instead of the nand_scan_ident() +
> nand_scan_tail() pair.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/cafe_nand.c | 135 ++++++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
> index ac0be933a490..1dbe43adcfe7 100644
> --- a/drivers/mtd/nand/raw/cafe_nand.c
> +++ b/drivers/mtd/nand/raw/cafe_nand.c
> @@ -67,6 +67,7 @@ struct cafe_priv {
>  	int nr_data;
>  	int data_pos;
>  	int page_addr;
> +	bool usedma;
>  	dma_addr_t dmaaddr;
>  	unsigned char *dmabuf;
>  };
> @@ -121,7 +122,7 @@ static void cafe_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct cafe_priv *cafe = nand_get_controller_data(chip);
>  
> -	if (usedma)
> +	if (cafe->usedma)
>  		memcpy(cafe->dmabuf + cafe->datalen, buf, len);
>  	else
>  		memcpy_toio(cafe->mmio + CAFE_NAND_WRITE_DATA + cafe->datalen, buf, len);
> @@ -137,7 +138,7 @@ static void cafe_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct cafe_priv *cafe = nand_get_controller_data(chip);
>  
> -	if (usedma)
> +	if (cafe->usedma)
>  		memcpy(buf, cafe->dmabuf + cafe->datalen, len);
>  	else
>  		memcpy_fromio(buf, cafe->mmio + CAFE_NAND_READ_DATA + cafe->datalen, len);
> @@ -253,7 +254,7 @@ static void cafe_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
>  	/* NB: The datasheet lies -- we really should be subtracting 1 here */
>  	cafe_writel(cafe, cafe->datalen, NAND_DATA_LEN);
>  	cafe_writel(cafe, 0x90000000, NAND_IRQ);
> -	if (usedma && (ctl1 & (3<<25))) {
> +	if (cafe->usedma && (ctl1 & (3<<25))) {
>  		uint32_t dmactl = 0xc0000000 + cafe->datalen;
>  		/* If WR or RD bits set, set up DMA */
>  		if (ctl1 & (1<<26)) {
> @@ -593,6 +594,76 @@ static int cafe_mul(int x)
>  	return gf4096_mul(x, 0xe01);
>  }
>  
> +static int cafe_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct cafe_priv *cafe = nand_get_controller_data(chip);
> +	int err = 0;
> +
> +	cafe->dmabuf = dma_alloc_coherent(&cafe->pdev->dev, 2112,
> +					  &cafe->dmaaddr, GFP_KERNEL);
> +	if (!cafe->dmabuf)
> +		return -ENOMEM;
> +
> +	/* Set up DMA address */
> +	cafe_writel(cafe, lower_32_bits(cafe->dmaaddr), NAND_DMA_ADDR0);
> +	cafe_writel(cafe, upper_32_bits(cafe->dmaaddr), NAND_DMA_ADDR1);
> +
> +	cafe_dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
> +		     cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);
> +
> +	/* Restore the DMA flag */
> +	cafe->usedma = usedma;
> +
> +	cafe->ctl2 = BIT(27); /* Reed-Solomon ECC */
> +	if (mtd->writesize == 2048)
> +		cafe->ctl2 |= BIT(29); /* 2KiB page size */
> +
> +	/* Set up ECC according to the type of chip we found */
> +	mtd_set_ooblayout(mtd, &cafe_ooblayout_ops);
> +	if (mtd->writesize == 2048) {
> +		cafe->nand.bbt_td = &cafe_bbt_main_descr_2048;
> +		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_2048;
> +	} else if (mtd->writesize == 512) {
> +		cafe->nand.bbt_td = &cafe_bbt_main_descr_512;
> +		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_512;
> +	} else {
> +		dev_warn(&cafe->pdev->dev,
> +			 "Unexpected NAND flash writesize %d. Aborting\n",
> +			 mtd->writesize);
> +		err = -ENOTSUPP;
> +		goto out_free_dma;
> +	}
> +
> +	cafe->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
> +	cafe->nand.ecc.size = mtd->writesize;
> +	cafe->nand.ecc.bytes = 14;
> +	cafe->nand.ecc.strength = 4;
> +	cafe->nand.ecc.write_page = cafe_nand_write_page_lowlevel;
> +	cafe->nand.ecc.write_oob = cafe_nand_write_oob;
> +	cafe->nand.ecc.read_page = cafe_nand_read_page;
> +	cafe->nand.ecc.read_oob = cafe_nand_read_oob;
> +
> +	return 0;
> +
> + out_free_dma:
> +	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
> +
> +	return err;
> +}
> +
> +static void cafe_nand_detach_chip(struct nand_chip *chip)
> +{
> +	struct cafe_priv *cafe = nand_get_controller_data(chip);
> +
> +	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
> +}
> +
> +static const struct nand_controller_ops cafe_nand_controller_ops = {
> +	.attach_chip = cafe_nand_attach_chip,
> +	.detach_chip = cafe_nand_detach_chip,
> +};
> +
>  static int cafe_nand_probe(struct pci_dev *pdev,
>  				     const struct pci_device_id *ent)
>  {
> @@ -600,7 +671,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  	struct cafe_priv *cafe;
>  	uint32_t ctrl;
>  	int err = 0;
> -	int old_dma;
>  
>  	/* Very old versions shared the same PCI ident for all three
>  	   functions on the chip. Verify the class too... */
> @@ -708,62 +778,15 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  		cafe_readl(cafe, GLOBAL_CTRL),
>  		cafe_readl(cafe, GLOBAL_IRQ_MASK));
>  
> -	/* Do not use the DMA for the nand_scan_ident() */
> -	old_dma = usedma;
> -	usedma = 0;
> +	/* Do not use the DMA during the NAND identification */
> +	cafe->usedma = 0;
>  
>  	/* Scan to find existence of the device */
> -	err = nand_scan_ident(mtd, 2, NULL);
> +	cafe->nand.dummy_controller.ops = &cafe_nand_controller_ops;
> +	err = nand_scan(mtd, 2);
>  	if (err)
>  		goto out_irq;
>  
> -	cafe->dmabuf = dma_alloc_coherent(&cafe->pdev->dev, 2112,
> -					  &cafe->dmaaddr, GFP_KERNEL);
> -	if (!cafe->dmabuf) {
> -		err = -ENOMEM;
> -		goto out_irq;
> -	}
> -
> -	/* Set up DMA address */
> -	cafe_writel(cafe, lower_32_bits(cafe->dmaaddr), NAND_DMA_ADDR0);
> -	cafe_writel(cafe, upper_32_bits(cafe->dmaaddr), NAND_DMA_ADDR1);
> -
> -	cafe_dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
> -		cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);
> -
> -	/* Restore the DMA flag */
> -	usedma = old_dma;
> -
> -	cafe->ctl2 = 1<<27; /* Reed-Solomon ECC */
> -	if (mtd->writesize == 2048)
> -		cafe->ctl2 |= 1<<29; /* 2KiB page size */
> -
> -	/* Set up ECC according to the type of chip we found */
> -	mtd_set_ooblayout(mtd, &cafe_ooblayout_ops);
> -	if (mtd->writesize == 2048) {
> -		cafe->nand.bbt_td = &cafe_bbt_main_descr_2048;
> -		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_2048;
> -	} else if (mtd->writesize == 512) {
> -		cafe->nand.bbt_td = &cafe_bbt_main_descr_512;
> -		cafe->nand.bbt_md = &cafe_bbt_mirror_descr_512;
> -	} else {
> -		pr_warn("Unexpected NAND flash writesize %d. Aborting\n",
> -			mtd->writesize);
> -		goto out_free_dma;
> -	}
> -	cafe->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
> -	cafe->nand.ecc.size = mtd->writesize;
> -	cafe->nand.ecc.bytes = 14;
> -	cafe->nand.ecc.strength = 4;
> -	cafe->nand.ecc.write_page = cafe_nand_write_page_lowlevel;
> -	cafe->nand.ecc.write_oob = cafe_nand_write_oob;
> -	cafe->nand.ecc.read_page = cafe_nand_read_page;
> -	cafe->nand.ecc.read_oob = cafe_nand_read_oob;
> -
> -	err = nand_scan_tail(mtd);
> -	if (err)
> -		goto out_free_dma;
> -
>  	pci_set_drvdata(pdev, mtd);
>  
>  	mtd->name = "cafe_nand";
> @@ -775,8 +798,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  
>   out_cleanup_nand:
>  	nand_cleanup(&cafe->nand);
> - out_free_dma:
> -	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
>   out_irq:
>  	/* Disable NAND IRQ in global IRQ mask register */
>  	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
