Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D174d-00052p-9V
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 13:05:23 -0500
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR010.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IBY00M67SUWR4@VL-MO-MR010.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 13:04:08 -0500 (EST)
Date: Tue, 15 Feb 2005 13:04:05 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <1108488989.19262.623.camel@hades.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <Pine.LNX.4.61.0502151239250.27338@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20050215154819.GB831@synertronixx3>
	<Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
	<1108488989.19262.623.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 Feb 2005, David Woodhouse wrote:

> On Tue, 2005-02-15 at 11:38 -0500, Nicolas Pitre wrote:
> > Please study carefully xip_udelay() and try to understand _when_ it is 
> > OK to call other functions and when it is not.  This function is really 
> > where all the magic is happening.
> 
> Out of interest, how do we guarantee that there won't be speculative
> prefetching of icache? If you're relying on hardware-specific knowledge
> that it doesn't happen, please document that so that it doesn't bite
> people implementing the XIP primitives on other platforms.

See xip_enable().  You'll find:

	(void) map_read(map, adr);
	asm volatile (".rep 8; nop; .endr"); /* fill instruction prefetch */

Hopefully that should be suficient to avoid this problem.


Nicolas
