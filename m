Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbZmW-0002Ts-JP
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 15:00:56 +0000
Date: Tue, 28 Jun 2011 15:59:37 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [RFC PATCH] MTD: atmel_nand: optimize read/write buffer functions
Message-ID: <20110628145937.GG21898@n2100.arm.linux.org.uk>
References: <1309261856-27402-1-git-send-email-nicolas.ferre@atmel.com>
	<20110628111043.GH6588@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20110628111043.GH6588@pengutronix.de>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, hong.xu@atmel.com,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2011 at 01:10:43PM +0200, Uwe Kleine-König wrote:
> > @@ -265,33 +234,53 @@ err_buf:
> >  static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
> >  {
> >  	struct nand_chip *chip = mtd->priv;
> > -	struct atmel_nand_host *host = chip->priv;
> > +	u32 align;
> > +	u8 *pbuf;
> >  
> >  	if (use_dma && len > mtd->oobsize)
> >  		/* only use DMA for bigger than oob size: better performances */
> >  		if (atmel_nand_dma_op(mtd, buf, len, 1) == 0)
> >  			return;
> >  
> > -	if (host->board->bus_width_16)
> > -		atmel_read_buf16(mtd, buf, len);
> > -	else
> > -		atmel_read_buf8(mtd, buf, len);
> > +	/* if no DMA operation possible, use PIO */
> > +	pbuf = buf;
> > +	align = 0x03 & ((unsigned)pbuf);
> > +
> > +	if (align) {
> > +		u32 align_len = 4 - align;
> > +
> > +		/* non aligned buffer: re-align to next word boundary */
> > +		ioread8_rep(chip->IO_ADDR_R, pbuf, align_len);
> > +		pbuf += align_len;
> > +		len -= align_len;
> > +	}
> > +	memcpy((void *)pbuf, chip->IO_ADDR_R, len);
> I think you don't need to cast to (void *). I think you need to cast the
> 2nd parameter instead because sparse don't like you passing an void
> __iomem *.
> Is it correct to read from chip->IO_ADDR_R, don't you need
> chip->IO_ADDR_R + align_len? Taking this into account, does it really
> help to align pbuf?

I think you need to read Documentation/bus-virt-phys-mapping.txt,
particularly the part after "NOTE NOTE NOTE".

Dereferencing ioremap'd memory is not permitted.  That includes passing
it to memcpy.  Even with a cast.
