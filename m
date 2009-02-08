Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LW7Kv-0002uH-4n
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 10:56:31 +0000
Date: Sun, 8 Feb 2009 10:56:28 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] [MTD] NAND: add ts7xxx driver
Message-ID: <20090208105628.GG11872@woodchuck>
References: <20090208085919.GD11872@woodchuck>
	<20090208102147.GL13433@xi.wantstofly.org>
	<20090208103904.GE11872@woodchuck>
	<20090208105226.GF11872@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090208105226.GF11872@woodchuck>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Alexander Clouter <alex@digriz.org.uk> [2009-02-08 10:52:26+0000]:
> 
> * Alexander Clouter <alex@digriz.org.uk> [2009-02-08 10:39:04+0000]:
> > 
> > * Lennert Buytenhek <buytenh@wantstofly.org> [2009-02-08 11:21:47+0100]:
> > > 
> > > On Sun, Feb 08, 2009 at 08:59:19AM +0000, Alexander Clouter wrote:
> > > >
> > > > This patch adds support for the NAND found in Technologic Systems ARM
> > > > boards[1].  The platform specific parts (IO address and parititoning
> > > > schemes) have been moved into platform specific files whilst the driver
> > > > it's self can be used as a complete replacement for the ts7250 NAND
> > > > driver.
> > > 
> > > Why don't you morph the ts7250 into the form you want instead of adding
> > > a parallel driver for the same thing?
> > >
> > 
> > [snipped rant]
> > 
> > The driver I threw together makes a rather radical change to put all the 
> > partitioning and iomem resources ranges back into the platform specific 
> > code where they belong.  It was just easier to start clean, plus I 
> > learnt a good deal about the MTD subsystem in the process, although 
> > that's not a good reason for submission I know.
> > 
> Attached is the kind of change that affects the platform code.  
> Meanwhile if I was to morph the ts7250 driver my first step would be to 
> trim a huge chunk of the platform specific code that's in the NAND 
> driver and then at the same time get the ARM platform driver amended 
> otherwise you end up with a NAND less board.
> 
Unsure if it even attached so incase it did not:

http://stuff.digriz.org.uk/ts7xxx-nand/0002--ARM-ep93xx-add-hooks-to-ts7xxx-NAND-driver.patch

Cheers
