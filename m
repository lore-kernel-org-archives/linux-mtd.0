Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Zaam-0001tJ-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 16:06:24 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Zaak-0001tD-00
	for mtd@infradead.org; Thu, 14 Sep 2000 16:06:22 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id QAA12293
	for <mtd@infradead.org>; Thu, 14 Sep 2000 16:06:13 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: CFI detection of x16 chips in x8 mode
In-reply-to: Your message of "Thu, 14 Sep 2000 15:02:14 BST."
             <39C0DA66.FF77C6BB@arcom.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Sep 2000 16:06:11 +0100
Message-Id: <E13Zaaa-0004Dk-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>Just commited some new stuff to detect x16 CFI chips which are in x8
>mode.  Arcom's SBC-MediaGX now works "out of the box".  I hope I didn't
>break anything...

Yup, it works. Thanks. What was the problem?

In other news, I devfsifed mtdblock, got it all working, and tried jffs with 
your new sbc_mediagx driver. It all worked. Beautifully. I'm *really* 
impressed --- the improvement over flashfx.o is unbelievable. It's fast and 
efficient and has yet to crash on me. It is a little slow to mount a new file 
system, but I can live with that.

How does jffs work? Erasing a single sector seems to take quite a while on 
this device. How does jffs manage to be so fast?

I believe it ought to be possible to persuade FlashFX to share a device with 
jffs. The way you'd do this is to use FXFMT to create a VBF volume that only 
uses, say, half the device. You'd then have to modify the partition table in 
sbc_mediagx.c to reflect this; you'd have three partitions: the boot partition 
(256kB); the VBF volume (8MB); and everything else (8MB). jffs would live in 
/dev/mtd/3. This ought to let you boot DOS on the VBF volume and then use LILO 
or loadlin to start Linux.

However, there has *got* to be some better way of handling partitions... the 
Arcom board seems to have a 256kB block at the beginning of the flash for ROM 
extensions, so it would make sense to have that as one partition. For the 
rest, it would seem logical that since FlashFX can find the VBF volume, so 
could we, and so we should be able to autodetect it. But does anyone know how?

(Next problem: how to get all this lot into the kernel so I can use a jffs 
partition as my root file system...)

David Given
dg@tao-group.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
