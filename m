Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQpp8-0007mN-Oh
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 07:26:56 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: Fix mtd_check_oob_ops()
Date: Mon, 18 Dec 2017 08:26:28 +0100
Message-Id: <20171218072628.17977-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_check_oob_ops() helper verifies if the operation defined by the
user is correct.

Fix the check that verifies if the entire requested area exists. This
check is too restrictive and will fail anytime the last data byte of the
very last page is included in an operation.

Fixes: 5cdd929da53d ("mtd: Add sanity checks in mtd_write/read_oob()")
Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index f80e911b8843..73b605577447 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1114,7 +1114,7 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (!ops->oobbuf)
 		ops->ooblen = 0;
 
-	if (offs < 0 || offs + ops->len >= mtd->size)
+	if (offs < 0 || offs + ops->len > mtd->size)
 		return -EINVAL;
 
 	if (ops->ooblen) {
-- 
2.11.0
