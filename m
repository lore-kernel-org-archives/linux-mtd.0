Received: from mail-by2on0141.outbound.protection.outlook.com
 ([207.46.100.141] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVPXL-0001q3-3C
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 19:42:07 +0000
From: Han Xu <b45815@freescale.com>
To: <shijie.huang@arm.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <b45815@freescale.com>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <hofrat@osadl.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vinod.koul@intel.com>, <dan.j.williams@intel.com>,
 <dmaengine@vger.kernel.org>
Subject: [PATCH v3 0/6] mtd: nand: gpmi: gpmi-nand DSM and bitflip support
Date: Fri, 28 Aug 2015 14:32:39 -0500
Message-ID: <1440790365-28072-1-git-send-email-b45815@freescale.com>
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

Han Xu (4):
  mtd: nand: gpmi: may use minimum required ecc for 744 oobsize NAND
  mtd: nand: gpmi: add GPMI NAND support for i.MX7D
  mtd: nand: gpmi: correct bitflip for erased NAND page
  mtd: nand: gpmi: support NAND on i.MX6UL

Huang Shijie (2):
  mtd: nand: gpmi: add gpmi dsm supend/resume support
  dmaengine: mxs: support i.MX7D and deep sleep mode

 drivers/dma/mxs-dma.c                  |  64 +++++++++++++++--
 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  24 +++++--
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  15 ++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 128 ++++++++++++++++++++++++++++-----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  14 +++-
 5 files changed, 207 insertions(+), 38 deletions(-)

-- 
1.9.1
