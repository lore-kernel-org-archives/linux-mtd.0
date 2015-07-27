Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJinz-0006Vo-LW
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 13:51:02 +0000
From: Alex Smith <alex.smith@imgtec.com>
To: <linux-mtd@lists.infradead.org>
CC: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 <linux-kernel@vger.kernel.org>, Alex Smith <alex.smith@imgtec.com>
Subject: [PATCH v4 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
Date: Mon, 27 Jul 2015 14:50:16 +0100
Message-ID: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
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
mainline so it should be possible to compile test now.

This version of the series has been rebased on 4.2-rc4, and also adds
an additional patch to fix an issue that was encountered in the
external Ci20 3.18 kernel branch.

Review and feedback welcome.

Thanks,
Alex

Alex Smith (3):
  mtd: nand: increase ready wait timeout and report timeouts
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 354 +++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 376 +++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |  15 +-
 7 files changed, 849 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
2.4.6
