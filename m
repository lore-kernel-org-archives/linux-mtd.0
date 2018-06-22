Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWKxt-0004QC-TJ
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 12:15:00 +0000
Received: from player792.ha.ovh.net (unknown [10.109.120.107])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id C7C1F1C49E5
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2018 14:14:38 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-aspeed@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/4] mtd: spi-nor: aspeed: introduce optimized settings for
 fast reads
Date: Fri, 22 Jun 2018 14:14:13 +0200
Message-Id: <20180622121417.6762-1-clg@kaod.org>
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

This series adds support for faster reads on the Aspeed SoC SMC (FMC
and SPI) controllers using a SPI timing calibration sequence to select
the best settings.
 
Thanks,

C.

 Changes since last time this was discussed (06/2017)

 - the "spi-max-frequency" property is now used to cap the results
 - chips on FMC controllers are also covered

Cédric Le Goater (4):
  mtd: spi-nor: aspeed: use command mode for reads
  mtd: spi-nor: aspeed: add support for SPI dual IO read mode
  mtd: spi-nor: aspeed: retrieve the ABH clock frequency
  mtd: spi-nor: aspeed: introduce optimized settings for fast reads

 drivers/mtd/spi-nor/aspeed-smc.c | 294 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 281 insertions(+), 13 deletions(-)

-- 
2.13.6
