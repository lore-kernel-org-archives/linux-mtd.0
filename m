Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Zap0-0001yH-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 16:21:06 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Zaoy-0001yB-00
	for mtd@infradead.org; Thu, 14 Sep 2000 16:21:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13Zaaa-0004Dk-00@pearl.tao.co.uk> 
References: <E13Zaaa-0004Dk-00@pearl.tao.co.uk> 
To: "David Given" <dg@tao-group.com>
Cc: mtd@infradead.org
Subject: Re: CFI detection of x16 chips in x8 mode 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Sep 2000 16:20:47 +0100
Message-ID: <22135.968944847@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dg@tao-group.com said:
>  How does jffs work? Erasing a single sector seems to take quite a
> while on  this device. How does jffs manage to be so fast?

You don't have to make the user wait while you erase a sector. You can do 
it from a kernel thread in the background, and make sure you've always got 
some space available

You can also interrupt erases on some flash chips, and read from the
filesystem even while you're waiting from an erase. We don't do that yet, 
but it's close.

> I believe it ought to be possible to persuade FlashFX to share a
> device with  jffs. The way you'd do this is to use FXFMT to create a
> VBF volume that only  uses, say, half the device. You'd then have to
> modify the partition table in  sbc_mediagx.c to reflect this; you'd
> have three partitions: the boot partition  (256kB); the VBF volume
> (8MB); and everything else (8MB). jffs would live in  /dev/mtd/3. This
> ought to let you boot DOS on the VBF volume and then use LILO  or
> loadlin to start Linux.

Theoretically possible. Probably better to get it to boot off the JFFS 
directly though, if you can. It'd be nice if someone with the source to the 
flashfx stuff could release a version which works on MTD devices.

> However, there has *got* to be some better way of handling
> partitions... the  Arcom board seems to have a 256kB block at the
> beginning of the flash for ROM  extensions, so it would make sense to
> have that as one partition. For the  rest, it would seem logical that
> since FlashFX can find the VBF volume, so  could we, and so we should
> be able to autodetect it. But does anyone know how?

Not easy to do this in a generic manner, and deal with all possible schemes 
for splitting the devices up.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
