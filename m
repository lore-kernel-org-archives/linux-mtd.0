Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SG9gx-0007jB-Mc
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2012 13:59:08 +0000
Received: by iaky10 with SMTP id y10so3897434iak.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Apr 2012 06:59:06 -0700 (PDT)
Date: Fri, 6 Apr 2012 21:59:31 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Sam Gandhi <samgandhi9@gmail.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
Message-ID: <20120406135929.GR7264@S2101-09.ap.freescale.net>
References: <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
 <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
 <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
 <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
 <1333628861.31825.22.camel@vkoul-udesk3>
 <20120406022305.GJ7264@S2101-09.ap.freescale.net>
 <4F7EC6AF.6000603@freescale.com>
 <CAOdLEaoD2sezmXbOoBdZ4h4E+A2rqf-2K9P-Y6aUt+zeASZQrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOdLEaoD2sezmXbOoBdZ4h4E+A2rqf-2K9P-Y6aUt+zeASZQrw@mail.gmail.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Wolfram Sang <w.sang@pengutronix.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 06, 2012 at 06:49:05AM -0700, Sam Gandhi wrote:
> >
> >
> > It's maybe too late to assign the DMA cookie after mxs_dma_enable_chan() in
> > mxs_dma_tx_submit().
> > The interrupt may arise before the dma_cookie_assign() finishes.
> >
> > Why mmc/audio do not have this bug? their interrupt arise too slow.
> >
> > I tested the following code :
> > ==============================================================
> >
> > diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> > index 5978113..0f5b09a 100644
> > --- a/drivers/dma/mxs-dma.c
> > +++ b/drivers/dma/mxs-dma.c
> > @@ -202,10 +202,12 @@ static struct mxs_dma_chan *to_mxs_dma_chan(struct
> > dma_cha
> > static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
> > {
> > struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(tx->chan);
> > + dma_cookie_t c;
> >
> > + c = dma_cookie_assign(tx);
> > mxs_dma_enable_chan(mxs_chan);
> >
> > - return dma_cookie_assign(tx);
> > + return c;
> > }
> >
> If this is the issue, then why not have mxs_dma_enable_chan itself
> call dma_cookie_assign() and return that cookie.
> 
As the function name tells, mxs_dma_enable_chan is to only operate dma
hardware to enable the channel but nothing else.

> That way mxs_dma_enable_chan() is self contained function that assign
> the cookie, enables channel and returns assigned cookie. And nobody
> will make mistake of calling just mxs_dma_enable_chan without first
> calling dma_cookie_assign?
> 
mxs_dma_enable_chan() is a mxs-dma private call.  Nobody but only
mxs-dma driver itself can call it.

-- 
Regards,
Shawn
