Received: from mail-dm3nam05on0629.outbound.protection.outlook.com
 ([2a01:111:f400:fe51::629]
 helo=NAM05-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKyvD-000221-Ei
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 05:01:32 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <michals@xilinx.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasuresh12@gmail.com>, <robh@kernel.org>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v12 0/3] Add support for Arasan NAND Flash controller
Date: Fri, 9 Nov 2018 10:30:38 +0530
Message-ID: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

This patch series adds the basic driver support for Arasan NAND Flash controller.
We are reinitiating the patch series by fixing the comments given by Miquel and Boris.
Major changes are exec_op() implementation related.
Rebased to 4.19 nand tree.
Tested MT29F32G08ABCDBJ4.

As suggested by Boris, it also adds a new varaible called mode in struct nand_sdr_timings,
which will give directly the sdr operating mode. and it is useful for some controllers,
where we can set direclty the operating mode instead of timings.

Naga Sureshkumar Relli (3):
  dt-bindings: mtd: arasan: Add device tree binding documentation
  mtd: rawnand: Add an option to get sdr timing mode number
  mtd: rawnand: arasan: Add support for Arasan NAND Flash Controller

 .../devicetree/bindings/mtd/arasan_nand.txt        |   32 +
 drivers/mtd/nand/raw/Kconfig                       |    7 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/arasan_nand.c                 | 1238 ++++++++++++++++++++
 drivers/mtd/nand/raw/nand_timings.c                |    6 +
 include/linux/mtd/rawnand.h                        |    1 +
 6 files changed, 1285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nand.txt
 create mode 100644 drivers/mtd/nand/raw/arasan_nand.c

-- 
2.7.4
