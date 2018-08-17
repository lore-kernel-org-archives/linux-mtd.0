Received: from mail-eopbgr720082.outbound.protection.outlook.com
 ([40.107.72.82] helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqefY-00023D-Bu
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2018 13:20:01 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <kyungmin.park@samsung.com>,
 <absahu@codeaurora.org>, <peterpandong@micron.com>,
 <frieder.schrempf@exceet.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michals@xilinx.com>, <nagasureshkumarrelli@gmail.com>, Naga Sureshkumar
 Relli <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v10 0/2] Add support for Arasan NAND Flash controller
Date: Fri, 17 Aug 2018 18:49:22 +0530
Message-ID: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

This patch series adds the basic driver support for Arasan NAND Flash
controller.
We are reinitiating the patch series by fixing the comments given by
Miquel and Boris.
Major changes are exec_op() implementation related.
Rebased to 4.19 nand tree.
Tested MT29F32G08ABCDBJ4.

Naga Sureshkumar Relli (2):
  dt-bindings: mtd: arasan: Add device tree binding documentation
  mtd: rawnand: arasan: Add support for Arasan NAND Flash Controller

 .../devicetree/bindings/mtd/arasan_nand.txt        |   38 +
 drivers/mtd/nand/raw/Kconfig                       |    8 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/arasan_nand.c                 | 1350 ++++++++++++++++++++
 4 files changed, 1397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt
 create mode 100644 drivers/mtd/nand/raw/arasan_nand.c

-- 
2.7.4
