Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143Lq3-0000xX-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 17:25:11 +0000
Received: from rf-mail1.echostar.com ([205.172.144.40] helo=rf-exch2.echostar.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143Lq2-0000xR-00
	for mtd@infradead.org; Tue, 05 Dec 2000 17:25:10 +0000
Message-ID: <3A2D24D4.FC82D90D@echostar.com>
Date: Tue, 05 Dec 2000 10:24:37 -0700
From: "Ian S. Nelson" <ian.nelson@echostar.com>
Reply-To: ian.nelson@echostar.com
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: Possibly a FAQ or stupid question
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

but is there an MTD how-to or anything?

I'm talking about a real idiot's guide, I'm just kind of hacking my way
through a project and I am rapidly approaching the time when I will need
a flash burner program.

Can I just dd to the flash?  Assuming that my AMD flash works with
CFI...

I've also skimmed the archives on JFFS,  any pros and cons vs. an initrd
and burning it in there linearly?  Right now my boot loader will boot
strap a kernel out of flash and then I hacked the kernel to scan for my
initrd in flash and it will decompress it and run, works like a champ
but I need a way to put a new initrd in there now.  Is JFFS compressed?
Can I set aside a few K at the end of flash for my boot loader and then
a few hundred at the beginning for my kernel and use JFFS in the middle?



thanks,
Ian



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
