Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QtptN-0001BL-PX
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 23:51:26 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC 3/5] mtd: do not assume oobsize is power of 2
Date: Wed, 17 Aug 2011 16:50:27 -0700
Message-ID: <1313625029-19546-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previous generations of MTDs all used OOB sizes that were powers of 2,
(e.g., 64, 128). However, newer generations of flash, especially NAND,
use irregular OOB sizes that are not powers of 2 (e.g., 218, 224, 448).
This means we cannot use masks like "mtd->oobsize - 1" to assume that we
will get a proper bitmask for OOB operations.

As I see it, we don't actually need these masks anyway, so kill them.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 4488e9a..a0c404b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -411,7 +411,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 		return ret;
 
 	ops.ooblen = length;
-	ops.ooboffs = start & (mtd->oobsize - 1);
+	ops.ooboffs = start;
 	ops.datbuf = NULL;
 	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;
 
@@ -422,7 +422,6 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	if (IS_ERR(ops.oobbuf))
 		return PTR_ERR(ops.oobbuf);
 
-	start &= ~((uint64_t)mtd->oobsize - 1);
 	ret = mtd->write_oob(mtd, start, &ops);
 
 	if (ops.oobretlen > 0xFFFFFFFFU)
@@ -455,7 +454,7 @@ static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
 		return ret;
 
 	ops.ooblen = length;
-	ops.ooboffs = start & (mtd->oobsize - 1);
+	ops.ooboffs = start;
 	ops.datbuf = NULL;
 	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;
 
@@ -466,7 +465,6 @@ static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
 	if (!ops.oobbuf)
 		return -ENOMEM;
 
-	start &= ~((uint64_t)mtd->oobsize - 1);
 	ret = mtd->read_oob(mtd, start, &ops);
 
 	if (put_user(ops.oobretlen, retp))
-- 
1.7.0.4
