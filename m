Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Zc8p-0002KM-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 17:45:39 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Zc8m-0002KF-00
	for mtd@infradead.org; Thu, 14 Sep 2000 17:45:37 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id RAA15493
	for <mtd@infradead.org>; Thu, 14 Sep 2000 17:45:31 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: CFI detection of x16 chips in x8 mode 
In-reply-to: Your message of "Thu, 14 Sep 2000 16:20:47 BST."
             <22135.968944847@passion.cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Sep 2000 17:45:30 +0100
Message-Id: <E13Zc8g-0005Fe-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

[...]
>> I believe it ought to be possible to persuade FlashFX to share a
>> device with  jffs. The way you'd do this is to use FXFMT to create a
>> VBF volume that only  uses, say, half the device. You'd then have to
>> modify the partition table in  sbc_mediagx.c to reflect this; you'd
>> have three partitions: the boot partition  (256kB); the VBF volume
>> (8MB); and everything else (8MB). jffs would live in  /dev/mtd/3. This
>> ought to let you boot DOS on the VBF volume and then use LILO  or
>> loadlin to start Linux.
>
>Theoretically possible. Probably better to get it to boot off the JFFS 
>directly though, if you can. It'd be nice if someone with the source to the 
>flashfx stuff could release a version which works on MTD devices.

The problem with booting off JFFS is that until Linux has loaded, the only 
means of accessing the flash is via VBF... which doesn't understand JFFS. And 
once Linux has loaded, it doesn't understand VBF.

I've managed to get a dual-personality system up and running now. It boots 
ROM-DOS off the VBF partition; then I load Linux with loadlin, and it boots 
off the network. Once the modules are loaded I can access the JFFS partition.

Oh, yes. While playing, I changed the start and length of the JFFS partition. 
The new one still overlapped part of the old one. I mounted it without erasing 
it first... and my files were still visible. Is there any way to reduce the 
startup time when you first mount the file system?

What's ffs2?

>> However, there has *got* to be some better way of handling
>> partitions... the  Arcom board seems to have a 256kB block at the
>> beginning of the flash for ROM  extensions, so it would make sense to
>> have that as one partition. For the  rest, it would seem logical that
>> since FlashFX can find the VBF volume, so  could we, and so we should
>> be able to autodetect it. But does anyone know how?
>
>Not easy to do this in a generic manner, and deal with all possible schemes 
>for splitting the devices up.

For now, it would be sufficient for the sbc_mediagx chipset driver to allocate three partitions:

0: boot partition (0-256kB)
1: VBF volume (detected)
2: everything else

After all, flash devices aren't really large enough to warrant more complex partitioning schemes. If you really need them, then waiting until there's a proper VBF driver and creating PC partitions in it would do fine.

Anyone know how FlashFX finds the VBF volume?

David Given
dg@tao-group.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
