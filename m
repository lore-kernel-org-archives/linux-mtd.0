Received: from 12.mo4.mail-out.ovh.net ([178.33.104.253])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1Ai8-0003jO-7A
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 11:57:22 +0000
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0D9845F61E
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 13:56:55 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/4] mtd: spi-nor: aspeed: add dual read and command mode
 support
Date: Thu, 20 Apr 2017 13:56:33 +0200
Message-Id: <1492689397-4704-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Here is a short series adding support for Dual read and for the
controller mode "Command". The later is to perform direct memory
access of the flash contents on the AHB Bus. A prereq to use this mode
is to configure the segment registers of the controller which define
the mapping window of the chips on the AHB bus.

Thanks,

C.

Cédric Le Goater (3):
  mtd: spi-nor: aspeed: remove dummies from keep mask
  mtd: spi-nor: aspeed: configure chip window on AHB bus
  mtd: spi-nor: aspeed: use command mode for reads

Robert Lippert (1):
  mtd: spi-nor: aspeed: add support for SPI dual IO read mode

 drivers/mtd/spi-nor/aspeed-smc.c | 205 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 194 insertions(+), 11 deletions(-)

-- 
2.7.4
