Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13gqVr-0001Nu-00
	for mtd-list@infradead.org; Wed, 04 Oct 2000 16:31:19 +0100
Received: from virgo.techno.spb.ru ([195.5.142.100] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13gqVp-0001No-00
	for mtd@infradead.org; Wed, 04 Oct 2000 16:31:18 +0100
Received: from techno.spb.ru (IDENT:maxs@Maverick.Techno.Spb.Ru [195.5.142.101])
	by virgo.techno.spb.ru (8.9.3/8.9.3) with ESMTP id TAA04266
	for <mtd@infradead.org>; Wed, 4 Oct 2000 19:31:09 +0400
Message-ID: <39DB4D04.B6467E30@techno.spb.ru>
Date: Wed, 04 Oct 2000 19:30:12 +0400
From: Nick Maximov <maxs@techno.spb.ru>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: AMPRO Core Module w/ DoC onboard
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I just got another Ampro module with working DoC. Some time ago I was
trying to install mtd support and crash my DoC firmware while trying to
write grub there. (using p5format)

Now I return here and ask everybody who can halp me.
What sequence should I do to get started and make my module bootable
from DoC.
Now I have

1. NEW :) CoreModule with DoC (solded onboard) (old module works w/o DoC
using IDE SSD SunDisk)
2. Utility disk with DOS p5format p5update
3. LinuxBox w/ RH 6.2 kernel 2.2.17 srcs
4. Latest Grub from their CVS arch

I afraid to crash it again. So please help me...

--Nick


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
