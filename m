Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dKfMK-0002YV-U2
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 06:31:27 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
Subject: [PATCH] ubifs: Change gfp flags in page allocation for bulk read
Date: Tue, 13 Jun 2017 15:30:47 +0900
Message-Id: <1497335447-4937-1-git-send-email-hyc.lee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hyunchul Lee <cheol.lee@lge.com>

Use readahead_gfp_mask for gfp flags when allocating pages.
This set additional flags which are __GFP_NORETRY and
__GFP_NOWARN. So OOMs and a failure message can be
avoided.
And we should remove __GFP_FS from flags to prevent from
calling ubifs_writepage during page reclaim.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 fs/ubifs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index d9ae86f..4396c04 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -735,6 +735,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 	int err, page_idx, page_cnt, ret = 0, n = 0;
 	int allocate = bu->buf ? 0 : 1;
 	loff_t isize;
+	gfp_t ra_gfp_mask = readahead_gfp_mask(mapping) & ~__GFP_FS;
 
 	err = ubifs_tnc_get_bu_keys(c, bu);
 	if (err)
@@ -796,8 +797,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 
 		if (page_offset > end_index)
 			break;
-		page = find_or_create_page(mapping, page_offset,
-					   GFP_NOFS | __GFP_COLD);
+		page = find_or_create_page(mapping, page_offset, ra_gfp_mask);
 		if (!page)
 			break;
 		if (!PageUptodate(page))
-- 
1.9.1
