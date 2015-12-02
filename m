Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4AF2-0005NJ-CZ
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 16:26:53 +0000
From: Harvey Hunt <harvey.hunt@imgtec.com>
To: <linux-mtd@lists.infradead.org>
CC: <alex@alex-smith.me.uk>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <Zubair.Kakakhel@imgtec.com>,
 <linux-kernel@vger.kernel.org>, Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH v8 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Wed, 2 Dec 2015 16:26:14 +0000
Message-ID: <1449073577-28465-1-git-send-email-harvey.hunt@imgtec.com>
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

Hi,

This series adds support for the BCH controller and NAND devices on
the Ingenic JZ4780 SoC.

Tested on the MIPS Creator Ci20 board. All dependencies are now in
mainline.

This version of the series is based on 4.4-rc3.

As suggested by Boris [0], refactoring work has been done to treat NAND
chips as children nodes of the NAND controller.

Review and feedback welcome.

Thanks,

Harvey

[0] https://patchwork.ozlabs.org/patch/526818/

Alex Smith (3):
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
  MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  81 ++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  61 +++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  26 ++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 361 ++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 420 +++++++++++++++++++++
 8 files changed, 999 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.6.2
