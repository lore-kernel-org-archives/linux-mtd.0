Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fddW2-0000Dt-6C
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 15:28:23 +0000
Date: Thu, 12 Jul 2018 17:28:09 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: Fixes for 4.18-rc5
Message-ID: <20180712172809.02c08c34@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Linus,

Here is the MTD fixes PR for 4.18-rc5.

Regards,

Boris

The following changes since commit 021c91791a5e7e85c567452f1be3e4c2c6cb6063:

  Linux 4.18-rc3 (2018-07-01 16:04:53 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.18-rc5

for you to fetch changes up to aa7eee8a143a7e8b530eb1e75fb86cae793d1e21:

  mtd: spi-nor: cadence-quadspi: Fix direct mode write timeouts (2018-07-03 10:01:44 +0200)

----------------------------------------------------------------
SPI NOR fixes:
- Fix a timeout in the cadence QSPI controller driver

----------------------------------------------------------------
Vignesh R (1):
      mtd: spi-nor: cadence-quadspi: Fix direct mode write timeouts

 drivers/mtd/spi-nor/cadence-quadspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
