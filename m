Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRePi-0007xH-Ba
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:14:27 +0000
Received: by pdjz10 with SMTP id z10so27092658pdj.0
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:14:05 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/5] mtd: nand: misc BBT fixes
Date: Sat, 28 Feb 2015 02:13:08 -0800
Message-Id: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few assorted changes. Some of these are geared toward refactoring the BBT
code for being reused for SPI NAND.

If possible, I'd really like to get some testing for the diskonchip changes.
It's an old driver, but it appears as if some still use it. Perhaps Alexander
(CC'd) can report?

Brian Norris (5):
  mtd: nand_bbt: drop unnecessary header
  mtd: diskonchip: don't call nand_scan_bbt() directly
  mtd: nand_bbt: make nand_scan_bbt() static
  mtd: nand_bbt: unify/fix error handling in nand_scan_bbt()
  mtd: nand_bbt: fix theoretical integer overflow in BBT write

 drivers/mtd/nand/diskonchip.c | 27 ++++++++++++++++-----------
 drivers/mtd/nand/nand_bbt.c   | 24 ++++++++++++++----------
 include/linux/mtd/nand.h      |  1 -
 3 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.1.0
