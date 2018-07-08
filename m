Received: from smtp47.i.mail.ru ([94.100.177.107])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fc7tR-0007B4-GP
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 11:30:19 +0000
From: Sergey Larin <cerg2010cerg2010@mail.ru>
To: 
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH 0/2] fix regressions in DoC G4 driver
Date: Sun,  8 Jul 2018 14:29:22 +0300
Message-Id: <cover.1531045014.git.cerg2010cerg2010@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

docg4 driver became broken and these patches will make it work again.

Sergey Larin (2):
  mtd: rawnand: docg4: fix NULL deref while probing
  mtd: rawnand: docg4: specify bits_per_cell

 drivers/mtd/nand/raw/docg4.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.18.0
