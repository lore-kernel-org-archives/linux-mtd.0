Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wQm1-0006mM-00
	for mtd-list@infradead.org; Thu, 16 Nov 2000 15:16:25 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13wQly-0006mG-00
	for mtd@infradead.org; Thu, 16 Nov 2000 15:16:23 +0000
Message-ID: <01C04FE2.F4415760@omnibook.home.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: block device for 2.0
Date: Thu, 16 Nov 2000 15:36:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have now got all important modules running to
support ROM, CFI and RAM with uClinux. I have
used an old version of mtdblk.c (1.14) for block
access, for several reasons:
*The current driver uses kernel_thread. I don't know
  if/how that could be used in 2.0
* Caching is used. In uClinux, where RAM is valuable,
  RAM with the size of one erase sector would be wasted.
  With flashes that have 64KB or 128KB erase sectors,
  thats a lot of wasted memory.
* When the block driver is used as replacement for
  the blkmem.c ROM driver, caching isn't of any use at all.
  I think that will be the main (or the only?) purpose
  of the blockdriver in uClinux.

I thought it might be best to have the choice between the
old, uncached block block driver (for uClinux) or the new driver
as a configuration option. Are there any better ideas?

Regards,

Erwin




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
