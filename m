Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Vvah-0003S5-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 13:15:27 +0000
Message-ID: <30724FF712DFD2119E6200104B2448920119744C@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'David Woodhouse ' <dwmw2@infradead.org>, Vipin Malik
	 <Vipin.Malik@daniel.com>
Cc: "'''mtd@infradead.org' ' '" <mtd@infradead.org>
Subject: RE: Unable to mount compressed root f/s because init_mtd() does n
	 ot r egister block device!
Date: Thu, 22 Feb 2001 07:11:55 -0600
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David,
But isn't the same init calls method used to init the stuff in the
2.4.x series of kernels. So it's not just a 2.2.18/19 issue.

Thanks

Vipin
P.S. Did you look at the 2nd patch to inode-v23.c that I sent yesterday
(to fix the partial page write stuff)?


-----Original Message-----
From: David Woodhouse
To: Vipin Malik
Cc: ''mtd@infradead.org' '
Sent: 2/22/01 2:08 AM
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n
ot r egister block device! 


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

Either we stop using initcalls for the MTD stuff in 2.2.18 - just revert
to 
the old method as we did in earlier 2.2, or we fix the remainder of
2.2.19 
to use initcalls properly. Probably the former.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
