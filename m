Received: from lon-del-03.spheriq.net ([195.46.50.99])
	by pentafluge.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CcRkn-0004mW-Cm
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 17:07:05 +0000
Received: from lon-inc-01.spheriq.net ([195.46.50.65])
	by lon-del-03.spheriq.net with ESMTP id iB9H6qcn013488
	for <linux-mtd@lists.infradead.org>; Thu, 9 Dec 2004 17:06:52 GMT
Received: from lon-out-01.spheriq.net (lon-out-01.spheriq.net [195.46.50.129])
	by lon-inc-01.spheriq.net with ESMTP id iB9H6pUv001816
	for <linux-mtd@lists.infradead.org>; Thu, 9 Dec 2004 17:06:51 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-01.spheriq.net with ESMTP id iB9H6pxf032356
	for <linux-mtd@lists.infradead.org>; Thu, 9 Dec 2004 17:06:51 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <41B88622.4BCD78EC@st.com>
Date: Thu, 09 Dec 2004 18:06:42 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>
	<1100978366.7949.38.camel@localhost.localdomain>
	<1100988787.7949.46.camel@localhost.localdomain>
	<1102604262.6694.17.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & NAND failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry I've been very busy lately and couldn't find time to report
back regarding this issue. There were only minor problems with
your patch.
Here is the patch that should settle the NAND failure problems
I've stumbled upon lately.
- block refiling in jffs2_flash_writev
- retry on flush wbuf (probably useful when umounting)
- retry in gc (might make some compilers complain ?)
- version thing in the write.c retry cases
  (I didn't make jffs2_write_dnode and jffs2_write_dirent update
   the version in all cases instead of the caller, because of the
   hole GC case where the version should remain the same as it
   was...)

- the modifications in jffs2_add_physical_node_ref are probably
  not necessary anymore ? not sure. The wasted_size thing is an
  old patch to avoid getting blocks with large amounts of wasted
  space in the clean_list.

(still no cvs access)
bye
Estelle

David Woodhouse wrote:
> 
> On Sat, 2004-11-20 at 22:13 +0000, David Woodhouse wrote:
> > On Sat, 2004-11-20 at 19:19 +0000, David Woodhouse wrote:
> > > This is the problem, surely? If we've refiled the nextblock, we should
> > > return retlen == 0.
> >
> > Can you try this patch against current CVS? I've already split the
> > refiling off into a separate function we can call, and I've also fixed
> > it to write from the wbuf if it's full.
> 
> Any progress? If it's working and you agree it's sufficient then we
> should commit it.
> 
> --
> dwmw2


diff -auNr jffs2/gc.c myjffs2/gc.c
--- jffs2/gc.c	2004-11-17 00:00:14.000000000 +0100
+++ myjffs2/gc.c	2004-12-09 16:59:23.880059000 +0100
@@ -602,7 +602,7 @@
 			printk(KERN_NOTICE "Not marking the space at 0x%08x as dirty because the flash driver returned retlen zero\n", nraw->flash_offset);
                         jffs2_free_raw_node_ref(nraw);
 		}
-		if (!retried && (nraw == jffs2_alloc_raw_node_ref())) {
+		if (!retried && (nraw = jffs2_alloc_raw_node_ref())) {
 			/* Try to reallocate space and retry */
 			uint32_t dummy;
 			struct jffs2_eraseblock *jeb = &c->blocks[phys_ofs / c->sector_size];
@@ -628,7 +628,6 @@
 			jffs2_free_raw_node_ref(nraw);
 		}
 
-		jffs2_free_raw_node_ref(nraw);
 		if (!ret)
 			ret = -EIO;
 		goto out_node;
  
  
  
  
  
diff -auNr jffs2/nodemgmt.c myjffs2/nodemgmt.c
--- jffs2/nodemgmt.c	2004-11-26 15:08:31.000000000 +0100
+++ myjffs2/nodemgmt.c	2004-12-09 17:32:23.921567000 +0100
@@ -308,7 +308,10 @@
 
 	D1(printk(KERN_DEBUG "jffs2_add_physical_node_ref(): Node at 0x%x(%d), size 0x%x\n", ref_offset(new), ref_flags(new), len));
 #if 1
-	if (jeb != c->nextblock || (ref_offset(new)) != jeb->offset + (c->sector_size - jeb->free_size)) {
+	/* we could get some obsolete nodes after nextblock was refiled
+	   in wbuf.c */
+	if (  (c->nextblock || !ref_obsolete(new))
+	    &&(jeb != c->nextblock || (ref_offset(new)) != jeb->offset + (c->sector_size - jeb->free_size))) {
 		printk(KERN_WARNING "argh. node added in wrong place\n");
 		jffs2_free_raw_node_ref(new);
 		return -EINVAL;
@@ -332,7 +335,7 @@
 		c->used_size += len;
 	}
 
-	if (!jeb->free_size && !jeb->dirty_size) {
+	if (!jeb->free_size && !jeb->dirty_size && !jeb->wasted_size) {
 		/* If it lives on the dirty_list, jffs2_reserve_space will put it there */
 		D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
 			  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
  
  
  
  
  
diff -auNr jffs2/wbuf.c myjffs2/wbuf.c
--- jffs2/wbuf.c	2004-11-26 15:08:31.000000000 +0100
+++ myjffs2/wbuf.c	2004-12-09 17:14:45.966959000 +0100
@@ -130,7 +130,10 @@
 	}
 }
 
-static void jffs2_block_refile(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
+#define REFILE_NOTEMPTY 0
+#define REFILE_ANYWAY   1
+
+static void jffs2_block_refile(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, int allow_empty)
 {
 	D1(printk("About to refile bad block at %08x\n", jeb->offset));
 
@@ -144,7 +147,8 @@
 		D1(printk("Refiling block at %08x to bad_used_list\n", jeb->offset));
 		list_add(&jeb->list, &c->bad_used_list);
 	} else {
-		BUG();
+		if (allow_empty == REFILE_NOTEMPTY)
+			BUG();
 		/* It has to have had some nodes or we couldn't be here */
 		D1(printk("Refiling block at %08x to erase_pending_list\n", jeb->offset));
 		list_add(&jeb->list, &c->erase_pending_list);
@@ -179,7 +183,7 @@
 
 	jeb = &c->blocks[c->wbuf_ofs / c->sector_size];
 
-	jffs2_block_refile(c, jeb);
+	jffs2_block_refile(c, jeb, REFILE_NOTEMPTY);
 
 	/* Find the first node to be recovered, by skipping over every
 	   node which ends before the wbuf starts, or which is obsolete. */
@@ -269,12 +273,12 @@
 		return;
 	}
 	if (end-start >= c->wbuf_pagesize) {
-		/* Need to do another write immediately. This, btw,
-		 means that we'll be writing from 'buf' and not from
-		 the wbuf. Since if we're writing from the wbuf there
-		 won't be more than a wbuf full of data, now will
-		 there? :) */
-
+		/* Need to do another write immediately, but it's possible
+		that this is just because the wbuf itself is completely
+		full, and there's nothing earlier read back from the 
+		flash. Hence 'buf' isn't necessarily what we're writing 
+		from. */
+		unsigned char *rewrite_buf = buf?:c->wbuf;
 		uint32_t towrite = (end-start) - ((end-start)%c->wbuf_pagesize);
 
 		D1(printk(KERN_DEBUG "Write 0x%x bytes at 0x%08x in wbuf recover\n",
@@ -292,14 +296,15 @@
 #endif
 		if (jffs2_cleanmarker_oob(c))
 			ret = c->mtd->write_ecc(c->mtd, ofs, towrite, &retlen,
-						buf, NULL, c->oobinfo);
+						rewrite_buf, NULL, c->oobinfo);
 		else
-			ret = c->mtd->write(c->mtd, ofs, towrite, &retlen, buf);
+			ret = c->mtd->write(c->mtd, ofs, towrite, &retlen, rewrite_buf);
 
 		if (ret || retlen != towrite) {
 			/* Argh. We tried. Really we did. */
 			printk(KERN_CRIT "Recovery of wbuf failed due to a second write error\n");
-			kfree(buf);
+			if (buf)
+				kfree(buf);
 
 			if (retlen) {
 				struct jffs2_raw_node_ref *raw2;
@@ -321,10 +326,10 @@
 
 		c->wbuf_len = (end - start) - towrite;
 		c->wbuf_ofs = ofs + towrite;
-		memcpy(c->wbuf, buf + towrite, c->wbuf_len);
+		memmove(c->wbuf, rewrite_buf + towrite, c->wbuf_len);
 		/* Don't muck about with c->wbuf_inodes. False positives are harmless. */
-
-		kfree(buf);
+		if (buf)
+			kfree(buf);
 	} else {
 		/* OK, now we're left with the dregs in whichever buffer we're using */
 		if (buf) {
@@ -547,6 +552,12 @@
 		D1(printk(KERN_DEBUG "jffs2_flush_wbuf_gc() padding. Not finished checking\n"));
 		down_write(&c->wbuf_sem);
 		ret = __jffs2_flush_wbuf(c, PAD_ACCOUNTING);
+		/* retry flushing wbuf in case jffs2_wbuf_recover
+		   left some data in the wbuf */
+		if (ret)
+		{
+			ret = __jffs2_flush_wbuf(c, PAD_ACCOUNTING);
+		}
 		up_write(&c->wbuf_sem);
 	} else while (old_wbuf_len &&
 		      old_wbuf_ofs == c->wbuf_ofs) {
@@ -561,6 +572,12 @@
 			down(&c->alloc_sem);
 			down_write(&c->wbuf_sem);
 			ret = __jffs2_flush_wbuf(c, PAD_ACCOUNTING);
+			/* retry flushing wbuf in case jffs2_wbuf_recover
+			   left some data in the wbuf */
+			if (ret)
+			{
+				ret = __jffs2_flush_wbuf(c, PAD_ACCOUNTING);
+			}
 			up_write(&c->wbuf_sem);
 			break;
 		}
@@ -580,6 +597,9 @@
 
 	down_write(&c->wbuf_sem);
 	ret = __jffs2_flush_wbuf(c, PAD_NOACCOUNT);
+	/* retry - maybe wbuf recover left some data in wbuf. */
+	if (ret)
+		ret = __jffs2_flush_wbuf(c, PAD_NOACCOUNT);
 	up_write(&c->wbuf_sem);
 
 	return ret;
@@ -762,9 +782,18 @@
 		
 		if (ret < 0 || wbuf_retlen != PAGE_DIV(totlen)) {
 			/* At this point we have no problem,
-			   c->wbuf is empty. 
+			   c->wbuf is empty. However refile nextblock to avoid
+			   writing again to same address.
 			*/
-			*retlen = donelen;
+			struct jffs2_eraseblock *jeb;
+
+			spin_lock(&c->erase_completion_lock);
+
+			jeb = &c->blocks[outvec_to / c->sector_size];
+			jffs2_block_refile(c, jeb, REFILE_ANYWAY);
+
+			*retlen = 0;
+			spin_unlock(&c->erase_completion_lock);
 			goto exit;
 		}
 		
  
  
  
  
  
diff -auNr jffs2/write.c myjffs2/write.c
--- jffs2/write.c	2004-11-17 00:00:14.000000000 +0100
+++ myjffs2/write.c	2004-12-09 17:20:32.438719000 +0100
@@ -136,6 +136,21 @@
 	raw->__totlen = PAD(sizeof(*ri)+datalen);
 	raw->next_phys = NULL;
 
+	if ((alloc_mode!=ALLOC_GC) && (je32_to_cpu(ri->version) < f->highest_version))
+	{
+		if (! retried)
+		{
+			BUG();
+		}
+		else
+		{
+			D1(printk(KERN_DEBUG "jffs2_write_dnode : dnode_version %d,  highest version %d -> updating dnode\n", 
+					     je32_to_cpu(ri->version), f->highest_version));
+			ri->version = cpu_to_je32(++f->highest_version);
+			ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
+		}
+	}
+
 	ret = jffs2_flash_writev(c, vecs, cnt, flash_ofs, &retlen,
 				 (alloc_mode==ALLOC_GC)?0:f->inocache->ino);
 
@@ -280,6 +295,22 @@
 	raw->__totlen = PAD(sizeof(*rd)+namelen);
 	raw->next_phys = NULL;
 
+	if ((alloc_mode!=ALLOC_GC) && (je32_to_cpu(rd->version) < f->highest_version))
+	{
+		if (! retried)
+		{
+			BUG();
+		}
+		else
+		{
+			D1(printk(KERN_DEBUG "jffs2_write_dirent : dirent_version %d,  highest version %d -> updating dirent\n", 
+					     je32_to_cpu(rd->version), f->highest_version));
+			rd->version = cpu_to_je32(++f->highest_version);
+			fd->version = je32_to_cpu(rd->version);
+			rd->node_crc = cpu_to_je32(crc32(0, rd, sizeof(*rd)-8));
+		}
+	}
+
 	ret = jffs2_flash_writev(c, vecs, 2, flash_ofs, &retlen,
 				 (alloc_mode==ALLOC_GC)?0:je32_to_cpu(rd->pino));
 	if (ret || (retlen != sizeof(*rd) + namelen)) {
