Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Fcol-0003tC-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 14:26:19 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Fcok-0003t6-00
	for mtd@infradead.org; Fri, 21 Jul 2000 14:26:18 +0100
Message-ID: <39785017.1C127BAC@arcom.co.uk>
Date: Fri, 21 Jul 2000 14:28:55 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Intel Extended Command set in 8x mode
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I have a board with an Intel StrataFlash 28F640 on it.  Having written a
map driver the CFI probe code detects the chip.  However it appears that
the Intel Extended Command Set code is only for chips in 16x mode not 8x
mode which this chip is in.  Is this the case?  If so how can I get it
to work?  Do I need to write a whole new thing like cfi_cmdset_0001.c
for 8x mode?

Also,  JFFS won't compile.  I'm using kernel 2.2.16 and the
put-module-symbol patch has been applied and I'm building it outside the
kernel tree.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
