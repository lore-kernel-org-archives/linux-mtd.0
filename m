Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAlyK-0002fW-39
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 20:52:24 +0000
Received: by mail-yk0-f174.google.com with SMTP id 10so10265538ykt.5
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2015 12:52:01 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: default bitflip-reporting threshold to 75% of
 correction strength
Date: Mon, 12 Jan 2015 12:51:29 -0800
Message-Id: <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <54B38745.70007@atmel.com>
References: <54B38745.70007@atmel.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MTD API reports -EUCLEAN only if the maximum number of bitflips
found in any ECC block exceeds a certain threshold. This is done to
avoid excessive -EUCLEAN reports to MTD users, which may induce
additional scrubbing of data, even when the ECC algorithm in use is
perfectly capable of handling the bitflips.

This threshold can be controlled by user-space (via sysfs), to allow
users to determine what they are willing to tolerate in their
application. But it still helps to have sane defaults.

In recent discussion [1], it was pointed out that our default threshold
is equal to the correction strength. That means that we won't actually
report any -EUCLEAN (i.e., "bitflips were corrected") errors until there
are almost too many to handle. It was determined that 3/4 of the
correction strength is probably a better default.

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057259.html

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 816b5c1fd416..3f24b587304f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4171,7 +4171,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * properly set.
 	 */
 	if (!mtd->bitflip_threshold)
-		mtd->bitflip_threshold = mtd->ecc_strength;
+		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
 
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
-- 
1.9.1
