Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yp8kg-0001g9-Rc
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 05:17:11 +0000
Date: Mon, 4 May 2015 10:47:23 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/4] mtd: sh_flctl: drop unused variable
Message-ID: <20150504051723.GW3521@localhost>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
 <1430553430-21396-2-git-send-email-hofrat@osadl.org>
 <1477205.SvYxjlTIEF@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477205.SvYxjlTIEF@avalon>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@the-dreams.de>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 03, 2015 at 10:33:43PM +0300, Laurent Pinchart wrote:
> Hi Nicholas,
> 
> Thank you for the patch.
> 
> On Saturday 02 May 2015 09:57:08 Nicholas Mc Guire wrote:
> > shdma_tx_submit() called via dmaengine_submit() returns the assigned
> > cookie but this is not used here so the variable and assignment can
> > be dropped.
> > 
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> 
> I would rephrase the commit message to avoid mentioning shdma_tx_submit() as 
> that's not relevant. Something like "dmaengine_submit() returns the assigned
> cookie but this is not used here so the variable and assignment can be 
> dropped."
And I am bit surrised about taht. Ideally the driver should use the cookie
to check the status later on...

-- 
~Vinod
> 
> With that fixed,
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> > 
> > V2: As pointed out by Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >     the variable and assignment can be dropped but not the call to
> >     dmaengine_submit(desc) - fixed up
> > 
> > Patch was compile tested with ap325rxa_defconfig (implies
> > CONFIG_MTD_NAND_SH_FLCTL=y)
> > 
> > Patch is against 4.1-rc1 (localversion-next is -next-20150501)
> > 
> >  drivers/mtd/nand/sh_flctl.c |    3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> > index 9b032dd..d1c46e5 100644
> > --- a/drivers/mtd/nand/sh_flctl.c
> > +++ b/drivers/mtd/nand/sh_flctl.c
> > @@ -351,7 +351,6 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> > *flctl, unsigned long *buf, struct dma_chan *chan;
> >  	enum dma_transfer_direction tr_dir;
> >  	dma_addr_t dma_addr;
> > -	dma_cookie_t cookie = -EINVAL;
> >  	uint32_t reg;
> >  	int ret = 0;
> >  	unsigned long time_left;
> > @@ -377,7 +376,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl
> > *flctl, unsigned long *buf,
> > 
> >  		desc->callback = flctl_dma_complete;
> >  		desc->callback_param = flctl;
> > -		cookie = dmaengine_submit(desc);
> > +		dmaengine_submit(desc);
> > 
> >  		dma_async_issue_pending(chan);
> >  	} else {
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
