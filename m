Message-Id: <20131220132521.682711410@bombadil.infradead.org>
Date: Fri, 20 Dec 2013 05:16:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: viro@zeniv.linux.org.uk
Subject: [PATCH 04/21] fs: add a set_acl inode operation
References: <20131220131635.650823732@bombadil.infradead.org>
Content-Disposition: inline;
 filename=0004-fs-add-a-set_acl-inode-operation.patch
Cc: Andreas Gruenbacher <andreas.gruenbacher@linbit.com>, xfs@oss.sgi.com,
 Jan Kara <jack@suse.cz>, Mark Fasheh <mfasheh@suse.com>,
 reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>, jfs-discussion@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This will allow moving all the Posix ACL handling into the VFS and clean
up tons of cruft in the filesystems.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 include/linux/fs.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 121f11f..09f553c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1580,6 +1580,7 @@ struct inode_operations {
 			   struct file *, unsigned open_flag,
 			   umode_t create_mode, int *opened);
 	int (*tmpfile) (struct inode *, struct dentry *, umode_t);
+	int (*set_acl)(struct inode *, struct posix_acl *, int);
 } ____cacheline_aligned;
 
 ssize_t rw_copy_check_uvector(int type, const struct iovec __user * uvector,
-- 
1.7.10.4
