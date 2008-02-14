Received: from filer.fsl.cs.sunysb.edu ([130.245.126.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JPmNk-0001Ba-Hj
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 22:16:47 +0000
Date: Thu, 14 Feb 2008 17:16:21 -0500
Message-Id: <200802142216.m1EMGLDo032715@agora.fsl.cs.sunysb.edu>
From: Erez Zadok <ezk@cs.sunysb.edu>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: jffs2 console printk storm
Cc: linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

This has been a problem I've seen for a while.  I've generated a jffs2 image
of an empty directory (I don't recall the version of the jffs2 utils I've
used to generate it).  I mount the jffs2 image something like this:

# cp jffs2-empty.img /tmp/fs.0
# losetup /dev/loop0 /tmp/fs.0
# modprobe block2mtd block2mtd=/dev/loop0,128ki
# mount -t jffs2 mtd0 /n/lower/b0

Then I start running my tests in it (in /n/lower/b0).  I get a lot of these
two kinds of console printk messages (esp. the first one):

  CLEANMARKER node found at 0x00810000, not first node in block (0x00800000)
  Empty flash at 0x0080ff70 ends at 0x00810000

I don't know how serious the messages are, but jffs2 seems to work fine for
me even with those many kernel messages scrolling off of my screen.  I could
not find a way to turn off these warnings: jffs2's debugging config options
allow me to turn on more messages, but not to turn off these.

Is there a way to prevent these messages from showing up?  Are they serious?
Is my jffs2 image bad/corrupt?  If so, how should I fix it?

In the mean time, I've been using the small patch below to turn the above
two messages into jffs2 debugging messages.

Thanks,
Erez.


diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 272872d..16f428c 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -646,8 +646,8 @@ scan_more:
 			inbuf_ofs = ofs - buf_ofs;
 			while (inbuf_ofs < scan_end) {
 				if (unlikely(*(uint32_t *)(&buf[inbuf_ofs]) != 0xffffffff)) {
-					printk(KERN_WARNING "Empty flash at 0x%08x ends at 0x%08x\n",
-					       empty_start, ofs);
+					D1(printk(KERN_WARNING "Empty flash at 0x%08x ends at 0x%08x\n",
+						  empty_start, ofs));
 					if ((err = jffs2_scan_dirty_space(c, jeb, ofs-empty_start)))
 						return err;
 					goto scan_more;
@@ -840,7 +840,7 @@ scan_more:
 					return err;
 				ofs += PAD(sizeof(struct jffs2_unknown_node));
 			} else if (jeb->first_node) {
-				printk(KERN_NOTICE "CLEANMARKER node found at 0x%08x, not first node in block (0x%08x)\n", ofs, jeb->offset);
+				D1(printk(KERN_NOTICE "CLEANMARKER node found at 0x%08x, not first node in block (0x%08x)\n", ofs, jeb->offset));
 				if ((err = jffs2_scan_dirty_space(c, jeb, PAD(sizeof(struct jffs2_unknown_node)))))
 					return err;
 				ofs += PAD(sizeof(struct jffs2_unknown_node));
