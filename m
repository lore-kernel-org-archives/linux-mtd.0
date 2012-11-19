Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TaX4D-0005FI-C9
 for linux-mtd@lists.infradead.org; Mon, 19 Nov 2012 19:31:42 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi1so730216pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Nov 2012 11:31:33 -0800 (PST)
Sender: tristan <blunderer@gmail.com>
Message-ID: <50AA8914.2090009@blunderer.org>
Date: Mon, 19 Nov 2012 14:31:32 -0500
From: Tristan Lelong <tristan.lelong@blunderer.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: make offline logfs image and some BUG()
Content-Type: multipart/mixed; boundary="------------090301070504090403030509"
Reply-To: tristan.lelong@blunderer.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090301070504090403030509
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am trying to use logfs for a project I am currently working on. The 
kernel version I used is 2.6.37 with some patch from TI DM8168.

I search on the internet for an offline way to create a logfs image from 
a directory (like mkfs.jffs2), and the only way seems to be using the 
block2mtd kernel module. Does anybody confirm that?

Also I encountered two BUG():
- The first is already documented on some mailing lists: it is the one 
that it appears when doing umount -> call to map_invalidatepage.
I was able to apply the attached patch1 to fix this, but I still see 
call to this function. I guess I might miss something.

- The other one is when mounting a filesystem that detects a previous 
incomplete write: it BUG() because it cannot find any free segment. 
Trying to understand what is happening, I realized that during the 
mount, the function that adds segment to the free list is called after 
the function that check the filesystem. I modified this like in the 
following patch2 and it seems to work fine.

Does anybody have any thoughts about that?

Thanks a lo

---
618FE3EF


--------------090301070504090403030509
Content-Type: text/plain; charset=UTF-8;
 name="patch1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patch1"

Index: super.c
===================================================================
--- super.c	(revision 24035)
+++ super.c	(working copy)
@@ -511,6 +510,7 @@
 	/* Alias entries slow down mount, so evict as many as possible */
 	sync_filesystem(sb);
 	logfs_write_anchor(sb);
+	free_areas(sb);
 
 	/*
 	 * From this point on alias entries are simply dropped - and any
Index: segment.c
===================================================================
--- segment.c	(revision 24035)
+++ segment.c	(working copy)
@@ -841,6 +841,16 @@
 	kfree(area);
 }
 
+void free_areas(struct super_block *sb)
+{
+	struct logfs_super *super = logfs_super(sb);
+	int i;
+
+	for_each_area(i)
+		free_area(super->s_area[i]);
+	free_area(super->s_journal_area);
+}
+
 static struct logfs_area *alloc_area(struct super_block *sb)
 {
 	struct logfs_area *area;
@@ -923,10 +933,6 @@
 void logfs_cleanup_areas(struct super_block *sb)
 {
 	struct logfs_super *super = logfs_super(sb);
-	int i;
 
 	btree_grim_visitor128(&super->s_object_alias_tree, 0, kill_alias);
-	for_each_area(i)
-		free_area(super->s_area[i]);
-	free_area(super->s_journal_area);
 }
Index: logfs.h
===================================================================
--- logfs.h	(revision 24035)
+++ logfs.h	(working copy)
@@ -594,6 +594,7 @@
 void logfs_sync_area(struct logfs_area *area);
 void logfs_sync_segments(struct super_block *sb);
 void freeseg(struct super_block *sb, u32 segno);
+void free_areas(struct super_block *sb);
 
 /* area handling */
 int logfs_init_areas(struct super_block *sb);

--------------090301070504090403030509
Content-Type: text/plain; charset=UTF-8;
 name="patch2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patch2"

Index: super.c
===================================================================
--- super.c	(revision 24035)
+++ super.c	(working copy)
@@ -308,14 +308,13 @@
 	if (err)
 		return err;
 
+	/* Do one GC pass before any data gets dirtied */
+	logfs_gc_pass(sb);
+
 	/* Check areas for trailing unaccounted data */
 	err = logfs_check_areas(sb);
 	if (err)
 		return err;
-
-	/* Do one GC pass before any data gets dirtied */
-	logfs_gc_pass(sb);
-
 	/* after all initializations are done, replay the journal
 	 * for rw-mounts, if necessary */
 	err = logfs_replay_journal(sb);

--------------090301070504090403030509--
