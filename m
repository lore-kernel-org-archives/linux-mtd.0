Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OHvu1-00049Q-46
	for linux-mtd@lists.infradead.org; Fri, 28 May 2010 09:30:54 +0000
Date: Fri, 28 May 2010 11:27:44 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Fix Oops with Atmel SPI
Message-ID: <20100528112744.579dc556@hskinnemoen-d830>
In-Reply-To: <20100521120106.d955c78b.akpm@linux-foundation.org>
References: <1271231840l.5270l.0l@i-dmzi_al.realan.de>
	<20100421152410.0fea5e12.akpm@linux-foundation.org>
	<1274267100l.1747l.1l@i-dmzi_al.realan.de>
	<20100521120106.d955c78b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Ian McDonnell <ian@brightstareng.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Nicolas Pitre <nico@fluxnic.net>, Anders Larsen <al@alarsen.net>,
	linux-kernel@vger.kernel.org, Iwo Mergler <iwo@call-direct.com.au>,
	linux-mtd@lists.infradead.org, Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Morton <akpm@linux-foundation.org> wrote:
> On Wed, 19 May 2010 13:05:00 +0200
> Anders Larsen <al@alarsen.net> wrote:
> 
> > On 2010-04-22 00:24:10, Andrew Morton wrote:
> > > Finally..  Wouldn't it be better to just fix the atmel SPI driver so
> > > that it doesn't barf when handed vmalloc'ed memory?  Who do we ridicule
> > > about that?  <checks, adds cc>
> > 
> > You mean something like this instead?
> 
> That looks simple enough.  How do we get it tested, changelogged and
> merged up?  Haavard, can you please take a look?

Sure. Sorry for the late response; I've been traveling for the last two
weeks.

Did anyone check what other drivers do to handle this case? Surely this
isn't the only driver which supports DMA?

> > diff --git a/drivers/spi/atmel_spi.c b/drivers/spi/atmel_spi.c
> > index c4e0442..a9ad5e8 100644
> > --- a/drivers/spi/atmel_spi.c
> > +++ b/drivers/spi/atmel_spi.c
> > @@ -352,16 +352,30 @@ atmel_spi_dma_map_xfer(struct atmel_spi *as, struct spi_transfer *xfer)
> >  
> >  	xfer->tx_dma = xfer->rx_dma = INVALID_DMA_ADDRESS;
> >  	if (xfer->tx_buf) {
> > -		xfer->tx_dma = dma_map_single(dev,
> > -				(void *) xfer->tx_buf, xfer->len,
> > -				DMA_TO_DEVICE);
> > +		if (is_vmalloc_addr(xfer->tx_buf))
> > +			xfer->tx_dma = dma_map_page(dev,
> > +					vmalloc_to_page(xfer->tx_buf),
> > +					(unsigned long)xfer->tx_buf & (PAGE_SIZE-1),
> > +					xfer->len,
> > +					DMA_TO_DEVICE);

Ok, this should be fine for small transfers, but what happens if the
transfer crosses a page boundary? Are there any guarantees that this
will never happen? What callers are passing vmalloc'ed memory in the
first place?

Ditto for the rx path.

Haavard
