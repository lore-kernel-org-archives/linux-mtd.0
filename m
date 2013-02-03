Received: from mail-pb0-f48.google.com ([209.85.160.48])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U1oHt-0005v7-Lc
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2013 01:22:30 +0000
Received: by mail-pb0-f48.google.com with SMTP id wy12so2686692pbc.7
 for <linux-mtd@lists.infradead.org>; Sat, 02 Feb 2013 17:22:27 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
From: Tejun Heo <tj@kernel.org>
To: akpm@linux-foundation.org
Subject: [PATCH 37/62] mtd: convert to idr_alloc()
Date: Sat,  2 Feb 2013 17:20:38 -0800
Message-Id: <1359854463-2538-38-git-send-email-tj@kernel.org>
In-Reply-To: <1359854463-2538-1-git-send-email-tj@kernel.org>
References: <1359854463-2538-1-git-send-email-tj@kernel.org>
Cc: axboe@kernel.dk, skinsbursky@parallels.com, rusty@rustcorp.com.au,
 jmorris@namei.org, linux-kernel@vger.kernel.org, bfields@fieldses.org,
 linux-mtd@lists.infradead.org, ebiederm@xmission.com,
 Tejun Heo <tj@kernel.org>, David Woodhouse <dwmw2@infradead.org>
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
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
This patch depends on an earlier idr changes and I think it would be
best to route these together through -mm.  Please holler if there's
any objection.  Thanks.

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
