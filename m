Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13PhgG-0003Ia-00
	for mtd-list@infradead.org; Fri, 18 Aug 2000 09:39:12 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13PhgF-0003IU-00
	for mtd@infradead.org; Fri, 18 Aug 2000 09:39:12 +0100
Message-ID: <399CF6F1.4622CF44@arcom.co.uk>
Date: Fri, 18 Aug 2000 09:42:25 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org, jffs-dev@axis.com
Subject: JFFS oopses on mount
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

JFFS oopses during mounting.  Are the latest CVS sources likely to fix
this problem (last checked out Aug 16th)? If not how can I go about
finding out what the problem is?  Unfortunatly I had to disable
debugging because the problem didn't occur with it enabled (sending
masses of debugging information via a serial link reduces greatly the
number of test iterations).  I do have more images of the flash than you
can shake a stick at though.

Possibly a message of interest
jffs_garbage_collect_now(): free_size == 0. This is BAD.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
