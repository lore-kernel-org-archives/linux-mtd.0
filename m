Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZsFC-0005Of-00
	for mtd-list@infradead.org; Fri, 15 Sep 2000 10:57:18 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZsFB-0005OZ-00
	for mtd@infradead.org; Fri, 15 Sep 2000 10:57:17 +0100
Message-ID: <39C1F36B.8E97D5F4@arcom.co.uk>
Date: Fri, 15 Sep 2000 11:01:15 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Can't read bytes from x16 device
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I have an Intel 28F640J5 part in x16 mode.  It appears I can't read
bytes which are odd aligned.  After reading one odd aligned byte all
reads fail.

I'm using the 1_by_16 routines in cfi_cmdset_0001.c

David Vrabel.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
