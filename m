Received: from mail-oa0-f52.google.com ([209.85.219.52])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U3B1B-0006bA-7q
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2013 19:50:53 +0000
Received: by mail-oa0-f52.google.com with SMTP id k14so1901012oag.25
 for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2013 11:50:49 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
From: Tejun Heo <tj@kernel.org>
To: akpm@linux-foundation.org
Subject: [PATCH 53/77] mtd: convert to idr_alloc()
Date: Wed,  6 Feb 2013 11:40:25 -0800
Message-Id: <1360179649-22465-54-git-send-email-tj@kernel.org>
In-Reply-To: <1360179649-22465-1-git-send-email-tj@kernel.org>
References: <1360179649-22465-1-git-send-email-tj@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to the much saner new idr interface.

Only compile tested.

Signed-off-by: Tejun Heo <tj@kernel.org>
Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/mtdcore.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index ec794a7..61d5f56 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -349,13 +349,8 @@ int add_mtd_device(struct mtd_info *mtd)
 	BUG_ON(mtd->writesize == 0);
 	mutex_lock(&mtd_table_mutex);
 
-	do {
-		if (!idr_pre_get(&mtd_idr, GFP_KERNEL))
-			goto fail_locked;
-		error = idr_get_new(&mtd_idr, mtd, &i);
-	} while (error == -EAGAIN);
-
-	if (error)
+	i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+	if (i < 0)
 		goto fail_locked;
 
 	mtd->index = i;
-- 
1.8.1
