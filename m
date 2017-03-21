Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGej-0000NO-Sq
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:04:48 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 00/13] mtd: nand: fsmc: fixes, improvements and cleanups
Date: Tue, 21 Mar 2017 11:03:52 +0100
Message-Id: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series brings a number of fixes, improvements and cleanups
to the fsmc MTD NAND driver.

The first patch is really a fix for the NAND bus width selection
through the Device Tree, which was broken since the Device Tree
support was added in the driver.

The next two patches add support for configuring the NAND controller
timings according to the connected NAND chip automatically.

The remaining patches are basically cleanups, removing useless code
and logic from the driver.

This patch series is based on v4.11-rc1.

Best regards,

Thomas

Thomas Petazzoni (13):
  mtd: nand: fsmc: fix NAND width handling
  mtd: nand: fsmc: rework fsmc_nand_setup() to use
    ->setup_data_interface()
  mtd: nand: fsmc: add support to use NAND timings
  mtd: nand: fsmc: move fsmc_nand_data definition
  mtd: nand: fsmc: remove ->select_bank() from fsmc_nand_platform_data
  mtd: nand: fsmc: remove fsmc_select_chip()
  mtd: nand: fmsc: kill {read,write}_dma_priv from
    fsmc_nand_platform_data
  mtd: nand: fsmc: kill {nr_,}partitions structure fields
  mtd: nand: fsmc: remove duplicate nand_set_flash_node()
  mtd: nand: fsmc: finally remove fsmc_nand_platform_data
  mtd: nand: fsmc: use devm_clk_get()
  mtd: nand: fsmc: remove unused definitions
  mtd: nand: fsmc: remove CONFIG_OF conditional

 drivers/mtd/nand/fsmc_nand.c | 342 ++++++++++++++++++++-----------------------
 1 file changed, 156 insertions(+), 186 deletions(-)

-- 
2.7.4
