Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14JGw9-0006Ym-00
	for mtd-list@infradead.org; Thu, 18 Jan 2001 15:25:17 +0000
Received: from reprofw.itrepro.com ([216.89.237.2] helo=itrepro.atlanta.itserve.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14JGw7-0006Yg-00
	for mtd@infradead.org; Thu, 18 Jan 2001 15:25:16 +0000
Received: from workbox.atlanta.itserve.com (IDENT:dhamm@workbox.atlanta.itserve.com [10.100.3.219])
	by itrepro.atlanta.itserve.com (8.9.3/8.9.3) with SMTP id KAA03651
	for <mtd@infradead.org>; Thu, 18 Jan 2001 10:25:34 -0500
From: David Hamm <dhamm@itrepro.com>
Reply-To: dhamm@itrepro.com
To: mtd@infradead.org
Subject: doc-lilo and mtd devices
Date: Thu, 18 Jan 2001 10:19:35 -0500
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <01011810250701.08590@workbox.atlanta.itserve.com>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Thanks to many kind folks on this list I can now fdisk and mke2fs the doc.  Now
I'm working with doc-lilo which I suspect won't work with mtd devices.   I get
the following error.  
Sorry don't know how to handle device 0x5d01

Do I need to get another boot loader ( ie grub ) or can I use a newer
version of lilo?



  ---------------------------------
David Hamm
Systems Analyst
Imaging Technologies Services Inc.
email: dhamm@itrepro.com
voice: 404-870-6663
---------------------------------


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
