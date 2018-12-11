Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWcoO-0004zX-7g
 for linux-mtd@lists.infradead.org; Tue, 11 Dec 2018 07:50:38 +0000
From: Vignesh R <vigneshr@ti.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut
 <marek.vasut@gmail.com>
CC: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>, Rob Herring
 <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Vignesh R
 <vigneshr@ti.com>
Subject: [PATCH v2 0/2] cadence-quadspi: Add Octal mode support
Date: Tue, 11 Dec 2018 13:21:04 +0530
Message-ID: <20181211075106.21317-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adds support for OSPI version of Cadence QSPI controller IP.
Based on top of [1][2] that add Octal mode support in spi-nor core:

[1] https://patchwork.ozlabs.org/patch/1006717/
[2] https://patchwork.ozlabs.org/patch/1006715/

Changes:
v2:
spi-nor core patches dropped, are now part of Yogesh's series [1]
Declare Octal mode capability based on compatible.

Vignesh R (2):
  dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
  mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

 .../bindings/mtd/cadence-quadspi.txt          |  1 +
 drivers/mtd/spi-nor/cadence-quadspi.c         | 54 ++++++++++++++-----
 2 files changed, 43 insertions(+), 12 deletions(-)

-- 
2.19.2
