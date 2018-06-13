Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFi-0004u7-Nk
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:37 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 07/14] ubi: fastmap: Fixup pool sizes for preseeded fastmaps
Date: Wed, 13 Jun 2018 23:23:37 +0200
Message-Id: <20180613212344.11608-8-richard@nod.at>
In-Reply-To: <20180613212344.11608-1-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A preseeded fastmap has, by definition, no dirty PEBs and therefore all
pools are empty. The creation tool can also not calculate the maximal
pool sizes. This means we have to set them during attach.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 69b855b3cf2a..976d371d7cef 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -645,8 +645,15 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 	pool_size = be16_to_cpu(fmpl->size);
 	wl_pool_size = be16_to_cpu(fmpl_wl->size);
-	fm->max_pool_size = be16_to_cpu(fmpl->max_size);
-	fm->max_wl_pool_size = be16_to_cpu(fmpl_wl->max_size);
+
+	if (fm->flags & UBI_FM_SB_PRESEEDED_FLG) {
+		fm->max_pool_size = ubi->fm_pool.max_size;
+		fm->max_wl_pool_size = ubi->fm_wl_pool.max_size;
+
+	} else {
+		fm->max_pool_size = be16_to_cpu(fmpl->max_size);
+		fm->max_wl_pool_size = be16_to_cpu(fmpl_wl->max_size);
+	}
 
 	if (pool_size > UBI_FM_MAX_POOL_SIZE || pool_size < 0) {
 		ubi_err(ubi, "bad pool size: %i", pool_size);
-- 
2.13.6
