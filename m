Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S6g1f-0001Ek-0Z
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2012 10:29:20 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers/mtd: docg3 fix writebufsize
Date: Sun, 11 Mar 2012 11:28:46 +0100
Message-Id: <1331461726-10087-2-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1331461726-10087-1-git-send-email-robert.jarzmik@free.fr>
References: <1331461726-10087-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The docg3 drivers lacked mtd writebufsize initialization. Without it,
ubifs cannot work.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index bd9e992..c30b56a 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1822,6 +1822,7 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	if (docg3->reliable == 2)
 		mtd->erasesize /= 2;
 	mtd->writesize = DOC_LAYOUT_PAGE_SIZE;
+	mtd->writebufsize = DOC_LAYOUT_PAGE_SIZE;
 	mtd->oobsize = DOC_LAYOUT_OOB_SIZE;
 	mtd->owner = THIS_MODULE;
 	mtd->erase = doc_erase;
-- 
1.7.5.4
