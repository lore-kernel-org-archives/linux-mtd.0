From: phil@river-bank.demon.co.uk (Phil Thompson)
Date: Fri, 14 Feb 2003 11:36:29 +0000
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <200302141200.50767.tglx@linutronix.de>
References: <200302132020.02330.phil@river-bank.demon.co.uk> <200302140946.42284.phil@river-bank.demon.co.uk> <200302141200.50767.tglx@linutronix.de>
Message-ID: <200302141136.29775.phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 11:00 am, Thomas Gleixner wrote:
> On Friday 14 February 2003 10:46, Phil Thompson wrote:
> > How do you want it implemented?
> > Just a new ioctl that sets the selector for subsequent MEMWRITEDATA and
> > MEMREADDATA calls?
>
> Not a good idea.
>
> > IMHO it would be cleaner to replace the struct mtd_oob_buf argument to
> > MEMWRITEDATA and MEMREADDATA with a structure that included the selector
> > to use for that operation. But that would break binary compatibility. Is
> > this an option at this stage?
>
> Yep, as it's for NAND only and as there are no tools, which are usefull, I
> think we can do this and implement it in a clean way. Then we can overhaul
> nandtest utils in mtd/utils to give an example. This should include a
> "copyImageToNAND" utility with support for other filesystems too.
>
> My suggestion:
>
> struct nand_ctrl {
> 	int	oob_select;	// selector for OOB usage
> 	int	data_lenght;	// length of data
> 	int	oob_length;	// length of oob-buffer
> };

What about the other elements of struct mtd_oob_buf, ie. start and ptr?

What about a pointer to the oob buffer?

> oob_length can be 0. If its not zero it must be 8 * (data_length / 256) for
> write and 12 * (data_length / 256) for read, as nand_read_ecc appends the
> ecc_status result behind each 8 byte OOB.
> struct nand_oob_read {
> 	char	oob_data[8];
> 	int	ecc_status;
> }
>
> JFFS2 needs no oob buffer for write, but YAFFS does.

JFFS2 doesn't need one for read either does it?

> data_length for write should be checked, if it is a multiple of page size
> (mtd->oobblock), which is either 256 or 512 at the moment. Deny writing
> parts of pages.
>
> David: any complaints ?

Phil
