From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@fb.com>
Subject: [PATCH 05/12] block_dev: get bdev inode bdi directly from the block
 device
Date: Wed, 14 Jan 2015 10:42:34 +0100
Message-Id: <1421228561-16857-6-git-send-email-hch@lst.de>
In-Reply-To: <1421228561-16857-1-git-send-email-hch@lst.de>
References: <1421228561-16857-1-git-send-email-hch@lst.de>
Cc: linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>,
 ceph-devel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Directly grab the backing_dev_info from the request_queue instead of
detouring through the address_space.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Tejun Heo <tj@kernel.org>
---
 fs/fs-writeback.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 2d609a5..e8116a4 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -69,10 +69,10 @@ EXPORT_SYMBOL(writeback_in_progress);
 static inline struct backing_dev_info *inode_to_bdi(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
-
+#ifdef CONFIG_BLOCK
 	if (sb_is_blkdev_sb(sb))
-		return inode->i_mapping->backing_dev_info;
-
+		return blk_get_backing_dev_info(I_BDEV(inode));
+#endif
 	return sb->s_bdi;
 }
 
-- 
1.9.1
