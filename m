Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13gYiS-000642-00
	for mtd-list@infradead.org; Tue, 03 Oct 2000 21:31:08 +0100
Received: from ils.nlynx.com ([204.251.47.66] helo=nlynx.com)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13gYiR-00063w-00
	for mtd@infradead.org; Tue, 03 Oct 2000 21:31:07 +0100
From: Brian.Burton@nlynx.com
To: mtd@infradead.org
Message-ID: <8625696D.00709687.00@nlynx.com>
Date: Tue, 3 Oct 2000 15:26:55 -0500
Subject: purpose of docprobe module and which device do I use
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



A couple of newbie questions:
1. Do any of the other drivers use docprobe?  Since I (as the developer) know
where the DOC is located, shouldn't I hard-code the location of the DOC instead
of this scanning for the DOC?  It seems to be confused as to what is a DOC and
what is not.
2.  I am looking to replace the M-System binary driver with this open source
driver (I am having problems with the M-System driver thinking that I have 2
DOCs installed instead of just the one that I have installed).  I was put the
Linux Router Project into a DOC.  Would I be using the pseudo-block device
MTDBLOCK driver as a replacement for the M-system driver?  Would that device be
/dev/mtdb0?

Also, after reading much of the list archives, and having the same problem with
modprobe in finding the drivers, I found I needed to add
path[mtd]=/lib/modules/mylinux/mtd for modprobe to find the various modules.
Was that correct?

Brian




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
