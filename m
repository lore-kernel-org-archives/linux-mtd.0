Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70]
	helo=mail.dev.rtsoft.ru)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AWXHX-0003WL-Jf
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2003 08:43:47 +0000
From: Ruslan Satlykov <sruslan@dev.rtsoft.ru>
To: Linux-MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary="=-9L+WfCxMqtDSNiWQOPvp"
Message-Id: <1071661335.12084.50.camel@comp174.dev.rtsoft.ru>
Mime-Version: 1.0
Date: Wed, 17 Dec 2003 11:42:15 +0000
Subject: Reducing of JFFS2 mounting time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9L+WfCxMqtDSNiWQOPvp
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,

Some time ago, we faced a problem with a long mounting of high filled JFFS2 filesystem. 
On 16Mb FLASH partition, the scanning (and mount, respectively) tooks about 4-5 seconds. 
To reduce this time, after looking around of possible ways to improve JFFS2 perfomance in 
this area, we decided to move flash scanning process itself into start of garbage collecting 
thread. While scanning will not be done, no any access from user-space is allowed, of course, 
and we reach it by blocking filesystem with semaphore and counter of already scanned flash blocks. 
Since scanning is executing in different kernel thread, user-space 'mount' released relatively fast. 

After scan completion, block counter will be equal total number of blocks and completion 
semaphore will be released, giving applications right to access filesystem.

In original driver's version, when a filesystem mounted in 'read-only mode', a garbage collection
thread doesn't started; in out modified version, we start this thread anyway, but after scanning 
completes, we check with what flags a mounting has been requested. And if we mounts 'read-only',
thread is terminated as usual.

Attached patch have been tested with MontaVista' MVLCEE 2.4.20 Linux kernel. On 16Mb, 
100% filled JFFS2  flash partition, a mounting tooks about 800ms.

Guys, if anybody have a time, please take a look at attached work. What do you think about it? 
Your opinions?

Thanks, 
Ruslan Satlykov

--=-9L+WfCxMqtDSNiWQOPvp
Content-Disposition: attachment;
	filename=linux-2.4.20_mvlcee30-jffs2-fastmount-12162003.patch
Content-Type: text/x-patch;
	name=linux-2.4.20_mvlcee30-jffs2-fastmount-12162003.patch; charset=
Content-Transfer-Encoding: 7bit

diff -uNr linux-2.4.20_mvlcee30-arm-original/Documentation/Configure.help linux-2.4.20_mvlcee30-arm-fast-mount/Documentation/Configure.help
--- linux-2.4.20_mvlcee30-arm-original/Documentation/Configure.help	Fri Sep 26 03:14:24 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/Documentation/Configure.help	Thu Dec 11 11:47:17 2003
@@ -16640,6 +16640,29 @@
   If reporting bugs, please try to have available a full dump of the
   messages at debug level 1 while the misbehaviour was occurring.
 
+JFFS2 Fast mounting
+CONFIG_JFFS2_FAST_MOUNT
+  This option allows to skip entire FLASH media scanning by moving this
+  phase into different kernel thread (at the start of the garbage 
+  collector thread). Also, this add new option to the user-level
+  'mount' command, 'mfast'.
+  
+  NOTE: This is _VERY_ experimental, and _NOT_ OFFICIAL add-on to
+  well-known filesystem.
+  
+  It's good to say 'N' here if you don't understand which was saying above.
+JFFS2 scanned inodes caching
+CONFIG_JFFS2_CACHED_NODES
+  On the first mounting phase, physical FLASH media scanning, scanned
+  inodes info can be cached, which will prevent it's repeately readings
+  on the latter accesses to file system (if the file has not been changed,
+  of course). It will slightly improve filesystem perfomance.
+
+  NOTE: This is _EXPERIMENTAL_, and _NOT_ official add-on to
+  well-known filesystem.
+
+  It's good to say 'N' here if you don't understand which was saying above.
+  
 JFFS stats available in /proc filesystem
 CONFIG_JFFS_PROC_FS
   Enabling this option will cause statistics from mounted JFFS file systems
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/Config.in linux-2.4.20_mvlcee30-arm-fast-mount/fs/Config.in
--- linux-2.4.20_mvlcee30-arm-original/fs/Config.in	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/Config.in	Thu Dec 11 11:37:29 2003
@@ -46,6 +46,8 @@
 dep_tristate 'Journalling Flash File System v2 (JFFS2) support' CONFIG_JFFS2_FS $CONFIG_MTD
 if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m" ] ; then
    int 'JFFS2 debugging verbosity (0 = quiet, 2 = noisy)' CONFIG_JFFS2_FS_DEBUG 0
+   bool 'Fast mounting (EXPERIMENTAL)' CONFIG_JFFS2_FAST_MOUNT $CONFIG_EXPERIMENTAL
+   bool 'Cache inodes on scanning (EXPERIMENTA)' CONFIG_JFFS2_CACHED_NODES $CONFIG_EXPERIMENTAL
 fi
 tristate 'Compressed ROM file system support' CONFIG_CRAMFS
 dep_mbool '  Use linear addressing for cramfs' CONFIG_CRAMFS_LINEAR $CONFIG_CRAMFS
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/background.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/background.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/background.c	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/background.c	Tue Dec 16 14:50:27 2003
@@ -2,6 +2,7 @@
  * JFFS2 -- Journalling Flash File System, Version 2.
  *
  * Copyright (C) 2001, 2002 Red Hat, Inc.
+ * Copyright (C) 2003 MontaVista Software <source@mvista.com>.
  *
  * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
  *
@@ -22,6 +23,7 @@
 #include <linux/unistd.h>
 #include "nodelist.h"
 
+extern int jffs2_build_filesystem (struct jffs2_sb_info *c);
 
 static int jffs2_garbage_collect_thread(void *);
 static int thread_should_wake(struct jffs2_sb_info *c);
@@ -42,10 +44,10 @@
 
 	if (c->gc_task)
 		BUG();
-
+	
 	init_MUTEX_LOCKED(&c->gc_thread_start);
 	init_completion(&c->gc_thread_exit);
-
+	
 	pid = kernel_thread(jffs2_garbage_collect_thread, c, CLONE_FS|CLONE_FILES);
 	if (pid < 0) {
 		printk(KERN_WARNING "fork failed for JFFS2 garbage collect thread: %d\n", -pid);
@@ -81,7 +83,9 @@
 static int jffs2_garbage_collect_thread(void *_c)
 {
 	struct jffs2_sb_info *c = _c;
-
+#ifdef CONFIG_JFFS2_FAST_MOUNT	
+	int ret = 0;
+#endif	
 	daemonize();
 
 	c->gc_task = current;
@@ -89,8 +93,33 @@
 
 	sprintf(current->comm, "jffs2_gcd_mtd%d", c->mtd->index);
 
-	set_user_nice(current, 10);
-
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+	if (!jffs2_is_complete(c)) {
+		
+		struct super_block *sb;
+		
+		set_user_nice (current, 0);
+		
+		ret = jffs2_do_mount_fs (c);	
+		/*
+		if (ret) {
+			complete(&c->scan_complete);
+			goto c_a_e;
+		}
+		*/
+		sb = OFNI_BS_2SFFJ(c);
+
+		if ((sb->s_flags & MS_RDONLY) || ret) {
+			spin_lock_bh(&c->erase_completion_lock);
+			c->gc_task = NULL;
+			spin_unlock_bh(&c->erase_completion_lock);
+			complete_and_exit(&c->gc_thread_exit, ret);
+		}
+	}
+done:
+#endif
+	set_user_nice (current, 10);
+	
 	for (;;) {
 		spin_lock_irq(&current_sig_lock);
 		siginitsetinv (&current->blocked, sigmask(SIGHUP) | sigmask(SIGKILL) | sigmask(SIGSTOP) | sigmask(SIGCONT));
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/build.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/build.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/build.c	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/build.c	Thu Dec 11 17:07:14 2003
@@ -2,6 +2,7 @@
  * JFFS2 -- Journalling Flash File System, Version 2.
  *
  * Copyright (C) 2001, 2002 Red Hat, Inc.
+ * Copyright (C) 2003 MontaVista Software <source@mvista.com>.
  *
  * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
  *
@@ -26,24 +27,23 @@
  - Scan directory tree from top down, setting nlink in inocaches
  - Scan inocaches for inodes with nlink==0
 */
-static int jffs2_build_filesystem(struct jffs2_sb_info *c)
+int jffs2_build_filesystem(struct jffs2_sb_info *c)
 {
 	int ret;
 	int i;
 	struct jffs2_inode_cache *ic;
-
+	
+#ifndef CONFIG_JFFS2_FAST_MOUNT	
 	/* First, scan the medium and build all the inode caches with
 	   lists of physical nodes */
-
+	
 	c->flags |= JFFS2_SB_FLAG_MOUNTING;
 	ret = jffs2_scan_medium(c);
 	c->flags &= ~JFFS2_SB_FLAG_MOUNTING;
-
 	if (ret)
 		return ret;
 
-	D1(printk(KERN_DEBUG "Scanned flash completely\n"));
-	D1(jffs2_dump_block_lists(c));
+#endif /* CONFIG_JFFS2_FAST_MOUNT */	
 
 	/* Now scan the directory tree, increasing nlink according to every dirent found. */
 	for_each_inode(i, c, ic) {
@@ -72,8 +72,12 @@
 				continue;
 			
 			/* XXX: Can get high latency here. Move the cond_resched() from the end of the loop? */
-
+#ifndef CONFIG_JFFS2_FAST_MOUNT			
 			ret = jffs2_build_remove_unlinked_inode(c, ic);
+#else
+			if (jffs2_is_complete(c))
+				ret = jffs2_build_remove_unlinked_inode(c, ic);
+#endif /* CONFIG_JFFS2_FAST_MOUNT */
 			if (ret)
 				break;
 		/* -EAGAIN means the inode's nlink was zero, so we deleted it,
@@ -92,13 +96,24 @@
 	for_each_inode(i, c, ic) {
 		struct jffs2_full_dirent *fd;
 		D1(printk(KERN_DEBUG "Pass 3: ino #%u, ic %p, nodes %p\n", ic->ino, ic, ic->nodes));
-
+		
 		while(ic->scan_dents) {
 			fd = ic->scan_dents;
 			ic->scan_dents = fd->next;
+#ifdef CONFIG_JFFS2_FAST_MOUNT			
+			if (jffs2_is_complete(c))	
+				jffs2_free_full_dirent(fd);
+#else
 			jffs2_free_full_dirent(fd);
+#endif
+		}
+#ifdef CONFIG_JFFS2_FAST_MOUNT	
+		if (jffs2_is_complete(c)) {
+			ic->scan_dents = NULL;
 		}
+#else
 		ic->scan_dents = NULL;
+#endif
 		cond_resched();
 	}
 	D1(printk(KERN_DEBUG "Pass 3 complete\n"));
@@ -155,6 +170,7 @@
 	int ret = 0;
 
 	D1(printk(KERN_DEBUG "JFFS2: Removing ino #%u with nlink == zero.\n", ic->ino));
+
 	
 	for (raw = ic->nodes; raw != (void *)ic; raw = raw->next_in_ino) {
 		D1(printk(KERN_DEBUG "obsoleting node at 0x%08x\n", ref_offset(raw)));
@@ -207,7 +223,7 @@
 
 int jffs2_do_mount_fs(struct jffs2_sb_info *c)
 {
-	int i;
+	int i,ret = 0;
 
 	c->free_size = c->flash_size;
 	c->nr_blocks = c->flash_size / c->sector_size;
@@ -231,7 +247,7 @@
 	init_waitqueue_head(&c->erase_wait);
 	spin_lock_init(&c->erase_completion_lock);
 	spin_lock_init(&c->inocache_lock);
-
+	
 	INIT_LIST_HEAD(&c->clean_list);
 	INIT_LIST_HEAD(&c->very_dirty_list);
 	INIT_LIST_HEAD(&c->dirty_list);
@@ -244,8 +260,19 @@
 	INIT_LIST_HEAD(&c->bad_list);
 	INIT_LIST_HEAD(&c->bad_used_list);
 	c->highest_ino = 1;
+		
+	c->flags |= JFFS2_SB_FLAG_MOUNTING;
+	ret = jffs2_scan_medium(c);
+	c->flags &= ~JFFS2_SB_FLAG_MOUNTING;
+	
+	if (ret)
+		goto fail;
 
-	if (jffs2_build_filesystem(c)) {
+	D1(printk(KERN_DEBUG "Scanned flash completely\n"));
+	D1(jffs2_dump_block_lists(c));
+	
+fail:
+	if (ret) {
 		D1(printk(KERN_DEBUG "build_fs failed\n"));
 		jffs2_free_ino_caches(c);
 		jffs2_free_raw_node_refs(c);
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/dir.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/dir.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/dir.c	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/dir.c	Mon Dec 15 14:04:49 2003
@@ -2,6 +2,7 @@
  * JFFS2 -- Journalling Flash File System, Version 2.
  *
  * Copyright (C) 2001, 2002 Red Hat, Inc.
+ * Copyright (C) 2003 MontaVista Software <source@mvista.com>.
  *
  * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
  *
@@ -73,14 +74,19 @@
 	struct jffs2_full_dirent *fd = NULL, *fd_list;
 	uint32_t ino = 0;
 	struct inode *inode = NULL;
-
+	
 	D1(printk(KERN_DEBUG "jffs2_lookup()\n"));
 
 	dir_f = JFFS2_INODE_INFO(dir_i);
 	c = JFFS2_SB_INFO(dir_i->i_sb);
 
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+	jffs2_waiting_for_scan (c);
+	jffs2_read_inode (dir_i);
+#endif
+	
 	down(&dir_f->sem);
-
+	
 	/* NB: The 2.2 backport will need to explicitly check for '.' and '..' here */
 	for (fd_list = dir_f->dents; fd_list && fd_list->nhash <= target->d_name.hash; fd_list = fd_list->next) {
 		if (fd_list->nhash == target->d_name.hash && 
@@ -92,6 +98,7 @@
 	}
 	if (fd)
 		ino = fd->ino;
+	
 	up(&dir_f->sem);
 	if (ino) {
 		inode = iget(dir_i->i_sb, ino);
@@ -116,12 +123,16 @@
 	struct inode *inode = filp->f_dentry->d_inode;
 	struct jffs2_full_dirent *fd;
 	unsigned long offset, curofs;
-
+	
 	D1(printk(KERN_DEBUG "jffs2_readdir() for dir_i #%lu\n", filp->f_dentry->d_inode->i_ino));
 
 	f = JFFS2_INODE_INFO(inode);
 	c = JFFS2_SB_INFO(inode->i_sb);
 
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+	jffs2_waiting_for_scan (c);
+	jffs2_read_inode (inode);
+#endif	
 	offset = filp->f_pos;
 
 	if (offset == 0) {
@@ -140,9 +151,12 @@
 
 	curofs=1;
 	down(&f->sem);
+
+	
 	for (fd = f->dents; fd; fd = fd->next) {
 
 		curofs++;
+		
 		/* First loop: curofs = 2; offset = 2 */
 		if (curofs < offset) {
 			D2(printk(KERN_DEBUG "Skipping dirent: \"%s\", ino #%u, type %d, because curofs %ld < offset %ld\n", 
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/file.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/file.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/file.c	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/file.c	Mon Dec 15 14:04:43 2003
@@ -269,7 +269,10 @@
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(pg->mapping->host);
 	int ret;
-	
+
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+	jffs2_waiting_for_scan(JFFS2_SB_INFO(pg->mapping->host->i_sb));
+#endif
 	down(&f->sem);
 	ret = jffs2_do_readpage_unlock(pg->mapping->host, pg);
 	up(&f->sem);
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/fs.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/fs.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/fs.c	Thu Jan 16 00:45:11 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/fs.c	Tue Dec 16 14:55:21 2003
@@ -2,6 +2,7 @@
  * JFFS2 -- Journalling Flash File System, Version 2.
  *
  * Copyright (C) 2001, 2002 Red Hat, Inc.
+ * Copyright (C) 2003 MontaVista Software <source@mvista.com>.
  *
  * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
  *
@@ -34,6 +35,9 @@
 	buf->f_ffree = 0;
 	buf->f_namelen = JFFS2_MAX_NAME_LEN;
 
+#ifdef CONFIG_JFFS2_FAST_MOUNT	
+	jffs2_waiting_for_scan(c);
+#endif
 	spin_lock_bh(&c->erase_completion_lock);
 
 	avail = c->dirty_size + c->free_size;
@@ -78,14 +82,14 @@
 	c = JFFS2_SB_INFO(inode->i_sb);
 
 	jffs2_init_inode_info(f);
-	
-	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
 
+	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
 	if (ret) {
 		make_bad_inode(inode);
 		up(&f->sem);
 		return;
-	}
+	}	
+
 	inode->i_mode = je32_to_cpu(latest_node.mode);
 	inode->i_uid = je16_to_cpu(latest_node.uid);
 	inode->i_gid = je16_to_cpu(latest_node.gid);
@@ -153,7 +157,7 @@
 	default:
 		printk(KERN_WARNING "jffs2_read_inode(): Bogus imode %o for ino %lu\n", inode->i_mode, (unsigned long)inode->i_ino);
 	}
-
+	
 	up(&f->sem);
 
 	D1(printk(KERN_DEBUG "jffs2_read_inode() returning\n"));
@@ -166,7 +170,12 @@
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !(sb->s_flags & MS_RDONLY))
 		return -EROFS;
-
+/*
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+	jffs2_waiting_for_scan(c);
+	jffs2_stop_garbage_collect_thread(c);
+#else
+*/
 	/* We stop if it was running, then restart if it needs to.
 	   This also catches the case where it was stopped and this
 	   is just a remount to restart it */
@@ -176,6 +185,8 @@
 	if (!(*flags & MS_RDONLY))
 		jffs2_start_garbage_collect_thread(c);
 	
+//#endif /* CONFIG_JFFS2_FAST_MOUNT */
+	
 	sb->s_flags = (sb->s_flags & ~MS_RDONLY)|(*flags & MS_RDONLY);
 
 	return 0;
@@ -259,7 +270,7 @@
 	struct inode *root_i;
 	int ret;
 	size_t blocks;
-
+	
 	c = JFFS2_SB_INFO(sb);
 
 	c->flash_size = c->mtd->size;
@@ -313,16 +324,28 @@
 		goto out_wbuf;
 	}
 	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
-
-	if ((ret = jffs2_do_mount_fs(c)))
-		goto out_inohash;
-
+	
 	ret = -EINVAL;
+	
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+	init_completion(&c->scan_complete);	
+	atomic_set (&c->scan_count, 0);
+	jffs2_start_garbage_collect_thread(c);
+	
+	while (atomic_read (&c->scan_count) < /*c->nr_blocks*/ 10)
+		cond_resched ();
+#else
+	if ((ret = jffs2_do_mount_fs(c)))
+		goto out_inohash;	
+		
+	if (!(sb->s_flags & MS_RDONLY)) 
+		jffs2_start_garbage_collect_thread(c);
+#endif 	
 
 	D1(printk(KERN_DEBUG "jffs2_do_fill_super(): Getting root inode\n"));
 	root_i = iget(sb, 1);
 	if (is_bad_inode(root_i)) {
-		D1(printk(KERN_WARNING "get root inode failed\n"));
+		printk(KERN_WARNING "get root inode failed\n");
 		goto out_nodes;
 	}
 
@@ -337,8 +360,7 @@
 	sb->s_blocksize = PAGE_CACHE_SIZE;
 	sb->s_blocksize_bits = PAGE_CACHE_SHIFT;
 	sb->s_magic = JFFS2_SUPER_MAGIC;
-	if (!(sb->s_flags & MS_RDONLY))
-		jffs2_start_garbage_collect_thread(c);
+
 	return 0;
 
  out_root_i:
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/nodelist.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/nodelist.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/nodelist.c	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/nodelist.c	Thu Dec 11 18:54:11 2003
@@ -2,6 +2,7 @@
  * JFFS2 -- Journalling Flash File System, Version 2.
  *
  * Copyright (C) 2001, 2002 Red Hat, Inc.
+ * Copyright (C) 2003 MontaVista Software <source@mvista.com>. 
  *
  * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
  *
@@ -103,27 +104,29 @@
 	struct jffs2_raw_node_ref *ref = f->inocache->nodes;
 	struct jffs2_tmp_dnode_info *tn, *ret_tn = NULL;
 	struct jffs2_full_dirent *fd, *ret_fd = NULL;
-
+	
 	union jffs2_node_union node;
 	size_t retlen;
 	int err;
 
 	*mctime_ver = 0;
 
-	D1(printk(KERN_DEBUG "jffs2_get_inode_nodes(): ino #%lu\n", ino));
+	D1(printk("jffs2_get_inode_nodes(): ino #%lu\n", ino));
 	if (!f->inocache->nodes) {
 		printk(KERN_WARNING "Eep. no nodes for ino #%lu\n", ino);
 	}
-
+	
 	spin_lock_bh(&c->erase_completion_lock);
 
+	
 	for (ref = f->inocache->nodes; ref && ref->next_in_ino; ref = ref->next_in_ino) {
 		/* Work out whether it's a data node or a dirent node */
 		if (ref_obsolete(ref)) {
 			/* FIXME: On NAND flash we may need to read these */
-			D1(printk(KERN_DEBUG "node at 0x%08x is obsoleted. Ignoring.\n", ref_offset(ref)));
+			printk("node at 0x%08x is obsoleted. Ignoring.\n", ref_offset(ref));
 			continue;
 		}
+		
 		/* We can hold a pointer to a non-obsolete node without the spinlock,
 		   but _obsolete_ nodes may disappear at any time, if the block
 		   they're in gets erased */
@@ -131,17 +134,29 @@
 
 		cond_resched();
 
+#ifdef CONFIG_JFFS2_CACHED_NODES		
+		if (je16_to_cpu(ref->v.u.magic) == JFFS2_MAGIC_BITMASK && je16_to_cpu(ref->v.u.nodetype) == JFFS2_NODETYPE_INODE) {
+			D2(printk(KERN_DEBUG "inode at 0x%08X cached\n", ref_offset(ref)));
+			err = 0;
+			retlen = /*ref->totlen*/sizeof (node.i);
+			//memcpy (&node.i, ref->v.ri, sizeof (ref->v.ri));
+			node.u.magic = ref->v.ri.magic;
+			node.u.totlen = ref->v.ri.totlen;
+			node.u.nodetype = ref->v.ri.nodetype;
+			memcpy (&node.i, &ref->v.ri, sizeof (node.i));
+		} else
+#endif		
 		/* FIXME: point() */
 		err = jffs2_flash_read(c, (ref_offset(ref)), min(ref->totlen, sizeof(node)), &retlen, (void *)&node);
 		if (err) {
 			printk(KERN_WARNING "error %d reading node at 0x%08x in get_inode_nodes()\n", err, ref_offset(ref));
 			goto free_out;
 		}
-			
-
+		
 			/* Check we've managed to read at least the common node header */
 		if (retlen < min(ref->totlen, sizeof(node.u))) {
-			printk(KERN_WARNING "short read in get_inode_nodes()\n");
+			printk(KERN_WARNING "short read in get_inode_nodes(): ref_offset(ref) = 0x%08X, retlen = %d, ref->totlen = %d, sizeof(node.u) = %lu\n",
+						ref_offset(ref), retlen, ref->totlen, sizeof (node.u));
 			err = -EIO;
 			goto free_out;
 		}
@@ -154,7 +169,7 @@
 				BUG();
 			}
 			if (retlen < sizeof(node.d)) {
-				printk(KERN_WARNING "short read in get_inode_nodes()\n");
+				printk(KERN_WARNING "short read in get_inode_nodes() for dirent\n");
 				err = -EIO;
 				goto free_out;
 			}
@@ -219,14 +234,14 @@
 		case JFFS2_NODETYPE_INODE:
 			D1(printk(KERN_DEBUG "Node at %08x (%d) is a data node\n", ref_offset(ref), ref_flags(ref)));
 			if (retlen < sizeof(node.i)) {
-				printk(KERN_WARNING "read too short for dnode\n");
+				printk(KERN_WARNING "read too short for dnode; retlen = %ld, sizeof(node.i) = %ld\n", retlen, sizeof(node.i));
 				err = -EIO;
 				goto free_out;
 			}
 			if (je32_to_cpu(node.i.version) > *highest_version)
 				*highest_version = je32_to_cpu(node.i.version);
 			D1(printk(KERN_DEBUG "version %d, highest_version now %d\n", je32_to_cpu(node.i.version), *highest_version));
-
+			
 			if (ref_obsolete(ref)) {
 				/* Obsoleted. This cannot happen, surely? dwmw2 20020308 */
 				printk(KERN_ERR "Inode node at 0x%08x became obsolete while we weren't looking\n",
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/nodelist.h linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/nodelist.h
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/nodelist.h	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/nodelist.h	Tue Dec 16 13:11:23 2003
@@ -39,6 +39,14 @@
 #define D2(x)
 #endif
 
+#ifdef CONFIG_JFFS2_CACHED_NODES
+struct jffs2_raw_nodes_vtbl 
+{
+	struct jffs2_unknown_node u;
+	struct jffs2_raw_inode ri;
+	struct jffs2_raw_dirent *rd;
+};
+#endif
 /*
   This is all we need to keep in-core for each raw node during normal
   operation. As and when we do read_inode on a particular inode, we can
@@ -55,7 +63,9 @@
 	struct jffs2_raw_node_ref *next_phys;
 	uint32_t flash_offset;
 	uint32_t totlen;
-	
+#ifdef CONFIG_JFFS2_CACHED_NODES
+	struct jffs2_raw_nodes_vtbl v;
+#endif
         /* flash_offset & 3 always has to be zero, because nodes are
 	   always aligned at 4 bytes. So we have a couple of extra bits
 	   to play with. So we set the least significant bit to 1 to
@@ -246,6 +256,27 @@
 
 #define PAD(x) (((x)+3)&~3)
 
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+static inline int jffs2_is_complete(struct jffs2_sb_info *c) 
+{
+	int ret = 0;
+	struct completion *x = &c->scan_complete;
+	
+	spin_lock_irq(&x->wait.lock);
+	
+	if (x->done)
+		ret = 1;
+
+	spin_unlock_irq(&x->wait.lock);
+
+	return ret;
+}
+#define jffs2_waiting_for_scan(c) 	wait_for_completion(&c->scan_complete); \
+					complete(&c->scan_complete);
+#else
+#define jffs2_waiting_for_scan(c)	{ ; }
+#endif
+
 static inline int jffs2_raw_ref_to_inum(struct jffs2_raw_node_ref *raw)
 {
 	while(raw->next_in_ino) {
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/scan.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/scan.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/scan.c	Thu Mar 27 10:21:37 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/scan.c	Thu Dec 11 17:07:46 2003
@@ -2,6 +2,7 @@
  * JFFS2 -- Journalling Flash File System, Version 2.
  *
  * Copyright (C) 2001, 2002 Red Hat, Inc.
+ * Copyright (C) 2003 MontaVista Software <source@mvista.com>.
  *
  * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
  *
@@ -71,7 +72,12 @@
 	unsigned char *flashbuf = NULL;
 	uint32_t buf_size = 0;
 	size_t pointlen;
-
+	
+	struct timeval scan_started, scan_done;
+	uint32_t delay = 0;
+	
+	do_gettimeofday (&scan_started);
+	
 	if (!c->blocks) {
 		printk(KERN_WARNING "EEEK! c->blocks is NULL!\n");
 		return -EINVAL;
@@ -100,10 +106,11 @@
 		if (!flashbuf)
 			return -ENOMEM;
 	}
-
+	
+	
 	for (i=0; i<c->nr_blocks; i++) {
 		struct jffs2_eraseblock *jeb = &c->blocks[i];
-
+		
 		ret = jffs2_scan_eraseblock(c, jeb, buf_size?flashbuf:(flashbuf+jeb->offset), buf_size);
 
 		if (ret < 0)
@@ -202,6 +209,10 @@
 			printk(KERN_WARNING "jffs2_scan_medium(): unknown block state\n");
 			BUG();	
 		}
+#ifdef CONFIG_JFFS2_FAST_MOUNT		
+		atomic_inc(&c->scan_count);
+		jffs2_build_filesystem(c);
+#endif
 	}
 	
 	/* Nextblock dirty is always seen as wasted, because we cannot recycle it now */
@@ -227,6 +238,7 @@
 		c->nextblock->free_size -= skip;
 		c->free_size -= skip;
 	}
+
 	if (c->nr_erasing_blocks) {
 		if ( !c->used_size && ((empty_blocks+bad_blocks)!= c->nr_blocks || bad_blocks == c->nr_blocks) ) {
 			printk(KERN_NOTICE "Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes\n");
@@ -240,6 +252,15 @@
 	else 
 		c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
 
+#ifdef CONFIG_JFFS2_FAST_MOUNT
+	do_gettimeofday (&scan_done);
+
+	complete(&c->scan_complete);
+	jffs2_build_filesystem(c);
+	
+	delay = (scan_done.tv_sec * 1000 + scan_done.tv_usec / 1000) - (scan_started.tv_sec * 1000 + scan_started.tv_usec / 1000);
+	printk ("jffs2_scan_medium(): Flash scanned completely; %ldms spended to scan.\n", delay);
+#endif
 	return 0;
 }
 
@@ -636,6 +657,37 @@
 	return ic;
 }
 
+#ifdef CONFIG_JFFS2_CACHED_NODES
+static void jffs2_copy_raw_inode (struct jffs2_raw_node_ref *ref, struct jffs2_raw_inode *ri)
+{
+	/*
+	memcpy (&ref->v.u, ri, sizeof (struct jffs2_unknown_node));
+	ref->v.ri = jffs2_alloc_raw_inode ();
+	if (!ref->v.ri) {
+		memset (&ref->v.u, 0, sizeof (ref->v.u));
+		return;
+	}
+	memcpy (&ref->v.u, ri, sizeof (ref->v.u));
+	memcpy (ref->v.ri, ri, sizeof (*ri));
+	*/
+	memcpy (&ref->v.ri, ri, sizeof (*ri));
+}
+
+static void jffs2_copy_raw_dirent (struct jffs2_raw_node_ref *ref, struct jffs2_raw_dirent *rd)
+{
+	/*
+	memcpy (&ref->v.u, rd, sizeof (struct jffs2_unknown_node));
+	ref->v.rd = (struct jffs2_raw_dirent *)kmalloc (sizeof (*rd) + rd->nsize + 1, GFP_KERNEL);
+	if (!ref->v.rd) {
+		memset (&ref->v.u, 0, sizeof (ref->v.u));
+		return;
+	}
+	memcpy (ref->v.rd, rd, sizeof (*rd));
+	*/
+}
+
+#endif /* CONFIG_JFFS2_CACHED_NODES_OLD */
+
 static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, 
 				 struct jffs2_raw_inode *ri, uint32_t ofs)
 {
@@ -687,7 +739,10 @@
 	raw->totlen = PAD(je32_to_cpu(ri->totlen));
 	raw->next_phys = NULL;
 	raw->next_in_ino = ic->nodes;
-
+#ifdef CONFIG_JFFS2_CACHED_NODES_1
+	jffs2_copy_raw_inode (raw, ri);
+	//memcpy (&raw->v.ri, ri, sizeof (*ri));
+#endif
 	ic->nodes = raw;
 	if (!jeb->first_node)
 		jeb->first_node = raw;
@@ -778,6 +833,9 @@
 	fd->ino = je32_to_cpu(rd->ino);
 	fd->nhash = full_name_hash(fd->name, rd->nsize);
 	fd->type = rd->type;
+#ifdef CONFIG_JFFS2_CACHED_NODES
+//	jffs2_copy_raw_dirent (raw, rd);
+#endif
 	USED_SPACE(PAD(je32_to_cpu(rd->totlen)));
 	jffs2_add_fd_to_list(c, fd, &ic->scan_dents);
 
diff -uNr linux-2.4.20_mvlcee30-arm-original/fs/jffs2/super-v24.c linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/super-v24.c
--- linux-2.4.20_mvlcee30-arm-original/fs/jffs2/super-v24.c	Wed Mar 19 22:51:28 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/fs/jffs2/super-v24.c	Wed Dec 10 13:14:44 2003
@@ -2,6 +2,7 @@
  * JFFS2 -- Journalling Flash File System, Version 2.
  *
  * Copyright (C) 2001, 2002 Red Hat, Inc.
+ * Copyright (C) 2003 MontaVista Software <source@mvista.com>.
  *
  * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
  *
@@ -29,6 +30,12 @@
 #define MTD_BLOCK_MAJOR 31
 #endif
 
+#ifndef CONFIG_JFFS2_FAST_MOUNT
+#define JFFS2NAM "JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis Communications AB.\n"
+#else
+#define JFFS2NAM "JFFS2 version 2.1 (with Fast-Mounting option). (C) 2001, 2002 Red Hat, Inc., designed by Axis Communications AB.\n"
+#endif
+
 void jffs2_put_super (struct super_block *);
 
 static struct super_operations jffs2_super_operations =
@@ -106,7 +113,7 @@
 {
 	int ret;
 
-	printk(KERN_NOTICE "JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis Communications AB.\n");
+	printk(KERN_NOTICE "%s", JFFS2NAM);
 
 #ifdef JFFS2_OUT_OF_KERNEL
 	/* sanity checks. Could we do these at compile time? */
diff -uNr linux-2.4.20_mvlcee30-arm-original/include/linux/jffs2_fs_sb.h linux-2.4.20_mvlcee30-arm-fast-mount/include/linux/jffs2_fs_sb.h
--- linux-2.4.20_mvlcee30-arm-original/include/linux/jffs2_fs_sb.h	Thu Mar 27 10:21:42 2003
+++ linux-2.4.20_mvlcee30-arm-fast-mount/include/linux/jffs2_fs_sb.h	Tue Dec  9 18:29:02 2003
@@ -13,6 +13,8 @@
 #define JFFS2_SB_FLAG_RO 1
 #define JFFS2_SB_FLAG_MOUNTING 2
 
+#define CHECKPOINT_BLOCK(c)	(c->nr_blocks / 16)
+
 /* A struct for the overall file system control.  Pointers to
    jffs2_sb_info structs are named `c' in the source code.  
    Nee jffs_control
@@ -51,6 +53,7 @@
 	uint32_t nr_erasing_blocks;
 
 	uint32_t nr_blocks;
+
 	struct jffs2_eraseblock *blocks;	/* The whole array of blocks. Used for getting blocks 
 						 * from the offset (blocks[ofs / sector_size]) */
 	struct jffs2_eraseblock *nextblock;	/* The block we're currently filling */
@@ -75,6 +78,11 @@
 
 	struct jffs2_inode_cache **inocache_list;
 	spinlock_t inocache_lock;
+
+#ifdef CONFIG_JFFS2_FAST_MOUNT	
+	struct completion scan_complete;
+	atomic_t scan_count;
+#endif /* CONFIG_JFFS2_FAST_MOUNT */
 	
 	/* Sem to allow jffs2_garbage_collect_deletion_dirent to
 	   drop the erase_completion_lock while it's holding a pointer 

--=-9L+WfCxMqtDSNiWQOPvp--
