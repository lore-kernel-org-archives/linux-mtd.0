Received: from lgeamrelo11.lge.com ([156.147.23.51])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dKvus-0001mL-RZ
 for linux-mtd@lists.infradead.org; Wed, 14 Jun 2017 00:12:13 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
Subject: [PATCH v2] ubifs: Change gfp flags in page allocation for bulk read
Date: Wed, 14 Jun 2017 09:11:32 +0900
Message-Id: <1497399092-11859-1-git-send-email-hyc.lee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hyunchul Lee <cheol.lee@lge.com>

In low memory situations, page allocations for bulk read
can kill applications for reclaiming memory, and print an
failure message when allocations are failed.
Because bulk read is just an optimization, we don't have
to do these and can stop page allocations.

Though this siutation happens rarely, add __GFP_NORETRY
to prevent from excessive memory reclaim and killing
applications, and __GFP_WARN to suppress this failure
message.

For this, Use readahead_gfp_mask for gfp flags when
allocating pages.

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
v2:
* rewrite a commit message for explaining why this
 patch is needed.
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
