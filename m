Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ScLP-0000iB-00
	for mtd-list@infradead.org; Wed, 08 Mar 2000 09:01:27 +0000
Date: Wed, 8 Mar 2000 10:01:22 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: mtd comments 
In-Reply-To: <1173.952458175@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000308093421.13423C-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 7 Mar 2000, David Woodhouse wrote:

> > Hi,
> > 
> > I'm just browsing trough the mtd code.
> 
> Thanks - it's high time this was done. 

The core (interfaces etc.) is very good. Some parts could probably
use some polish though.
 
> > The following code in mtd.c::mtd_read() is pretty bad from a security
> > standpoint:
> > 
> > if (!mtd->point || (ret = MTD_POINT(mtd, *ppos, count, &retlen, &mtdbuf)) != 0)
> > {
> >    /* mtd->point() failed; use mtd->read instead */
> >    ret = MTD_READ(mtd, *ppos, count, &retlen, buf);
> > 
> > The passing of buf, which is a userspace pointer to a kernel API is
> > dubious at the very least. And in the case of i.e. slram.c the 
> > physmem_read() function in fact just does an memcpy leading to a direct
> > security problem. 
> 
> I wasn't sure how to do this at the time I wrote this section of code (about
> three years ago), but now I think we ought to declare that the MTD read() et
> al. functions ought to take user-space pointers and use verify_area/
> copy_{to,from}_user.
> 
> If they're actually called with a kernel-space buffer, we use 
> set_fs(KERNEL_DS) beforehand, which handles the rest of your question.

Oh, i didn't know about that trick. Well that seems like a good idea
then. I suppose we have to fix all driver too. 
Kernel space buffers are used from the block driver request code, the ftl
(and nftl i suppose) request code and bam cache read/writes. Soo, are oob
pointers to kernel space or user space? (I would think kernel space, as
they are not exported via the char device).
 
> > Also, what is oob (out of band) blocks? 
> 
> NAND flash chips have 16 bytes of extra storage per 512-byte block. I'm not 
> particularly impressed with the 'out-of-band' routines, but I couldn't see a 
> better way to do it. Suggestions are welcome.
> 
> Likewise, the DiskOnChip hardware also does ECC on the blocks it writes to the 
> flash, and automatically checks the ECC on the blocks it reads back. I'm not 
> wonderfully happy with the interface I've defined for that either, but the 
> same applies - suggestions are welcome.

I have no other suggestions.
 
> > And how are flash-memories that
> > have non-constant erase-sector size (i.e. boot sectors etc.) handled?
> 
> I've never met a flash memory with non-constant erase-sector size, and hence 
> didn't allow for them. Can you provide more information about such beasts?

Some flash chips (I have no reference right now, i can find it if you
want) have different sector size of the first few sectors. The rest are a
fixed size. 

Here is an example of how a 64kb sector size flash  might look:

 4 k \
 4 k  |
 8 k   > This can be seen as the "first sector" of 64k
16 k  |
32 k /
64k
64k
.
.
.

This is mainly used as a bootsector type of thing. The idea seems to be
that if your boot-code is a lot less than 64k you don't waste so much
space. And you can also store configuration data in one of the smaller
sectors, and rewrite it without destroying the boot sector.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
