Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JC8W-000278-00
	for mtd-list@infradead.org; Mon, 31 Jul 2000 10:45:28 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13JC8U-000272-00
	for mtd@infradead.org; Mon, 31 Jul 2000 10:45:27 +0100
Message-ID: <39854B63.4203ACB@arcom.co.uk>
Date: Mon, 31 Jul 2000 10:48:19 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Intel Ext. 2_by_8() routines
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I've added some *2_by_8() routines for the Intel Extended Command Set
(cfi_cmdset_0001.c).
cfi_intelext_setup() decides which ones to use based on the interleave.

Also, the erase block size is set from the CFI info.  I've used the info
from the first erase block and assumed that they're all the same size
since MTD doesn't appear to support different erase block sizes.

This stuff has been tested on an Arcom Control Systems SBC-MediaGX (a
flash chip mapping for which has also been added).

Those of you with chips in x16 mode might like to check that the correct
routines and are selected.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
