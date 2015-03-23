Received: from mail-yh0-x242.google.com ([2607:f8b0:4002:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya3jX-0000DA-Te
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2015 14:53:40 +0000
Received: by yhaf10 with SMTP id f10so1882276yha.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2015 07:53:18 -0700 (PDT)
From: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
To: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: propagate error value than 0
Date: Mon, 23 Mar 2015 10:52:57 -0400
Message-Id: <1427122377-26332-1-git-send-email-sanidhya.gatech@gmail.com>
Cc: taesoo@gatech.edu, sanidhya@gatech.edu,
 Sanidhya Kashyap <sanidhya.gatech@gmail.com>, blee@gatech.edu,
 csong84@gatech.edu, changwoo@gatech.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, ubifs_readpage only returns 0 even if ubifs_bulk_read()
fails. Therefore propagating error to the above functions which
have called ubifs_readpage.

Another check that is missing is ENOMEM for kmalloc in ubifs_bulk_read.

Signed-off-by: Sanidhya Kashyap <sanidhya.gatech@gmail.com>
---
 fs/ubifs/file.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e627c0a..b2d1de0 100644
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
@@ -887,8 +889,11 @@ out_unlock:
 
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
 	return 0;
-- 
2.1.0
