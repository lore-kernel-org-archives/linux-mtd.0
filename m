Received: from mail-pb0-f41.google.com ([209.85.160.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1UAQUc-0007ht-Qh
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2013 19:47:15 +0000
Received: by mail-pb0-f41.google.com with SMTP id um15so2590465pbc.14
 for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2013 11:47:12 -0800 (PST)
From: Syam Sidhardhan <syamsidhardh@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: maps: Remove redundant NULL check before kfree
Date: Wed, 27 Feb 2013 01:16:56 +0530
Message-Id: <1361908016-3110-1-git-send-email-s.syam@samsung.com>
Cc: dwmw2@infradead.org, syamsidhardh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kfree on NULL pointer is a no-op.

Signed-off-by: Syam Sidhardhan <s.syam@samsung.com>
---
 drivers/mtd/maps/ck804xrom.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index 586a1c7..0455166 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -308,8 +308,7 @@ static int ck804xrom_init_one(struct pci_dev *pdev,
 
  out:
 	/* Free any left over map structures */
-	if (map)
-		kfree(map);
+	kfree(map);
 
 	/* See if I have any map structures */
 	if (list_empty(&window->maps)) {
-- 
1.7.9.5
