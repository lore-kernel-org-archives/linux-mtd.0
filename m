Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13mcbV-0004dk-00
	for mtd-list@infradead.org; Fri, 20 Oct 2000 14:53:01 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13mcbU-0004de-00
	for mtd@infradead.org; Fri, 20 Oct 2000 14:53:00 +0100
Received: from cotw.com (IDENT:samcconn@ptecdev2.ptec.com [192.168.10.4])
	by cvsftp.cotw.com (8.9.3/8.9.3) with ESMTP id IAA30419
	for <mtd@infradead.org>; Fri, 20 Oct 2000 08:51:06 -0500
Message-ID: <39F04F40.893560CA@cotw.com>
Date: Fri, 20 Oct 2000 08:57:20 -0500
From: S A McConnell <samcconn@cotw.com>
Reply-To: samcconn@cotw.com
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Intel Strata Flash (Question)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have been having some problems erasing and programming a 32-Mb Strata
Flash

Every once in a while after issuing a command I get 0x80ffff in the
status register. This of course causes my software to believe the
command has finished and that every possible error that could occur has
occured.

For example, here is some output from a 'software' chip erase.

Erasing block: 0x0
Erasing block: 0x40000
Erasing block: 0x80000
Erasing block: 0xc0000
Erasing block: 0x100000
***Error: Program or set error. Status= 0x80ffff
***Error: Clear or erase error. Status= 0x80ffff
***Error: Voltage range error. Status= 0x80ffff
***Error: Device protection error. Status= 0x80ffff
Erasing block: 0x140000
Erasing block: 0x180000
Erasing block: 0x1c0000
Erasing block: 0x200000

...


Has anyone else seen this?


Thanks,
Scott


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
