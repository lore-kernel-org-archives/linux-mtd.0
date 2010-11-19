Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PJMlC-0005YP-KA
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2010 08:55:59 +0000
From: Jason Liu <r64343@freescale.com>
To: <David.Woodhouse@intel.com>
Subject: [PATCH 1/1] mtd: nand: add check for out of page read
Date: Fri, 19 Nov 2010 16:40:45 +0800
Message-ID: <1290156045-11719-1-git-send-email-r64343@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When run mtd_oobtest case, there will be one error for step(4),
which turned out it need add one check for out of page read in
nand_do_read_oob just like mtd_do_write_oob did it already.
This commit also fix one typo error for comments in mtd_do_write_oob

Signed-off-by: Jason Liu <r64343@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1f75a1b..75d199e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1782,6 +1782,13 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	else
 		len = mtd->oobsize;
 
+	/* Do not allow read past end of page */
+	if ((ops->ooboffs + readlen) > len) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to read "
+				"past end of page\n", __func__);
+		return -EINVAL;
+	}
+
 	if (unlikely(ops->ooboffs >= len)) {
 		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to start read "
 					"outside oob\n", __func__);
@@ -2377,7 +2384,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EINVAL;
 	}
 
-	/* Do not allow reads past end of device */
+	/* Do not allow write past end of device */
 	if (unlikely(to >= mtd->size ||
 		     ops->ooboffs + ops->ooblen >
 			((mtd->size >> chip->page_shift) -
-- 
1.7.0.4
