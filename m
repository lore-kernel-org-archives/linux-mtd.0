Received: from mail-sn1nam02on0070.outbound.protection.outlook.com
 ([104.47.36.70] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePOHY-0001JW-W6
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 07:50:20 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <cyrille.pitchen@wedev4u.fr>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <michals@xilinx.com>, <punnaia@xilinx.com>,
 <nagasuresh12@gmail.com>
Subject: [PATCH v8 0/2] Add support for Arasan NAND Flash controller
Date: Thu, 14 Dec 2017 13:19:04 +0530
Message-ID: <20171214074906.2147-1-nagasure@xilinx.com>
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
Boris and Rob.

Previous Patch reference:
https://lkml.org/lkml/2017/1/8/245

Naga Sureshkumar Relli (2):
  mtd: arasan: Add device tree binding documentation
  mtd: nand: Add support for Arasan NAND Flash Controller

 .../devicetree/bindings/mtd/arasan_nand.txt        |   38 +
 drivers/mtd/nand/Kconfig                           |    8 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/arasan_nand.c                     | 1020 ++++++++++++++++++++
 4 files changed, 1067 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt
 create mode 100644 drivers/mtd/nand/arasan_nand.c

-- 
2.13.0
