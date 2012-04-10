Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHaLe-0005W7-0C
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2012 12:39:02 +0000
Received: by iaky10 with SMTP id y10so9085532iak.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2012 05:39:00 -0700 (PDT)
Date: Tue, 10 Apr 2012 20:39:58 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
Message-ID: <20120410123952.GA419@S2101-09.ap.freescale.net>
References: <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
 <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
 <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
 <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
 <1333628861.31825.22.camel@vkoul-udesk3>
 <20120406022305.GJ7264@S2101-09.ap.freescale.net>
 <4F7EC6AF.6000603@freescale.com>
 <20120410094223.GN24211@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120410094223.GN24211@n2100.arm.linux.org.uk>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, Fabio Estevam <festevam@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 Sam Gandhi <samgandhi9@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 10, 2012 at 10:42:23AM +0100, Russell King - ARM Linux wrote:
> On Fri, Apr 06, 2012 at 06:34:23PM +0800, Huang Shijie wrote:
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
> 
> Hang on, why are you enabling a channel (and presumably allowing this
> transaction to be issued) before dma_async_issue_pending() has been
> called for the channel?

When mxs-dma driver was created, we chose to only support a single
descriptor at the beginning, and mxs_dma_issue_pending() is an empty
function right now .  This is something needs to be improved, but it
should be orthogonal to the bug fix posted here.

-- 
Regards,
Shawn
