Received: from exsmtp01.microchip.com ([198.175.253.37]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWRhe-0006fB-T2
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 17:49:52 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 0/3] mtd: spi-nor: add support to SPI 1-2-2 and SPI 1-4-4
 protocols
Date: Wed, 25 Jan 2017 18:49:25 +0100
Message-ID: <cover.1485365439.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

this series of patches updates the spi-nor framework to add support to
more SPI protocols. Also the 3rd argument of spi_nor_scan() is changed so
we can now make the difference between read and write operations.
Indeed some SPI controllers may support Quad SPI protocols only for read
operations but not for write operations.

The new argument is designed so SPI controller drivers can precisely
describe their hardware capabilies to the spi-nor framework. In turn, this
framework selects the right SPI protocols, op code, number of dummy cycles
and so on for (Fast) Read and Page Program commands by computing the best
match between the SPI memory and controller hardware capabilities.

Please note that a spi_nor_basic_flash_parameter structure is also
introduced by this series. It's used to describe the hardware capabilities
and requirements of SPI memories. The structure fields are based on what
can be read from the SFDP Basic Flash Parameter table of the JESD216B
specification. Indeed this series of patch is also a base for a further
series which will add support to the SFDP tables in the spi-nor framework.

This series is based on the next branch of the spi-nor tree.

Best regards,

Cyrille

Cyrille Pitchen (3):
  mtd: spi-nor: add support of SPI protocols like SPI 1-2-2 and SPI
    1-4-4
  mtd: spi-nor: remove unused set_quad_mode() function
  mtd: m25p80: add support of SPI 1-2-2 and 1-4-4 protocols

 drivers/mtd/devices/m25p80.c          | 133 +++++++++++----
 drivers/mtd/spi-nor/aspeed-smc.c      |  22 +--
 drivers/mtd/spi-nor/atmel-quadspi.c   |  82 ++++++----
 drivers/mtd/spi-nor/cadence-quadspi.c |  18 ++-
 drivers/mtd/spi-nor/fsl-quadspi.c     |   8 +-
 drivers/mtd/spi-nor/hisi-sfc.c        |  31 +++-
 drivers/mtd/spi-nor/intel-spi.c       |   6 +-
 drivers/mtd/spi-nor/mtk-quadspi.c     |  16 +-
 drivers/mtd/spi-nor/nxp-spifi.c       |  21 +--
 drivers/mtd/spi-nor/spi-nor.c         | 295 +++++++++++++++++++++++++---------
 include/linux/mtd/spi-nor.h           | 163 +++++++++++++++++--
 11 files changed, 604 insertions(+), 191 deletions(-)

-- 
2.7.4
