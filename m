Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0AM-0007po-OS
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:24:51 +0000
Received: by bwz5 with SMTP id 5so2009440bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 07:24:49 -0800 (PST)
Subject: Re: UBIFS oops after remount ro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfgang Wegner <wolfgang@leila.ping.de>
In-Reply-To: <20101126135005.GV23237@leila.ping.de>
References: <20101126135005.GV23237@leila.ping.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:24:17 +0200
Message-ID: <1290785057.2552.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-11-26 at 14:50 +0100, Wolfgang Wegner wrote:
> [<c0371e40>] (mutex_lock+0x4/0x14) from [<c015cfc4>] (make_reservation+0x74/0x364)
> [<c015cfc4>] (make_reservation+0x74/0x364) from [<c015d79c>] (ubifs_jnl_write_inode+0x80/0x1e4)
> [<c015d79c>] (ubifs_jnl_write_inode+0x80/0x1e4) from [<c0163c14>] (ubifs_write_inode+0x5c/0xbc)
> [<c0163c14>] (ubifs_write_inode+0x5c/0xbc) from [<c00cfbec>] (writeback_single_inode+0x120/0x238)
> [<c00cfbec>] (writeback_single_inode+0x120/0x238) from [<c00d08a8>] (writeback_inodes_wb+0x3d4/0x4a8)
> [<c00d08a8>] (writeback_inodes_wb+0x3d4/0x4a8) from [<c00d0ad4>] (wb_writeback+0x158/0x1ec)
> [<c00d0ad4>] (wb_writeback+0x158/0x1ec) from [<c00d0cb8>] (wb_do_writeback+0x6c/0x1cc)
> [<c00d0cb8>] (wb_do_writeback+0x6c/0x1cc) from [<c00d0e38>] (bdi_writeback_task+0x20/0x98)
> [<c00d0e38>] (bdi_writeback_task+0x20/0x98) from [<c0099020>] (bdi_start_fn+0x8c/0x100)
> [<c0099020>] (bdi_start_fn+0x8c/0x100) from [<c00543bc>] (kthread+0x7c/0x84)
> [<c00543bc>] (kthread+0x7c/0x84) from [<c002744c>] (kernel_thread_exit+0x0/0x8)
> Code: ebfffd21 e28dd014 e8bd80f0 e3a03000 (e1001093)
> ---[ end trace 162376f104dd0abc ]---

Well, for some reason the write-back code thinks UBIFS still has dirty
inodes, but UBIFS was re-mounted R/O and it should not have dirty
inodes. I do not know where the bug is.

> I am a bit puzzled about this all.
> - is the flush-ubifs_0_1 process expected to run after the filesystem
>   has been mounted read-only?

Yes, in .32 it wakes up every 5 seconds. But it should find that there
is nothing to do and go sleep. In newer kernels it does not wake up
unless there is something to do.

> - What can I do to further debug this?

Difficult to say.

Firs of all, try to enable UBIFS debugging - just CONFIG_UBIFS_FS_DEBUG,
not messages. Is the problem still reproducible?

Also, it is interesting where exactly wb_writeback() is called - there
are 2 places.

And it is interesting which inode number is being written by write-back
code. And is it the same every time you oops or not?

Try to reproduce with the following patch:


diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 9d5360c..44ebcdf 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -908,6 +908,7 @@ long wb_do_writeback(struct bdi_writeback *wb, int force_wait)
 		if (args.sync_mode == WB_SYNC_NONE)
 			wb_clear_pending(wb, work);
 
+		printk(KERN_DEBUG "qqq: wb work for %s\n", bdi->name);
 		wrote += wb_writeback(wb, &args);
 
 		/*
@@ -921,6 +922,7 @@ long wb_do_writeback(struct bdi_writeback *wb, int force_wait)
 	/*
 	 * Check for periodic writeback, kupdated() style
 	 */
+	printk(KERN_DEBUG "qqq: kupdated for %s\n", bdi->name);
 	wrote += wb_check_old_data_flush(wb);
 
 	return wrote;
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 914f1bd..6b0e41c 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -124,6 +124,7 @@ static int reserve_space(struct ubifs_info *c, int jhead, int len)
 	 */
 	ubifs_assert(!c->ro_media && !c->ro_mount);
 	squeeze = (jhead == BASEHD);
+
 again:
 	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
 
@@ -779,6 +780,11 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	if (!ino)
 		return -ENOMEM;
 
+	if (!c->jheads) {
+		/* We are about to oops, so here we can print useful info */
+		printk(KERN_DEBUG "qqq: writing inode %lu\n", inode->i_ino);
+	}
+
 	/* Make reservation before allocating sequence numbers */
 	err = make_reservation(c, BASEHD, len);
 	if (err)
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 52f5627..752f4e4 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1533,6 +1533,9 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		return -EROFS;
 	}
 
+	printk(KERN_DEBUG "qqq: %s\n", __func__);
+	dump_stack();
+
 	mutex_lock(&c->umount_mutex);
 	dbg_save_space_info(c);
 	c->remounting_rw = 1;
@@ -1678,6 +1681,8 @@ static void ubifs_remount_ro(struct ubifs_info *c)
 
 	ubifs_assert(!c->need_recovery);
 	ubifs_assert(!c->ro_mount);
+	printk(KERN_DEBUG "qqq: %s\n", __func__);
+	dump_stack();
 
 	mutex_lock(&c->umount_mutex);
 	if (c->bgt) {

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
