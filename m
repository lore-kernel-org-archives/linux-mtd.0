Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQM0s-0000HH-GL
 for linux-mtd@lists.infradead.org; Thu, 21 Jul 2016 22:00:15 +0000
Received: by mail-pf0-x244.google.com with SMTP id h186so6071354pfg.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2016 14:59:54 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] mtd: nand: Get rid of needless 'goto'
Date: Thu, 21 Jul 2016 14:59:21 -0700
Message-Id: <1469138361-14173-4-git-send-email-andrew.smirnov@gmail.com>
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

Using "goto" and "switch" statement only makes it harder to follow
control flow and doesn't bring any advantages. Rewrite the code to avoid
using "goto".

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

No changes since v2.

 drivers/mtd/nand/nand_base.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 93f5432..777152b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2122,7 +2122,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops)
 {
-	int ret = -ENOTSUPP;
+	int ret;
 
 	ops->retlen = 0;
 
@@ -2133,24 +2133,18 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 		return -EINVAL;
 	}
 
-	nand_get_device(mtd, FL_READING);
-
-	switch (ops->mode) {
-	case MTD_OPS_PLACE_OOB:
-	case MTD_OPS_AUTO_OOB:
-	case MTD_OPS_RAW:
-		break;
+	if (ops->mode != MTD_OPS_PLACE_OOB &&
+	    ops->mode != MTD_OPS_AUTO_OOB &&
+	    ops->mode != MTD_OPS_RAW)
+		return -ENOTSUPP;
 
-	default:
-		goto out;
-	}
+	nand_get_device(mtd, FL_READING);
 
 	if (!ops->datbuf)
 		ret = nand_do_read_oob(mtd, from, ops);
 	else
 		ret = nand_do_read_ops(mtd, from, ops);
 
-out:
 	nand_release_device(mtd);
 	return ret;
 }
-- 
2.5.5
