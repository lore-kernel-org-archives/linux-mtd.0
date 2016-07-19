Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPXAF-0004jt-6W
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 15:42:31 +0000
Received: by mail-pa0-x244.google.com with SMTP id ez1so1534756pab.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 08:42:10 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: nand: Get rid of needless 'goto'
Date: Tue, 19 Jul 2016 08:41:44 -0700
Message-Id: <1468942904-26464-2-git-send-email-andrew.smirnov@gmail.com>
In-Reply-To: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using "goto" in that "switch" statement only makes it harder to follow
control flow and doesn't bring any advantages. Rewrite the code to avoid
using "goto".

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 57043a6..8fa5536 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2139,18 +2139,15 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	case MTD_OPS_PLACE_OOB:
 	case MTD_OPS_AUTO_OOB:
 	case MTD_OPS_RAW:
+		if (!ops->datbuf)
+			ret = nand_do_read_oob(mtd, from, ops);
+		else
+			ret = nand_do_read_ops(mtd, from, ops);
 		break;
-
 	default:
-		goto out;
+		break;
 	}
 
-	if (!ops->datbuf)
-		ret = nand_do_read_oob(mtd, from, ops);
-	else
-		ret = nand_do_read_ops(mtd, from, ops);
-
-out:
 	nand_release_device(mtd);
 	return ret;
 }
-- 
2.5.5
