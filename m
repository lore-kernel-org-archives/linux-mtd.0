Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1AW-0002uL-Pk
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 02:59:30 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE002SC8A98R30@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 11:58:57 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH 00/23] mtd: nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 11:58:57 +0900
Message-id: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message. For example,
k.alloc and v.alloc failures use dump_stack().

Jingoo Han (23):
      mtd: atmel_nand: Remove unnecessary OOM messages
      mtd: orion_nand: Remove unnecessary OOM messages
      mtd: sharpsl: Remove unnecessary OOM messages
      mtd: au1550nd: Remove unnecessary OOM messages
      mtd: bf5xx_nand: Remove unnecessary OOM messages
      mtd: cafe_nand: Remove unnecessary OOM messages
      mtd: cmx270_nand: Remove unnecessary OOM messages
      mtd: cs553x_nand: Remove unnecessary OOM messages
      mtd: diskonchip: Remove unnecessary OOM messages
      mtd: fsl_elbc_nand: Remove unnecessary OOM messages
      mtd: fsl_ifc_nand: Remove unnecessary OOM messages
      mtd: jz4740_nand: Remove unnecessary OOM messages
      mtd: pasemi_nand: Remove unnecessary OOM messages
      mtd: txx9ndfmc: Remove unnecessary OOM messages
      mtd: davinci_nand: Remove unnecessary OOM messages
      mtd: fsmc_nand: Remove unnecessary OOM messages
      mtd: nand-gpio: Remove unnecessary OOM messages
      mtd: lpc32xx_mlc: Remove unnecessary OOM messages
      mtd: lpc32xx_slc: Remove unnecessary OOM messages
      mtd: mpc5121_nfc: Remove unnecessary OOM messages
      mtd: plat_nand: Remove unnecessary OOM messages
      mtd: s3c2410: Remove unnecessary OOM messages
      mtd: sh_flctl: Remove unnecessary OOM messages

---
 drivers/mtd/nand/atmel_nand.c    |    4 +---
 drivers/mtd/nand/au1550nd.c      |    4 +---
 drivers/mtd/nand/bf5xx_nand.c    |    1 -
 drivers/mtd/nand/cafe_nand.c     |    4 +---
 drivers/mtd/nand/cmx270_nand.c   |    1 -
 drivers/mtd/nand/cs553x_nand.c   |    1 -
 drivers/mtd/nand/davinci_nand.c  |    4 +---
 drivers/mtd/nand/diskonchip.c    |    3 ---
 drivers/mtd/nand/fsl_elbc_nand.c |    1 -
 drivers/mtd/nand/fsl_ifc_nand.c  |    1 -
 drivers/mtd/nand/fsmc_nand.c     |    8 ++------
 drivers/mtd/nand/gpio.c          |    4 +---
 drivers/mtd/nand/jz4740_nand.c   |    4 +---
 drivers/mtd/nand/lpc32xx_mlc.c   |   10 ++--------
 drivers/mtd/nand/lpc32xx_slc.c   |    9 ++-------
 drivers/mtd/nand/mpc5121_nfc.c   |    4 +---
 drivers/mtd/nand/orion_nand.c    |    2 --
 drivers/mtd/nand/pasemi_nand.c   |    2 --
 drivers/mtd/nand/plat_nand.c     |    4 +---
 drivers/mtd/nand/s3c2410.c       |    2 --
 drivers/mtd/nand/sh_flctl.c      |    8 ++------
 drivers/mtd/nand/sharpsl.c       |    4 +---
 drivers/mtd/nand/txx9ndfmc.c     |    5 +----
