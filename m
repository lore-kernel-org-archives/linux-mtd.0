From: Christoph Hellwig <hch@lst.de>
To: viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net
Subject: [PATCH 1/4] gfs2: fix bogus __mark_inode_dirty(I_DIRTY_SYNC |
 I_DIRTY_DATASYNC) calls
Date: Wed, 21 Feb 2018 07:54:46 -0800
Message-Id: <20180221155449.25542-2-hch@lst.de>
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
 fs/gfs2/xattr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 05de20954659..f2bce1e0f6fb 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -308,7 +308,7 @@ static int ea_dealloc_unstuffed(struct gfs2_inode *ip, struct buffer_head *bh,
 	}
 
 	ip->i_inode.i_ctime = current_time(&ip->i_inode);
-	__mark_inode_dirty(&ip->i_inode, I_DIRTY_SYNC | I_DIRTY_DATASYNC);
+	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
 
 	gfs2_trans_end(sdp);
 
@@ -768,7 +768,7 @@ static int ea_alloc_skeleton(struct gfs2_inode *ip, struct gfs2_ea_request *er,
 		goto out_end_trans;
 
 	ip->i_inode.i_ctime = current_time(&ip->i_inode);
-	__mark_inode_dirty(&ip->i_inode, I_DIRTY_SYNC | I_DIRTY_DATASYNC);
+	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
 
 out_end_trans:
 	gfs2_trans_end(GFS2_SB(&ip->i_inode));
@@ -896,7 +896,7 @@ static int ea_set_simple_noalloc(struct gfs2_inode *ip, struct buffer_head *bh,
 		ea_set_remove_stuffed(ip, es->es_el);
 
 	ip->i_inode.i_ctime = current_time(&ip->i_inode);
-	__mark_inode_dirty(&ip->i_inode, I_DIRTY_SYNC | I_DIRTY_DATASYNC);
+	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
 
 	gfs2_trans_end(GFS2_SB(&ip->i_inode));
 	return error;
@@ -1114,7 +1114,7 @@ static int ea_remove_stuffed(struct gfs2_inode *ip, struct gfs2_ea_location *el)
 	}
 
 	ip->i_inode.i_ctime = current_time(&ip->i_inode);
-	__mark_inode_dirty(&ip->i_inode, I_DIRTY_SYNC | I_DIRTY_DATASYNC);
+	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
 
 	gfs2_trans_end(GFS2_SB(&ip->i_inode));
 
-- 
2.14.2
