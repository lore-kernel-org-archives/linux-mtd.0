Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LT5g-00043R-00
	for mtd-list@infradead.org; Wed, 24 Jan 2001 16:48:12 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LT5d-00043L-00
	for mtd@infradead.org; Wed, 24 Jan 2001 16:48:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: info@linuxdevices.com
Subject: DiskOnChip DIMM support.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 24 Jan 2001 16:47:46 +0000
Message-ID: <23592.980354866@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Somewhat belated note... as well as support for the DiskOnChip 2000 
and Millennium, the official release of the 2.4.0 kernel also appears to 
support the DiskOnChip DIMM. I'd suspected this, but didn't actually have 
any hardware with which to test until this morning.

The only thing that's missing, that I'm aware of, is support for the larger
DiskOnChip 2000 devices - 72MiB upwards. That's almost trivial to do, and
there's 5 of the beasts now sitting on my desk calling to me, so it should
happen RealSoonNow(tm).

Thanks to M-Systems for providing me with sample hardware. 

If pushed, I'd call the code in 2.4.0 'late beta'. I'm not aware of any 
outstanding problems with it, but I'm not yet satisfied with the amount of 
testing that it's received. If you use it, please report your status - 
either success or failure - to mtd@infradead.org.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
