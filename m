Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143MbD-000188-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 18:13:55 +0000
Received: from d8fa50aa.ptr.dia.nextlink.net ([216.250.80.170] helo=tetsuo.applianceware.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143MbB-000181-00
	for mtd@infradead.org; Tue, 05 Dec 2000 18:13:53 +0000
Received: (from mike@localhost)
	by tetsuo.applianceware.com (8.9.3/8.9.3) id MAA11220
	for mtd@infradead.org; Tue, 5 Dec 2000 12:26:57 -0500
Message-ID: <20001205122657.A11201@tetsuo.applianceware.com>
Date: Tue, 5 Dec 2000 12:26:57 -0500
From: Mike Panetta <mpanetta@applianceware.com>
To: mtd@infradead.org
Subject: CVS MTD drivers -> latest devel kernel.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

If I want to use the latest CVS MTD drivers in the
latest (or not so latest 2.4.0-test10) kernel can
I just copy the kernel dir in cvs to linux/drivers/mtd?
I would of course move the old dir out of the way first
to save it...  The reason I ask is because if I
currently try to compile CVS MTD it complains
about the index field not being in struct mtd_info.
It is not in that struct, in the old kernel driver
but it obviously is in the new one (I checked).  
So it looks like the search path finds mtd.h from
my kernel instead of the include dir in the cvs
tree. 


TIA
Mike
-- 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
