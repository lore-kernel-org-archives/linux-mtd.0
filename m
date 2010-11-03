Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDb0S-0000d8-A6
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 10:55:53 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 2/3] mtd: onenand: fix omap2 code to handle cache program
	feature
Date: Wed,  3 Nov 2010 12:55:20 +0200
Message-Id: <1288781721-31771-3-git-send-email-roman.tereshonkov@nokia.com>
In-Reply-To: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: kyungmin.park@samsung.com, Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some fixes are introduced into omap2 code to handle errors when
cache program feature is used.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/omap2.c |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 9f322f1..da25a90 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -108,8 +108,9 @@ static void wait_warn(char *msg, int state, unsigned int ctrl,
 static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 {
 	struct omap2_onenand *c = container_of(mtd, struct omap2_onenand, mtd);
+	struct onenand_chip *this = mtd->priv;
 	unsigned int intr = 0;
-	unsigned int ctrl;
+	unsigned int ctrl, ctrl_mask;
 	unsigned long timeout;
 	u32 syscfg;
 
@@ -180,7 +181,8 @@ retry:
 			if (result == 0) {
 				/* Timeout after 20ms */
 				ctrl = read_reg(c, ONENAND_REG_CTRL_STATUS);
-				if (ctrl & ONENAND_CTRL_ONGO) {
+				if (ctrl & ONENAND_CTRL_ONGO &&
+				    !this->ongoing) {
 					/*
 					 * The operation seems to be still going
 					 * so give it some more time.
@@ -269,7 +271,11 @@ retry:
 		return -EIO;
 	}
 
-	if (ctrl & 0xFE9F)
+	ctrl_mask = 0xFE9F;
+	if (this->ongoing)
+		ctrl_mask &= ~0x8000;
+
+	if (ctrl & ctrl_mask)
 		wait_warn("unexpected controller status", state, ctrl, intr);
 
 	return 0;
-- 
1.7.0.4
