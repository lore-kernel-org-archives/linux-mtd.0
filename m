Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9NJK-0001Ok-9o
 for linux-mtd@lists.infradead.org; Tue, 31 Oct 2017 03:33:56 +0000
Received: by mail-io0-x243.google.com with SMTP id 97so32009343iok.7
 for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2017 20:33:31 -0700 (PDT)
From: motobud@gmail.com
To: boris.brezillon@free-electrons.com
Cc: Brent Taylor <motobud@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: nand: Fix writing mtdoops to nand flash.
Date: Mon, 30 Oct 2017 22:32:45 -0500
Message-Id: <20171031033246.8576-1-motobud@gmail.com>
In-Reply-To: <20171030042343.24551-1-motobud@gmail.com>
References: <20171030042343.24551-1-motobud@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Brent Taylor <motobud@gmail.com>

When mtdoops calls mtd_panic_write, it eventually calls
panic_nand_write in nand_base.c.  In order to properly
wait for the nand chip to be ready in panic_nand_wait,
the chip must first be selected.

When using the atmel nand flash controller, a panic
would occur due to a NULL pointer exception.

Signed-off-by: Brent Taylor <motobud@gmail.com>
---
Changes in v2:
  - drop deselecting the chip
  - move select_chip and panic_nand_wait after panic_nand_get_device

 drivers/mtd/nand/nand_base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 12edaae17d81..2093667e2bcb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2802,12 +2802,16 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	/* Wait for the device to get ready */
-	panic_nand_wait(mtd, chip, 400);
+	int chipnr = (int)(to >> chip->chip_shift);
 
 	/* Grab the device */
 	panic_nand_get_device(chip, mtd, FL_WRITING);
 
+	chip->select_chip(mtd, chipnr);
+
+	/* Wait for the device to get ready */
+	panic_nand_wait(mtd, chip, 400);
+
 	memset(&ops, 0, sizeof(ops));
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
-- 
2.14.2
