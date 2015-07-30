Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKrjm-0005N6-8e
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 17:35:23 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [RFC PATCH 0/2] mtd: nand: properly handle bitflips in erased pages
Date: Thu, 30 Jul 2015 19:34:52 +0200
Message-Id: <1438277694-23763-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

This is the patch series I promised a while ago.
The implementation should be generic enough to be used by controller
drivers.
The only problem I can see is for the GPMI controller which might produce
non byte aligned ECC data, and the nand_check_erased helpers are only
working with byte aligned buffers.

Best Regards,

Boris

Boris Brezillon (2):
  mtd: nand: add nand_check_erased helper functions
  mtd: nand: use nand_check_erased_ecc_chunk in default ECC read
    functions

 drivers/mtd/nand/nand_base.c | 167 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/nand.h     |   8 +++
 2 files changed, 167 insertions(+), 8 deletions(-)

-- 
1.9.1
