Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144Jmi-0007Y0-00
	for mtd-list@infradead.org; Fri, 08 Dec 2000 09:25:44 +0000
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 144Jmg-0007Xp-00
	for mtd@infradead.org; Fri, 08 Dec 2000 09:25:43 +0000
Message-ID: <3A30AA56.AEFBBF6E@arcom.co.uk>
Date: Fri, 08 Dec 2000 09:31:02 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Requesting module even when it's compiled in
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I've patched a 2.2.17 kernel with the latest mtd-patch-2.2.17 however
the MTD code is from yesterday's CVS.

Compiled into the kernel
	MTD
	CFI support
	Intel Ext suport
	SBC-MediaGX
The SBC-MediaGX driver starts but fails with
	request_module[cfi_probe]: Root fs is not mounted

It shouldn't be looking for a module should it (since it is compiled
into the kernel)?

CONFIG_MODULES is defined. (don't know if this is relevant)

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
