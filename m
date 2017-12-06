Received: from mail-by2nam01on0068.outbound.protection.outlook.com
 ([104.47.34.68] helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMUsi-0001KG-1u
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:16:42 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [RFC 00/10] mtd: spi-nor: Update spi-nor framework
Date: Wed, 6 Dec 2017 13:45:31 +0530
Message-ID: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

SPI-NOR framework currently supports-
 - (1-1-1, 1-1-2, 1-1-4) read protocols
 - read latency(dummy cycles) are hardcoded with the assumption
 that the flash would support it.
 - Number of mode cycles/bits is also hardcoded, but the mode bits
 may be different for different Flashes and they also differ for
 different commands.
 - Additionally the existing framework selects the slowest read protocol
 combination supported by the controller and the Flash.

This patch set add support of 1-2-2, 1-4-4 read protocols. 
It choose the fastest available read protocol. It adds a provision to
configure the read latency (dummy cycles) based on the Flash memory
device. 

This patch also adds support of S25FS-S flash family with required
mode bits(required number of mode cycles). To allow dummy cycle
configuration in flash, new APIs have been added to read/write any register.

Finally it update fsl-quadspi binding to support different modes
(Single, dual, quad) of controller and update its capability
structure. This capability register is used by spi-nor framework
in defining right supported flash configurations.


Prabhakar Kushwaha (10):
  mtd: spi-nor: Add support of 1-2-2, 1-4-4 IO READ protocols
  mtd: spi-nor: Use the highest supported READ protocol
  mtd: spi-nor: Configure read latency for read commands
  mtd: spi-nor: Configure read latency for micron flashes
  Documentation: binding: Update fsl-quadspi binding
  mtd: spi-nor: Update hwcap based on mode of fsl-quadspi
  mtd: spi-nor: Add support of read/write any reg commands
  mtd: spi-nor: Add support of SPANSION S25FS-S flash
  mtd: spi-nor: Disable hybrid mode for SPANSION S25FS-S family
  mtd: spi-nor: Implement anyreg functions for fsl-quadspi

 .../devicetree/bindings/mtd/fsl-quadspi.txt        |   4 +
 drivers/mtd/spi-nor/fsl-quadspi.c                  |  47 ++++-
 drivers/mtd/spi-nor/spi-nor.c                      | 196 +++++++++++++++++++--
 include/linux/mtd/spi-nor.h                        |  19 ++
 4 files changed, 247 insertions(+), 19 deletions(-)

-- 
2.7.4
