Received: from 100.red-80-36-174.pooles.rima-tde.net ([80.36.174.100]
	helo=beta.iqc-services.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kg2g-0007gQ-DT
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 09:22:38 +0100
Received: from amavis by beta.iqc-services.com with scanned-ok (Exim 4.20 #1
	(OpenNA Linux))	id 19kg22-00030f-Q6
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 10:21:58 +0200
Received: from devil.iqc-services.local ([192.168.197.3]
	helo=devil.teleline.es)
	by beta.iqc-services.com with esmtp (Exim 4.20 #1 (OpenNA Linux))
	id 19kg22-00030W-4v
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 10:21:58 +0200
Message-Id: <5.2.1.1.2.20030807101847.00bfc310@pop3.iqc-services.com>
Date: Thu, 07 Aug 2003 10:22:14 +0200
To: linux-mtd@lists.infradead.org
From: Marcos Lois =?iso-8859-1?Q?Berm=FAdez?= <securez@teleline.es>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: I have a NOR and NAND flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello i will start to add support for the new revision of the Dragonix 
board. Now in the board we have a NOR flash (i already have this flash chip 
working), and a NAND chip also a SmartMedia slot.

My question is:

Can i setup mtd to work with both types of memories NOR and NAND, there are 
any example to do this?
How i can implement the SmartMedia slot, to allow hot plug of the 
smartmedia cards?

Any hel are apreciated.

Regards.
