Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13USDJ-0001ai-00
	for mtd-list@infradead.org; Thu, 31 Aug 2000 12:08:57 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13USDI-0001ac-00
	for mtd@infradead.org; Thu, 31 Aug 2000 12:08:56 +0100
Message-ID: <39AE3D9E.27DF19E7@arcom.co.uk>
Date: Thu, 31 Aug 2000 12:12:30 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org, jffs-dev@axis.com
Subject: JFFS: df output is incorrected
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

The output of the df command is not correct for JFFS file systems.  It
appears to include the size of deleted files as well.

I know this is a trival problem that's probably not worth wasting time
on...

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
