Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUTOl-0007fo-Vc
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 12:15:18 -0500
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <419B8715.4036BDBB@st.com>
Date: Wed, 17 Nov 2004 18:15:01 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: 
Subject: JFFS2 & NAND failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

here are a few corrections (I think) regarding the management
of write or erase error with NAND flash.
 - bad_count was not initialised
 - during wbuf flushing, if the previously written node filled
   wbuf exactly, "buf" may be used instead of "wbuf"
   in jffs2_wbuf_recover (access to null pointer)
 - there is no refiling of nextblock if a write error occurs
   during writev_ecc (direct write, not using wbuf), 
   so the next write may occur on the failed block
 - if a write error occurs, but part of the data was written,
   an obsolete raw node ref is added but nextblock has changed.

Additionally I have a question about the retry cases in
jffs2_write_dnode and jffs2_write_dirent.
If the write error occurs during an API call (not GC),
jffs2_reserve_space is called again to find space to rewrite
the node. However since we refiled the bad block, the free space
was reduced. Is it not possible then that jffs2_reserve_space
will need to gc to find some space ?
In the case of a deletion dirent, the previous dirent may be
GCed so its version number is increased. When the deletion
dirent is finally written in the retry, its version number
is older than the GCed node, so it is (quietly) obsoleted.
In the case of a dnode, I think there may be a deadlock
if a dnode belonging to the same file is GCed, since the
GC will attempt to lock f->sem.
I actually saw the dirent case in my tests but since I wrote
some nodes manually I am not sure this is a valid problem in
ordinary JFFS2 processing ?
Could the solution be to call jffs2_reserve_space_gc instead
of jffs2_reserve_space ?

BR
Estelle





diff -auNr jffs2/wbuf.c myjffs2/wbuf.c
--- jffs2/wbuf.c	2004-11-17 00:00:14.000000000 +0100
+++ myjffs2/wbuf.c	2004-11-17 17:36:14.556445000 +0100
@@ -263,7 +263,7 @@
 			kfree(buf);
 		return;
 	}
-	if (end-start >= c->wbuf_pagesize) {
+	if (end-start > c->wbuf_pagesize) {
 		/* Need to do another write immediately. This, btw,
 		 means that we'll be writing from 'buf' and not from
 		 the wbuf. Since if we're writing from the wbuf there
@@ -744,9 +744,42 @@
 		
 		if (ret < 0 || wbuf_retlen != PAGE_DIV(totlen)) {
 			/* At this point we have no problem,
-			   c->wbuf is empty. 
+			   c->wbuf is empty. However refile nextblock to avoid
+                           writing again to same address.
 			*/
 			*retlen = donelen;
+			struct jffs2_eraseblock *jeb;
+			spin_lock(&c->erase_completion_lock);
+                  
+			jeb = &c->blocks[outvec_to / c->sector_size];
+			D1(printk("About to refile bad block at %08x\n", jeb->offset));
+
+			D2(jffs2_dump_block_lists(c));
+			/* File the existing block on the bad_used_list.... */
+			if (c->nextblock == jeb)
+				c->nextblock = NULL;
+			else /* Not sure this should ever happen... need more coffee */
+				list_del(&jeb->list);
+			if (jeb->first_node) {
+				D1(printk("Refiling block at %08x to bad_used_list\n", jeb->offset));
+				list_add(&jeb->list, &c->bad_used_list);
+			} else {
+				D1(printk("Refiling block at %08x to erase_pending_list\n", jeb->offset));
+				list_add(&jeb->list, &c->erase_pending_list);
+				c->nr_erasing_blocks++;
+				jffs2_erase_pending_trigger(c);
+			}
+			D2(jffs2_dump_block_lists(c));
+
+			/* Adjust its size counts accordingly */
+			c->wasted_size += jeb->free_size;
+			c->free_size -= jeb->free_size;
+			jeb->wasted_size += jeb->free_size;
+			jeb->free_size = 0;
+
+			ACCT_SANITY_CHECK(c,jeb);
+			D1(ACCT_PARANOIA_CHECK(jeb));
+			spin_unlock(&c->erase_completion_lock);
 			return ret;
 		}
 		

diff -auNr jffs2/nodemgmt.c myjffs2/nodemgmt.c
--- jffs2/nodemgmt.c	2004-11-17 00:00:14.000000000 +0100
+++ myjffs2/nodemgmt.c	2004-11-17 17:40:40.130248000 +0100
@@ -308,7 +308,7 @@
 
 	D1(printk(KERN_DEBUG "jffs2_add_physical_node_ref(): Node at 0x%x(%d), size 0x%x\n", ref_offset(new), ref_flags(new),
len));
 #if 1
-	if (jeb != c->nextblock || (ref_offset(new)) != jeb->offset + (c->sector_size - jeb->free_size)) {
+	if ((!ref_obsolete(new)) && (jeb != c->nextblock || (ref_offset(new)) != jeb->offset + (c->sector_size -
jeb->free_size))) {
 		printk(KERN_WARNING "argh. node added in wrong place\n");
 		jffs2_free_raw_node_ref(new);
 		return -EINVAL;



diff -auNr jffs2/build.c myjffs2/build.c
--- jffs2/build.c	2004-11-17 00:00:13.000000000 +0100
+++ myjffs2/build.c	2004-11-17 17:29:20.384186000 +0100
@@ -310,6 +310,7 @@
 		c->blocks[i].used_size = 0;
 		c->blocks[i].first_node = NULL;
 		c->blocks[i].last_node = NULL;
+		c->blocks[i].bad_count = 0;
 	}
 
 	init_MUTEX(&c->alloc_sem);
