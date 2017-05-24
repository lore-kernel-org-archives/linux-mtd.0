Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDg2F-0000HC-1P
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 23:49:49 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org, andrew@lunn.ch, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 0/5] mtd: mchp23k256: device tree and mchp23lcv1024
Date: Thu, 25 May 2017 11:49:11 +1200
Message-Id: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adds device tree support to the mchp23k256 driver and
support for the mchp23lcv1024 chip. I suspect there are more compatible
variants that we could now enumerate if desired.

Chris Packham (5):
  mtd: mchp23k256: Add OF device ID table
  mtd: mchp23k256: switch to mtd_device_register()
  mtd: handle partitioning on devices with 0 erasesize
  mtd: mchp23k256: add partitioning support
  mtd: mchp23k256: Add support for mchp23lcv1024

 .../bindings/mtd/microchip,mchp23k256.txt          | 18 +++++
 drivers/mtd/devices/mchp23k256.c                   | 78 ++++++++++++++++++----
 drivers/mtd/mtdpart.c                              | 25 ++++---
 3 files changed, 100 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt

-- 
2.13.0
