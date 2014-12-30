From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@fb.com>
Subject: [PATCH 6/8] nilfs2: set up s_bdi like the generic mount_bdev code
Date: Tue, 30 Dec 2014 09:57:37 +0100
Message-Id: <1419929859-24427-7-git-send-email-hch@lst.de>
In-Reply-To: <1419929859-24427-1-git-send-email-hch@lst.de>
References: <1419929859-24427-1-git-send-email-hch@lst.de>
Cc: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mapping->backing_dev_info will go away, so don't rely on it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/nilfs2/super.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 2e5b3ec..3d4bbac 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -1057,7 +1057,6 @@ nilfs_fill_super(struct super_block *sb, void *data, int silent)
 {
 	struct the_nilfs *nilfs;
 	struct nilfs_root *fsroot;
-	struct backing_dev_info *bdi;
 	__u64 cno;
 	int err;
 
@@ -1077,8 +1076,7 @@ nilfs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_time_gran = 1;
 	sb->s_max_links = NILFS_LINK_MAX;
 
-	bdi = sb->s_bdev->bd_inode->i_mapping->backing_dev_info;
-	sb->s_bdi = bdi ? : &default_backing_dev_info;
+	sb->s_bdi = &bdev_get_queue(sb->s_bdev)->backing_dev_info;
 
 	err = load_nilfs(nilfs, sb);
 	if (err)
-- 
1.9.1
