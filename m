Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3G4j-0001JQ-6Y
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 11:06:21 -0500
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR010.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IC9003B0RCOAT@VL-MO-MR010.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 11:05:12 -0500 (EST)
Date: Mon, 21 Feb 2005 11:05:09 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <421998DA.1060503@imc-berlin.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-id: <Pine.LNX.4.61.0502211059090.15845@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <421998DA.1060503@imc-berlin.de>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: ioremap_cached in drivers/mtd/maps ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 Feb 2005, Steven Scholz wrote:

> Hi there,
> 
> it looks like only lubbock-flash.c is using ioremap_cached().

sa1100-flash could be using it as well.

> Can I use ioremap_cached() with normal NOR flashes?

Yes.

> Is it only for DMA transfer from/to flash?

>From flash only.

> Does it improve something when using JFFS2?

Much improved read throughput.

> What do I have to consider? .inval_cache function?

Yep.


Nicolas
