Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBdDA-0001Wf-96
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 09:29:09 +0000
Date: Thu, 26 Apr 2018 11:28:55 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v3 7/9] spi: ti-qspi: Implement the spi_mem interface
Message-ID: <20180426112855.46e0f3c0@bbrezillon>
In-Reply-To: <b13e1147-c168-1163-436d-5c3fadf70191@ti.com>
References: <20180422183522.11118-1-boris.brezillon@bootlin.com>
 <20180422183522.11118-8-boris.brezillon@bootlin.com>
 <b13e1147-c168-1163-436d-5c3fadf70191@ti.com>
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

On Thu, 26 Apr 2018 14:40:41 +0530
Vignesh R <vigneshr@ti.com> wrote:

> > +static int ti_qspi_exec_mem_op(struct spi_mem *mem,
> > +			       const struct spi_mem_op *op)
> > +{
> > +	struct ti_qspi *qspi = spi_master_get_devdata(mem->spi->master);
> > +	u32 from = 0;
> > +	int ret = 0;
> > +
> > +	/* Only optimize read path. */
> > +	if (!op->data.nbytes || op->data.dir != SPI_MEM_DATA_IN ||
> > +	    !op->addr.nbytes || op->addr.nbytes > 4)
> > +		return -ENOTSUPP;
> > +
> > +	/* Address exceeds MMIO window size, fall back to regular mode. */
> > +	from = op->addr.val;
> > +	if (from + op->data.nbytes > qspi->mmap_size)
> > +		return -ENOTSUPP;
> > +  
> 
> qspi->mmap_size turns out to be 0 if qspi->rx_chan is not NULL
> (in other words when DMA is used)
> Could you squash below diff into this patch?

Will do.

Thanks,

Boris
