Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme6p-0006HW-Qv
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:46:35 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 05/46] mtd: Don't print a scary message when trying to
 remove a busy MTD
Date: Wed, 21 Sep 2016 11:46:05 +0200
Message-Id: <9a91cf325bae6b29b2e3fe38f8c33c93abf933af.1474450295.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Just return -EBUSY and everything is fine.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdcore.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b8205ec..32f1088 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -500,8 +500,6 @@ int del_mtd_device(struct mtd_info *mtd)
 	}
 
 	if (mtd->usecount) {
-		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
-		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
 		/* No need to get a refcount on the module containing
-- 
2.8.3
