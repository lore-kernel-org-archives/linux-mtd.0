Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enmJT-0006ae-0v
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 14:21:09 +0000
Date: Mon, 19 Feb 2018 15:20:49 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Yogesh
 Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar
 <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180219152049.7d8c9748@bbrezillon>
In-Reply-To: <20180219135357.GE32761@sirena.org.uk>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
 <20180219135357.GE32761@sirena.org.uk>
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

Hi Mark,

On Mon, 19 Feb 2018 13:53:57 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Feb 06, 2018 at 12:21:15AM +0100, Boris Brezillon wrote:
> 
> > Some controllers are exposing high-level interfaces to access various
> > kind of SPI memories. Unfortunately they do not fit in the current
> > spi_controller model and usually have drivers placed in
> > drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> > memories in general.  
> 
> > This is an attempt at defining a SPI memory interface which works for
> > all kinds of SPI memories (NORs, NANDs, SRAMs).  
> 
> It would be helpful if this changelog were to describe what the
> problems are and how the patch addresses them.  Someone reading the git
> history should be able to tell what the patch is doing without having to
> google around to find a cover letter for the patch series.

Sure. I'll copy the explanation I give in my cover letter here.

> It also
> feels like this should be split up a bit - there's some preparatory
> refactoring here, a new API, and an adaption layer to implement that API
> with actual SPI controllers.  It's a very large patch doing several
> different things and splitting it up would make it easier to review.

Noted. I'll try to spit things up.

> 
> I have to say I'm rather unclear why this is being done in the SPI core
> rather than as a layer on top of it - devices doing the new API can't
> support normal SPI clients at all and everything about this is entirely
> flash specific.  You've got a bit about that in your cover letter, I'll
> reply there.

Then I'll reply there.

> 
> > @@ -2155,10 +2181,14 @@ int spi_register_controller(struct spi_controller *ctlr)
> >  			spi_controller_is_slave(ctlr) ? "slave" : "master",
> >  			dev_name(&ctlr->dev));
> >  
> > -	/* If we're using a queued driver, start the queue */
> > -	if (ctlr->transfer)
> > +	/*
> > +	 * If we're using a queued driver, start the queue. Note that we don't
> > +	 * need the queueing logic if the driver is only supporting high-level
> > +	 * memory operations.
> > +	 */
> > +	if (ctlr->transfer) {
> >  		dev_info(dev, "controller is unqueued, this is deprecated\n");
> > -	else {
> > +	} else if (ctlr->transfer_one || ctlr->transfer_one_message) {
> >  		status = spi_controller_initialize_queue(ctlr);
> >  		if (status) {
> >  			device_del(&ctlr->dev);  
> 
> This for example feels like a separate refactoring which could be split
> out.

Hm, this change is not really required without the spi_mem stuff. I
mean, the only cases we have right now are:

1/ the controller implements ->transfer() on its own
2/ the controller implements ctlr->transfer_one()
   or ctlr->transfer_one_message() and relies on the default
   queueing/dequeuing mechanism

The spi_mem stuff adds a 3rd case:

3/ the controller only supports memory-like operation and in this case
   we don't need to initialize the queue

which is why I added this else if() at the same time I added the
spi_mem stuff.

> 
> > +	if (op->data.dir == SPI_MEM_DATA_OUT)
> > +		dmadev = ctlr->dma_tx ?
> > +			 ctlr->dma_tx->device->dev : ctlr->dev.parent;
> > +	else
> > +		dmadev = ctlr->dma_rx ?
> > +			 ctlr->dma_rx->device->dev : ctlr->dev.parent;  
> 
> Please don't abuse the ternery operator like this :(

I'll try to remember that.

Thanks for your review.

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
