Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UE69l-00008U-HZ
 for linux-mtd@lists.infradead.org; Fri, 08 Mar 2013 22:52:54 +0000
From: Dave Kleikamp <dave.kleikamp@oracle.com>
To: Zach Brown <zab@zabbo.net>
Subject: [PATCH V7 -next 32/33] ubifs: convert file ops from aio_read/write to
 read/write_iter
Date: Fri,  8 Mar 2013 16:52:27 -0600
Message-Id: <1362783148-22736-33-git-send-email-dave.kleikamp@oracle.com>
In-Reply-To: <1362783148-22736-1-git-send-email-dave.kleikamp@oracle.com>
References: <1362783148-22736-1-git-send-email-dave.kleikamp@oracle.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Dave Kleikamp <dave.kleikamp@oracle.com>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 1437453..d2ba11d 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -44,7 +44,7 @@
  * 'ubifs_writepage()' we are only guaranteed that the page is locked.
  *
  * Similarly, @i_mutex is not always locked in 'ubifs_readpage()', e.g., the
- * read-ahead path does not lock it ("sys_read -> generic_file_aio_read ->
+ * read-ahead path does not lock it ("sys_read -> generic_file_read_iter ->
  * ondemand_readahead -> readpage"). In case of readahead, @I_SYNC flag is not
  * set as well. However, UBIFS disables readahead.
  */
@@ -1395,8 +1395,8 @@ static int update_mctime(struct ubifs_info *c, struct inode *inode)
 	return 0;
 }
 
-static ssize_t ubifs_aio_write(struct kiocb *iocb, const struct iovec *iov,
-			       unsigned long nr_segs, loff_t pos)
+static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *iter,
+				loff_t pos)
 {
 	int err;
 	struct inode *inode = iocb->ki_filp->f_mapping->host;
@@ -1406,7 +1406,7 @@ static ssize_t ubifs_aio_write(struct kiocb *iocb, const struct iovec *iov,
 	if (err)
 		return err;
 
-	return generic_file_aio_write(iocb, iov, nr_segs, pos);
+	return generic_file_write_iter(iocb, iter, pos);
 }
 
 static int ubifs_set_page_dirty(struct page *page)
@@ -1582,8 +1582,8 @@ const struct file_operations ubifs_file_operations = {
 	.llseek         = generic_file_llseek,
 	.read           = do_sync_read,
 	.write          = do_sync_write,
-	.aio_read       = generic_file_aio_read,
-	.aio_write      = ubifs_aio_write,
+	.read_iter       = generic_file_read_iter,
+	.write_iter      = ubifs_write_iter,
 	.mmap           = ubifs_file_mmap,
 	.fsync          = ubifs_fsync,
 	.unlocked_ioctl = ubifs_ioctl,
-- 
1.8.1.5
