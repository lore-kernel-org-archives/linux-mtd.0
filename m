Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139vc1-0003Y4-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 21:17:37 +0100
Received: from web5304.mail.yahoo.com ([216.115.106.113])
	by infradead.org with smtp (Exim 3.03 #1)
	id 139vbz-0003Xy-00
	for mtd@infradead.org; Wed, 05 Jul 2000 21:17:35 +0100
Message-ID: <20000705201702.5221.qmail@web5304.mail.yahoo.com>
Date: Wed, 5 Jul 2000 16:17:02 -0400 (EDT)
From: Juan Gonzo <kayemmess@yahoo.ca>
Subject: MTD, JFFS, my target -- bringing them together?
To: MTD Mailing List <mtd@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ok,

I am using Intel Strataflash with the CFI command
set.  I have managed to compile the kernel with the
MTD code in place.  I would like to use JFFS for the
filesystem.  The following were enabled with make
oldconfig:

   Memory Technology Device (MTD) support
   Common Flash Interface (CFI) support
   CFI support for Intel/Sharp Extended Command Set
chips
   CFI chips on memory bus support
   Direct blockdevice access to MTD devices
   Journalling Flash filesystem (JFFS) support

>From previous emails, it seems I have to supply a
read16() and write16() function for MTD to work
properly on my system.  Is this right?  Is that all
I have to supply?  What about all that info from the
website about populating the mtd_info struct and the
add_mtd_device business?  Do I still have to do that?

Thanks for any help,
   -- kelly



_______________________________________________________
Do You Yahoo!?
Get your free @yahoo.ca address at http://mail.yahoo.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
