Received: from mail-bl2nam02on0052.outbound.protection.outlook.com
 ([104.47.38.52] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew3y9-0005b6-1q
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 10:49:23 +0000
From: <nagasureshkumarrelli@gmail.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <cyrille.pitchen@wedev4u.fr>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michals@xilinx.com>, <punnaia@xilinx.com>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>
Subject: [LINUX PATCH v8 0/2] Add arm pl353 smc nand driver for xilinx zynq soc
Date: Wed, 14 Mar 2018 16:18:00 +0530
Message-ID: <1521024480-30588-1-git-send-email-nagasureshkumarrelli@gmail.com>
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

From: Naga Sureshkumar Relli <nagasure@xilinx.com>

This latest series make use of ->exec_op() . Referenced the marvel driver as
pointed by Miquel. Sorry for the long delay to send v8.

The following patches add arm pl353 static memory controller driver for
xilinx zynq soc. The arm pl353 smc supports two interfaces i.e nand and
nor/sram memory interfaces. The current implementation supports only a
single SMC instance and nand specific configuration.

xilinx zynq TRM link:
http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf

ARM pl353 smc TRM link:
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/
DDI0380G_smc_pl350_series_r2p1_trm.pdf

Tested Micron MT29F2G08ABAEAWP (On-die capable) and AMD/Spansion S34ML01G1.
The v7 patch series can be found here (https://lkml.org/lkml/2015/6/8/499)

Naga Sureshkumar Relli (2):
  Documentation: nand: pl353: Add documentation for controller and
    driver
  mtd: rawnand: pl353: Add basic driver for arm pl353 smc nand interface

 Documentation/mtd/nand/pl353-nand.txt |   92 +++
 drivers/mtd/nand/raw/Kconfig          |    8 +
 drivers/mtd/nand/raw/Makefile         |    1 +
 drivers/mtd/nand/raw/pl353_nand.c     | 1363 +++++++++++++++++++++++++++++++++
 4 files changed, 1464 insertions(+)
 create mode 100644 Documentation/mtd/nand/pl353-nand.txt
 create mode 100644 drivers/mtd/nand/raw/pl353_nand.c

-- 
2.7.4
