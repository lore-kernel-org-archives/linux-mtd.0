Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZHc7-0001Zx-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 19:50:31 +0100
Received: from [216.84.103.11] (helo=coolexchange.coollogic.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZHc6-0001Zl-00
	for mtd@infradead.org; Wed, 13 Sep 2000 19:50:30 +0100
Message-ID: <39BFCCE8.F95BA237@coollogic.com>
Date: Wed, 13 Sep 2000 13:52:24 -0500
From: Ian Thompson <ithompson@coollogic.com>
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: lilo patch
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Forgive me if I'm covering familiar territory.

What was the purpose of the lilo-ebda.patch?

I have a development setup with a hard-drive and a DiskOnChip
and I was looking for a lilo patch that would allow me to boot
the hard-drive with a configured DiskOnChip in place but this 
didn't do it.

I have a 32M DOC2000 @ 0xd000:0000 

Other things I have noticed, that I, with my limited DOC knowledge,
can't explain...

A configured 32M Millenium will allow lilo to boot the hard-drive but
a configured 16M Millenium wiil not.

64M DOC2000s don't seem to work with M-Systems binary driver.

Has anyone any experience with 64M DOC2000s? We have several and 
approx. 25% won't format to full capacity with the M-Systems utilities.

Ian T.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
