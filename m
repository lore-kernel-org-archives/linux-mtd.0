Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D39uT-0006yb-9u
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 04:31:22 -0500
Date: Mon, 21 Feb 2005 09:31:00 +0000
From: Ben Dooks <ben@fluff.org.uk>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20050221093100.GF28744@home.fluff.org>
References: <421998DA.1060503@imc-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <421998DA.1060503@imc-berlin.de>
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

On Mon, Feb 21, 2005 at 09:16:26AM +0100, Steven Scholz wrote:
> Hi there,
> 
> it looks like only lubbock-flash.c is using ioremap_cached().
> 
> Can I use ioremap_cached() with normal NOR flashes?
> Is it only for DMA transfer from/to flash?

you could use it for such, but it also allows an cached
area for flash read, which makes it faster to execute
code from.

> Does it improve something when using JFFS2?
> What do I have to consider? .inval_cache function?

It allows the mapping driver to have a seperate read-only
cached area, the .inval_cache function is needed to flush
this area when writes happen to the un-cached area.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
