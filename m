Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13y9PV-00013M-00
	for mtd-list@infradead.org; Tue, 21 Nov 2000 09:08:17 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13y9PU-00013G-00
	for mtd@infradead.org; Tue, 21 Nov 2000 09:08:16 +0000
Received: from dwmw2 (helo=redhat.com)
	by passion.cygnus with local-esmtp (Exim 3.16 #2)
	id 13y9PT-0000DB-00
	for mtd@infradead.org; Tue, 21 Nov 2000 09:08:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: 2.4 stuff.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Nov 2000 09:08:15 +0000
Message-ID: <816.974797695@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

OK, I've just merged the inter_module_xxx changes from 2.4 as I said I was 
going to do last week - yes it took me over a week to do it because I got 
distracted and fixed PCMCIA in 2.4 instead.

This will break the build on 2.2 if you don't have Keith's inter_module_xxx 
patch applied. But you had to apply a patch anyway to make 
put_module_symbol() work. Hopefully, it'll end up in 2.2.1[89] and we'll 
all be happy. 

2.2.17 and above also contain the new module_init() code so I've (at least
partially) carried out my threat to stop maintaining the initcalls. If you
care, fix it. If you care and don't have CVS write access, send me a SSH
public key.

Note that a handful of drivers now ought to put the module_init() version 
inside #if LINUX_VERSION_CODE >= 0x20211 instead of 0x20300

My current plan is to give Linus a selective update of the MTD code
some time early in the 2.4 series. In it, I'm intending to include:
	- mtdpart stuff
	- New mtdblock
	- New NFTL
	- New DiskOnChip driver, _preferably_ with DOC_SINGLE_DRIVER
	- API changes - set_vpp() and anything else that's momentarily
		slipped my notoriously vague attention.
	- Any new map drivers which are appropriate - probably the
		SA1100 one. 
	- New CFI code iff it actually works next time I try it on my
		boards :)

Speak up if there's something missing which you think ought to be included, 
or alternatively if there's something in there which you think I ought to 
omit.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
