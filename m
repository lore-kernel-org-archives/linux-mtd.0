Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D5MZZ-0003jf-Vg
	for linux-mtd@lists.infradead.org; Sun, 27 Feb 2005 06:26:56 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Craig A. Vanderborgh" <craigv@voxware.com>
In-Reply-To: <422141F8.7050707@voxware.com>
References: <1109444967.4688.19.camel@sauron.oktetlabs.ru>
	<422141F8.7050707@voxware.com>
Content-Type: multipart/mixed; boundary="=-weNPJTx/IeUFR1PNJy3M"
Date: Sun, 27 Feb 2005 14:26:20 +0300
Message-Id: <1109503580.13512.30.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: [BUGFIX] JFFS2 NOR problem
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-weNPJTx/IeUFR1PNJy3M
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Craig, 

I've found that the patch I sent yesterday has defect which might cause
errors or at least lead to an inefficient behavior.

The problem is that if we have the JFFS2_SB_FLAG_MOUNTING flag set
during the entire FS build process we risk to loose proper blocks
accounting. Namely, jffs2_mark_node_obsolete() function moves blocks
between different lists, but this peace of code is skipped owing to the
JFFS2_SB_FLAG_MOUNTING flag.

New patch (attached) must be better. Comments?

On Sat, 2005-02-26 at 22:43 -0500, Craig A. Vanderborgh wrote:
> I have succeeded in resolving the oops that I reported in 2 different ways:
Good, I hope Konstantin Kletschke's problem will go away as well.

> Would you please comment on this:  which solution do you think is the 
> better one?  Now that we have the newer MTD code working in the 
> otherwise "vanilla" 2.6.10 kernel, is this the best solution?  Or is the 
> build.c patch solution the safer bet for us?
Well, I can't advice ably but I'd rather use CVS head albeit it is a bit
more dangerous. And last but not least, I'd like to stress - CVS head,
not 2.6.11-rc5 as its MTD snapshot doesn't have to be latest. You might
download the latest MTD snapshot and install it to your kernel
(patchin.sh utility). Refer to linux-mtd.infradead.org for more info.


On Sun, 2005-02-27 at 09:40 +0000, David Woodhouse wrote: 
> Didn't we move it from there to where it is now quite recently for other
> reasons?
Yes, we did. First the flag was set only around scan and we moved it 
lover to embrace the Pass 1 as well.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--=-weNPJTx/IeUFR1PNJy3M
Content-Disposition: attachment; filename=jffs2_mount_fix-01.diff
Content-Type: text/x-patch; name=jffs2_mount_fix-01.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff -auNr --exclude=CVS mtd/fs/jffs2/build.c mtd-tst/fs/jffs2/build.c
--- mtd/fs/jffs2/build.c	2004-12-16 23:22:18.000000000 +0300
+++ mtd-tst/fs/jffs2/build.c	2005-02-27 12:56:19.000000000 +0300
@@ -97,14 +97,16 @@
 	/* First, scan the medium and build all the inode caches with
 	   lists of physical nodes */
 
-	c->flags |= JFFS2_SB_FLAG_MOUNTING;
+	c->flags |= JFFS2_SB_FLAG_SCANNING;
 	ret = jffs2_scan_medium(c);
+	c->flags &= ~JFFS2_SB_FLAG_SCANNING;
 	if (ret)
 		goto exit;
 
 	D1(printk(KERN_DEBUG "Scanned flash completely\n"));
 	D2(jffs2_dump_block_lists(c));
 
+	c->flags |= JFFS2_SB_FLAG_BUILDING;
 	/* Now scan the directory tree, increasing nlink according to every dirent found. */
 	for_each_inode(i, c, ic) {
 		D1(printk(KERN_DEBUG "Pass 1: ino #%u\n", ic->ino));
@@ -116,7 +118,6 @@
 			cond_resched();
 		}
 	}
-	c->flags &= ~JFFS2_SB_FLAG_MOUNTING;
 
 	D1(printk(KERN_DEBUG "Pass 1 complete\n"));
 
@@ -164,6 +165,8 @@
 		ic->scan_dents = NULL;
 		cond_resched();
 	}
+	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
+	
 	D1(printk(KERN_DEBUG "Pass 3 complete\n"));
 	D2(jffs2_dump_block_lists(c));
 
diff -auNr --exclude=CVS mtd/fs/jffs2/nodemgmt.c mtd-tst/fs/jffs2/nodemgmt.c
--- mtd/fs/jffs2/nodemgmt.c	2005-01-25 23:11:11.000000000 +0300
+++ mtd-tst/fs/jffs2/nodemgmt.c	2005-02-27 13:04:36.000000000 +0300
@@ -403,7 +403,7 @@
 	jeb = &c->blocks[blocknr];
 
 	if (jffs2_can_mark_obsolete(c) && !jffs2_is_readonly(c) &&
-	    !(c->flags & JFFS2_SB_FLAG_MOUNTING)) {
+	    !(c->flags & (JFFS2_SB_FLAG_SCANNING | JFFS2_SB_FLAG_BUILDING))) {
 		/* Hm. This may confuse static lock analysis. If any of the above 
 		   three conditions is false, we're going to return from this 
 		   function without actually obliterating any nodes or freeing
@@ -470,8 +470,8 @@
 
 	D1(ACCT_PARANOIA_CHECK(jeb));
 
-	if (c->flags & JFFS2_SB_FLAG_MOUNTING) {
-		/* Mount in progress. Don't muck about with the block
+	if (c->flags & JFFS2_SB_FLAG_SCANNING) {
+		/* Flash scanning is in progress. Don't muck about with the block
 		   lists because they're not ready yet, and don't actually
 		   obliterate nodes that look obsolete. If they weren't 
 		   marked obsolete on the flash at the time they _became_
@@ -530,7 +530,8 @@
 
 	spin_unlock(&c->erase_completion_lock);
 
-	if (!jffs2_can_mark_obsolete(c) || jffs2_is_readonly(c)) {
+	if (!jffs2_can_mark_obsolete(c) || jffs2_is_readonly(c) ||
+		(c->flags & JFFS2_SB_FLAG_BUILDING)) {
 		/* We didn't lock the erase_free_sem */
 		return;
 	}
diff -auNr --exclude=CVS mtd/include/linux/jffs2_fs_sb.h mtd-tst/include/linux/jffs2_fs_sb.h
--- mtd/include/linux/jffs2_fs_sb.h	2005-02-09 12:23:55.000000000 +0300
+++ mtd-tst/include/linux/jffs2_fs_sb.h	2005-02-27 13:13:36.000000000 +0300
@@ -14,7 +14,8 @@
 #include <linux/rwsem.h>
 
 #define JFFS2_SB_FLAG_RO 1
-#define JFFS2_SB_FLAG_MOUNTING 2
+#define JFFS2_SB_FLAG_SCANNING 2 /* Flash scanning is in progress */
+#define JFFS2_SB_FLAG_BUILDING 4 /* File system building is in progress */
 
 struct jffs2_inodirty;
 

--=-weNPJTx/IeUFR1PNJy3M--
