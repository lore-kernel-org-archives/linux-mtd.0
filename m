Return-path: <David.Woodhouse@mvhi.com>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xRs6-0001ys-00
	for mtd-list@infradead.org; Mon, 13 Dec 1999 09:34:22 +0000
Received: from mxbackup.insnet.net ([194.177.174.245] helo=polaris.uk.insnet.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xRs4-0001ym-00
	for mtd@infradead.org; Mon, 13 Dec 1999 09:34:20 +0000
Received: from gizmo.adis.on.ca (50.0-63.97.211.216.in-addr.arpa [216.211.97.50] (may be forged))
	by polaris.uk.insnet.net (8.9.3/8.9.3) with ESMTP id FAA01655
	for <mtd@infradead.org>; Mon, 13 Dec 1999 05:11:37 GMT
Date: Sun, 12 Dec 1999 23:16:25 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: Christer Weinigel <wingel@cendio.se>
cc: mtd@infradead.org
Subject: Re: DOC2000 and 2.2.12 kernel
In-Reply-To: <199912130214.DAA24071@godzilla.cendio.se>
Message-ID: <Pine.LNX.4.10.9912122309530.3362-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>

> I actually got the M-systems driver working as a module a couple of
> weeks ago, and have been using it with an initrd.  I still dislike
> using a binary only module, but I was under a lot of time pressure and
> didn't have the time to try to find the bugs in the mtd-implementation
> (or rather the mismatch between what David Woodhouse's mtd code writes
> to the flash and what the M-systems BIOS expects).

I'd be interested in your modularized M-Systems driver if you'd like to
share it.

I think I'll stick to using syslinux for booting from flash right now.
I've only briefly worked with syslinux. If it works as it looks it might
even be a better solution for me than lilo. I can boot the kernel and the
compressed ramdisk from the doc2000 using syslinux. Once the system is up
the module for the doc2000 can be loaded, whether it be the M-sys or mtd
driver. 

Regards,
Adi



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
