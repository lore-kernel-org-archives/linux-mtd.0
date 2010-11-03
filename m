Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDb0S-0000dB-AE
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 10:55:54 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 3/3] mtd: onenand: implement cache program feature for 4kb
	page onenand
Date: Wed,  3 Nov 2010 12:55:21 +0200
Message-Id: <1288781721-31771-4-git-send-email-roman.tereshonkov@nokia.com>
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

Implement cache program feature for 4KB page onenand.
This feature improves the write data performance.
The observed 128KB data program speed change is
from 8827KB/s to 14156 KB/s when the feature is enabled.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |   22 +++++++++++++++++++---
 1 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 6b3a875..4d6e6c5 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1845,7 +1845,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	const u_char *buf = ops->datbuf;
 	const u_char *oob = ops->oobbuf;
 	u_char *oobbuf;
-	int ret = 0;
+	int ret = 0, cmd;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
 		__func__, (unsigned int) to, (int) len);
@@ -1954,7 +1954,19 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			ONENAND_SET_NEXT_BUFFERRAM(this);
 		}
 
-		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
+		this->ongoing = 0;
+		cmd = ONENAND_CMD_PROG;
+
+		/* Exclude 1st OTP and OTP blocks for cache program feature */
+		if (ONENAND_IS_CACHE_PROGRAM(this) &&
+		    likely(onenand_block(this, to) != 0) &&
+		    ONENAND_IS_4KB_PAGE(this) &&
+		    ((written + thislen) < len)) {
+			cmd = ONENAND_CMD_2X_CACHE_PROG;
+			this->ongoing = 1;
+		}
+
+		this->command(mtd, cmd, to, mtd->writesize);
 
 		/*
 		 * 2 PLANE, MLC, and Flex-OneNAND wait here
@@ -3377,8 +3389,10 @@ static void onenand_check_features(struct mtd_info *mtd)
 	case ONENAND_DEVICE_DENSITY_4Gb:
 		if (ONENAND_IS_DDP(this))
 			this->options |= ONENAND_HAS_2PLANE;
-		else if (numbufs == 1)
+		else if (numbufs == 1) {
 			this->options |= ONENAND_HAS_4KB_PAGE;
+			this->options |= ONENAND_HAS_CACHE_PROGRAM;
+		}
 
 	case ONENAND_DEVICE_DENSITY_2Gb:
 		/* 2Gb DDP does not have 2 plane */
@@ -3415,6 +3429,8 @@ static void onenand_check_features(struct mtd_info *mtd)
 		printk(KERN_DEBUG "Chip has 2 plane\n");
 	if (this->options & ONENAND_HAS_4KB_PAGE)
 		printk(KERN_DEBUG "Chip has 4KiB pagesize\n");
+	if (this->options & ONENAND_HAS_CACHE_PROGRAM)
+		printk(KERN_DEBUG "Chip has cache program feature\n");
 }
 
 /**
-- 
1.7.0.4
