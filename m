Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16exDi-0001s2-00
	for <linux-mtd@lists.infradead.org>; Sun, 24 Feb 2002 11:53:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000701c1bd20$b62ba000$8b97143e@jocke> 
References: <000701c1bd20$b62ba000$8b97143e@jocke>  <441701c1ba2c$2cf1dc60$1900000a@v.vmanage.com> <20020220063356.59191.qmail@web14702.mail.yahoo.com> <24611.1014280415@redhat.com> <449501c1bd14$48bac5c0$1900000a@v.vmanage.com> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: "Gad Hayisraeli" <gad@syete.co.il>, gleixner@autronix.de,
    "Michael Michael" <memmel2@yahoo.com>, jffs-dev@axis.com
Subject: Re: Slow jffs2 startup on DOM 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 24 Feb 2002 12:04:27 +0000
Message-ID: <29564.1014552267@redhat.com>
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

(moved to correct list)

Joakim.Tjernlund@lumentis.se said:
> I see this too. Every time I boot with a fresh JFFS2 image or if I
> remove som big files and reboot(does not matter if I wait before I
> reboot), kupdate runs like hell, consuming almost all cpu for a while
> before it calms down. If I monitor the output from 'df', I see that
> the Use field slowly rises to 100% and then its drops back to my real
> usage of the JFFS2 partition. 

That one I can explain, although it shouldn't make any difference whether 
you reboot cleanly or not.

When we obsoleted the final node in an eraseblock, we used to stick it 
straight on the erase_pending_list for recycling. That screwed the wear 
levelling - if you continually create and remove {lots of,large} files, 
then you'll keep using the same blocks over and over again.

So I took that out, and we just file those blocks on the dirty_list for 
later erasure by the garbage-collection code. However, the mount code will 
observe that they're entirely empty and file them for immediate erasure, 
and this is what makes kupdated eat your CPU on remount.

I see two options for fixing this.

First, we could partially revert the earlier change - mostly just erase 
the block straight away as we used to, but _occasionally_ put it on the 
dirty_list to keep the wear levelling moving.

Secondly, we could prevent the code from erasing the all-dirty blocks
immediately on mount, by filing them at the front of the dirty_list so 
they're first up for garbage-collection. 

I've just committed the first option to CVS, which should render the second 
pointless - there will rarely be many such blocks anyway. 

Thomas - this may break the NAND support, as it takes some NAND-specific 
code out of #if 0. Although the NAND support was already broken, because 
that code really should have been used :)

In the 1 in 64 times that we just stick this block on the dirty_list instead
of erasing it immediately (or putting it on the erase_pending_wbuf list),
what stops the GC code from subsequently erasing it before the wbuf is
flushed? (Until today, that was 64 in 64 times.)

Index: nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.55
retrieving revision 1.56
diff -u -p -r1.55 -r1.56
--- nodemgmt.c	2002/02/21 23:50:46	1.55
+++ nodemgmt.c	2002/02/24 11:55:23	1.56
@@ -31,7 +31,7 @@
  * provisions above, a recipient may use your version of this file
  * under either the RHEPL or the GPL.
  *
- * $Id: nodemgmt.c,v 1.55 2002/02/21 23:50:46 gleixner Exp $
+ * $Id: nodemgmt.c,v 1.56 2002/02/24 11:55:23 dwmw2 Exp $
  *
  */
 
@@ -348,13 +348,17 @@ void jffs2_mark_node_obsolete(struct jff
 		D2(printk(KERN_DEBUG "Not moving nextblock 0x%08x to dirty/erase_pending list\n", jeb->offset));
 	} else if (jeb == c->gcblock) {
 		D2(printk(KERN_DEBUG "Not moving gcblock 0x%08x to dirty/erase_pending list\n", jeb->offset));
-#if 0 /* We no longer do this here. It can screw the wear levelling. If you have a lot of static
-	 data and a few blocks free, and you just create new files and keep deleting/overwriting
-	 them, then you'd keep erasing and reusing those blocks without ever moving stuff around.
-	 So we leave completely obsoleted blocks on the dirty_list and let the GC delete them 
-	 when it finds them there. That way, we still get the 'once in a while, take a clean block'
-	 to spread out the flash usage */
-	} else if (!jeb->used_size) {
+	} else if (!jeb->used_size && (jiffies % 64)) {
+		/* We no longer do this unconditionally. It can screw the wear
+		   levelling. If you have a lot of static data and a few
+		   blocks free, and you just create new files and keep
+		   deleting/overwriting them, then you'd keep erasing and
+		   reusing those blocks without ever moving stuff around.  So
+		   occasionally we leave completely obsoleted blocks on the
+		   dirty_list and let the GC delete them when it finds them
+		   there. That way, we still get the 'once in a while, take a
+		   clean block' to spread out the flash usage.
+		*/
 		D1(printk(KERN_DEBUG "Eraseblock at 0x%08x completely dirtied. Removing from (dirty?) list...\n", jeb->offset));
 		list_del(&jeb->list);
 		if (c->wbuf_len) {
@@ -387,7 +391,6 @@ void jffs2_mark_node_obsolete(struct jff
 			jffs2_erase_pending_trigger(c);
 		}
 		D1(printk(KERN_DEBUG "Done OK\n"));
-#endif
 	} else if (jeb->dirty_size == ref->totlen) {
 		D1(printk(KERN_DEBUG "Eraseblock at 0x%08x is freshly dirtied. Removing from clean list...\n", jeb->offset));
 		list_del(&jeb->list);

--
dwmw2
