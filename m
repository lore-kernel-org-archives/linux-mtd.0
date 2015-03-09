Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUwL8-0006mL-Ov
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 11:59:19 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
Subject: [PATCH_V2 0/2] mtd: nand: jz4780: Add nand and bch driver
Date: Mon, 9 Mar 2015 11:58:17 +0000
Message-ID: <1425902299-53967-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Zubair.Kakakhel@imgtec.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Two patches based on 4.0-rc3 that add NAND and BCH controller
drivers for the Ingenic JZ4780 SoC.

Core JZ4780 support is still in-flight.

Review and feedback welcome.

V1 - > V2
Fixed module license macros
Rebase to 4.0-rc3


Thanks,
ZubairLK

Alex Smith (2):
  dt-bindings: binding for jz4780-{nand,bch}
  mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs

 .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
 drivers/mtd/nand/Kconfig                           |   7 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/jz4780_bch.c                      | 358 ++++++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  42 +++
 drivers/mtd/nand/jz4780_nand.c                     | 372 +++++++++++++++++++++
 6 files changed, 837 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c

-- 
1.9.1
