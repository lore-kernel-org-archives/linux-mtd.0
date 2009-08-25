Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MfxwO-00045a-Up
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 15:28:13 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n7PFRn91024357
	for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2009 18:27:58 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH] UBIFS: fix commentaries
Date: Tue, 25 Aug 2009 18:27:04 +0300
Message-Id: <1251214024-2777-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Change "write-back does take inode @i_mutex" to "write-back does not
take inode @i_mutex" type. IOW, this patch just adds "not" word, the
rest of the changes are just re-formatting to fit the 80 characters
line limit.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/file.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 6d34dc7..ff43f60 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -965,12 +965,12 @@ static int do_writepage(struct page *page, int len)
  * and then keeps writing pages back.
  *
  * Some locking issues explanation. 'ubifs_writepage()' first is called with
- * the page locked, and it locks @ui_mutex. However, write-back does take inode
- * @i_mutex, which means other VFS operations may be run on this inode at the
- * same time. And the problematic one is truncation to smaller size, from where
- * we have to call 'vmtruncate()', which first changes @inode->i_size, then
- * drops the truncated pages. And while dropping the pages, it takes the page
- * lock. This means that 'do_truncation()' cannot call 'vmtruncate()' with
+ * the page locked, and it locks @ui_mutex. However, write-back does not take
+ * inode @i_mutex, which means other VFS operations may be run on this inode at
+ * the same time. And the problematic one is truncation to smaller size, from
+ * where we have to call 'vmtruncate()', which first changes @inode->i_size,
+ * then drops the truncated pages. And while dropping the pages, it takes the
+ * page lock. This means that 'do_truncation()' cannot call 'vmtruncate()' with
  * @ui_mutex locked, because it would deadlock with 'ubifs_writepage()'. This
  * means that @inode->i_size is changed while @ui_mutex is unlocked.
  *
-- 
1.6.2.5
