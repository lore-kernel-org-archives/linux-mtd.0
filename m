Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JIbe-00033l-00
	for mtd-list@infradead.org; Mon, 31 Jul 2000 17:39:58 +0100
Received: from web5301.mail.yahoo.com ([216.115.106.110])
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JIbc-00033f-00
	for mtd@infradead.org; Mon, 31 Jul 2000 17:39:56 +0100
Message-ID: <20000731163920.10575.qmail@web5301.mail.yahoo.com>
Date: Mon, 31 Jul 2000 12:39:20 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: flash file system -- which files for image?
To: JFFS Mailing List <jffs-dev@axis.com>,
  MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ok,

I would like to use mkfs.jffs to create a flash image I can
burn into flash and then in turn, boot from this image.

My question is... what files should go into this image to
create a minimal set that the kernel can use to boot?

Currently, we are booting from a ramdisk with a filesystem
image we downloaded from some site (don't remember which).
Can I use this filesystem (after running it through mkfs.jffs)
as my set of files?

Is there a good place on the Internet with info on something
like this?  Or perhaps an appropriate image for use with JFFS
to get the system up and running?

Thanks,

   -- kelly




_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
