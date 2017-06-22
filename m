Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNwNx-000740-6Y
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 07:18:39 +0000
Received: from player796.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 2E5BE9357E
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 09:18:14 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/2] mtd: spi-nor: aspeed: add dual read and command mode
 support
Date: Thu, 22 Jun 2017 09:18:01 +0200
Message-Id: <1498115883-31499-1-git-send-email-clg@kaod.org>
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

Quad read is only available on the AST2400 SPI controller and not on
any of the AST2500 controllers, I am pondering on the need for the
support. It needs some testing anyhow first.

Thanks,

C.

Changes since v1:

 - reintroduced the setting of the SPI NOR command in the control
   register, which was forgotten in the previous rebase of the patch.
 - reworked dual io support to fit the new spi-nor hwcaps
 - added dual address and data IO
 - took ownership due to the amount of rewritten code.

Cédric Le Goater (2):
  mtd: spi-nor: aspeed: add support for SPI dual IO read mode
  mtd: spi-nor: aspeed: use command mode for reads

 drivers/mtd/spi-nor/aspeed-smc.c | 80 ++++++++++++++++++++++++++++++++++------
 1 file changed, 68 insertions(+), 12 deletions(-)

-- 
2.7.5
