Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFONQ-00079M-Az
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 16:50:29 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 7C0CB500F6
 for <linux-mtd@lists.infradead.org>; Fri,  9 Dec 2016 17:49:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 0/5] Static memory controllers for the Aspeed SoC
Date: Fri,  9 Dec 2016 17:49:22 +0100
Message-Id: <1481302167-28044-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Here is a serie introducing a new driver for the different memory
controllers of the Aspeed AST2500 and AST2400 SoCs. Each SoC has at
least a memory controller for the BMC firmware and another one for the
host firmware. The register set are mostly comptatible but there are
some slight differences on the AST2400.

The driver only support SPI type flash.

Tested on:

 * OpenPOWER Palmetto (AST2400) with
 	FMC controller : n25q256a
	SPI controller : mx25l25635e and n25q512ax3

 * Evaluation board (AST2500) with
 	FMC controller : w25q256 
	SPI controller : w25q256

 * OpenPOWER Witherspoon (AST2500) with
 	FMC controller : mx25l25635e * 2
	SPI controller : mx66l1g45g

Changes since v2:
 - splitted patch to distinguish AST2400 and AST2500 controllers
 - fixed controller names
 - introduced prepare/unprepare ops
 - introduced a aspeed_smc_setup_flash() routine
 - various cleanups

Changes since v1:
 - added a set4b ops to handle difference in the controllers
 - simplified the IO routines
 - prepared for fast read using dummy cycles

Work in progress:
 - read optimization using higher SPI clock frequencies
 - command mode to direct reads from AHB
 - DMA support

Thanks,

C.

Cédric Le Goater (5):
  mtd: spi-nor: add memory controllers for the Aspeed AST2500 SoC
  mtd: aspeed: add memory controllers for the Aspeed AST2400 SoC
  mtd: aspeed: used a label property
  mtd: spi-nor: bindings for the Aspeed memory controllers
  mtd: spi-nor: add a label property to jedec,spi-nor

 .../devicetree/bindings/mtd/aspeed-smc.txt         |  51 ++
 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |   2 +
 drivers/mtd/spi-nor/Kconfig                        |  10 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/aspeed-smc.c                   | 770 +++++++++++++++++++++
 5 files changed, 834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
 create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c

-- 
2.7.4
