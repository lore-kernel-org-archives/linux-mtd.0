Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZFNN-0000ja-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 17:27:09 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZFNK-0000jU-00
	for mtd@infradead.org; Wed, 13 Sep 2000 17:27:07 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id RAA15651
	for <mtd@infradead.org>; Wed, 13 Sep 2000 17:27:02 +0100
To: mtd@infradead.org
Subject: sbc-mediagx
Date: Wed, 13 Sep 2000 17:27:02 +0100
From: David Given <dg@tao-group.com>
Message-Id: <E13ZFNG-00020Z-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have a Arcom systems development board with a Datalight FlashFX flash device 
on it. When I heard that the new MTD system supported this, I rejoiced, 
because the Datalight binary-only FlashFX driver sucks beyond belief. (It's 
120kB. It only works on 2.2.10. When writing, it leaves interrupts off for 
long periods. It takes several minutes to write a few hundred kB --- with 
interrupts off. If you run strings on it, you discover that it seems to have a 
number of DOS executables compiled into it.)

So, I checked the latest MTD out of CVS, got 2.4.0test7 (test8 locks up on 
me), and got it working.

* MTD only works with kernels compiled with*out* MODVERSIONS. This is because 
the dynamic loading code in map.h doesn't know about the mangled symbols used 
with this option turned on.

* The device claims to see only 8MB of my flash medium.

* The device sees three partitions on the disk. DOS sees one. I suspect that 
they use different concepts of partitions.

* MTD doesn't work with devfs, so you have to create device nodes manually --- 
/dev/mtd is at c,90,0..2 and /dev/mtdblock is at b,31,0..2, right?

* There does seem to be data in the partitions. mtd0 and mtd1 seem to be 
identical, and they look suspiciously like a PC ROM --- I'm steering well 
clear of them. mtd2 is strange. There are visible strings here and there, but 
nothing that seems to make any sense. DOS thinks there's a FAT12 filesystem on 
it.

mtd0 & 1 are 640kB. mtd2 is 1.44MB. mtdblock0 is 640kB, mtdblock1 is 1.44MB, 
and mtdblock2 is 6MB. The data in them all seem to repeat after 1MB.

Would anyone like to explain to me what's going on, if anyone knows? I 
*really* don't want to go back to using flashfx.o. I don't want to experiment 
as I could easily render my board unbootable. Which would be a shame.

BTW, anyone know how frequently the kernel syncs with the CVS tree?

-- 
+- David Given ---------------McQ-+ "`Aplysia californica' is your taxonomic
|  Work: dg@tao-group.com         | nomenclature.
|  Play: dgiven@iname.com         | A slug, by any other name, is still a slug
+- http://wired.st-and.ac.uk/~dg -+ by nature." --- drushel on a.f.c           






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
