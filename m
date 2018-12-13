Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXVrm-0006DS-LL
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 18:37:48 +0000
Date: Thu, 13 Dec 2018 19:37:25 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Lucas
 Stach <dev@lynxeye.de>, Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu
 <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org
Subject: Re: [v5,04/17] mtd: rawnand: omap2: convert driver to nand_scan()
Message-ID: <20181213193725.4c1771c5@bbrezillon>
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
> > +		if (IS_ERR(info->dma)) {
> > +			dev_err(dev, "DMA engine request failed\n");

Can you print the error code here?
