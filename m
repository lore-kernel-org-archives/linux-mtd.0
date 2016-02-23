Received: from mail-he1eur01on061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::61c]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYMGL-0004gx-8w
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 23:21:03 +0000
From: Han Xu <han.xu@nxp.com>
To: <shijie.huang@arm.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@nxp.com>, <standby24x7@gmail.com>,
 <jkosina@suse.cz>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <fransklaver@gmail.com>, <hofrat@osadl.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] support gpmi on i.MX6UL/7D and HW bitflip on i.MX6QP/7D
Date: Tue, 23 Feb 2016 17:04:48 -0600
Message-ID: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
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

add support for gpmi nand on i.MX6UL and i.MX7D, document the related
properties in DT and add the HW bitflip detection and correction for
i.MX6QP and i.MX7D.

The two document related patch are new and other three patches have no code
change.

Han Xu (5):
  mtd: nand: gpmi: add GPMI NAND support for i.MX7D
  mtd: nand: gpmi: document the clocks and clock-names in DT property
  mtd: nand: gpmi: correct bitflip for erased NAND page
  mtd: nand: gpmi: support NAND on i.MX6UL
  mtd: nand: gpmi: document the new supported chip in DT

 .../devicetree/bindings/mtd/gpmi-nand.txt          | 12 ++++-
 drivers/mtd/nand/gpmi-nand/bch-regs.h              | 24 ++++++---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              | 15 ++++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 60 +++++++++++++++++++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             | 14 +++--
 5 files changed, 104 insertions(+), 21 deletions(-)

-- 
1.9.1
