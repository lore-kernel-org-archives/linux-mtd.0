Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZrs-0005Hq-J6
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:01 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: update dbg_dump_inode
Date: Tue, 30 Sep 2008 12:19:10 +0300
Message-Id: <1222766358-21886-15-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

'dbg_dump_inode()' is quite outdated and does not print all
the fileds.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   42 +++++++++++++++++++++++++-----------------
 1 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index d7f7645..32071ec 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -222,30 +222,38 @@ void dbg_dump_inode(const struct ubifs_info *c, const struct inode *inode)
 {
 	const struct ubifs_inode *ui = ubifs_inode(inode);
 
-	printk(KERN_DEBUG "inode      %lu\n", inode->i_ino);
-	printk(KERN_DEBUG "size       %llu\n",
+	printk(KERN_DEBUG "Dump in-memory inode:");
+	printk(KERN_DEBUG "\tinode          %lu\n", inode->i_ino);
+	printk(KERN_DEBUG "\tsize           %llu\n",
 	       (unsigned long long)i_size_read(inode));
-	printk(KERN_DEBUG "nlink      %u\n", inode->i_nlink);
-	printk(KERN_DEBUG "uid        %u\n", (unsigned int)inode->i_uid);
-	printk(KERN_DEBUG "gid        %u\n", (unsigned int)inode->i_gid);
-	printk(KERN_DEBUG "atime      %u.%u\n",
+	printk(KERN_DEBUG "\tnlink          %u\n", inode->i_nlink);
+	printk(KERN_DEBUG "\tuid            %u\n", (unsigned int)inode->i_uid);
+	printk(KERN_DEBUG "\tgid            %u\n", (unsigned int)inode->i_gid);
+	printk(KERN_DEBUG "\tatime          %u.%u\n",
 	       (unsigned int)inode->i_atime.tv_sec,
 	       (unsigned int)inode->i_atime.tv_nsec);
-	printk(KERN_DEBUG "mtime      %u.%u\n",
+	printk(KERN_DEBUG "\tmtime          %u.%u\n",
 	       (unsigned int)inode->i_mtime.tv_sec,
 	       (unsigned int)inode->i_mtime.tv_nsec);
-	printk(KERN_DEBUG "ctime       %u.%u\n",
+	printk(KERN_DEBUG "\tctime          %u.%u\n",
 	       (unsigned int)inode->i_ctime.tv_sec,
 	       (unsigned int)inode->i_ctime.tv_nsec);
-	printk(KERN_DEBUG "creat_sqnum %llu\n", ui->creat_sqnum);
-	printk(KERN_DEBUG "xattr_size  %u\n", ui->xattr_size);
-	printk(KERN_DEBUG "xattr_cnt   %u\n", ui->xattr_cnt);
-	printk(KERN_DEBUG "xattr_names %u\n", ui->xattr_names);
-	printk(KERN_DEBUG "dirty       %u\n", ui->dirty);
-	printk(KERN_DEBUG "xattr       %u\n", ui->xattr);
-	printk(KERN_DEBUG "flags       %d\n", ui->flags);
-	printk(KERN_DEBUG "compr_type  %d\n", ui->compr_type);
-	printk(KERN_DEBUG "data_len    %d\n", ui->data_len);
+	printk(KERN_DEBUG "\tcreat_sqnum    %llu\n", ui->creat_sqnum);
+	printk(KERN_DEBUG "\txattr_size     %u\n", ui->xattr_size);
+	printk(KERN_DEBUG "\txattr_cnt      %u\n", ui->xattr_cnt);
+	printk(KERN_DEBUG "\txattr_names    %u\n", ui->xattr_names);
+	printk(KERN_DEBUG "\tdirty          %u\n", ui->dirty);
+	printk(KERN_DEBUG "\txattr          %u\n", ui->xattr);
+	printk(KERN_DEBUG "\tbulk_read      %u\n", ui->xattr);
+	printk(KERN_DEBUG "\tsynced_i_size  %llu\n",
+	       (unsigned long long)ui->synced_i_size);
+	printk(KERN_DEBUG "\tui_size        %llu\n",
+	       (unsigned long long)ui->ui_size);
+	printk(KERN_DEBUG "\tflags          %d\n", ui->flags);
+	printk(KERN_DEBUG "\tcompr_type     %d\n", ui->compr_type);
+	printk(KERN_DEBUG "\tlast_page_read %lu\n", ui->last_page_read);
+	printk(KERN_DEBUG "\tread_in_a_row  %lu\n", ui->read_in_a_row);
+	printk(KERN_DEBUG "\tdata_len       %d\n", ui->data_len);
 }
 
 void dbg_dump_node(const struct ubifs_info *c, const void *node)
-- 
1.5.4.1
