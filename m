Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cl7p-0004xR-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 12:06:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002c01c23ebf$40a81c70$5501a8c0@synso.com.tw> 
References: <002c01c23ebf$40a81c70$5501a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: "'Thomas Gleixner'" <tglx@linutronix.de>,
    "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: NAND Configuration 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 12:05:45 +0100
Message-ID: <12213.1028804745@redhat.com>
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

startec@ms11.hinet.net said:
>  In jffs2_wbuf_process, when free_size is smaller than (c->
> wbuf_pagesize - c->wbuf_len), jffs2_flush_wbuf(c, 1) was called, but
> free_size will not be assigned right value. In the case, the block can
> not be used anymore because the last page in the block was used here,
> but jffs2_do_reserve_space does not know.  jffs2_do_reserve_space will
> use the block, if minsize > jeb->free_size and it maybe happen here.  

Try this (it's in CVS).... 

Index: wbuf.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/wbuf.c,v
retrieving revision 1.12
retrieving revision 1.13
diff -u -p -r1.12 -r1.13
--- wbuf.c	20 May 2002 14:56:39 -0000	1.12
+++ wbuf.c	8 Aug 2002 11:04:40 -0000	1.13
@@ -7,7 +7,7 @@
  *
  * For licensing information, see the file 'LICENCE' in this directory.
  *
- * $Id: wbuf.c,v 1.12 2002/05/20 14:56:39 dwmw2 Exp $
+ * $Id: wbuf.c,v 1.13 2002/08/08 11:04:40 dwmw2 Exp $
  *
  */
 
@@ -80,17 +80,33 @@ void jffs2_wbuf_process (void *data)
 	
 	D1(printk(KERN_DEBUG "jffs2_wbuf_process() entered\n"));
 
-	if (!down_trylock(&c->alloc_sem)) {
-		D1(printk (KERN_DEBUG "jffs2_wbuf_process() alloc_sem got\n"));
-	
-		if(!c->nextblock || (c->nextblock->free_size < (c->wbuf_pagesize - c->wbuf_len)))
-			jffs2_flush_wbuf(c, 1); /* pad only */
-		else			
-			jffs2_flush_wbuf(c, 2); /* pad and adjust nextblock */
-		up(&c->alloc_sem);
-	} else {
+	if (down_trylock(&c->alloc_sem)) {
+		/* If someone else has the alloc_sem, they're about to
+		   write anyway. So no need to waste space by
+		   padding */
 		D1(printk (KERN_DEBUG "jffs2_wbuf_process() alloc_sem already occupied\n"));
+		return;
 	}	
+
+	D1(printk (KERN_DEBUG "jffs2_wbuf_process() alloc_sem got\n"));
+
+	if (!c->nextblock) {
+		D1(printk(KERN_DEBUG "jffs2_wbuf_process(): nextblock NULL, nothing to do\n"));
+		if (c->wbuf_len) {
+			printk(KERN_WARNING "jffs2_wbuf_process(): c->wbuf_len is 0x%03x but nextblock is NULL!\n", c->wbuf_len);
+			up(&c->alloc_sem);
+			BUG();
+		}
+		return;
+	}
+	
+	
+	/* if !c->nextblock then the tail will have got flushed from
+	   jffs2_do_reserve_space() anyway. */
+	if(c->nextblock)
+		jffs2_flush_wbuf(c, 2); /* pad and adjust nextblock */
+
+	up(&c->alloc_sem);
 }
 
 
@@ -166,8 +182,16 @@ int jffs2_flush_wbuf(struct jffs2_sb_inf
 		spin_lock_bh(&c->erase_completion_lock);
 		if (!c->nextblock)
 			BUG();
-		if (c->nextblock->free_size < (c->wbuf_pagesize - c->wbuf_len))
+		/* wbuf_pagesize - wbuf_len is the amount of space that's to be 
+		   padded. If there is less free space in the block than that,
+		   something screwed up */
+		if (c->nextblock->free_size < (c->wbuf_pagesize - c->wbuf_len)) {
+			printk(KERN_CRIT "jffs2_flush_wbuf(): Accounting error. wbuf at 0x%08x has 0x%03x bytes, 0x%03x left.\n",
+			       c->wbuf_ofs, c->wbuf_len, c->wbuf_pagesize-c->wbuf_len);
+			printk(KERN_CRIT "jffs2_flush_wbuf(): But free_size for block at 0x%08x is only 0x%08x\n",
+			       c->nextblock->offset, c->nextblock->free_size);
 			BUG();
+		}
 		c->nextblock->free_size -= (c->wbuf_pagesize - c->wbuf_len);
 		c->nextblock->dirty_size += (c->wbuf_pagesize - c->wbuf_len);
 		spin_unlock_bh(&c->erase_completion_lock);


--
dwmw2
