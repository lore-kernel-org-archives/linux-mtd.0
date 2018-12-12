Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX5Ha-0004y1-KB
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2018 14:14:40 +0000
Received: by mail-pf1-x441.google.com with SMTP id b7so8933367pfi.8
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2018 06:14:27 -0800 (PST)
From: zhangjun <openzhangj@gmail.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhangjun <openzhangj@gmail.com>
Subject: ubifs: fix page_count in ->ubifs_migrate_page()
Date: Wed, 12 Dec 2018 09:13:57 -0500
Message-Id: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
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
 fs/ubifs/file.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 1b78f2e..2136a5c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1480,8 +1480,15 @@ static int ubifs_migrate_page(struct address_space *mapping,
 		struct page *newpage, struct page *page, enum migrate_mode mode)
 {
 	int rc;
+	int extra_count;
 
-	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode, 0);
+	/*
+	 * UBIFS is using PagePrivate() which can have different meanings across
+	 * filesystems. So here adjusting the 'extra_count' make it work.
+	 */
+	extra_count = 0 - page_has_private(page);
+	rc = migrate_page_move_mapping(mapping, newpage,
+			page, NULL, mode, extra_count);
 	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
 
-- 
2.7.4
