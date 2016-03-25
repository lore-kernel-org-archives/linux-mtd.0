Received: from cmccmta3.chinamobile.com ([221.176.66.81])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajHhz-00023U-Jd
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 02:42:46 +0000
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 baiyaowei@cmss.chinamobile.com
Subject: [PATCH 0/5] drivers/mtd: make several functions return bool
Date: Fri, 25 Mar 2016 10:41:50 +0800
Message-Id: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series only make several funcitons return bool to improve
readability, no other funcitonal changes.

Yaowei Bai (5):
  drivers/mtd: mtd_is_partition can be boolean
  drivers/mtd: cfi_interleave_supported can be boolean
  drivers/mtd: map_bankwidth_supported can be boolean
  drivers/mtd: mtd_nand_has_bch can be boolean
  drivers/mtd/nand: nand_opcode_8bits can be boolean

 drivers/mtd/mtdpart.c          | 6 +++---
 include/linux/mtd/cfi.h        | 6 +++---
 include/linux/mtd/map.h        | 6 +++---
 include/linux/mtd/nand.h       | 6 +++---
 include/linux/mtd/nand_bch.h   | 4 ++--
 include/linux/mtd/partitions.h | 2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.9.1
