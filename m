Received: from mail-bn1bon0145.outbound.protection.outlook.com
 ([157.56.111.145] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRXeL-0000bh-D5
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 03:33:22 +0000
From: Han Xu <b45815@freescale.com>
To: <shijie.huang@arm.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <b45815@freescale.com>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <hofrat@osadl.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vinod.koul@intel.com>, <dan.j.williams@intel.com>,
 <dmaengine@vger.kernel.org>
Subject: [PATCH v2 0/6] mtd: nand: gpmi: gpmi-nand DSM and bitflip support
Date: Mon, 17 Aug 2015 22:24:25 -0500
Message-ID: <1439868265-24701-1-git-send-email-b45815@freescale.com>
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

send the patchs to Huang Shijie's latest e-mail address

v1 ---> v2
change the erased page bitflip threshold to ecc strength in bitflip patch


Han Xu (4):
  mtd: nand: gpmi: may use minimum required ecc for 744 oobsize NAND
  mtd: nand: gpmi: add GPMI NAND support for i.MX7D
  mtd: nand: gpmi: correct bitflip for erased NAND page
  mtd: nand: gpmi: support NAND on i.MX6UL

Huang Shijie (2):
  mtd: nand: gpmi: add gpmi dsm supend/resume support
  dmaengine: mxs: support i.MX7D and deep sleep mode

 drivers/dma/mxs-dma.c                  |  73 +++++++++++++++++--
 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  24 +++++--
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  15 ++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 126 ++++++++++++++++++++++++++++-----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  14 +++-
 5 files changed, 215 insertions(+), 37 deletions(-)

-- 
1.9.1
