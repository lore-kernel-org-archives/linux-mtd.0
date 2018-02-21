From: Christoph Hellwig <hch@lst.de>
To: viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net
Subject: [PATCH 3/4] ubifs: fix bogus __mark_inode_dirty(I_DIRTY_SYNC |
 I_DIRTY_DATASYNC) call
Date: Wed, 21 Feb 2018 07:54:48 -0800
Message-Id: <20180221155449.25542-4-hch@lst.de>
In-Reply-To: <20180221155449.25542-1-hch@lst.de>
References: <20180221155449.25542-1-hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I_DIRTY_DATASYNC is a strict superset of I_DIRTY_SYNC semantics, as
in mark dirty to be written out by fdatasync as well.  So dirtying
for both flags makes no sense.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ubifs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cf348ba99238..1acb2ff505e6 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1256,7 +1256,7 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 		 * Inode length changed, so we have to make sure
 		 * @I_DIRTY_DATASYNC is set.
 		 */
-		 __mark_inode_dirty(inode, I_DIRTY_SYNC | I_DIRTY_DATASYNC);
+		 __mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 	else
 		mark_inode_dirty_sync(inode);
 	mutex_unlock(&ui->ui_mutex);
-- 
2.14.2
