Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAwSm-0007Nu-Vn
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2015 08:36:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/3] UBI: Fix typo in comment
Date: Fri,  3 Jul 2015 10:36:15 +0200
Message-Id: <1435912576-27878-2-git-send-email-richard@nod.at>
In-Reply-To: <1435912576-27878-1-git-send-email-richard@nod.at>
References: <1435912576-27878-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While we are here fix a s/beween/between typo.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi-media.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index d0d072e..22ed3f6 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -500,7 +500,7 @@ struct ubi_fm_volhdr {
 /* struct ubi_fm_volhdr is followed by one struct ubi_fm_eba records */
 
 /**
- * struct ubi_fm_eba - denotes an association beween a PEB and LEB
+ * struct ubi_fm_eba - denotes an association between a PEB and LEB
  * @magic: EBA table magic number
  * @reserved_pebs: number of table entries
  * @pnum: PEB number of LEB (LEB is the index)
-- 
1.8.4.5
