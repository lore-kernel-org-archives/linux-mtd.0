From: Christoph Hellwig <hch@lst.de>
To: viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net
Subject: [PATCH 2/4] ntfs: fix bogus __mark_inode_dirty(I_DIRTY_SYNC |
 I_DIRTY_DATASYNC) call
Date: Wed, 21 Feb 2018 07:54:47 -0800
Message-Id: <20180221155449.25542-3-hch@lst.de>
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
 fs/ntfs/mft.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 2831f495a674..32c523cf5a2d 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -381,7 +381,7 @@ MFT_RECORD *map_extent_mft_record(ntfs_inode *base_ni, MFT_REF mref,
  * vfs inode dirty.  This ensures that any changes to the mft record are
  * written out to disk.
  *
- * NOTE:  We only set I_DIRTY_SYNC and I_DIRTY_DATASYNC (and not I_DIRTY_PAGES)
+ * NOTE:  We only set I_DIRTY_DATASYNC (and not I_DIRTY_PAGES)
  * on the base vfs inode, because even though file data may have been modified,
  * it is dirty in the inode meta data rather than the data page cache of the
  * inode, and thus there are no data pages that need writing out.  Therefore, a
@@ -407,7 +407,7 @@ void __mark_mft_record_dirty(ntfs_inode *ni)
 	else
 		base_ni = ni->ext.base_ntfs_ino;
 	mutex_unlock(&ni->extent_lock);
-	__mark_inode_dirty(VFS_I(base_ni), I_DIRTY_SYNC | I_DIRTY_DATASYNC);
+	__mark_inode_dirty(VFS_I(base_ni), I_DIRTY_DATASYNC);
 }
 
 static const char *ntfs_please_email = "Please email "
-- 
2.14.2
