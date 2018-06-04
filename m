Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPlaW-0006qv-Lk
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2018 09:15:43 +0000
Date: Mon, 4 Jun 2018 11:15:21 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 4.18
Message-ID: <20180604111521.7ea397dd@bbrezillon>
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

Hi all,

And now the SPI NOR PR for 4.18 which I also plan to merge in mtd/next
later this week.

Marek, can you have a quick look and let me know if you see something
odd in there.

Thanks,

Boris

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/spi-nor/for-4.18

for you to fetch changes up to 771ff17e82fac54686f149e311d4ea74a70255b1:

  mtd: spi-nor: Add support for EN25QH32 (2018-05-18 13:38:53 +0200)

----------------------------------------------------------------
Core changes:
- Add support for a bunch of SPI NOR chips
- Clear EAR reg when switching to 3-byte addressing mode on Winbond
  chips

SPI NOR controller driver changes:
- cadence: Add DMA support for direct mode reads
- hisi: Prefix a few functions with hisi_
- intel:
  * Mark the driver as "dangerous" in Kconfig
  * Fix atomic sequence handling
  * Pass a 40us delay (instead of 0us) to readl_poll_timeout()
- fsl:
  * fix a typo in a function name
  * add support for IP variants embedded in the ls2080a and ls1080a
    SoCs
- stm32: request exclusive control of the reset line

----------------------------------------------------------------
Ezequiel Garcia (1):
      mtd: spi-nor: hisi: Avoid generic function names

Hauke Mehrtens (1):
      mtd: spi-nor: Add support for XM25QH64A and XM25QH128A

Kimmo Rautkoski (1):
      mtd: spi-nor: Add support for is25wp series chips

Marek Vasut (1):
      mtd: spi-nor: add support for ISSI is25lp256

Mika Westerberg (2):
      mtd: spi-nor: intel-spi: Fix atomic sequence handling
      mtd: spi-nor: intel-spi: Explicitly mark the driver as dangerous in Kconfig

NeilBrown (1):
      mtd: spi-nor: clear Winbond Extended Address Reg on switch to 3-byte addressing.

Nicholas Mc Guire (1):
      mtd: spi-nor: intel: provide a range for poll_timout

Philipp Zabel (1):
      mtd: spi-nor: stm32-quadspi: explicitly request exclusive reset control

Stephen Douthit (1):
      mtd: spi-nor: Add Winbond w25q32jv support

Thor Thayer (1):
      mtd: spi-nor: Add Micron MT25QU02 support

Vignesh R (1):
      mtd: spi-nor: cadence-quadspi: Add DMA support for direct mode reads

Yogesh Gaur (2):
      mtd: spi-nor: fsl-quadspi: fix api naming typo _init_ahb_read
      mtd: spi-nor: fsl-quadspi: add support for ls2080a/ls1080a

YuheiOKAWA (1):
      mtd: spi-nor: Add support for EN25QH32

 drivers/mtd/spi-nor/Kconfig           |  4 +--
 drivers/mtd/spi-nor/cadence-quadspi.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/fsl-quadspi.c     | 15 ++++++++--
 drivers/mtd/spi-nor/hisi-sfc.c        | 12 ++++----
 drivers/mtd/spi-nor/intel-spi.c       | 80 ++++++++++++++++++++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/spi-nor.c         | 33 ++++++++++++++++++++
 drivers/mtd/spi-nor/stm32-quadspi.c   |  2 +-
 include/linux/mtd/spi-nor.h           |  2 ++
 8 files changed, 220 insertions(+), 24 deletions(-)


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
