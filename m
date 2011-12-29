Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgIYG-0000ge-D5
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 16:09:57 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: onenand: kill unused variable
Date: Thu, 29 Dec 2011 18:11:47 +0200
Message-Id: <1325175108-7945-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Fix this gcc warning:

drivers/mtd/onenand/onenand_base.c: In function ‘onenand_block_markbad’:
drivers/mtd/onenand/onenand_base.c:2636:23: warning: unused variable ‘this’ [-Wunused-variable]

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/onenand/onenand_base.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index dd278a2..a061bc1 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2633,7 +2633,6 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
  */
 static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
-	struct onenand_chip *this = mtd->priv;
 	int ret;
 
 	ret = onenand_block_isbad(mtd, ofs);
-- 
1.7.7.3
