Received: from mail-sn1nam01on0078.outbound.protection.outlook.com
 ([104.47.32.78] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQTEB-0002vm-Dg
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 07:51:33 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>, <wmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <f.fainelli@gmail.com>, <mmayer@broadcom.com>, <rogerq@ti.com>,
 <ladis@linux-mips.org>, <ada@thorsis.com>, <honghui.zhang@mediatek.com>,
 <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasureshkumarrelli@gmail.com>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v9 0/4] Add arm pl353 smc memory and nand driver for
 xilinx zynq soc
Date: Wed, 6 Jun 2018 13:19:38 +0530
Message-ID: <1528271382-21690-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

The following patches add arm pl353 static memory controller driver and nand driver
for xilinx zynq soc. The arm pl353 smc supports two interfaces i.e nand and nor/sram
memory interfaces. The current implementation supports only a single SMC
instance and nand specific configuration.

xilinx zynq TRM link:
http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf

ARM pl353 smc TRM link:
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/DDI0380G_smc_pl350_series_r2p1_trm.pdf

Tested Micron MT29F2G08ABAEAWP (On-die capable) and AMD/Spansion S34ML01G1.
This latest series make use of ->exec_op() . Referenced the marvel driver
as pointed by Miquel.

Naga Sureshkumar Relli (4):
  Devicetree: Add pl353 smc controller devicetree binding information
  memory: pl353: Add driver for arm pl353 static memory controller
  Documentation: nand: pl353: Add documentation for controller and
    driver
  mtd: rawnand: pl353: Add basic driver for arm pl353 smc nand interface

 .../bindings/memory-controllers/pl353-smc.txt      |   53 +
 Documentation/mtd/nand/pl353-nand.txt              |   99 ++
 drivers/memory/Kconfig                             |    8 +
 drivers/memory/Makefile                            |    1 +
 drivers/memory/pl353-smc.c                         |  523 +++++++++
 drivers/mtd/nand/raw/Kconfig                       |    7 +
 drivers/mtd/nand/raw/Makefile                      |    3 +
 drivers/mtd/nand/raw/pl353_nand.c                  | 1236 ++++++++++++++++++++
 include/linux/platform_data/pl353-smc.h            |   29 +
 9 files changed, 1959 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
 create mode 100644 Documentation/mtd/nand/pl353-nand.txt
 create mode 100644 drivers/memory/pl353-smc.c
 create mode 100644 drivers/mtd/nand/raw/pl353_nand.c
 create mode 100644 include/linux/platform_data/pl353-smc.h

-- 
2.7.4
