Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8bM9-0004iT-Ap
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 14:40:56 +0000
Subject: [PATCH] UBIFS: use anonymous device
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 17:39:32 +0300
Message-Id: <1243262372.21646.128.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, viro@ZenIV.linux.org.uk
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

here is a patch which fixes a minor UBIFS issues spotted
by Al Viro. I'm going to push it to ubifs-2.6.git.


From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBIFS: use anonymous device

UBIFS has erroneuosly set 'sb->s_dev' to the UBI volume
character device major/minor. This may lead to clashes
if there is another FS mounted to a block device with
the same major/minor numbers. User-space programs which
use 'stat->st_dev' may get confused because of this.

This problem was spotted by Al Viro. He also pointed the
way to fix the problem - use 'set_anon_super()' and
'kill_anon_super()' VFS helpers.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   21 ++++-----------------
 1 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9a589d8..d8d9523 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1945,7 +1945,6 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_magic = UBIFS_SUPER_MAGIC;
 	sb->s_blocksize = UBIFS_BLOCK_SIZE;
 	sb->s_blocksize_bits = UBIFS_BLOCK_SHIFT;
-	sb->s_dev = c->vi.cdev;
 	sb->s_maxbytes = c->max_inode_sz = key_max_inode_size(c);
 	if (c->max_inode_sz > MAX_LFS_FILESIZE)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
@@ -1990,16 +1989,9 @@ out_free:
 static int sb_test(struct super_block *sb, void *data)
 {
 	dev_t *dev = data;
+	struct ubifs_info *c = sb->s_fs_info;
 
-	return sb->s_dev == *dev;
-}
-
-static int sb_set(struct super_block *sb, void *data)
-{
-	dev_t *dev = data;
-
-	sb->s_dev = *dev;
-	return 0;
+	return c->vi.cdev == *dev;
 }
 
 static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
@@ -2027,7 +2019,7 @@ static int ubifs_get_sb(struct file_system_type *fs_type, int flags,
 
 	dbg_gen("opened ubi%d_%d", vi.ubi_num, vi.vol_id);
 
-	sb = sget(fs_type, &sb_test, &sb_set, &vi.cdev);
+	sb = sget(fs_type, &sb_test, &set_anon_super, &vi.cdev);
 	if (IS_ERR(sb)) {
 		err = PTR_ERR(sb);
 		goto out_close;
@@ -2067,16 +2059,11 @@ out_close:
 	return err;
 }
 
-static void ubifs_kill_sb(struct super_block *sb)
-{
-	generic_shutdown_super(sb);
-}
-
 static struct file_system_type ubifs_fs_type = {
 	.name    = "ubifs",
 	.owner   = THIS_MODULE,
 	.get_sb  = ubifs_get_sb,
-	.kill_sb = ubifs_kill_sb
+	.kill_sb = kill_anon_super,
 };
 
 /*
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
