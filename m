Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U8xN-0006JU-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 15:35:13 +0100
Received: from hci.ucsd.edu ([132.239.215.210] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13U8xM-0006JO-00
	for mtd@infradead.org; Wed, 30 Aug 2000 15:35:12 +0100
To: mtd@infradead.org
Subject: What do these log messages mean?
From: David Fox <dsfox@cogsci.ucsd.edu>
Date: 30 Aug 2000 07:35:05 -0700
In-Reply-To: Alice Hennessy's message of "Tue, 29 Aug 2000 16:54:07 -0700"
Message-ID: <luu2c2vmue.fsf_-_@hci.ucsd.edu>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

When I modprobe docprobe I get the following in syslog:

kernel: M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings Inc.
kernel: Cannot find driver for DiskOnChip 2000 at 0xD6000
kernel: Possible DiskOnChip with unknown ChipID 50 found at 0xdc000

That's all I see.  Any ideas what I should do next?  The machine is
based on a Nat Semi board, essentially the same as a VirginConnect.
The flash device is marked DiskOnChip 2000, MD2200-D48.  I see that
the normal DOC 2000 chip ID is 0x20, should I patch the code to accept
0x50 as well?  Is it perhaps being fooled into thinking it sees a
DOC2000 at 0xdc000, and the real device is further down the list?
And what's going on at 0xd6000?


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
