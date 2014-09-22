Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW85x-0007zs-79
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 18:12:18 +0000
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/2] mtd: nand: support ONFI timings mode retrieval for
 non-ONFI NANDs
Date: Mon, 22 Sep 2014 20:11:49 +0200
Message-Id: <1411409511-4381-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Yassin Jaffer <yassinjaffer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Following the series adding ONFI timing mode support, here is a series
adding support for timing mode retrieval on non-ONFI NANDs.

It just adds a new field to the nand_chip and nand_flash_dev struct so
that anyone can define its chip requirements in the nand_ids table.

The 2nd patch serves as an example and adds an entry for the Hynix
H27UCG8T2ATR-BC NAND chip used on the Cubietruck board.

Best Regards,

Boris

Changes since v2:
- fix checkpatch warnings

Changes since v1:
- fix H27UCG8T2ATR-BC definition
- rename onfi_timing_mode_ds field into onfi_timing_mode_default

Boris BREZILLON (2):
  mtd: nand: support ONFI timing mode retrieval for non-ONFI NANDs
  mtd: nand: add Hynix's H27UCG8T2ATR-BC to nand_ids table

 drivers/mtd/nand/nand_base.c |  2 ++
 drivers/mtd/nand/nand_ids.c  |  4 ++++
 include/linux/mtd/nand.h     | 11 +++++++++++
 3 files changed, 17 insertions(+)

-- 
1.9.1
