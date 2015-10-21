Received: from mail-bl2on0115.outbound.protection.outlook.com ([65.55.169.115]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zp1I8-0002Zh-UH
 for linux-mtd@lists.infradead.org; Wed, 21 Oct 2015 21:51:30 +0000
From: Han Xu <b45815@freescale.com>
To: <shijie.huang@arm.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <b45815@freescale.com>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <hofrat@osadl.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vinod.koul@intel.com>, <dan.j.williams@intel.com>,
 <dmaengine@vger.kernel.org>
Subject: [PATCH v4 0/6] mtd: nand: gpmi: gpmi-nand DSM and bitflip support
Date: Wed, 21 Oct 2015 16:40:02 -0500
Message-ID: <1445463608-5836-1-git-send-email-b45815@freescale.com>
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

v1 ---> v2
change the erased page bitflip threshold to ecc strength in bitflip patch

v2 ---> v3
remove unnecessary function in mxs-dma
change the log message when legacy_set_geometry failed
fix the comment message for bitflip
add comma for all field entries

v3 ---> v4
code style change for indentation

Han Xu (4):
  mtd: nand: gpmi: may use minimum required ecc for 744 oobsize NAND
  mtd: nand: gpmi: add GPMI NAND support for i.MX7D
  mtd: nand: gpmi: correct bitflip for erased NAND page
  mtd: nand: gpmi: support NAND on i.MX6UL

Huang Shijie (2):
  mtd: nand: gpmi: add gpmi dsm supend/resume support
  dmaengine: mxs: support i.MX7D and deep sleep mode

 drivers/dma/mxs-dma.c                  |  64 ++++++++++++++--
 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  24 ++++--
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  15 +++-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 130 ++++++++++++++++++++++++++++-----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  14 +++-
 5 files changed, 208 insertions(+), 39 deletions(-)

-- 
1.9.1
