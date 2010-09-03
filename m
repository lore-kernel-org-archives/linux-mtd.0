Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OrTcd-0003yC-L6
	for linux-mtd@lists.infradead.org; Fri, 03 Sep 2010 10:35:56 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand/davinci: relax a timeout for ECC-initialization
Date: Fri,  3 Sep 2010 12:35:37 +0200
Message-Id: <1283510137-23573-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1283382898.2209.62.camel@brekeke>
References: <1283382898.2209.62.camel@brekeke>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	Sneha Narnakaje <nsnehaprabha@ti.com>, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sudhakar found out that 100us are enough. Sadly, his updated patch was
overlooked and an older version still using 100ms was merged. Fix this.

Reference: http://patchwork.ozlabs.org/patch/59180/

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---

Artem, if you pick up this one, too, then we have what Sudhakar sent as
v3 of his original patch. Except for some minor rewording in the comment.

Sudhakar, I hope it is okay if I send this patch now. I just want to have
the confusion about the different versions gone.

 drivers/mtd/nand/davinci_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 53f864a..1ad0eed 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -313,7 +313,7 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
 	u32 syndrome[4];
 	u32 ecc_state;
 	unsigned num_errors, corrected;
-	unsigned long timeo = jiffies + msecs_to_jiffies(100);
+	unsigned long timeo;
 
 	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
 	for (i = 0; i < 10; i++) {
@@ -373,6 +373,7 @@ compare:
 	 * long as ECC_STATE reads less than 4. After that, ECC HW has entered
 	 * correction state.
 	 */
+	timeo = jiffies + usecs_to_jiffies(100);
 	do {
 		ecc_state = (davinci_nand_readl(info,
 				NANDFSR_OFFSET) >> 8) & 0x0f;
-- 
1.7.1
