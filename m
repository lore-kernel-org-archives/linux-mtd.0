Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFV-0004qT-Hc
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:17 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 04/14] ubi: fastmap: Add UBI_FM_SB_PRESEEDED_FLG flag
Date: Wed, 13 Jun 2018 23:23:34 +0200
Message-Id: <20180613212344.11608-5-richard@nod.at>
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

This flag indicates that the fastmap was preseeded, which means
it was created offline by a tool such as ubinize which cannot know
the whole MTD state such as real size and bad blocks.
As consequence UBI has to take special care to use that fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi-media.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 6136a97f4844..be339fb924af 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -390,7 +390,11 @@ struct ubi_vtbl_record {
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
