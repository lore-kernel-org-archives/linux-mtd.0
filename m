Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12SPsf-0007op-00
	for mtd-list@infradead.org; Tue, 07 Mar 2000 19:42:57 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12SPsd-0007oj-00
	for mtd@infradead.org; Tue, 07 Mar 2000 19:42:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10003011820470.29074-100000@tammy.signum.se> 
References: <Pine.LNX.4.10.10003011820470.29074-100000@tammy.signum.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: mtd comments 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Mar 2000 19:42:55 +0000
Message-ID: <1173.952458175@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


(this found in my drafts folder - evidently it never got sent - sorry for the 
delay)

> Hi,
> 
> I'm just browsing trough the mtd code.

Thanks - it's high time this was done. 

> The following code in mtd.c::mtd_read() is pretty bad from a security
> standpoint:
> 
> if (!mtd->point || (ret = MTD_POINT(mtd, *ppos, count, &retlen, &mtdbuf)) != 0)
> {
>    /* mtd->point() failed; use mtd->read instead */
>    ret = MTD_READ(mtd, *ppos, count, &retlen, buf);
> 
> The passing of buf, which is a userspace pointer to a kernel API is
> dubious at the very least. And in the case of i.e. slram.c the 
> physmem_read() function in fact just does an memcpy leading to a direct
> security problem. 

I wasn't sure how to do this at the time I wrote this section of code (about
three years ago), but now I think we ought to declare that the MTD read() et
al. functions ought to take user-space pointers and use verify_area/
copy_{to,from}_user.

If they're actually called with a kernel-space buffer, we use 
set_fs(KERNEL_DS) beforehand, which handles the rest of your question.

> Also, what is oob (out of band) blocks? 

NAND flash chips have 16 bytes of extra storage per 512-byte block. I'm not 
particularly impressed with the 'out-of-band' routines, but I couldn't see a 
better way to do it. Suggestions are welcome.

Likewise, the DiskOnChip hardware also does ECC on the blocks it writes to the 
flash, and automatically checks the ECC on the blocks it reads back. I'm not 
wonderfully happy with the interface I've defined for that either, but the 
same applies - suggestions are welcome.

> And how are flash-memories that
> have non-constant erase-sector size (i.e. boot sectors etc.) handled?

I've never met a flash memory with non-constant erase-sector size, and hence 
didn't allow for them. Can you provide more information about such beasts?




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
