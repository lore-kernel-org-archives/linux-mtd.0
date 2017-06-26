Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPWeN-0006AW-MS
 for linux-mtd@lists.infradead.org; Mon, 26 Jun 2017 16:14:09 +0000
From: matthew.gerlach@linux.intel.com
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH 0/3] Altera Quadspi Controller Version 2
Date: Mon, 26 Jun 2017 09:13:36 -0700
Message-Id: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Hi Everyone,

This patch set adds support for Version 2 of the Altera
Quadspi Controller.  Version 1 of the Altera Quadspi
Controller only supported 1 byte of flash id instead of
the 3 bytes required for a JEDEC ID.  As such the driver
for Version 1 was rejected.  Please see 
https://patchwork.kernel.org/patch/7025681

Patch 1: add device tree bindings document for platform driver

Patch 2: add core code for driver

Patch 3: add platform driver

Matthew Gerlach (3):
  ARM: dts: Bindings for Altera Quadspi Controller Version 2
  mtd: spi-nor: core code for the Altera Quadspi Flash Controller v2
  mtd: spi-nor: Altera Quadspi Flash Controller v2 Platform driver

 .../devicetree/bindings/mtd/altera-quadspi-v2.txt  |  37 ++
 MAINTAINERS                                        |   8 +
 drivers/mtd/spi-nor/Kconfig                        |  10 +
 drivers/mtd/spi-nor/Makefile                       |   5 +-
 drivers/mtd/spi-nor/altera-quadspi-platform.c      | 137 +++++
 drivers/mtd/spi-nor/altera-quadspi.c               | 676 +++++++++++++++++++++
 include/linux/mtd/altera-quadspi.h                 |  28 +
 7 files changed, 900 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
 create mode 100644 drivers/mtd/spi-nor/altera-quadspi-platform.c
 create mode 100644 drivers/mtd/spi-nor/altera-quadspi.c
 create mode 100644 include/linux/mtd/altera-quadspi.h

-- 
2.7.4
