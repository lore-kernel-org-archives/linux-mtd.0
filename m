Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12YY35-0008L5-00
	for mtd-list@infradead.org; Fri, 24 Mar 2000 17:39:03 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12YY34-0008Kz-00
	for mtd@infradead.org; Fri, 24 Mar 2000 17:39:02 +0000
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12YY3c-0004VD-00
	for mtd@infradead.org; Fri, 24 Mar 2000 17:39:36 +0000
Received: from localhost ([127.0.0.1] helo=devel2.axiom.internal)
	by devel2.axiom.internal with esmtp (Exim 1.90 #1)
	for mtd@infradead.org
	id 12YY3c-0003Fr-00; Fri, 24 Mar 2000 17:39:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Booting from DiskOnChip
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 24 Mar 2000 17:39:36 +0000
Message-ID: <12514.953919576@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


We're getting there, slowly....

    GRUB  version 0.5.94  (639K lower / 130048K upper memory)

 [ Minimal BASH-like line editing is supported.  For the first word, TAB
   lists possible command completions.  Anywhere else TAB lists the possible
   completions of a device/filename. ]

grub> root=(dc)
DiskOnChip 2000 found at d0000
DiskOnChip NAND chip size: 8Mb
Total of 5 chips found - total capacity 40 Mb
Scanning for NFTL Media Header
NFTL Media Header found in flash sector 96
NFTL Media Header found in flash sector 112



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
