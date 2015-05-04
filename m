Received: from smtprelay0182.hostedemail.com ([216.40.44.182]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpARb-0004rn-7T
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 07:05:35 +0000
Message-ID: <1430723109.2818.1.camel@perches.com>
Subject: Re: [PATCH 4/4] mtd: sh_flctl: fix wrapped condition alignment
From: Joe Perches <joe@perches.com>
To: Vinod Koul <vinod.koul@intel.com>
Date: Mon, 04 May 2015 00:05:09 -0700
In-Reply-To: <20150504052138.GX3521@localhost>
References: <1430553430-21396-1-git-send-email-hofrat@osadl.org>
 <1430553430-21396-4-git-send-email-hofrat@osadl.org>
 <20150504052138.GX3521@localhost>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>,
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

On Mon, 2015-05-04 at 10:51 +0530, Vinod Koul wrote:
> On Sat, May 02, 2015 at 09:57:10AM +0200, Nicholas Mc Guire wrote:
> > CodingStyle fix only - align function parameters to opening (.
> > 
> This doesnt look any better to me...

The goto and return statements were overly indented

> > diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
[]
> > @@ -428,8 +428,8 @@ static void read_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
> >  
> >  	/* initiate DMA transfer */
> >  	if (flctl->chan_fifo0_rx && rlen >= 32 &&
> > -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) == 0)
> > -			goto convert;	/* DMA success */
> > +	    flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) == 0)
> > +		goto convert;	/* DMA success */
> >  
> >  	/* do polling transfer */
> >  	for (i = 0; i < len_4align; i++) {
> > @@ -487,8 +487,8 @@ static void write_ec_fiforeg(struct sh_flctl *flctl, int rlen,
> >  
> >  	/* initiate DMA transfer */
> >  	if (flctl->chan_fifo0_tx && rlen >= 32 &&
> > -		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) == 0)
> > -			return;	/* DMA success */
> > +	    flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) == 0)
> > +		return;	/* DMA success */
