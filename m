Received: from modemcable096.213-200-24.mc.videotron.ca ([24.200.213.96]
	helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwNMg-0001VN-5Y
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 11:28:27 -0500
Date: Wed, 2 Feb 2005 11:28:17 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050202160838.GB28574@synertronixx3>
Message-ID: <Pine.LNX.4.61.0502021122100.26049@localhost.localdomain>
References: <20050202134730.GA16215@synertronixx3>
	<Pine.LNX.4.61.0502021029000.26049@localhost.localdomain>
	<20050202160838.GB28574@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: HowTo cache additional address space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Feb 2005, Konstantin Kletschke wrote:

> Am 2005-02-02 10:30 -0500 schrieb Nicolas Pitre:
> 
> > For MTD you need to add support for that in your map driver.  See the 
> > Lubbock map driver for example.
> 
> Is maps/xxx.c the only file which has to be adapted? Ok, I found lubbok
> myself and the ioremap.cached stuff in there...
> 
> I am curious if only the (succesful)
> 
> scb9328_map.cached = (unsigned long)__ioremap(scb9328_map.phys,
> SCB9328_FLASH_SIZE, 0, 0);
> or 
> scb9328_map.cached = ioremap_cached(scb9328_map.phys,
> SCB9328_FLASH_SIZE)
> 
> does the trick...

The __ioremap(..., 0, 0) is uncached.  You need to use the later.

But no, that's not enough.  You also need to provide an inval_cache 
method.


Nicolas
