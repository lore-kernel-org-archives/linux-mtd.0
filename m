Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQM0n-0000Gj-HI
 for linux-mtd@lists.infradead.org; Thu, 21 Jul 2016 22:00:10 +0000
Received: by mail-pf0-x242.google.com with SMTP id g202so6100920pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2016 14:59:51 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] mtd: nand: Error out if cmd_ctrl() is missing
Date: Thu, 21 Jul 2016 14:59:20 -0700
Message-Id: <1469138361-14173-3-git-send-email-andrew.smirnov@gmail.com>
In-Reply-To: <1469138361-14173-1-git-send-email-andrew.smirnov@gmail.com>
References: <1469138361-14173-1-git-send-email-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If no user specified chip->select_chip() function is provided, code in
nand_base.c will automatically set this hook to nand_select_chip(),
which in turn depends on chip->cmd_ctrl() hook being valid. Not
providing both of those functions in NAND controller driver (for example
by mistake) will result in a bit cryptic segfault. Same is true for
chip->cmdfunc().

To avoid the above scenario add a check in nand_scan_dent and error out
if cmd_ctrl() is not provided.

Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Suggested-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since v2:

	- Check moved to nand_scan_ident

 drivers/mtd/nand/nand_base.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ce7b2ca..93f5432 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3997,6 +3997,15 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	if (!mtd->name && mtd->dev.parent)
 		mtd->name = dev_name(mtd->dev.parent);
 
+	if ((!chip->cmdfunc || !chip->select_chip) && !chip->cmd_ctrl) {
+		/*
+		 * Default functions assigned for chip_select() and
+		 * cmdfunc() both expect cmd_ctrl() to be populated,
+		 * so we need to check that that's the case
+		 */
+		pr_err("chip.cmd_ctrl() callback is not provided");
+		return -EINVAL;
+	}
 	/* Set the default functions */
 	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
 
-- 
2.5.5
