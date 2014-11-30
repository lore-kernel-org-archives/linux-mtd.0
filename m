Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2nR-0006o3-Eq
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:36:11 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 4/6] UBI: Fastmap: Wrap fastmap specific function in a ifdef
Date: Sun, 30 Nov 2014 12:35:38 +0100
Message-Id: <1417347340-6872-5-git-send-email-richard@nod.at>
In-Reply-To: <1417347340-6872-1-git-send-email-richard@nod.at>
References: <1417347340-6872-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...such that we can implement NOP variants of some functions.
This will help to reduce fastmap specific ifdefs in other c files.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index d672412..6fadf34 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -864,10 +864,14 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 		      int pnum, const struct ubi_vid_hdr *vid_hdr);
 
 /* fastmap.c */
+#ifdef CONFIG_MTD_UBI_FASTMAP
 size_t ubi_calc_fm_size(struct ubi_device *ubi);
 int ubi_update_fastmap(struct ubi_device *ubi);
 int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		     int fm_anchor);
+#else
+static inline int ubi_update_fastmap(struct ubi_device *ubi) { return 0; }
+#endif
 
 /* block.c */
 #ifdef CONFIG_MTD_UBI_BLOCK
-- 
1.8.4.5
