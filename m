Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SjIC-00009O-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 17:31:08 +0000
Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SjIB-00009I-00
	for mtd@infradead.org; Tue, 13 Feb 2001 17:31:08 +0000
Message-ID: <3A89758C.74FD4C74@danielind.com>
Date: Tue, 13 Feb 2001 11:57:33 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>
Subject: cfi_probe module usage count when insmod physmap.o fails
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

When insmod physmap.o fails, it does not decrement the usage count of
cfi_probe.o

This results in an ever increasing usage count for each "try" of insmod
physmap.o

The problem that I encountered is that trying to unload cfi_probe module
to add some debug printk's was not possible.

I solved the problem with an extra line in physmap.c right before it
exits because do_cfi_probe() failed that decrements
the cfi_probe module usage count as thus:

 inter_module_put("cfi_probe");

This works. Anyone see any problems with it? If not can we change
physmap.c with this change?

Thanks

Vipin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
