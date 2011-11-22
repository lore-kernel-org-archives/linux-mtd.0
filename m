Received: from [192.195.68.30] (helo=denmail01.apm.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSkRI-0006ik-2v
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 07:06:44 +0000
From: Tanmay Inamdar <tinamdar@apm.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/2] MTD: NAND: ndfc: fix compilation error
Date: Tue, 22 Nov 2011 11:50:50 +0530
Message-Id: <1321942850-20012-1-git-send-email-tinamdar@apm.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tanmay Inamdar <tinamdar@apm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes compilation error in ndfc flash driver
---
 drivers/mtd/nand/ndfc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index ee17139..f8aacf4 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -188,7 +188,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (!flash_np)
 		return -ENODEV;
 
-	ppdata->of_node = flash_np;
+	ppdata.of_node = flash_np;
 	ndfc->mtd.name = kasprintf(GFP_KERNEL, "%s.%s",
 			dev_name(&ndfc->ofdev->dev), flash_np->name);
 	if (!ndfc->mtd.name) {
-- 
1.6.1.rc3
