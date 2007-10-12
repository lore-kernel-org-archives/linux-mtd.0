Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IgEvR-0000pQ-GZ
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 08:27:15 +0100
Message-ID: <470F200A.9090404@nokia.com>
Date: Fri, 12 Oct 2007 10:19:38 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] MTD: OneNAND: Return only negative error codes
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The OneNAND driver was confusing JFFS2 by returning positive error
codes.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index f633941..a8c426b 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -327,7 +327,7 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n", ctrl);
 		if (ctrl & ONENAND_CTRL_LOCK)
 			printk(KERN_ERR "onenand_wait: it's locked error.\n");
-		return ctrl;
+		return -EIO;
 	}
 
 	if (interrupt & ONENAND_INT_READ) {
@@ -336,7 +336,7 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
 				printk(KERN_ERR "onenand_wait: ECC error = 0x%04x\n", ecc);
 				mtd->ecc_stats.failed++;
-				return ecc;
+				return -EBADMSG;
 			} else if (ecc & ONENAND_ECC_1BIT_ALL) {
 				printk(KERN_INFO "onenand_wait: correctable ECC error = 0x%04x\n", ecc);
 				mtd->ecc_stats.corrected++;
-- 
1.4.4.2
