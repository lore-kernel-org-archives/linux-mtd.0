Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjV6P-0004cq-U0
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 16:28:34 +0000
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
 by Websense Email Security Gateway with ESMTPS id BAA2D8CF1E6C6
 for <linux-mtd@lists.infradead.org>; Tue,  6 Oct 2015 17:28:04 +0100 (IST)
From: Harvey Hunt <harvey.hunt@imgtec.com>
To: <linux-mtd@lists.infradead.org>
CC: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH v7,0/3] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Tue, 6 Oct 2015 17:27:14 +0100
Message-ID: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
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

The first patch from this series was removed and sent individually
earlier today, as this was deemed more appropriate.

Original work was done by Alex Smith and the transition from
v6 -> v7 was done by me.

Thanks,

Harvey

Alex Smith (3):
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
  MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND device tree nodes

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  61 ++++
 arch/mips/boot/dts/ingenic/ci20.dts                |  54 +++
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  26 ++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 349 +++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 384 +++++++++++++++++++++
 8 files changed, 924 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.6.0
