Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H69G-0000So-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 15:57:34 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13H69E-0000Si-00
	for mtd@infradead.org; Tue, 25 Jul 2000 15:57:33 +0100
Message-ID: <397DAB7D.1217F60E@arcom.co.uk>
Date: Tue, 25 Jul 2000 16:00:13 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: cfi_cmdset_0001.c *_2_by_8() funcs 
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

If written some *_2_by_8() funcs for read/write/erase for the Intel
Extended Command Set.  
cf_intelext_setup() also selects the appropriate (1_by_16 or 2_by_8)
depending on cfi->interleave (hope this is the right way to do it).  I
just cut-and-pasted the 1_by_16 func and changed all the read16/write16
to read8/write8.  Is there a better way of doing it?

Is anyone else interested in this code? Should I send in a patch?

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
