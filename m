Received: from ec2-54-201-57-178.us-west-2.compute.amazonaws.com
 ([54.201.57.178] helo=ip-172-31-12-36.us-west-2.compute.internal)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgxuK-0007pD-1c
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 15:33:04 +0000
Date: Wed, 22 Oct 2014 15:32:02 +0000
From: dwalker@fifo99.com
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: slram on mapped ram areas
Message-ID: <20141022153202.GA5114@fifo99.com>
References: <20141009161707.GA18921@fifo99.com>
 <CAN8TOE8scDnP74KJHmQcq2sznPmxkfDru7sFE+ByrJ8tKHt9mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8TOE8scDnP74KJHmQcq2sznPmxkfDru7sFE+ByrJ8tKHt9mg@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 20, 2014 at 05:05:56PM -0700, Brian Norris wrote:
> On Thu, Oct 9, 2014 at 9:17 AM,  <dwalker@fifo99.com> wrote:
> > Hi,
> >
> > It seems that slram was made for access parts of memory not used by the system,
> > or not mapped (right terminology?). I wanted to use it on memory which is mapped
> > or memory that can be used by the system. The problem I have is that the system I
> > work on places a filesystem image in memory someplace, and send the physical address
> > and size of the area as boot parameters. The memory where the images ends up is not
> > special memory.
> 
> I honestly don't know much about the slram.c driver. I doubt it has
> many serious users these days.

Seems that way since both people I emailed have dead addresses.
 
> It also seems like you're really trying to use this driver in a way it
> was not designed. Do you really need to access specific kernel memory?
> Or do you just want a RAM-backed MTD? There are other drivers for this
> already (mtdram?).

It's not very different from how it's currently used. The only difference is the memory I want to use
could be used by the kernel at the time I want to use it.

I need to access a specific memory area, no random area will do. I looked at drivers/block/brd.c for example
it doesn't allow a specific area to be used.

> > I made the following changes to your driver (somewhat condensed),
> >
> > 1) Added memblock_reserve() on the memory region
> > 2) Added an insert_resource() call to the memory
> > 3) Altered the driver to not use ioremap, instead use __va() conditionally.
> 
> I see this comment next to the __va() definition for ARM:
> 
> /*
>  * Drivers should NOT use these either.
>  */

That's interesting, there must be an alternative.. I just need a way to convert the address from
physical to virtual.

Daniel
