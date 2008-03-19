Received: from mk-filter-4-a-1.mail.uk.tiscali.com ([212.74.100.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jc5iA-0003Ex-3y
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 21:20:38 +0000
Received: from [192.168.62.105] ([192.168.62.105])
	by newgolddream.info (8.14.1/8.14.1/Debian-8ubuntu1) with ESMTP id
	m2JLKFpW030390
	for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2008 21:20:16 GMT
Subject: [Fwd: [PATCH] 0/2 Add support for maple "Visual Memory Unit" on
	SEGA Dreamcast]
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Wed, 19 Mar 2008 21:20:10 +0000
Message-Id: <1205961610.6276.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Apologies: sent it to the wrong address for this list before

The VMU is a small (approx 128K) hotpluggable flash device on the SEGA Dreamcast.

To get this to work I have had to rewrite parts of the maple bus driver - some of that
is bug fixing (in the sense that the bus driver was not allowing proper probing, just
forcing the load of the appropriate driver) - the main functional change is to add a
semaphore to the maple device (to ensure that devices can properly inject maple packets
into the queue of packets waiting to be dispatched via DMA to the devices themselves).

Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>


 drivers/mtd/maps/Kconfig     |   14 +
 drivers/mtd/maps/Makefile    |    1 +
 drivers/mtd/maps/vmu_flash.c |  746 ++++++++++++++++++++++++++++++++++++++++++
 drivers/sh/maple/maple.c     |  113 ++++---
 include/linux/maple.h        |    2 +


