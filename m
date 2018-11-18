Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOTWz-0001vJ-Uq
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2018 20:18:58 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: fix Coverity integer handling issue
Date: Sun, 18 Nov 2018 21:18:31 +0100
Message-Id: <20181118201831.11636-2-miquel.raynal@bootlin.com>
In-Reply-To: <20181118201831.11636-1-miquel.raynal@bootlin.com>
References: <20181118201831.11636-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A Coverity robot reported an integer handling issue
(OVERFLOW_BEFORE_WIDEN) in the potentially overflowing expression:

    (mtd_div_by_ws(mtd->size, mtd) - mtd_div_by_ws(offs, mtd)) *
    mtd_oobavail(mtd, ops)

While such overflow will certainly never happen due to the numbers
handled, it is cleaner to fix this operation anyway.

The problem is that all the maths include 32-bit quantities, while the
result is stored in an explicit 64-bit value.

As maxooblen will just be compared with a size_t, let's change the
type of the variable to a size_t. This will not fix anything but will
clarify a bit the situation. Then, do an explicit cast to fix Coverity
warning.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 97ac219c082e..afb4b17fb670 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1136,13 +1136,13 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 		return -EINVAL;
 
 	if (ops->ooblen) {
-		u64 maxooblen;
+		size_t maxooblen;
 
 		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
 			return -EINVAL;
 
-		maxooblen = ((mtd_div_by_ws(mtd->size, mtd) -
-			      mtd_div_by_ws(offs, mtd)) *
+		maxooblen = ((size_t)(mtd_div_by_ws(mtd->size, mtd) -
+				      mtd_div_by_ws(offs, mtd)) *
 			     mtd_oobavail(mtd, ops)) - ops->ooboffs;
 		if (ops->ooblen > maxooblen)
 			return -EINVAL;
-- 
2.17.1
