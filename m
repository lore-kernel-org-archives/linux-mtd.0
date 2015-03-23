Received: from mail-yh0-x241.google.com ([2607:f8b0:4002:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZuey-0007tb-Nd
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2015 05:12:21 +0000
Received: by yhoc41 with SMTP id c41so4832418yho.0
 for <linux-mtd@lists.infradead.org>; Sun, 22 Mar 2015 22:11:57 -0700 (PDT)
From: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
To: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: return err value than 0
Date: Mon, 23 Mar 2015 01:11:34 -0400
Message-Id: <1427087494-29017-1-git-send-email-sanidhya.gatech@gmail.com>
Cc: blee@gatech.edu, taesoo@gatech.edu, changwoo@gatech.edu,
 sanidhya@gatech.edu, Sanidhya Kashyap <sanidhya.gatech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, ubifs_readpage only returns 0 even if ubifs_bulk_read()
fails. Like the other file systems, the error value should be
propagated further instead of 0.

Another check that is missing is ENOMEM for kmalloc.

Signed-off-by: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
---
 fs/ubifs/file.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e627c0a..28fe892 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -863,8 +863,10 @@ static int ubifs_bulk_read(struct page *page)
 		bu = &c->bu;
 	else {
 		bu = kmalloc(sizeof(struct bu_info), GFP_NOFS | __GFP_NOWARN);
-		if (!bu)
+		if (!bu) {
+			err = -ENOMEM;
 			goto out_unlock;
+		}
 
 		bu->buf = NULL;
 		allocated = 1;
@@ -887,11 +889,14 @@ out_unlock:
 
 static int ubifs_readpage(struct file *file, struct page *page)
 {
-	if (ubifs_bulk_read(page))
-		return 0;
+	int err = 0;
+
+	err = ubifs_bulk_read(page);
+	if (err)
+		return err;
 	do_readpage(page);
 	unlock_page(page);
-	return 0;
+	return err;
 }
 
 static int do_writepage(struct page *page, int len)
-- 
2.1.0
