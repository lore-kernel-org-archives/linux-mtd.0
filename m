Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CPlFe-00025M-Sg
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2004 12:18:27 -0500
Message-ID: <418A643B.2070806@yandex.ru>
Date: Thu, 04 Nov 2004 20:17:47 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Estelle HAMMACHE <estelle.hammache@st.com>
References: <417F961A.1090107@yandex.ru>		<1098881953.13633.1786.camel@hades.cambridge.redhat.com>		<417FA408.9080906@yandex.ru>	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>		<4180E732.70608@yandex.ru>
	<4180FAD8.2000107@yandex.ru> <41879A58.F960F963@st.com>
	<41890762.9030901@yandex.ru> <4189F07F.6495F568@st.com>
	<4189F823.2060204@yandex.ru> <418A591C.A4D46C9E@st.com>
In-Reply-To: <418A591C.A4D46C9E@st.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & SMP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Estelle,

I don't cleanly understand your Idea, I'll think more.

Could you please answer: does it handle the following "use-case" (if 
yes, how?):

Suppose we are reading node, which is in the wbuf so far.


int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len, 
size_t *retlen, u_char *buf)
{
         loff_t  orbf = 0, owbf = 0, lwbf = 0;
         int     ret;

         /* Read flash */
         if (!jffs2_can_mark_obsolete(c)) {
                 ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, 
NULL, c->oobinfo);

                 if ( (ret == -EBADMSG) && (*retlen == len) ) {
                         printk(KERN_WARNING "mtd->read(0x%zx bytes from 
0x%llx) returned ECC error\n",
                                len, ofs);
                         /*
                          * We have the raw data without ECC correction 
in the buffer, maybe
                          * we are lucky and all data or parts are 
correct. We check the node.
                          * If data are corrupted node check will sort 
it out.
                          * We keep this block, it will fail on write or 
erase and the we
                          * mark it bad. Or should we do that now? But 
we should give him a chance.
                          * Maybe we had a system crash or power loss 
before the ecc write or
                          * a erase was completed.
                          * So we return success. :)
                          */
                         ret = 0;
                  }
         } else
                 return c->mtd->read(c->mtd, ofs, len, retlen, buf);
/*________________________
Suppose the page we have read is empty because of its data is still in 
wbuf. We have read all 0xFF. Suppose we are preempted at this point. 
Somebody else made write, the wbuf became full and was flushed to the 
correspondent flash page. Then we wake up. We see, the wbuf_len == 0. 
And we exit. Result: we have read all 0xFF instead of node....
________________________*/

         /* if no writebuffer available or write buffer empty, return */
         if (!c->wbuf_pagesize || !c->wbuf_len)
                 return ret; /* <---------------------- we exit here.... */

         /* if we read in a different block, return */
         if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs & 
~(c->sector_size-1)) )
                 return ret;

         if (ofs >= c->wbuf_ofs) {
                 owbf = (ofs - c->wbuf_ofs);     /* offset in write 
buffer */
                 if (owbf > c->wbuf_len)         /* is read beyond write 
buffer ? */
                         return ret;
                 lwbf = c->wbuf_len - owbf;      /* number of bytes to 
copy */
                 if (lwbf > len)
                         lwbf = len;
         } else {
                 orbf = (c->wbuf_ofs - ofs);     /* offset in read buffer */
                 if (orbf > len)                 /* is write beyond 
write buffer ? */
                         return ret;
                 lwbf = len - orbf;              /* number of bytes to 
copy */
                 if (lwbf > c->wbuf_len)
                         lwbf = c->wbuf_len;
         }
         if (lwbf > 0)
                 memcpy(buf+orbf,c->wbuf+owbf,lwbf);

         return ret;
}



Estelle HAMMACHE wrote:
> Artem,
> 
> I meant that it might be possible to ensure a correct
> read operation without relying on a mutex, by ensuring
> that the wbuf variables are always coherent when reading
> from wbuf is authorized (wbuf_len != 0).
> I am not sure this idea is really a good one, because
> it tends to make the whole implementation more complex
> to understand and maintain. Whereas the mutex idea is
> more visible and easier to understand.
> 
> However here are my ideas:
> 
> - in jffs2_flash_writev
> In this function I believe there is no problem - as long as
> callers call jffs2_flash_writev first, and they add the
> node to the raw node ref lists and inode tree later.
> The read function won't attempt to read a node which is
> not yet in the nodes lists and trees.
> As to nodes which were previously written, and which are
> still (partly or totally) in wbuf, I think there is no
> problem in this function itself (wbuf_len is only
> increased in this function, until it is time to flush,
> and wbuf_ofs is only modified after a flush).
> 
> - in __jffs2_flush_wbuf 
> Here I think there is an inconsistency because wbuf_len 
> should be reset to 0 and/or wbuf_ofs should be incremented
> before memset(wbuf, 0xFF, ), in order to prevent reading 
> the wbuf when it no longer contains valid data.
> 
> - in jffs2_wbuf_recover
> This function is more tricky - both wbuf and the raw
> node refs are modified.
> I think a more secure way to manage wbuf recovery would
> be to 
>  - keep the wbuf variables intact for most of the function
>  - write only full pages to the new block - with a padding
>    node if necessary.
>    During this step, any read attempt to nodes which end is
>    in wbuf will effectively read wbuf.
>  - modify the raw node refs to point to the newly written
>    pages (unchanged from current code)
>    During this step, depending on which nodes are read
>    and which raw node refs are already updated, wbuf may
>    be read or not.
>    After completion of this step, wbuf will never
>    be read again because all raw node refs point to the 
>    newly written pages.
>  - lastly, reset wbuf_len to 0, and wbuf_ofs to the correct
>    offset, and memset(wbuf, 0xFF, ). wbuf is now empty.
> 
> Corresponding patch is attached. I only tested that it
> doesn't break JFFS2, I didn't test jffs2_wbuf_recover
> thoroughly.
> Now as I mentionned before I am not sure this is the way
> to go. Maybe your patch is better.
> 
> bye
> Estelle
> 
> 
> 
> "Artem B. Bityuckiy" wrote:
> 
>>Estelle, I'm glad not to introduce new mutes, but I don't really know
>>how to do so easy way.
>>
>> > I didn't check all the functions which
>> > modify the wbuf variables so I don't know whether it is a
>> > realistic idea or not.
>>I investigated this. These are:
>>jffs2_flash_writev()
>>__jffs2_flush_wbuf()
>>jffs2_wbuf_recover() too, but it is called only from __jffs2_flush_wbuf().
>>
>>Anyway, all such functions are in wbuf.c
>>
>>Basically, the c->alloc_sem protects the write buffer. It is logical to
>>use it in the jffs2_flash_read() too. But the problem is that the
>>jffs2_flash_read() is called by from many places and the c->alloc_sem
>>may be already locked (when the jffs2_flash_read() is called from the
>>Garbage Collector, for example) or not locked (when, for example, JFFS2
>>performs the read_node() superblock operation).
>>
>>Thus, we should introduce one more function parameter (like
>>alloc_sem_is_set "boolean" flag) to distinguish if the alloc_sem is
>>hold. It is possible too. But the jffs2_flash_read() functions is also
>>called from many other functions, and we will need to add this parameter
>>recursively to all of them (for example, jffs2_mark_node_obsolete()).
>>
>>It seems the "down_trylock" decision is will not work.
>>
>>So, I think this way is not very nice... Any suggestions?
>>
>>Estelle HAMMACHE wrote:
>>
>>>Hello Artem,
>>>
>>>as I mentionned before I don't have linux so I can't really test
>>>your patch right now. I agree with the principle of your patch.
>>>I believe it should work this way.
>>>I was hoping the problem could be solved without introducing
>>>a new mutex, however I didn't check all the functions which
>>>modify the wbuf variables so I don't know whether it is a
>>>realistic idea or not.
>>>bye
>>>Estelle
>>>
>>
>>--
>>Best Regards,
>>Artem B. Bityuckiy,
>>St.-Petersburg, Russia.
>>
>>
>>------------------------------------------------------------------------
>>
>>diff -auNr mtd/fs/jffs2/wbuf.c  wbuf_mod.c
>>
>>--- mtd/fs/jffs2/wbuf.c	2004-09-12 00:00:12.000000000 +0200
>>+++ wbuf_mod.c	2004-11-04 16:42:14.737060000 +0100
>>@@ -140,7 +140,7 @@
>> 	size_t retlen;
>> 	int ret;
>> 	unsigned char *buf;
>>-	uint32_t start, end, ofs, len;
>>+	uint32_t start, end, ofs, len, buflen;
>> 
>> 	spin_lock(&c->erase_completion_lock);
>> 
>>@@ -211,18 +211,23 @@
>> 
>> 	D1(printk(KERN_DEBUG "wbuf recover %08x-%08x\n", start, end));
>> 
>>-	buf = NULL;
>>+	buflen = (end - start) & (c->wbuf_pagesize - 1);
>>+	if (buflen)
>>+		buflen = c->wbuf_pagesize - buflen;
>>+	buflen += end - start;
>>+	buf = kmalloc(buflen, GFP_KERNEL);
>>+	if (!buf) {
>>+		printk(KERN_CRIT "Malloc failure in wbuf recovery. Data loss ensues.\n");
>>+		buf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
>>+		if (!buf)
>>+			return;
>>+		goto read_failed;
>>+	}
>>+
>> 	if (start < c->wbuf_ofs) {
>> 		/* First affected node was already partially written.
>> 		 * Attempt to reread the old data into our buffer. */
>> 
>>-		buf = kmalloc(end - start, GFP_KERNEL);
>>-		if (!buf) {
>>-			printk(KERN_CRIT "Malloc failure in wbuf recovery. Data loss ensues.\n");
>>-
>>-			goto read_failed;
>>-		}
>>-
>> 		/* Do the read... */
>> 		ret = c->mtd->read_ecc(c->mtd, start, c->wbuf_ofs - start, &retlen, buf, NULL, c->oobinfo);
>> 		if (ret == -EBADMSG && retlen == c->wbuf_ofs - start) {
>>@@ -232,103 +237,116 @@
>> 		if (ret || retlen != c->wbuf_ofs - start) {
>> 			printk(KERN_CRIT "Old data are already lost in wbuf recovery. Data loss ensues.\n");
>> 
>>-			kfree(buf);
>>-			buf = NULL;
>> 		read_failed:
>> 			first_raw = &(*first_raw)->next_phys;
>> 			/* If this was the only node to be recovered, give up */
>> 			if (!(*first_raw))
>>+			{
>>+				kfree(buf);
>> 				return;
>>+			}
>> 
>> 			/* It wasn't. Go on and try to recover nodes complete in the wbuf */
>> 			start = ref_offset(*first_raw);
>>-		} else {
>>-			/* Read succeeded. Copy the remaining data from the wbuf */
>>+			
>>+			buflen = (end - start) & (c->wbuf_pagesize - 1);
>>+			if (buflen)
>>+				buflen = c->wbuf_pagesize - buflen;
>>+			buflen += end - start;
>>+		} 
>>+		else
>>+		{
>>+			/* find remainder of the data in wbuf */
>> 			memcpy(buf + (c->wbuf_ofs - start), c->wbuf, end - c->wbuf_ofs);
>> 		}
>> 	}
>>-	/* OK... we're to rewrite (end-start) bytes of data from first_raw onwards.
>>-	   Either 'buf' contains the data, or we find it in the wbuf */
>>+	/* no need to read from flash or read failed */
>>+	if (start >= c->wbuf_ofs)
>>+	{
>>+		/* find data in wbuf */
>>+		memcpy(buf, c->wbuf + (start - c->wbuf_ofs), end - c->wbuf_ofs);
>>+	}
>>+
>>+	/* fill up with dirty mask or padding node */
>>+	if (buflen > (end - start))
>>+	{
>>+		len = buflen - PAD(end-start);
>>+		if ( len + sizeof(struct jffs2_unknown_node) < c->wbuf_pagesize) 
>>+		{
>>+			struct jffs2_unknown_node *padnode = (void *)(buf + end - start);
>>+			padnode->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
>>+			padnode->nodetype = cpu_to_je16(JFFS2_NODETYPE_PADDING);
>>+			padnode->totlen = cpu_to_je32(len);
>>+			padnode->hdr_crc = cpu_to_je32(crc32(0, padnode, sizeof(*padnode)-4));
>>+		} else {
>>+			/* Pad with JFFS2_DIRTY_BITMASK */
>>+			memset(buf + end - start, 0, len);
>>+		}
>>+	}
>> 
>>+	/* OK... we're to rewrite buflen bytes of data from first_raw onwards. */
>> 
>> 	/* ... and get an allocation of space from a shiny new block instead */
>>-	ret = jffs2_reserve_space_gc(c, end-start, &ofs, &len);
>>+	ret = jffs2_reserve_space_gc(c, buflen, &ofs, &len);
>> 	if (ret) {
>> 		printk(KERN_WARNING "Failed to allocate space for wbuf recovery. Data loss ensues.\n");
>> 		if (buf)
>> 			kfree(buf);
>> 		return;
>> 	}
>>-	if (end-start >= c->wbuf_pagesize) {
>>-		/* Need to do another write immediately. This, btw,
>>-		 means that we'll be writing from 'buf' and not from
>>-		 the wbuf. Since if we're writing from the wbuf there
>>-		 won't be more than a wbuf full of data, now will
>>-		 there? :) */
>>-
>>-		uint32_t towrite = (end-start) - ((end-start)%c->wbuf_pagesize);
>> 
>>-		D1(printk(KERN_DEBUG "Write 0x%x bytes at 0x%08x in wbuf recover\n",
>>-			  towrite, ofs));
>>+	/* write buflen immediately */
>>+        
>>+	D1(printk(KERN_DEBUG "Write 0x%x bytes at 0x%08x in wbuf recover\n",
>>+		  buflen, ofs));
>> 	  
>> #ifdef BREAKMEHEADER
>>-		static int breakme;
>>-		if (breakme++ == 20) {
>>-			printk(KERN_NOTICE "Faking write error at 0x%08x\n", ofs);
>>-			breakme = 0;
>>-			c->mtd->write_ecc(c->mtd, ofs, towrite, &retlen,
>>-					  brokenbuf, NULL, c->oobinfo);
>>-			ret = -EIO;
>>-		} else
>>+	static int breakme;
>>+	if (breakme++ == 20) {
>>+		printk(KERN_NOTICE "Faking write error at 0x%08x\n", ofs);
>>+		breakme = 0;
>>+		c->mtd->write_ecc(c->mtd, ofs, buflen, &retlen,
>>+				  brokenbuf, NULL, c->oobinfo);
>>+		ret = -EIO;
>>+	} else
>> #endif
>>-			ret = c->mtd->write_ecc(c->mtd, ofs, towrite, &retlen,
>>+		ret = c->mtd->write_ecc(c->mtd, ofs, buflen, &retlen,
>> 						buf, NULL, c->oobinfo);
>> 
>>-		if (ret || retlen != towrite) {
>>-			/* Argh. We tried. Really we did. */
>>-			printk(KERN_CRIT "Recovery of wbuf failed due to a second write error\n");
>>-			kfree(buf);
>>-
>>-			if (retlen) {
>>-				struct jffs2_raw_node_ref *raw2;
>>+	if (ret || retlen != buflen) {
>>+		/* Argh. We tried. Really we did. */
>>+		printk(KERN_CRIT "Recovery of wbuf failed due to a second write error\n");
>>+		kfree(buf);
>> 
>>-				raw2 = jffs2_alloc_raw_node_ref();
>>-				if (!raw2)
>>-					return;
>>-
>>-				raw2->flash_offset = ofs | REF_OBSOLETE;
>>-				raw2->__totlen = ref_totlen(c, jeb, *first_raw);
>>-				raw2->next_phys = NULL;
>>-				raw2->next_in_ino = NULL;
>>+		if (retlen) {
>>+			struct jffs2_raw_node_ref *raw2;
>>+			raw2 = jffs2_alloc_raw_node_ref();
>>+			if (!raw2)
>>+				return;
>> 
>>-				jffs2_add_physical_node_ref(c, raw2);
>>+			raw2->flash_offset = ofs | REF_OBSOLETE;
>>+			raw2->__totlen = ref_totlen(c, jeb, *first_raw);
>>+			raw2->next_phys = NULL;
>>+			raw2->next_in_ino = NULL;
>>+			jffs2_add_physical_node_ref(c, raw2);
>> 			}
>>-			return;
>>-		}
>>-		printk(KERN_NOTICE "Recovery of wbuf succeeded to %08x\n", ofs);
>>-
>>-		c->wbuf_len = (end - start) - towrite;
>>-		c->wbuf_ofs = ofs + towrite;
>>-		memcpy(c->wbuf, buf + towrite, c->wbuf_len);
>>-		/* Don't muck about with c->wbuf_inodes. False positives are harmless. */
>>-
>>-		kfree(buf);
>>-	} else {
>>-		/* OK, now we're left with the dregs in whichever buffer we're using */
>>-		if (buf) {
>>-			memcpy(c->wbuf, buf, end-start);
>>-			kfree(buf);
>>-		} else {
>>-			memmove(c->wbuf, c->wbuf + (start - c->wbuf_ofs), end - start);
>>-		}
>>-		c->wbuf_ofs = ofs;
>>-		c->wbuf_len = end - start;
>>+		return;
>> 	}
>>+	printk(KERN_NOTICE "Recovery of wbuf succeeded to %08x\n", ofs);
>> 
>> 	/* Now sort out the jffs2_raw_node_refs, moving them from the old to the next block */
>> 	new_jeb = &c->blocks[ofs / c->sector_size];
>> 
>> 	spin_lock(&c->erase_completion_lock);
>>+	/* if we padded : adjust sizes */
>>+	if (buflen > (end - start))
>>+	{
>>+		len = buflen - PAD(end-start);
>>+		new_jeb->free_size -= len;
>>+		c->free_size -= len;
>>+		new_jeb->wasted_size += len;
>>+		c->wasted_size += len;
>>+	}
>> 	if (new_jeb->first_node) {
>> 		/* Odd, but possible with ST flash later maybe */
>> 		new_jeb->last_node->next_phys = *first_raw;
>>@@ -363,6 +381,12 @@
>> 		raw = &(*raw)->next_phys;
>> 	}
>> 
>>+	/* wbuf is empty after recovery */
>>+	c->wbuf_len = 0;
>>+	c->wbuf_ofs = ofs + len;
>>+	BUG_ON(c->wbuf_ofs & (c->wbuf_pagesize-1));
>>+	memset(c->wbuf, 0xFF, c->wbuf_pagesize);
>>+
>> 	/* Fix up the original jeb now it's on the bad_list */
>> 	*first_raw = NULL;
>> 	if (first_raw == &jeb->first_node) {
>>@@ -493,10 +517,11 @@
>> 	jffs2_clear_wbuf_ino_list(c);
>> 	spin_unlock(&c->erase_completion_lock);
>> 
>>-	memset(c->wbuf,0xff,c->wbuf_pagesize);
>>+        /* reset length first, to prevent reading wbuf */
>>+	c->wbuf_len = 0;
>> 	/* adjust write buffer offset, else we get a non contiguous write bug */
>> 	c->wbuf_ofs += c->wbuf_pagesize;
>>-	c->wbuf_len = 0;
>>+	memset(c->wbuf,0xff,c->wbuf_pagesize);
>> 	return 0;
>> }
>> 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
