Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RWBn-0007DQ-00
	for mtd-list@infradead.org; Wed, 23 Aug 2000 09:47:15 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13RWBl-0007DK-00
	for mtd@infradead.org; Wed, 23 Aug 2000 09:47:14 +0100
Message-ID: <39A39051.CAF6DA66@arcom.co.uk>
Date: Wed, 23 Aug 2000 09:50:25 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: JFFS: free_size == 0 after mounting
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I'm using the latest CVS JFFS and get endless
   jffs_garbage_collect_thread(): free_size == 0. This is BAD.
messages after mounting.

I have images of the flash if anyone is interested.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
