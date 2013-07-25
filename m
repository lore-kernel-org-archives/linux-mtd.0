Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2Pi7-0000RF-QO
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2013 17:52:20 +0000
From: Dave Kleikamp <dave.kleikamp@oracle.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH V8 32/33] ubifs: convert file ops from aio_read/write to
 read/write_iter
Date: Thu, 25 Jul 2013 12:50:58 -0500
Message-Id: <1374774659-13121-33-git-send-email-dave.kleikamp@oracle.com>
In-Reply-To: <1374774659-13121-1-git-send-email-dave.kleikamp@oracle.com>
References: <1374774659-13121-1-git-send-email-dave.kleikamp@oracle.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Dave Kleikamp <dave.kleikamp@oracle.com>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Zach Brown <zab@zabbo.net>, "Maxim V. Patlasov" <mpatlasov@parallels.com>
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
index 123c79b..22924e0 100644
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
@@ -1396,8 +1396,8 @@ static int update_mctime(struct ubifs_info *c, struct inode *inode)
 	return 0;
 }
 
-static ssize_t ubifs_aio_write(struct kiocb *iocb, const struct iovec *iov,
-			       unsigned long nr_segs, loff_t pos)
+static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *iter,
+				loff_t pos)
 {
 	int err;
 	struct inode *inode = iocb->ki_filp->f_mapping->host;
@@ -1407,7 +1407,7 @@ static ssize_t ubifs_aio_write(struct kiocb *iocb, const struct iovec *iov,
 	if (err)
 		return err;
 
-	return generic_file_aio_write(iocb, iov, nr_segs, pos);
+	return generic_file_write_iter(iocb, iter, pos);
 }
 
 static int ubifs_set_page_dirty(struct page *page)
@@ -1583,8 +1583,8 @@ const struct file_operations ubifs_file_operations = {
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
1.8.3.4
