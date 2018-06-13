Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFi-0004u5-O6
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:38 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 06/14] ubi: fastmap: Handle bad block count for preseeded
 fastmap case
Date: Wed, 13 Jun 2018 23:23:36 +0200
Message-Id: <20180613212344.11608-7-richard@nod.at>
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

If the fastmap is preseeded the bad block count is created while
scanning for bad blocks in the PEB fixup code.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 279d02874297..69b855b3cf2a 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -725,7 +725,16 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 	}
 
 	ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
-	ai->bad_peb_count = be32_to_cpu(fmhdr->bad_peb_count);
+
+	if (fm->flags & UBI_FM_SB_PRESEEDED_FLG) {
+		/* When we have a preseeded Fastmap we cannot use the provided bad block number */
+		if (be32_to_cpu(fmhdr->bad_peb_count) != 0) {
+			ubi_err(ubi, "Bad block count in preseeded Fastmap is non-zero");
+			goto fail_bad;
+		}
+	} else {
+		ai->bad_peb_count = be32_to_cpu(fmhdr->bad_peb_count);
+	}
 
 	/* Iterate over all volumes and read their EBA table */
 	for (i = 0; i < be32_to_cpu(fmhdr->vol_count); i++) {
-- 
2.13.6
