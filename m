Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11zZOw-0005m1-00
	for mtd-list@infradead.org; Sun, 19 Dec 1999 06:01:02 +0000
Received: from [216.211.97.50] (helo=gizmo.adis.on.ca ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11zZOu-0005lt-00
	for mtd@infradead.org; Sun, 19 Dec 1999 06:01:00 +0000
Received: from localhost.localdomain (IDENT:adi@[192.168.100.2])
	by gizmo.adis.on.ca (8.9.3/8.9.3) with ESMTP id XAA21870
	for <mtd@infradead.org>; Sat, 18 Dec 1999 23:58:56 -0600
Date: Sun, 19 Dec 1999 00:10:08 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: mtd@infradead.org
Subject: doc2000 and mtd
Message-ID: <Pine.LNX.4.10.9912190002590.14262-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I am trying to get he mtd driver to work... Here's what I've got so far:

1. Compiled the driver
2. Ran MAKEDEV
3. Load modules
     insmod mtd.o
     insmod mtdblock.o
     insmod nftl.o
     insmod doc2000.o
4. Mount the doc (factory fresh)
     mount -t msdos /dev/nftla1 /mnt

Now I can cd into /mnt (the doc2000 partiton) and I can also read and
write to it. So I copy a bunch of files there, the unmount and power off
the machine. Upon reboot I do step 3. above. When I attempt to mount
/dev/nftla1 I get an error message saying the partition doesn't exist or
is the wrong file system. If I do fdisk /dev/nftla my partition doesn't
exist.

I ran my dos boot floppy and reinstalled the doc firmaware from the
M-Systems disk. I repeated the above steps with the same result.

What am I doing wrong?

Regards,
Adi
   



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
