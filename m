Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dotN-0003KH-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 08:47:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02022021101508.18560@thomas> 
References: <02022021101508.18560@thomas>  <02022020414807.18560@thomas> 
To: gleixner@autronix.de
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 list_dirty corruption 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Feb 2002 08:59:09 +0000
Message-ID: <28487.1014281949@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

gleixner@autronix.de said:
> > While hacking on JFFS2 for NAND I found a possibility, where
> > scan_medium corrupts list_dirty. 
> This patch resolves the problem: 

That's OK, but I think it's cleaner if we prevent the mark_node_obsolete() 
code from touching the lists in the first place. This way, we can also 
prevent it from trying to physically mark them obsolete too - if that 
didn't happen the first time, we shouldn't be doing it on mount. 

This problem didn't turn up on NOR flash because we do mark the nodes 
obsolete on the flash, so the mount code never had to bother with them.

Please could you confirm this also fixes the problem?

Index: include/linux/jffs2_fs_sb.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/jffs2_fs_sb.h,v
retrieving revision 1.18
diff -u -p -r1.18 jffs2_fs_sb.h
--- include/linux/jffs2_fs_sb.h	2002/01/09 11:44:23	1.18
+++ include/linux/jffs2_fs_sb.h	2002/02/21 08:33:56
@@ -12,6 +12,7 @@
 #define INOCACHE_HASHSIZE 1
 
 #define JFFS2_SB_FLAG_RO 1
+#define JFFS2_SB_FLAG_MOUNTING 2
 
 /* A struct for the overall file system control.  Pointers to
    jffs2_sb_info structs are named `c' in the source code.  
Index: fs/jffs2/build.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/build.c,v
retrieving revision 1.22
diff -u -p -r1.22 build.c
--- fs/jffs2/build.c	2002/01/09 16:30:57	1.22
+++ fs/jffs2/build.c	2002/02/21 08:33:56
@@ -293,6 +293,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
 	INIT_LIST_HEAD(&c->bad_list);
 	INIT_LIST_HEAD(&c->bad_used_list);
 	c->highest_ino = 1;
+	c->flags |= JFFS2_SB_FLAG_MOUNTING;
 
 	if (jffs2_build_filesystem(c)) {
 		D1(printk(KERN_DEBUG "build_fs failed\n"));
@@ -301,5 +302,8 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
 		kfree(c->blocks);
 		return -EIO;
 	}
+	
+	c->flags &= ~JFFS2_SB_FLAG_MOUNTING;
+
 	return 0;
 }
Index: fs/jffs2/nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.52
diff -u -p -r1.52 nodemgmt.c
--- fs/jffs2/nodemgmt.c	2002/01/19 23:16:41	1.52
+++ fs/jffs2/nodemgmt.c	2002/02/21 08:33:57
@@ -318,6 +318,15 @@ void jffs2_mark_node_obsolete(struct jff
 
 	ACCT_PARANOIA_CHECK(jeb);
 
+	if (c->flags & JFFS2_SB_FLAG_MOUNTING) {
+		/* Mount in progress. Don't muck about with the block
+		   lists because they're not ready yet, and don't actually
+		   obliterate nodes that look obsolete. If they weren't 
+		   marked obsolete on the flash at the time they _became_
+		   obsolete, there was probably a reason for that. */
+		spin_unlock_bh(&c->erase_completion_lock);
+		return;
+	}
 	if (jeb == c->nextblock) {
 		D2(printk(KERN_DEBUG "Not moving nextblock 0x%08x to dirty/erase_pending list\n", jeb->offset));
 	} else if (jeb == c->gcblock) {


--
dwmw2
