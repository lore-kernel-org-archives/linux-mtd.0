Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXWXB-0004Rd-9n
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 19:20:37 +0000
Received: by mail-pl1-x643.google.com with SMTP id p8so1514532plo.2
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 11:20:23 -0800 (PST)
From: zhangjun <openzhangj@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zhangjun <openzhangj@gmail.com>
Subject: [PATCH v2] ubifs: fix page_count in ->ubifs_migrate_page()
Date: Thu, 13 Dec 2018 14:20:17 -0500
Message-Id: <1544728817-2870-1-git-send-email-openzhangj@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Because the PagePrivate() in UBIFS is different meanings,
alloc_cma() will fail when one dirty page cache located in
the type of MIGRATE_CMA

If not adjust the 'extra_count' for dirty page,
ubifs_migrate_page() -> migrate_page_move_mapping() will
always return -EAGAIN for:
	expected_count += page_has_private(page)
This causes the migration to fail until the page cache is cleaned

In general, PagePrivate() indicates that buff_head is already bound
to this page, and at the same time page_count() will also increase.
But UBIFS set private flag when the cache is dirty, and page_count()
not increase.
Therefore, the expected_count of UBIFS is different from the general
case.

Signed-off-by: zhangjun <openzhangj@gmail.com>
---
 fs/ubifs/file.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 1b78f2e..890dfce 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1480,8 +1480,17 @@ static int ubifs_migrate_page(struct address_space *mapping,
 		struct page *newpage, struct page *page, enum migrate_mode mode)
 {
 	int rc;
+	int extra_count = 0;
 
-	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
+	/*
+	 * UBIFS uses PG_private as marker and does not raise the page counter.
+	 * migrate_page_move_mapping() expects a incremented counter if
+	 * PG_private is set. Therefore pass -1 as extra_count for this case.
+	 */
+	if (page_has_private(page))
+		extra_count = -1;
+	rc = migrate_page_move_mapping(mapping, newpage, page,
+			NULL, mode, extra_count);
 	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
 
-- 
2.7.4
