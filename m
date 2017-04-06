Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwAix-0005QA-28
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 16:57:33 +0000
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id B171F7A2D6
 for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2017 18:57:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 00/10] mtd: spi-nor: aspeed: support extensions
Date: Thu,  6 Apr 2017 18:56:38 +0200
Message-Id: <1491497808-25487-1-git-send-email-clg@kaod.org>
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

Here is a series extending the support for the Aspeed AST2500 and
AST2400 SMC driver. First is a couple of simple fixes, then comes
support for :

 - DMA which applies to the FMC (BMC Firmware) controller only.
 - Dual Data (Quad is not supported by the controller). The spi-nor
   table of chips is modified to activate DUAL mode on the chips used
   on OpenPOWER systems. 
 - Configuration of the segment registers defining the mapping windows
   of the chips on the AHB bus.
 - Command mode for reads. Reads are performed directly on the mapping
   windows of the chip on the AHB Bus.
 - Read mode optimization, calculating the best settings for a given
   chip (for the SPI controllers only)

Tested on:

 * OpenPOWER Palmetto (AST2400)
 * Evaluation board (AST2500) 
 * OpenPOWER Witherspoon (AST2500)
 * OpenPOWER Romulus (AST2500)
 * OpenPOWER Zaius (AST2500)

Thanks,

C.

Cédric Le Goater (9):
  mtd: spi-nor: aspeed: fix the AST2400 SMC window size
  mtd: spi-nor: aspeed: remove dummies from keep mask
  mtd: spi-nor: aspeed: add DMA support
  mtd: spi-nor: Add support for Macronix mx66l1g45g spi flash
  mtd: spi-nor: add SPI_NOR_DUAL_READ to some flash devices
  mtd: spi-nor: aspeed: configure chip window on AHB bus
  mtd: spi-nor: aspeed: use command mode for reads
  mtd: spi-nor: aspeed: link controller with the ahb clock
  mtd: spi-nor: aspeed: optimize read mode

Robert Lippert (1):
  mtd: spi-nor: aspeed: add support for SPI dual IO read mode

 drivers/mtd/spi-nor/aspeed-smc.c | 604 ++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/spi-nor.c    |   9 +-
 2 files changed, 595 insertions(+), 18 deletions(-)

-- 
2.7.4
