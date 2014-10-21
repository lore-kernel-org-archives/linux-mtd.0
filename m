Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgTe4-0008Gl-8d
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 07:14:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: fix budget leak in error path
Date: Tue, 21 Oct 2014 10:13:51 +0300
Message-Id: <1413875631-7115-1-git-send-email-dedekind1@gmail.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We forgot to free the budget in 'write_begin_slow()' when 'do_readpage()'
fails. This patch fixes the issue.

Suggested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b5b593c..538519e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -262,6 +262,7 @@ static int write_begin_slow(struct address_space *mapping,
 			if (err) {
 				unlock_page(page);
 				page_cache_release(page);
+				ubifs_release_budget(c, &req);
 				return err;
 			}
 		}
-- 
1.9.3
