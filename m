Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144MZ7-00082k-00
	for mtd-list@infradead.org; Fri, 08 Dec 2000 12:23:53 +0000
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 144MZ4-00082e-00
	for mtd@infradead.org; Fri, 08 Dec 2000 12:23:52 +0000
From: "Quarantine" <quarantine@arcom.co.uk>
To: <mtd@infradead.org>
Subject: FW: Requesting module even when it's compiled in
Date: Fri, 8 Dec 2000 12:23:06 -0000
Message-ID: <NDBBKECCCEBFFCBPNEGIEECDDDAA.quarantine@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
Of David Vrabel
Sent: Friday, December 08, 2000 9:31 AM
To: mtd@infradead.org
Subject: Requesting module even when it's compiled in


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





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
