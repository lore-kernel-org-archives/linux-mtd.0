Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSfZU-0000LH-Hu
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 09:58:54 +0000
Date: Fri, 30 Nov 2018 10:58:29 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marex@denx.de>
Subject: [GIT PULL] mtd: Fixes for 4.20-rc5
Message-ID: <20181130105829.0bbefe10@bbrezillon>
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

Here is the MTD fixes PR for 4.20-rc5.

Regards,

Boris

The following changes since commit 2e6e902d185027f8e3cb8b7305238f7e35d6a436:

  Linux 4.20-rc4 (2018-11-25 14:19:31 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.20-rc5

for you to fetch changes up to 40b412897ccb4b98b2cfb2a0aaabed58dd9e2086:

  mtd: nand: Fix memory allocation in nanddev_bbt_init() (2018-11-28 15:41:50 +0100)

----------------------------------------------------------------
NAND fixes:
- Fix BBT cache allocation done in nanddev_bbt_init()

SPI NOR fixes:
- Fix the erase type selection logic

----------------------------------------------------------------
Frieder Schrempf (1):
      mtd: nand: Fix memory allocation in nanddev_bbt_init()

Tudor Ambarus (1):
      mtd: spi-nor: fix erase_type array to indicate current map conf

 drivers/mtd/nand/bbt.c        |  3 ++-
 drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 3 deletions(-)	
