Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14RFyx-0000iJ-00
	for mtd-list@infradead.org; Fri, 09 Feb 2001 16:01:11 +0000
Received: from waltz.softhome.net ([204.144.231.7])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14RFyw-0000gu-00
	for mtd@infradead.org; Fri, 09 Feb 2001 16:01:10 +0000
Message-ID: <20010209160048.20512.qmail@softhome.net>
From: oskaya@softhome.net
To: mtd@infradead.org
Subject: m-systems doc 2000 : no free space left 
Date: Fri, 09 Feb 2001 16:00:48 GMT
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



i have a icp amd k6 based embedded system with msystems 2000 flash disk . I
was able to access flash disk device after loading the modules as listed in
one of previous mails . It detects the disk in three pieces at 0xd6000
address . After running MAKEDEV in utils directory i can fdisk to the
/dev/nftla device . I'm running linux kernel 2.4.0.

The problem with the flash disk is while formatting the device with
mkfs.ext2 /dev/nftla
It runs without any problems for some duration .Later it gives an error
with an argh message stating that it has reached to the end of the device
and no free space is left . 

Then i thought that i should grab the latest version from mtd site . The
snapshot i have downloaded doesn't seem to compile in this case . Any
idea...


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
