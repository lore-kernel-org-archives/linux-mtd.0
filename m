Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZC34-0001xE-E8
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2018 09:52:25 +0000
Date: Tue, 18 Dec 2018 10:52:17 +0100
From: Helmut Grohne <helmut.grohne@intenta.de>
To: David Woodhouse <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard.weinberger@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 2/3] jffs2: jffs2_iget defer f->sem acquisition
Message-ID: <fd1306f8dfdf0ab4332eaf84ea54b6cfb6ebb0b6.1545126261.git.helmut.grohne@intenta.de>
References: <cover.1545126261.git.helmut.grohne@intenta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1545126261.git.helmut.grohne@intenta.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At the point where f->sem is taken, we know that we have a locked I_NEW
inode. Since jffs2_iget is the only function processing I_NEW inodes and
iget_locked blocks on I_NEW inodes, we know that we are the only user of
the inode until we unlock_new_inode it. Since 7aaea7605c0 ("jffs2: fix
unbalanced locking"), jffs2_do_read_inode no longer touches f->sem and
does not make the inode visible to others either. Thus we can call it
without f->sem acquired. Nextup, inode->i_mode is protected until
unlock_new_inode.

After deferring the locking, we can decide upon the proper lock class
depending on inode->i_mode.

Signed-off-by: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 fs/jffs2/fs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index eab04eca95a3..89a10b398d00 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -270,13 +270,15 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
 	c = JFFS2_SB_INFO(inode->i_sb);
 
 	jffs2_init_inode_info(f);
-	mutex_lock(&f->sem);
 
 	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
 	if (ret)
 		goto error;
 
 	inode->i_mode = jemode_to_cpu(latest_node.mode);
+
+	mutex_lock(&f->sem);
+
 	i_uid_write(inode, je16_to_cpu(latest_node.uid));
 	i_gid_write(inode, je16_to_cpu(latest_node.gid));
 	inode->i_size = je32_to_cpu(latest_node.isize);
-- 
2.11.0
