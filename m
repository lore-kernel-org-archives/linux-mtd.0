Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13j6fy-0008Jn-00
	for mtd-list@infradead.org; Tue, 10 Oct 2000 22:11:06 +0100
Received: from [205.250.170.220] (helo=xanadu.vipswitch.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13j6fw-0008Jg-00
	for mtd@infradead.org; Tue, 10 Oct 2000 22:11:04 +0100
Date: Tue, 10 Oct 2000 17:06:52 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: mtd@infradead.org
Subject: Big Intel CFI support update
Message-ID: <Pine.LNX.4.10.10010101658390.21753-100000@xanadu.vipswitch.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi!

I just commited large patches to the CVS regarding CFI support for Intel
chips.  It allows multiple flash configuration to be supported by the same
codebase.  Everything should be parametized now and the code may shrink a
lot when a specific geometry is bolted in cfi.h.

I modified cfi-cmdset0001.c only, not cfi-cmdset0002.c, since that's all I
have access to.

Hopefully I didn't break anything that worked before.  I could only test
it with 2 parallel x16 chips on a 32-bit access bus which was still
unsupported previously.

So if it worked but doesn't anymore, I'm he one to blame.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
