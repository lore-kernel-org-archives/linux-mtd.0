Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Vqr5-0002Aw-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 08:12:03 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Vqr4-0002Aq-00
	for mtd@infradead.org; Thu, 22 Feb 2001 08:12:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <30724FF712DFD2119E6200104B2448920119744B@mail1> 
References: <30724FF712DFD2119E6200104B2448920119744B@mail1> 
To: Vipin Malik <Vipin.Malik@daniel.com>
Cc: "''mtd@infradead.org' '" <mtd@infradead.org>
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n ot r egister block device! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Feb 2001 08:08:51 +0000
Message-ID: <12716.982829331@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Vipin.Malik@daniel.com said:
> Ok, looking a bit more at it, it seems that all the init for  the mtd
> stuff is happening when do_inicalls() gets called as they are all
> declared as initcalls.

> But looking at the other block device stuff (hd, floppy etc.) they all
> get init'ed by calling blk_dev_init() from genhd.c which gets called
> by device_setup() called from init/main.c
>  

> This guarantees that the block devices are registered before the
> ramdisk load stuff gets called, hence allowing them to be used to load
> compressed filesystems.

> How to we fix this (as I'm not too familiar with the init stuff and
> how to change that)? 

Either we stop using initcalls for the MTD stuff in 2.2.18 - just revert to 
the old method as we did in earlier 2.2, or we fix the remainder of 2.2.19 
to use initcalls properly. Probably the former.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
