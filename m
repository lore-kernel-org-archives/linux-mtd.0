Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmEw-0002lT-PZ
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:27 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 14/39] fs: quota: restore i_flags of quota files in
 dquot_disable
Date: Tue, 15 Sep 2015 17:02:09 +0800
Message-ID: <1442307754-13233-15-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we load quota files, we set the i_flags of the inodes
to (S_NOQUOTA | S_NOATIME | S_IMMUTABLE). In dquot_disable()
we only clear these flags, But we do not restore the old
flags. That would change the i_flags of quota files if some
of these flags were set before loading quota files.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/quota/dquot.c      | 2 ++
 include/linux/quota.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index 0bda7fa..c73f44d 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -2125,6 +2125,7 @@ int dquot_disable(struct super_block *sb, int type, unsigned int flags)
 				mutex_lock(&toputinode[cnt]->i_mutex);
 				toputinode[cnt]->i_flags &= ~(S_IMMUTABLE |
 				  S_NOATIME | S_NOQUOTA);
+				toputinode[cnt]->i_flags |= dqopt->old_flags[cnt];
 				truncate_inode_pages(&toputinode[cnt]->i_data,
 						     0);
 				mutex_unlock(&toputinode[cnt]->i_mutex);
@@ -2223,6 +2224,7 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
 		oldflags = inode->i_flags & (S_NOATIME | S_IMMUTABLE |
 					     S_NOQUOTA);
 		inode->i_flags |= S_NOQUOTA | S_NOATIME | S_IMMUTABLE;
+		dqopt->old_flags[type] = oldflags;
 		mutex_unlock(&inode->i_mutex);
 		/*
 		 * When S_NOQUOTA is set, remove dquot references as no more
diff --git a/include/linux/quota.h b/include/linux/quota.h
index b2505ac..fcfee5a 100644
--- a/include/linux/quota.h
+++ b/include/linux/quota.h
@@ -507,6 +507,7 @@ struct quota_info {
 	struct mutex dqio_mutex;		/* lock device while I/O in progress */
 	struct mutex dqonoff_mutex;		/* Serialize quotaon & quotaoff */
 	struct inode *files[MAXQUOTAS];		/* inodes of quotafiles */
+	unsigned int old_flags[MAXQUOTAS];	/* i_flags for each quota file */
 	struct mem_dqinfo info[MAXQUOTAS];	/* Information for each quota type */
 	const struct quota_format_ops *ops[MAXQUOTAS];	/* Operations for each type */
 };
-- 
1.8.4.2
