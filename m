Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXWK7-0007Wr-RH
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 19:07:05 +0000
Date: Thu, 13 Dec 2018 20:06:41 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Lucas
 Stach <dev@lynxeye.de>, Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu
 <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org
Subject: Re: [v5,04/17] mtd: rawnand: omap2: convert driver to nand_scan()
Message-ID: <20181213200641.7b9f7531@bbrezillon>
In-Reply-To: <20181213190111.2f32cfaffa5ea26f77bae520@gmail.com>
References: <20180725133152.30898-5-miquel.raynal@bootlin.com>
 <20181213190111.2f32cfaffa5ea26f77bae520@gmail.com>
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

On Thu, 13 Dec 2018 19:01:11 +0100
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

> > +static int omap_nand_attach_chip(struct nand_chip *chip)
> > +{
> > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > +	struct omap_nand_info *info = mtd_to_omap(mtd);
> > +	struct device *dev = &info->pdev->dev;
> > +	int min_oobbytes = BADBLOCK_MARKER_LENGTH;
> > +	int oobbytes_per_step;
> > +	dma_cap_mask_t mask;
> > +	int err;
> > +
> > +	if (chip->bbt_options & NAND_BBT_USE_FLASH)
> > +		chip->bbt_options |= NAND_BBT_NO_OOB;
> > +	else
> > +		chip->options |= NAND_SKIP_BBTSCAN;
> > +
> > +	/* Re-populate low-level callbacks based on xfer modes */
> > +	switch (info->xfer_type) {
> > +	case NAND_OMAP_PREFETCH_POLLED:
> > +		chip->read_buf = omap_read_buf_pref;
> > +		chip->write_buf = omap_write_buf_pref;
> > +		break;
> > +
> > +	case NAND_OMAP_POLLED:
> > +		/* Use nand_base defaults for {read,write}_buf */
> > +		break;
> > +
> > +	case NAND_OMAP_PREFETCH_DMA:
> > +		dma_cap_zero(mask);
> > +		dma_cap_set(DMA_SLAVE, mask);
> > +		info->dma = dma_request_chan(dev, "rxtx");
> > +

Can you try with

		info->dma = dma_request_chan(dev->parent, "rxtx");

?
