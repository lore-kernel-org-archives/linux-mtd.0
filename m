Received: from mail-ig0-f175.google.com ([209.85.213.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8tbh-0002T6-Lg
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 15:32:46 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so17920060igb.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2014 07:32:21 -0800 (PST)
Sender: Andrew Ruder <andy@aeruder.net>
From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
To: linux-fsdevel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [HACK] fs/super.c: sync ro remount after blocking writers
Date: Thu, 30 Jan 2014 09:26:54 -0600
Message-Id: <1391095614-21554-1-git-send-email-andrew.ruder@elecsyscorp.com>
Cc: Christoph Hellwig <hch@infradead.org>, Richard Weinberger <richard@nod.at>,
 Andrew Ruder <andrew.ruder@elecsyscorp.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move sync_filesystem() after sb_prepare_remount_readonly().  If writers
sneak in anywhere from sync_filesystem() to sb_prepare_remount_readonly()
it can cause inodes to be dirtied and writeback to occur well after
sys_mount() has completely successfully.

This was spotted by corrupted ubifs filesystems on reboot, but appears
that it can cause issues with any filesystem using writeback.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Richard Weinberger <richard@nod.at>
Co-authored-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---

I marked this as hack as because there is still a race condition concerning
the force == 1 situation.  mark_files_ro() never actually blocks new
writers even through the filesystem-specific remount code because nothing
ever sets sb->s_readonly_remount.

 fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index 0225c20..1912090d 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -735,59 +735,59 @@ rescan:
 int do_remount_sb(struct super_block *sb, int flags, void *data, int force)
 {
 	int retval;
 	int remount_ro;
 
 	if (sb->s_writers.frozen != SB_UNFROZEN)
 		return -EBUSY;
 
 #ifdef CONFIG_BLOCK
 	if (!(flags & MS_RDONLY) && bdev_read_only(sb->s_bdev))
 		return -EACCES;
 #endif
 
 	if (flags & MS_RDONLY)
 		acct_auto_close(sb);
 	shrink_dcache_sb(sb);
-	sync_filesystem(sb);
 
 	remount_ro = (flags & MS_RDONLY) && !(sb->s_flags & MS_RDONLY);
 
 	/* If we are remounting RDONLY and current sb is read/write,
 	   make sure there are no rw files opened */
 	if (remount_ro) {
 		if (force) {
 			mark_files_ro(sb);
 		} else {
 			retval = sb_prepare_remount_readonly(sb);
 			if (retval)
 				return retval;
 		}
 	}
+	sync_filesystem(sb);
 
 	if (sb->s_op->remount_fs) {
 		retval = sb->s_op->remount_fs(sb, &flags, data);
 		if (retval) {
 			if (!force)
 				goto cancel_readonly;
 			/* If forced remount, go ahead despite any errors */
 			WARN(1, "forced remount of a %s fs returned %i\n",
 			     sb->s_type->name, retval);
 		}
 	}
 	sb->s_flags = (sb->s_flags & ~MS_RMT_MASK) | (flags & MS_RMT_MASK);
 	/* Needs to be ordered wrt mnt_is_readonly() */
 	smp_wmb();
 	sb->s_readonly_remount = 0;
 
 	/*
 	 * Some filesystems modify their metadata via some other path than the
 	 * bdev buffer cache (eg. use a private mapping, or directories in
 	 * pagecache, etc). Also file data modifications go via their own
 	 * mappings. So If we try to mount readonly then copy the filesystem
 	 * from bdev, we could get stale data, so invalidate it to give a best
 	 * effort at coherency.
 	 */
 	if (remount_ro && sb->s_bdev)
 		invalidate_bdev(sb->s_bdev);
 	return 0;
 
-- 
1.8.5.2
