Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Vgj-0001OP-K2
 for linux-mtd@lists.infradead.org; Fri, 11 Jul 2014 07:56:14 +0000
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: nand: add basic SDR NAND timings infrastructure
Date: Fri, 11 Jul 2014 09:49:40 +0200
Message-Id: <1405064982-11456-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

These two patches add SDR NAND timings definition and ONFI timing mode to
NAND timings converter.

This infrastructure will be used by NAND controller drivers to configure
their signal timings according to NAND chip capabilities.

Best Regards,

Boris

Boris BREZILLON (2):
  mtd: nand: define struct nand_timings
  mtd: nand: add ONFI timing mode to nand_timings converter

 drivers/mtd/nand/Makefile       |   2 +-
 drivers/mtd/nand/nand_timings.c | 250 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h        |  52 +++++++++
 3 files changed, 303 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/nand_timings.c

-- 
1.8.3.2
