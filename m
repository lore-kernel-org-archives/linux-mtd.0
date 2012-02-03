Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtFgc-0006LC-8K
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 09:44:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] mtd: nftlcore: remove out-of-date and now irrelevant
 piece of code
Date: Fri,  3 Feb 2012 11:44:06 +0200
Message-Id: <1328262247-11391-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328262247-11391-1-git-send-email-dedekind1@gmail.com>
References: <1328262247-11391-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nftlcore.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index a75382a..c5f4ebf 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -56,13 +56,6 @@ static void nftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (memcmp(mtd->name, "DiskOnChip", 10))
 		return;
 
-	if (!mtd_can_have_bb(mtd)) {
-		printk(KERN_ERR
-"NFTL no longer supports the old DiskOnChip drivers loaded via docprobe.\n"
-"Please use the new diskonchip driver under the NAND subsystem.\n");
-		return;
-	}
-
 	pr_debug("NFTL: add_mtd for %s\n", mtd->name);
 
 	nftl = kzalloc(sizeof(struct NFTLrecord), GFP_KERNEL);
-- 
1.7.9
