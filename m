Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15a22y-0001wg-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 22:29:52 +0100
Message-Id: <5.1.0.14.0.20010823163143.00b03a08@mail.spewey.com>
Date: Thu, 23 Aug 2001 16:36:04 -0500
To: Luke <luke_epsilon@yahoo.com>,linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: ZFMicro MachZ modification of physmap.c
In-Reply-To: <20010823194128.72225.qmail@web13602.mail.yahoo.com>
References: <5.1.0.14.0.20010823095635.00b00ca0@mail.spewey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

At 12:41 PM 8/23/2001 -0700, Luke wrote:
>Hello,
>
>--- Vipin Malik <vipin@embeddedlinuxworks.com> wrote:
> >
> > Normally, one map's the entire flash as far as the chip select's are
> > concerned, and set's the start/length logically in the map driver (in your
> > case physmap.c).
> > Of course you don't want to start/stop in the middle of a sector. Only on
> > sector boundaries please :)
> >
>
>It seems that the standard physmap.c just takes the 3 CONFIG_* inputs of 
>start (of the physical
>memory address to look for the flash),length, and bus width.  To change 
>the offset of the flash to
>access do you modify the return from ioremap() ?

no, you don't mess with the return value from ioremap. That's what the 
kernel is telling you it's mapped your requested physical memory to 
(logical memory).


>For example, if I have an 8 Mbyte flash chip that I want to access with 
>MTD and I only want to map
>from byte offset 0x300000 to 0x700000 of the flash I should set my 
>CONFIG_MTD_PHYSMAP_LEN to 4
>Mbytes and inside the physmap.c code add an offset of 0x300000 to something?

I really haven't mapped partial chips myself, so you'll have to play around 
with what I am suggesting (unless some one else that has done this chimes in :)

I would look at the partition code (that partition's the flash in multiple 
mtd devices). Essentially you need to do the same. At the very least, you 
should be able to define a partition for the section that you don't want to 
use and not mount anything on that.

There's plenty of examples in some of the other physical map drivers that 
have examples of multiple mtd partitions on the same flash chip.

Vipin
