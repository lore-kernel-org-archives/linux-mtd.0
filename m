Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KC8JT-0004wB-HN
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 07:24:07 +0000
Date: Fri, 27 Jun 2008 09:23:54 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] [MTD] orion_nand: add chip_delay parameter
Message-ID: <20080627072354.GA30174@logfs.org>
References: <alpine.LFD.1.10.0806230952530.2979@xanadu.home>
	<alpine.LFD.1.10.0806261319340.2979@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0806261319340.2979@xanadu.home>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 26 June 2008 13:24:14 -0400, Nicolas Pitre wrote:
> 
> I posted this patch on Monday for inclusion in 2.6.27.  However we have 
> additional patches meant to be pushed through the ARM tree that depend 
> on this one.  So to simplify dependency issues, I would like for this 
> patch to be acked and then we'll simply push it along with the others 
> through the ARM path.
> 
> Any objections??

While I don't really understand what this patch does, it seems harmless
enough and I generally trust your judgement.  Good enough for me.

> > diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> > index 59e05a1..ee2ac39 100644
> > --- a/drivers/mtd/nand/orion_nand.c
> > +++ b/drivers/mtd/nand/orion_nand.c
> > @@ -85,6 +85,9 @@ static int __init orion_nand_probe(struct platform_device *pdev)
> >  	nc->cmd_ctrl = orion_nand_cmd_ctrl;
> >  	nc->ecc.mode = NAND_ECC_SOFT;
> >  
> > +	if (board->chip_delay)
> > +		nc->chip_delay = board->chip_delay;
> > +

What I'm wondering about is whether the assignment should be made
unconditional.  After all, if board->chip_delay is zero, the assignment
should simply write zero to a variable that already is zero.  Or if it
isn't, the driver is missing a memset() somewhere.

Jörn

-- 
There is no worse hell than that provided by the regrets
for wasted opportunities.
-- Andre-Louis Moreau in Scarabouche
