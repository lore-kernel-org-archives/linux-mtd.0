Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CPOB6-00083G-Hd
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2004 11:40:12 -0500
Message-ID: <418909C7.3040508@yandex.ru>
Date: Wed, 03 Nov 2004 19:39:35 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Estelle HAMMACHE <estelle.hammache@st.com>
References: <417F961A.1090107@yandex.ru>		<1098881953.13633.1786.camel@hades.cambridge.redhat.com>		<417FA408.9080906@yandex.ru>	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>		<4180E732.70608@yandex.ru>
	<4180FAD8.2000107@yandex.ru> <41879A58.F960F963@st.com>
In-Reply-To: <41879A58.F960F963@st.com>
Content-Type: multipart/mixed; boundary="------------010105010300020208010404"
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 & SMP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010105010300020208010404
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, the patch was made not very accurately and will not easily 
applied, please, use this one.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--------------010105010300020208010404
Content-Type: text/x-patch;
 name="preempt-patch.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="preempt-patch.diff"

diff -auNr mtd-snapshot-20041008/fs/jffs2/build.c mtd-preepmpt-fix/fs/jffs2/build.c
--- mtd-snapshot-20041008/fs/jffs2/build.c	2003-10-29 02:00:34.000000000 +0300
+++ mtd-preepmpt-fix/fs/jffs2/build.c	2004-11-03 19:20:49.769732102 +0300
@@ -314,6 +314,7 @@
 
 	init_MUTEX(&c->alloc_sem);
 	init_MUTEX(&c->erase_free_sem);
+	init_rwsem(&c->wbuf_sem);
 	init_waitqueue_head(&c->erase_wait);
 	init_waitqueue_head(&c->inocache_wq);
 	spin_lock_init(&c->erase_completion_lock);
diff -auNr mtd-snapshot-20041008/fs/jffs2/wbuf.c mtd-preepmpt-fix/fs/jffs2/wbuf.c
--- mtd-snapshot-20041008/fs/jffs2/wbuf.c	2004-09-12 02:00:12.000000000 +0400
+++ mtd-preepmpt-fix/fs/jffs2/wbuf.c	2004-11-03 19:20:49.761733507 +0300
@@ -392,7 +392,7 @@
    1: Pad, do not adjust nextblock free_size
    2: Pad, adjust nextblock free_size
 */
-static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
+static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad, int alloc_wbuf_sem)
 {
 	int ret;
 	size_t retlen;
@@ -408,8 +408,11 @@
 		BUG();
 	}
 
+	if (alloc_wbuf_sem)
+		down_write(&c->wbuf_sem);
+
 	if(!c->wbuf || !c->wbuf_len)
-		return 0;
+		goto exit;
 
 	/* claim remaining space on the page
 	   this happens, if we have a change to a new block,
@@ -458,7 +461,7 @@
 
 		jffs2_wbuf_recover(c);
 
-		return ret; 
+		goto exit;
 	}
 
 	spin_lock(&c->erase_completion_lock);
@@ -497,6 +500,9 @@
 	/* adjust write buffer offset, else we get a non contiguous write bug */
 	c->wbuf_ofs += c->wbuf_pagesize;
 	c->wbuf_len = 0;
+exit:
+	if (alloc_wbuf_sem)
+		up_write(&c->wbuf_sem);
 	return 0;
 }
 
@@ -525,7 +531,7 @@
 	if (c->unchecked_size) {
 		/* GC won't make any progress for a while */
 		D1(printk(KERN_DEBUG "jffs2_flush_wbuf_gc() padding. Not finished checking\n"));
-		ret = __jffs2_flush_wbuf(c, 2);
+		ret = __jffs2_flush_wbuf(c, 2, 1);
 	} else while (old_wbuf_len &&
 		      old_wbuf_ofs == c->wbuf_ofs) {
 
@@ -537,7 +543,7 @@
 		if (ret) {
 			/* GC failed. Flush it with padding instead */
 			down(&c->alloc_sem);
-			ret = __jffs2_flush_wbuf(c, 2);
+			ret = __jffs2_flush_wbuf(c, 2, 1);
 			break;
 		}
 		down(&c->alloc_sem);
@@ -552,10 +558,9 @@
 /* Pad write-buffer to end and write it, wasting space. */
 int jffs2_flush_wbuf_pad(struct jffs2_sb_info *c)
 {
-	return __jffs2_flush_wbuf(c, 1);
+	return __jffs2_flush_wbuf(c, 1, 1);
 }
 
-
 #define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
 #define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
 int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count, loff_t to, size_t *retlen, uint32_t ino)
@@ -575,6 +580,8 @@
 	if (!c->wbuf)
 		return jffs2_flash_direct_writev(c, invecs, count, to, retlen);
 	
+	down_write(&c->wbuf_sem);
+
 	/* If wbuf_ofs is not initialized, set it to target address */
 	if (c->wbuf_ofs == 0xFFFFFFFF) {
 		c->wbuf_ofs = PAGE_DIV(to);
@@ -592,12 +599,12 @@
 		/* It's a write to a new block */
 		if (c->wbuf_len) {
 			D1(printk(KERN_DEBUG "jffs2_flash_writev() to 0x%lx causes flush of wbuf at 0x%08x\n", (unsigned long)to, c->wbuf_ofs));
-			ret = jffs2_flush_wbuf_pad(c);
+			ret = __jffs2_flush_wbuf(c, 1, 1);
 			if (ret) {
 				/* the underlying layer has to check wbuf_len to do the cleanup */
 				D1(printk(KERN_WARNING "jffs2_flush_wbuf() called from jffs2_flash_writev() failed %d\n", ret));
 				*retlen = 0;
-				return ret;
+				goto exit;
 			}
 		}
 		/* set pointer to new block */
@@ -658,14 +665,14 @@
 		}			
 		
 		/* write buffer is full, flush buffer */
-		ret = __jffs2_flush_wbuf(c, 0);
+		ret = __jffs2_flush_wbuf(c, 0, 0);
 		if (ret) {
 			/* the underlying layer has to check wbuf_len to do the cleanup */
 			D1(printk(KERN_WARNING "jffs2_flush_wbuf() called from jffs2_flash_writev() failed %d\n", ret));
 			/* Retlen zero to make sure our caller doesn't mark the space dirty.
 			   We've already done everything that's necessary */
 			*retlen = 0;
-			return ret;
+			goto exit;
 		}
 		outvec_to += donelen;
 		c->wbuf_ofs = outvec_to;
@@ -709,7 +716,6 @@
 
 	if (splitvec != -1) {
 		uint32_t remainder;
-		int ret;
 
 		remainder = outvecs[splitvec].iov_len - split_ofs;
 		outvecs[splitvec].iov_len = split_ofs;
@@ -721,7 +727,7 @@
 			   c->wbuf is empty. 
 			*/
 			*retlen = donelen;
-			return ret;
+			goto exit;
 		}
 		
 		donelen += wbuf_retlen;
@@ -760,7 +766,11 @@
 	if (c->wbuf_len && ino)
 		jffs2_wbuf_dirties_inode(c, ino);
 
-	return 0;
+	ret = 0;
+	
+exit:
+	up_write(&c->wbuf_sem);
+	return ret;
 }
 
 /*
@@ -789,6 +799,8 @@
 
 	/* Read flash */
 	if (!jffs2_can_mark_obsolete(c)) {
+		down_read(&c->wbuf_sem);
+
 		ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
 
 		if ( (ret == -EBADMSG) && (*retlen == len) ) {
@@ -811,23 +823,23 @@
 
 	/* if no writebuffer available or write buffer empty, return */
 	if (!c->wbuf_pagesize || !c->wbuf_len)
-		return ret;
+		goto exit;
 
 	/* if we read in a different block, return */
 	if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) 
-		return ret;	
+		goto exit;
 
 	if (ofs >= c->wbuf_ofs) {
 		owbf = (ofs - c->wbuf_ofs);	/* offset in write buffer */
 		if (owbf > c->wbuf_len)		/* is read beyond write buffer ? */
-			return ret;
+			goto exit;
 		lwbf = c->wbuf_len - owbf;	/* number of bytes to copy */
 		if (lwbf > len)	
 			lwbf = len;
 	} else {	
 		orbf = (c->wbuf_ofs - ofs);	/* offset in read buffer */
 		if (orbf > len)			/* is write beyond write buffer ? */
-			return ret;
+			goto exit;
 		lwbf = len - orbf; 		/* number of bytes to copy */
 		if (lwbf > c->wbuf_len)	
 			lwbf = c->wbuf_len;
@@ -835,6 +847,8 @@
 	if (lwbf > 0)
 		memcpy(buf+orbf,c->wbuf+owbf,lwbf);
 
+exit:
+	up_read(&c->wbuf_sem);
 	return ret;
 }
 
diff -auNr mtd-snapshot-20041008/include/linux/jffs2_fs_sb.h mtd-preepmpt-fix/include/linux/jffs2_fs_sb.h
--- mtd-snapshot-20041008/include/linux/jffs2_fs_sb.h	2003-10-09 02:00:05.000000000 +0400
+++ mtd-preepmpt-fix/include/linux/jffs2_fs_sb.h	2004-11-03 19:20:50.058681364 +0300
@@ -36,8 +36,9 @@
 	struct semaphore alloc_sem;	/* Used to protect all the following 
 					   fields, and also to protect against
 					   out-of-order writing of nodes.
-					   And GC.
-					*/
+					   And GC. Also protects the write buffer
+					   against concurrent writes. */
+	struct rw_semaphore wbuf_sem;	/* Protects the write buffer while it is read */
 	uint32_t cleanmarker_size;	/* Size of an _inline_ CLEANMARKER
 					 (i.e. zero for OOB CLEANMARKER */
 

--------------010105010300020208010404--
