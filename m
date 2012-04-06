Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFypF-0003yU-MC
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2012 02:22:58 +0000
Received: by iaky10 with SMTP id y10so3193481iak.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2012 19:22:54 -0700 (PDT)
Date: Fri, 6 Apr 2012 10:23:08 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
Message-ID: <20120406022305.GJ7264@S2101-09.ap.freescale.net>
References: <20120404070157.GB24930@pengutronix.de>
 <CAOdLEaqXyvHzTRSq2=RquZLqEO6kMEp11rjKJ+UtSqtF4nr-EA@mail.gmail.com>
 <20120404183314.GF17187@pengutronix.de>
 <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
 <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
 <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
 <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
 <1333628861.31825.22.camel@vkoul-udesk3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333628861.31825.22.camel@vkoul-udesk3>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Fabio Estevam <festevam@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@freescale.com>, Sam Gandhi <samgandhi9@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 05, 2012 at 05:57:41PM +0530, Vinod Koul wrote:
> On Thu, 2012-04-05 at 05:03 -0700, Sam Gandhi wrote:
> > 2012/4/4 Huang Shijie <b32955@freescale.com>:
...
> > >>> flash_erase /dev/mtd1 0 0
> > >>> Erasing 1------------[ cut here ]------------
> > >>> kernel BUG at /home/sam/linux/drivers/dma/dmaengine.h:53!
> > > the mxs-dma has added some patches about the cookie.
> > > The bug is in the dmaengine.h.
> > >
> > > So let more people know this bug.
> > >

I'm still trying to understand why I did run into the BUG_ON when I
test it with mxs mmc and sound drivers.

...

> This means you are trying to mark a cookie complete when it is already
> marked so!, hence dmaengine screams.
> The bug is is mxs-dma.
> Let me know if below fixes it (assuming you are not using cyclic API,
> that would need fixup as well)
> 
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index c81ef7e..5ddd84e 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -399,6 +399,10 @@ static struct dma_async_tx_descriptor
> *mxs_dma_prep_slave_sg(
>  		ccw->bits &= ~CCW_DEC_SEM;
>  	} else {
>  		idx = 0;
> +		/* assign cookie here,
> +		 * hopefully for above case we dont need it
> +		 */
> +		dma_cookie_assign(&mxs_chan->desc);

Isn't it done in mxs_dma_tx_submit() already? The gpmi driver somehow
misses the call to dmaengine_submit() for some case?

Regards,
Shawn

>  	}
>  
>  	if (direction == DMA_TRANS_NONE) {
> 
> -- 
