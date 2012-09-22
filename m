Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFJ0a-00085W-Dd
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 06:16:12 +0000
Received: by pbbrq8 with SMTP id rq8so9415481pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2012 23:16:06 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: onenand: Make flexonenand_set_boundary static
Date: Sat, 22 Sep 2012 11:42:31 +0530
Message-Id: <1348294351-27182-1-git-send-email-sachin.kamat@linaro.org>
Cc: patches@linaro.org, sachin.kamat@linaro.org,
 artem.bityutskiy@linux.intel.com, dedekind1@gmail.com,
 Kyungmin Park <kyungmin.park@samsung.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes the following sparse warning:
drivers/mtd/onenand/onenand_base.c:3697:5: warning:
symbol 'flexonenand_set_boundary' was not declared. Should it be static?

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/onenand/onenand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 7153e0d..b3f41f2 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3694,7 +3694,7 @@ static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start, int
  * flexonenand_set_boundary	- Writes the SLC boundary
  * @param mtd			- mtd info structure
  */
-int flexonenand_set_boundary(struct mtd_info *mtd, int die,
+static int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 				    int boundary, int lock)
 {
 	struct onenand_chip *this = mtd->priv;
-- 
1.7.4.1
