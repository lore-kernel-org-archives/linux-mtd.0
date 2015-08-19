Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSA5w-0001lo-GO
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 20:36:25 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com
Subject: [PATCH 2/2] ubifs: Allow O_DIRECT
Date: Wed, 19 Aug 2015 22:35:53 +0200
Message-Id: <1440016553-26481-2-git-send-email-richard@nod.at>
In-Reply-To: <1440016553-26481-1-git-send-email-richard@nod.at>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently UBIFS does not support direct IO, but some applications
blindly use the O_DIRECT flag.
Instead of failing upon open() we can do better and fall back
to buffered IO.

Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: dedekind1@gmail.com
Suggested-by: Dave Chinner <david@fromorbit.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/file.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a3dfe2a..a61fe86 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1540,6 +1540,15 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 
+/*
+ * For now fall back to buffered IO.
+ */
+static ssize_t ubifs_direct_IO(struct kiocb *iocb, struct iov_iter *iter,
+				   loff_t offset)
+{
+	return 0;
+}
+
 const struct address_space_operations ubifs_file_address_operations = {
 	.readpage       = ubifs_readpage,
 	.writepage      = ubifs_writepage,
@@ -1548,6 +1557,7 @@ const struct address_space_operations ubifs_file_address_operations = {
 	.invalidatepage = ubifs_invalidatepage,
 	.set_page_dirty = ubifs_set_page_dirty,
 	.releasepage    = ubifs_releasepage,
+	.direct_IO	= ubifs_direct_IO,
 };
 
 const struct inode_operations ubifs_file_inode_operations = {
-- 
1.8.4.5
