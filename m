From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 10:05:54 +0100
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <200302132020.02330.phil@river-bank.demon.co.uk>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
Message-ID: <200302141005.54498.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thursday 13 February 2003 21:20, Phil Thompson wrote:
> What's the standard method for initialising the OOB area for software ECC
> when flashing a new JFFS2 image?
>
> The MEMWRITEDATA ioctl looks at first to be the method to use because it
> uses mtd->write_ecc(). However 0 (ie. NAND_ECC_NONE) is always passed as
> the last parameter which disables writing the ECC data. Wouldn't it be more
> flexible to allow user space to specify the OOB format in the ioctl? Or
> have another ioctl to support writing ECC data?
>
> I know I can use MEMWRITEOOB to write the data, but that means that I have
> to compute it in user space - which seems pointless given the kernel can do
> it.
True. I planned to make an ioctrl so you can write with the appropriate ECC 
selector to NAND, but I hadnt hat the time to do so.
Poke me enough and maybe I find some time

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
