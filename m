Received: from mail-sn1nam04on062e.outbound.protection.outlook.com
 ([2a01:111:f400:fe4c::62e]
 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fd9gk-000124-Fm
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 07:37:28 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <f.fainelli@gmail.com>, <mmayer@broadcom.com>, <rogerq@ti.com>,
 <ladis@linux-mips.org>, <ada@thorsis.co>, <honghui.zhang@mediatek.com>,
 <miquel.raynal@bootlin.com>, <linus.walleij@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasureshkumarrelli@gmail.com>, <michals@xilinx.com>, Naga Sureshkumar
 Relli <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v11 0/3] Add arm pl353 smc memory and nand driver for
 xilinx zynq soc
Date: Wed, 11 Jul 2018 13:06:49 +0530
Message-ID: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

The following patches add arm pl353 static memory controller driver and NAND
driver for Xilinx Zynq SoC. The arm pl353 smc supports two interfaces
i.e nand and NOR/SRAM memory interfaces. The current implementation supports
only a single SMC instance and nand specific configuration.

Xilinx Zynq TRM link:
http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf

ARM pl353 smc TRM link:
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/DDI0380G_smc_pl350_series_r2p1_trm.pdf

Tested Micron MT29F2G08ABAEAWP (On-die capable) and AMD/Spansion S34ML01G1.
This latest series make use of ->exec_op().

Naga Sureshkumar Relli (3):
  dt-bindings: memory: Add pl353 smc controller devicetree binding
    information
  memory: pl353: Add driver for arm pl353 static memory controller
  mtd: rawnand: pl353: Add basic driver for arm pl353 smc nand interface

 .../bindings/memory-controllers/pl353-smc.txt      |   47 +
 drivers/memory/Kconfig                             |   10 +
 drivers/memory/Makefile                            |    1 +
 drivers/memory/pl353-smc.c                         |  468 +++++++
 drivers/mtd/nand/raw/Kconfig                       |    7 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/pl353_nand.c                  | 1314 ++++++++++++++++++++
 include/linux/pl353-smc.h                          |   30 +
 8 files changed, 1878 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
 create mode 100644 drivers/memory/pl353-smc.c
 create mode 100644 drivers/mtd/nand/raw/pl353_nand.c
 create mode 100644 include/linux/pl353-smc.h

-- 
2.7.4
