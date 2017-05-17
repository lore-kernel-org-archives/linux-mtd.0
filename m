Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dArgp-0003aI-Pu
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 05:40:06 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com, andrew@lunn.ch,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/4] mtd: mchp23k256: device tree and mchp23lcv1024
Date: Wed, 17 May 2017 17:39:04 +1200
Message-Id: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
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

Chris Packham (4):
  mtd: mchp23k256: Add OF device ID table
  mtd: mchp23k256: switch to mtd_device_register()
  mtd: mchp23k256: add partitioning support
  mtd: mchp23k256: Add support for mchp23lcv1024

 .../bindings/mtd/microchip,mchp23k256.txt          | 18 +++++++++++
 drivers/mtd/devices/mchp23k256.c                   | 37 +++++++++++++++++++---
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt

-- 
2.11.0.24.ge6920cf
