Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPXAE-0004jo-MO
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 15:42:31 +0000
Received: by mail-pf0-x241.google.com with SMTP id h186so1603269pfg.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 08:42:10 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: nand: BUG_ON in case of no select_chip and cmd_ctrl
Date: Tue, 19 Jul 2016 08:41:43 -0700
Message-Id: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
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
by mistake) will result in a bit cryptic segfault. Replace it with
explicit BUG_ON statement so it would be obvious what went wrong.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ce7b2ca..57043a6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3128,8 +3128,10 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 	if (chip->waitfunc == NULL)
 		chip->waitfunc = nand_wait;
 
-	if (!chip->select_chip)
+	if (!chip->select_chip) {
+		BUG_ON(!chip->cmd_ctrl);
 		chip->select_chip = nand_select_chip;
+	}
 
 	/* set for ONFI nand */
 	if (!chip->onfi_set_features)
-- 
2.5.5
