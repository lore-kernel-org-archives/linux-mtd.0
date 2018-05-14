Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIBau-0003Nt-Eo
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 11:24:51 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/8] ubi: fastmap: Add UBI_FM_SB_PRESEEDED_FLG flag
Date: Mon, 14 May 2018 13:24:16 +0200
Message-Id: <20180514112422.23988-3-richard@nod.at>
In-Reply-To: <20180514112422.23988-1-richard@nod.at>
References: <20180514112422.23988-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This flag indicates that the fastmap was preseeded, which means
it was created offline by a tool such as ubinize which cannot know
the whole MTD state such as real size and bad blocks.
As consequence UBI has to take special care to use that fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi-media.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index d25ced1285e2..5ebf40db922f 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -406,7 +406,11 @@ struct ubi_vtbl_record {
 #define UBI_FM_MIN_POOL_SIZE	8
 #define UBI_FM_MAX_POOL_SIZE	256
 
-#define UBI_FM_SB_FLG_MASK	0
+enum {
+	UBI_FM_SB_PRESEEDED_FLG	= 0x1,
+};
+
+#define UBI_FM_SB_FLG_MASK (UBI_FM_SB_PRESEEDED_FLG)
 
 /**
  * struct ubi_fm_sb - UBI fastmap super block
-- 
2.13.6
