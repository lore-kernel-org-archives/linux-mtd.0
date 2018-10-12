Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAxDx-0006Jx-R8
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 13:11:27 +0000
Date: Fri, 12 Oct 2018 15:11:13 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [GIT PULL] mtd: spi-nor: Changes for 4.20
Message-ID: <20181012151113.1b58457a@bbrezillon>
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

Hello,

Here is the spi-nor PR for 4.20.

Regards,

Boris

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/spi-nor/for-4.20

for you to fetch changes up to 41fe242979e463d6ad251077ded01b825a330b7e:

  mtd: spi-nor: fsl-quadspi: fix read error for flash size larger than 16MB (2018-10-12 11:48:19 +0200)

----------------------------------------------------------------
Core changes:
* Support non-uniform erase size
* Support controllers with limited TX fifo size

Driver changes:
* m25p80: Re-issue a WREN command after each write access
* cadence: Pass a proper dir value to dma_[un]map_single()
* fsl-qspi: Check fsl_qspi_get_seqid() return val make sure 4B
  addressing opcodes are properly handled
* intel-spi: Add a new PCI entry for Ice Lake

----------------------------------------------------------------
Ahmad Fatoum (1):
      mtd: spi-nor: fsl-quadspi: Don't let -EINVAL on the bus

Liu Xiang (1):
      mtd: spi-nor: fsl-quadspi: fix read error for flash size larger than 16MB

Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Ice Lake SPI serial flash

Nathan Chancellor (1):
      mtd: spi-nor: cadence-quadspi: Use proper enum for dma_[un]map_single

Tudor Ambarus (2):
      mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories
      mtd: spi-nor: parse SFDP Sector Map Parameter Table

Yogesh Gaur (2):
      mtd: spi-nor: Support controllers with limited TX FIFO size
      mtd: devices: m25p80: Make sure WRITE_EN is issued before each write

 drivers/mtd/devices/m25p80.c          |  23 +-
 drivers/mtd/spi-nor/cadence-quadspi.c |   4 +-
 drivers/mtd/spi-nor/fsl-quadspi.c     |  15 +-
 drivers/mtd/spi-nor/intel-spi-pci.c   |   1 +
 drivers/mtd/spi-nor/spi-nor.c         | 925 +++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h           | 119 ++++++++
 6 files changed, 1001 insertions(+), 86 deletions(-)


-- 
Boris Brezillon, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
