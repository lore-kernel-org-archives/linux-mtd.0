Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1duwgd-0005iK-UB
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 08:18:22 +0000
Date: Thu, 21 Sep 2017 10:17:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: Fixes for 4.14-rc2
Message-ID: <20170921101744.0903215d@bbrezillon>
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

Here is my fixes PR for 4.14-rc2.

Regards,

Boris

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.14-rc2

for you to fetch changes up to 73600b619bf8b9803a0610624a0e11f5ed8f761e:

  mtd: nand: remove unused blockmask variable (2017-09-18 14:51:02 +0200)

----------------------------------------------------------------
SPI NOR:
 * Fix the SFDP parsing code (bugs reported by Geert Uytterhoeven)

NAND:
 * Fix a resource leak in the lpc32xx_mlc driver
 * Fix a build warning in the core

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: spi-nor: Check consistency of the memory size extracted from the SFDP

Christophe JAILLET (1):
      mtd: nand: lpc32xx_mlc: Fix an error handling path in lpc32xx_nand_probe()

Corentin Labbe (1):
      mtd: nand: remove unused blockmask variable

Cyrille Pitchen (1):
      mtd: spi-nor: fix DMA unsafe buffer issue in spi_nor_read_sfdp()

 drivers/mtd/nand/lpc32xx_mlc.c |  3 ++-
 drivers/mtd/nand/nand_base.c   |  3 +--
 drivers/mtd/spi-nor/spi-nor.c  | 45 ++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 6 deletions(-)
