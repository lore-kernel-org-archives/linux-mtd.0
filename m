Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CpJT-0004BI-00
	for mtd-list@infradead.org; Thu, 13 Jul 2000 21:10:27 +0100
Received: from web5302.mail.yahoo.com ([216.115.106.111])
	by infradead.org with smtp (Exim 3.03 #1)
	id 13CpJR-0004Ak-00
	for mtd@infradead.org; Thu, 13 Jul 2000 21:10:26 +0100
Message-ID: <20000713200952.1875.qmail@web5302.mail.yahoo.com>
Date: Thu, 13 Jul 2000 16:09:52 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: persistence of files using jffs
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Me again.  More questions.  Oy!

Our system is using a ramdisk (with a prebuilt image)
as its root device.  Before I boot up the system I burn
a small image into flash (this image was created with
mkfs.jffs and contains a couple of files and one directory).

So, the system boots up and I do the following:
   (1) mknod /dev/mtd3 b 31 3   (mtd3 is where the fs 'partition' is,
                                 using examples from nora.c)
   (2) mount -t jffs /dev/mtd3 /mnt

The mount is successful and after this I can see the files and
directory I burned into flash.  I can copy another file from the
ramdisk to this mount.  And I can 'umount /mnt' successfully as
well.

However, when I cycle power on the system,
any *new* files I create or copy into this space are lost.

Everytime I restart the system I have to 'mknod /dev/mtd3', does
this have something to do with that?  What am I missing to
get the new files to be present when I remount JFFS?

Thanks,
   -- kelly



_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
