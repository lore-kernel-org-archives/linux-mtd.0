Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCP5E-0005qK-SB
	for linux-mtd@lists.infradead.org; Sat, 28 Jun 2008 01:18:33 +0000
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_f4tA//VPE0/Lw42GZpyK9A)"
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0K3500JDQFMV1860@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 21:18:31 -0400 (EDT)
Date: Fri, 27 Jun 2008 21:18:31 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH] [MTD] orion_nand: add chip_delay parameter
In-reply-to: <20080627072354.GA30174@logfs.org>
Message-id: <alpine.LFD.1.10.0806272113270.19095@xanadu.home>
References: <alpine.LFD.1.10.0806230952530.2979@xanadu.home>
	<alpine.LFD.1.10.0806261319340.2979@xanadu.home>
	<20080627072354.GA30174@logfs.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_f4tA//VPE0/Lw42GZpyK9A)
Content-type: TEXT/PLAIN; charset=utf-8
Content-transfer-encoding: 8BIT

On Fri, 27 Jun 2008, Jörn Engel wrote:

> On Thu, 26 June 2008 13:24:14 -0400, Nicolas Pitre wrote:
> > 
> > I posted this patch on Monday for inclusion in 2.6.27.  However we have 
> > additional patches meant to be pushed through the ARM tree that depend 
> > on this one.  So to simplify dependency issues, I would like for this 
> > patch to be acked and then we'll simply push it along with the others 
> > through the ARM path.
> > 
> > Any objections??
> 
> While I don't really understand what this patch does, it seems harmless
> enough and I generally trust your judgement.  Good enough for me.

OK thanks.

> > > diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> > > index 59e05a1..ee2ac39 100644
> > > --- a/drivers/mtd/nand/orion_nand.c
> > > +++ b/drivers/mtd/nand/orion_nand.c
> > > @@ -85,6 +85,9 @@ static int __init orion_nand_probe(struct platform_device *pdev)
> > >  	nc->cmd_ctrl = orion_nand_cmd_ctrl;
> > >  	nc->ecc.mode = NAND_ECC_SOFT;
> > >  
> > > +	if (board->chip_delay)
> > > +		nc->chip_delay = board->chip_delay;
> > > +
> 
> What I'm wondering about is whether the assignment should be made
> unconditional.  After all, if board->chip_delay is zero, the assignment
> should simply write zero to a variable that already is zero.  Or if it
> isn't, the driver is missing a memset() somewhere.

There is the case that a default could be set by the driver and having 
board->chip_delay == 0 should mean the driver default is fine.


Nicolas

--Boundary_(ID_f4tA//VPE0/Lw42GZpyK9A)--
