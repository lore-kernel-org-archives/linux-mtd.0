From: phil@river-bank.demon.co.uk (Phil Thompson)
Date: Tue, 18 Feb 2003 15:17:04 +0000
Subject: NAND ECC and OOB usage
In-Reply-To: <200302181619.56976.tglx@linutronix.de>
References: <200302181409.25070.tglx@linutronix.de> <200302181321.03287.phil@river-bank.demon.co.uk> <200302181619.56976.tglx@linutronix.de>
Message-ID: <200302181517.04451.phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 18 February 2003 3:19 pm, Thomas Gleixner wrote:
> On Tuesday 18 February 2003 14:21, Phil Thompson wrote:
> > On Tuesday 18 February 2003 1:09 pm, Thomas Gleixner wrote:
> > > I have changed the oob-selection for NAND as follows:
> > >
> > > 1. A default oob selector is added to the mtd structure. It can be
> > > initialized on compile time or modified on runtime. For partitioned
> > > devices a default selector is included in the partition description
> > > structure. This can be set on compile time (see autcpu12.c) or on
> > > runtime.
> >
> > This means we really need to be able to specify the selector on the
> > command line as part of mtdparts as well.
>
> You don't need that, as the filesystem forces layout selection itself.

So why hardcode it in autcpu12.c? If it's useful to be able to hardcode the 
selector then it must also be useful to parameterise it in mtdparts.

But maybe it isn't useful to hardcode it either.

As I understand it, the only point of including the selector in struct 
mtd_info is to provide an appropriate default when using user space tools 
that aren't aware of OOB data and ECC. In other words so that you can do...

dd if=jffs2_image of=/dev/mtd1

...and have the OOB data initialised properly. However, because you have to 
deal with potential bad blocks, you shouldn't be using user space tools that 
aren't aware of OOB data. You should be using something like your enhanced 
nandwrite which is going to use the MEMSETOOBSEL ioctl to explicitly set the 
selector correctly anyway.

In other words, I can't see the point in having the selector in struct 
mtd_partition at all.

Phil
