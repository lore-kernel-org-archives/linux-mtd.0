Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNemo-0002B2-TJ
 for linux-mtd@lists.infradead.org; Tue, 29 May 2018 13:35:41 +0000
Date: Tue, 29 May 2018 15:35:19 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Peter Pan <peterpansjtu@gmail.com>, Vignesh R
 <vigneshr@ti.com>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>, Peter Pan
 <peterpandong@micron.com>
Subject: Re: [PATCH v7 2/5] mtd: nand: Add core infrastructure to support
 SPI NANDs
Message-ID: <20180529153519.393741f8@bbrezillon>
In-Reply-To: <31e7dfaf-a083-e750-feb0-34f5ae930eb3@exceet.de>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
 <20180515150825.19835-3-boris.brezillon@bootlin.com>
 <31e7dfaf-a083-e750-feb0-34f5ae930eb3@exceet.de>
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

On Tue, 29 May 2018 12:57:33 +0200
Frieder Schrempf <frieder.schrempf@exceet.de> wrote:

> > +static int spinand_init(struct spinand_device *spinand)
> > +{
> > +	struct device *dev = &spinand->spimem->spi->dev;
> > +	struct mtd_info *mtd = spinand_to_mtd(spinand);
> > +	struct nand_device *nand = mtd_to_nanddev(mtd);
> > +	int ret, i;
> > +
> > +	/*
> > +	 * We need a scratch buffer because the spi_mem interface requires that
> > +	 * buf passed in spi_mem_op->data.buf be DMA-able.
> > +	 */
> > +	spinand->scratchbuf = kzalloc(SPINAND_MAX_ID_LEN, GFP_KERNEL);
> > +	if (!spinand->scratchbuf)
> > +		return -ENOMEM;
> > +
> > +	ret = spinand_detect(spinand);
> > +	if (ret)
> > +		goto err_free_bufs;
> > +
> > +	/*
> > +	 * Use kzalloc() instead of devm_kzalloc() here, because some drivers
> > +	 * may use this buffer for DMA access.
> > +	 * Memory allocated by devm_ does not guarantee DMA-safe alignment.
> > +	 */
> > +	spinand->databuf = kzalloc(nanddev_page_size(nand) +
> > +			       nanddev_per_page_oobsize(nand),
> > +			       GFP_KERNEL);
> > +	if (!spinand->databuf)
> > +		goto err_free_bufs;
> > +
> > +	spinand->oobbuf = spinand->databuf + nanddev_page_size(nand);
> > +
> > +	ret = spinand_init_cfg_cache(spinand);  
> 
> If the SPINAND_HAS_QE_BIT bit is set, then spinand_init_quad_enable() 
> will try to use the config cache, but it hasn't been initialized at that 
> time.

Oops, you're right. I wonder how I could miss that one when testing it.
I guess you get a NULL pointer exception, right?

> 
> So spinand_init_cfg_cache() should probably be called earlier, before 
> spinand_detect().

I'd prefer to move the spinand_init_quad_enable() just after the
spinand_init_cfg_cache() one. Calling spinand_init_cfg_cache() does not
work because we don't know how many dies we have and the cfg cache has
one entry per die.
