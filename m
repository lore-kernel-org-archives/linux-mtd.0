From: phil@river-bank.demon.co.uk (Phil Thompson)
Date: Fri, 14 Feb 2003 09:46:42 +0000
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <200302141005.54498.tglx@linutronix.de>
References: <200302132020.02330.phil@river-bank.demon.co.uk> <200302141005.54498.tglx@linutronix.de>
Message-ID: <200302140946.42284.phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 9:05 am, Thomas Gleixner wrote:
> On Thursday 13 February 2003 21:20, Phil Thompson wrote:
> > What's the standard method for initialising the OOB area for software ECC
> > when flashing a new JFFS2 image?
> >
> > The MEMWRITEDATA ioctl looks at first to be the method to use because it
> > uses mtd->write_ecc(). However 0 (ie. NAND_ECC_NONE) is always passed as
> > the last parameter which disables writing the ECC data. Wouldn't it be
> > more flexible to allow user space to specify the OOB format in the ioctl?
> > Or have another ioctl to support writing ECC data?
> >
> > I know I can use MEMWRITEOOB to write the data, but that means that I
> > have to compute it in user space - which seems pointless given the kernel
> > can do it.
>
> True. I planned to make an ioctrl so you can write with the appropriate ECC
> selector to NAND, but I hadnt hat the time to do so.
> Poke me enough and maybe I find some time

I'm happy to do it and send you a patch.

How do you want it implemented?

Just a new ioctl that sets the selector for subsequent MEMWRITEDATA and 
MEMREADDATA calls?

Is there a need for an ioctl to return the current selector?

Is there a need to validate the selector, or just leave it up to MEMWRITEDATA 
and MEMREADDATA to deal with?

IMHO it would be cleaner to replace the struct mtd_oob_buf argument to 
MEMWRITEDATA and MEMREADDATA with a structure that included the selector to 
use for that operation. But that would break binary compatibility. Is this an 
option at this stage?

Phil
