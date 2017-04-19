Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0qAJ-000503-Ka
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 14:01:09 +0000
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 960E04E139
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 16:00:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/2] mtd: spi-nor: add new definitions to chip table
Date: Wed, 19 Apr 2017 16:00:18 +0200
Message-Id: <1492610420-12397-1-git-send-email-clg@kaod.org>
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

Here are a couple of patches adding new definitions to the spi-nor
chip table.

Thanks,

C.

Cédric Le Goater (2):
  mtd: spi-nor: Add support for Macronix mx66l1g45g spi flash
  mtd: spi-nor: add Dual and Quad read mode support to some flash
    devices

 drivers/mtd/spi-nor/spi-nor.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.7.4
