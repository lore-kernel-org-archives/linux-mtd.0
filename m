From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <1100978366.7949.38.camel@localhost.localdomain>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>
	<1100978366.7949.38.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sat, 20 Nov 2004 22:13:06 +0000
Message-Id: <1100988787.7949.46.camel@localhost.localdomain>
Mime-Version: 1.0
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

On Sat, 2004-11-20 at 19:19 +0000, David Woodhouse wrote:
> This is the problem, surely? If we've refiled the nextblock, we should
> return retlen == 0.

Can you try this patch against current CVS? I've already split the
refiling off into a separate function we can call, and I've also fixed
it to write from the wbuf if it's full.

Index: wbuf.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/wbuf.c,v
retrieving revision 1.81
diff -u -r1.81 wbuf.c
--- wbuf.c	20 Nov 2004 10:44:07 -0000	1.81
+++ wbuf.c	20 Nov 2004 22:06:25 -0000
@@ -264,12 +268,12 @@
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
+		   that this is just because the wbuf itself is completely
+		   full, and there's nothing earlier read back from the 
+		   flash. Hence 'buf' isn't necessarily what we're writing 
+		   from. */
+		unsigned char *rewrite_buf = buf?:c->wbuf;
 		uint32_t towrite = (end-start) - ((end-start)%c->wbuf_pagesize);
 
 		D1(printk(KERN_DEBUG "Write 0x%x bytes at 0x%08x in wbuf recover\n",
@@ -287,14 +291,15 @@
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
@@ -316,10 +321,10 @@
 
 		c->wbuf_len = (end - start) - towrite;
 		c->wbuf_ofs = ofs + towrite;
-		memcpy(c->wbuf, buf + towrite, c->wbuf_len);
+		memmove(c->wbuf, buf + towrite, c->wbuf_len);
 		/* Don't muck about with c->wbuf_inodes. False positives are harmless. */
-
-		kfree(buf);
+		if (buf)
+			kfree(buf);
 	} else {
 		/* OK, now we're left with the dregs in whichever buffer we're using */
 		if (buf) {
@@ -757,9 +762,19 @@
 		
 		if (ret < 0 || wbuf_retlen != PAGE_DIV(totlen)) {
 			/* At this point we have no problem,
-			   c->wbuf is empty. 
+			   c->wbuf is empty. However refile nextblock to avoid
+                           writing again to same address.
 			*/
+			struct jffs2_eraseblock *jeb;
+
 			*retlen = donelen;
+			spin_lock(&c->erase_completion_lock);
+                  
+			jeb = &c->blocks[outvec_to / c->sector_size];
+			jffs2_refile_block(c, jeb);
+
+			*retlen = 0;
+			spin_unlock(&c->erase_completion_lock);
 			goto exit;
 		}
 		

-- 
dwmw2
