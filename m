Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ1KG-0003fo-TI
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 22:50:21 +0000
Received: by pdco4 with SMTP id o4so24504003pdc.3
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 15:49:58 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFT PATCH 0/4] mtd: spi-nor: code refactoring and layering
Date: Thu, 13 Aug 2015 15:46:01 -0700
Message-Id: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I found a few areas where code should probably be refactored in the spi-nor
driver layering while reviewing drivers recently. I don't have hardware for
some of this, hence the Request For Test.

Potential future patch: push the MTD registration into a spi_nor_*() API. I
would have just merged it into spi_nor_scan() now, but there are occasionally a
few things that drivers want to do before exposing the MTD but after the SPI
NOR probing. Perhaps a bottom-half API, and an optional all-in-one API that
does both, similar to nand_base's nand_scan_ident(), nand_scan_tail(), and
nand_scan()?

Anyway, enough random musings. Happy reviewing/testing.

Brian

Brian Norris (4):
  mtd: fsl-quadspi: use automatic spi-nor detection
  mtd: spi-nor: assign mtd->priv in spi_nor_scan()
  mtd: spi-nor: add forward declaration for mtd_info
  mtd: spi-nor: embed struct mtd_info within struct spi_nor

 drivers/mtd/devices/m25p80.c      | 11 ++++-------
 drivers/mtd/spi-nor/fsl-quadspi.c | 19 +++++--------------
 drivers/mtd/spi-nor/nxp-spifi.c   |  7 ++-----
 drivers/mtd/spi-nor/spi-nor.c     |  9 +++++----
 include/linux/mtd/spi-nor.h       |  4 +++-
 5 files changed, 19 insertions(+), 31 deletions(-)

-- 
2.5.0.276.gf5e568e
