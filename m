Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14n69q-0001Mb-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 22:58:42 +0100
Received: from internal.sixthdimension.com ([216.17.150.15] helo=solo.sixthdimension.com)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14n69p-0001MV-00
	for mtd@infradead.org; Tue, 10 Apr 2001 22:58:41 +0100
Message-ID: <009e01c0c209$50be0ae0$d501a8c0@sixthdimension.com>
From: "Michael Dwyer" <mdwyer@sixthdimension.com>
To: <mtd@infradead.org>
Subject: DOC2000 and extreme clock skew
Date: Tue, 10 Apr 2001 15:57:59 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've got a linux 2.2 machine here that uses the DOC2000 and the M-Sys
provided drivers.  We're noticing an EXTREME clock skew on this machine.
I'm theorizing that it is because the kernel is forced to go out to
lunch while writing to flash.  While it is out to lunch, it misses timer
interrupts.

Since their base driver isn't open source, I can't poke through it --
not that that would help me much, since I'm not sure how the kernel
handles high-latency interrupts anyway.

Has anyone else seen this?  Does anyone know how I would go about trying
to hunt this down?





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
