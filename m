From: phil@river-bank.demon.co.uk (Phil Thompson)
Date: Tue, 18 Feb 2003 15:53:41 +0000
Subject: NAND ECC and OOB usage
In-Reply-To: <200302181745.16506.tglx@linutronix.de>
References: <200302181409.25070.tglx@linutronix.de> <200302181517.04451.phil@river-bank.demon.co.uk> <200302181745.16506.tglx@linutronix.de>
Message-ID: <200302181553.41412.phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 18 February 2003 4:45 pm, Thomas Gleixner wrote:
> On Tuesday 18 February 2003 16:17, Phil Thompson wrote:
> > > You don't need that, as the filesystem forces layout selection itself.
> >
> > So why hardcode it in autcpu12.c? If it's useful to be able to hardcode
> > the selector then it must also be useful to parameterise it in mtdparts.
> >
> > But maybe it isn't useful to hardcode it either.
> >
> > As I understand it, the only point of including the selector in struct
> > mtd_info is to provide an appropriate default when using user space tools
> > that aren't aware of OOB data and ECC. In other words so that you can
> > do... dd if=jffs2_image of=/dev/mtd1
>
> You can use write and read from userspace, e.g. to burn an image on the
> partition. You still have to deal with bad blocks, but you can use non NAND
> specific functions for read and write.

Understood.

> > ...and have the OOB data initialised properly. However, because you have
> > to deal with potential bad blocks, you shouldn't be using user space
> > tools that aren't aware of OOB data. You should be using something like
> > your enhanced nandwrite which is going to use the MEMSETOOBSEL ioctl to
> > explicitly set the selector correctly anyway.
> > In other words, I can't see the point in having the selector in struct
> > mtd_partition at all.
>
> 1. It's the only way to set the dfault for a partition

In which case my original point is valid - you should also be able to set the 
default through mtdparts.

Phil
