Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 146F4l-0006xh-00
	for mtd-list@infradead.org; Wed, 13 Dec 2000 16:48:19 +0000
Received: from web2104.mail.yahoo.com ([128.11.68.248])
	by infradead.org with smtp (Exim 3.16 #2)
	id 146F4j-0006xb-00
	for mtd@infradead.org; Wed, 13 Dec 2000 16:48:17 +0000
Message-ID: <20001213164807.18924.qmail@web2104.mail.yahoo.com>
Date: Wed, 13 Dec 2000 08:48:07 -0800 (PST)
From: Michael Stumpf <michaelstumpf@yahoo.com>
Reply-To: mstumpf@pobox.com
Subject: MTD, generic physmap memory, MTD_BLOCK
To: mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I'm working in embedded LinuxPPC on a system with low RAM and ROM -- 6 meg RAM,
8 meg flash ROM.  It seems like that MTD may provide (or almost so) a method
for mapping memory space in as a block device.  It already appears to sort-of
do that, but I was wondering if full support for booting off of non-CFI
compliant, but transparently mapped in, memories is either in place now
(doesn't seem to be there) or is planned for the future.

It's a trivial driver, and I'll write it / modify existing MTD code if
desired/needed, but it really seems important to have so that I can
execute-in-place from a cramfs partition in ROM (and also have this as my root
partition).

Thoughts?  Am I way off the mark here?

Regards-
Michael Stumpf



=====
=====================================================================
Michael J. Stumpf                              
LinuxPPC enablement
IBM-Austin, TX     512.838.1524 [lab]  512.838.5335 [work]   
http://www.pobox.com/~mstumpf

__________________________________________________
Do You Yahoo!?
Yahoo! Shopping - Thousands of Stores. Millions of Products.
http://shopping.yahoo.com/


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
