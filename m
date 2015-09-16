Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcB1n-0004rH-6V
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 11:37:32 +0000
Received: by wicgb1 with SMTP id gb1so69630167wic.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2015 04:37:08 -0700 (PDT)
From: Alex Smith <alex@alex-smith.me.uk>
To: linux-mtd@lists.infradead.org
Cc: Alex Smith <alex@alex-smith.me.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Paul Burton <paul.burton@imgtec.com>,
 Niklas Cassel <niklas.cassel@axis.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Subject: [PATCH v6 0/4] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Wed, 16 Sep 2015 12:36:53 +0100
Message-Id: <1442403417-5288-1-git-send-email-alex@alex-smith.me.uk>
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

This version of the series is based on 4.3-rc1.

Review and feedback welcome.

Thanks,
Alex

Alex Smith (4):
  mtd: nand: increase ready wait timeout and report timeouts
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
  MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  51 +++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  26 ++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 348 +++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 375 +++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |  33 +-
 9 files changed, 927 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.5.2
