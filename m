Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KNAW-0006qW-00
	for mtd-list@infradead.org; Thu, 03 Aug 2000 16:44:24 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13KNAV-0006qQ-00
	for mtd@infradead.org; Thu, 03 Aug 2000 16:44:24 +0100
Message-ID: <39899405.CAB92AA4@arcom.co.uk>
Date: Thu, 03 Aug 2000 16:47:17 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Messages produced by cfi_probe.c and cfi_cmdset_0001.c
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

cfi_probe.c and cfi_cmdset_0001.c both produce large quantities of
output when probing. (eg all of the CFI query data).  Is is necessary? 
Can I remove it (comment it out,#ifdef, debug only messages etc.)?

Also, in cfi_cmdset_0001.c in
cfi_intelext_write_{2_by_8,1_by_16}_buffers() we always write a full
buffer even if we have less than a buffer to write.  This affects
performace (particularly when writing short <32byte buffers).  Is there
a reason why this is done like this?

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
