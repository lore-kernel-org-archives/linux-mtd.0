Received: from c-24-91-108-216.hsd1.ma.comcast.net ([24.91.108.216]
	helo=ahgu.homeunix.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8pOV-0004KN-1p
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 21:22:07 -0400
Received: from weiwei (blue.appledor.net [216.132.23.20])
	(authenticated bits=0)
	by ahgu.homeunix.com (8.12.11/8.12.11) with ESMTP id j7R1HPTm077686
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Aug 2005 21:17:29 -0400 (EDT)
	(envelope-from ahgu@ahgu.homeunix.com)
Message-ID: <015b01c5aaa5$b9ab1550$0c00a8c0@weiwei>
From: "ahgu" <ahgu@ahgu.homeunix.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 26 Aug 2005 21:21:47 -0400
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="gb2312"; reply-type=response
Content-Transfer-Encoding: 7bit
Subject: NAND error retry does not work,
Reply-To: ahgu <ahgu@ahgu.homeunix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case of page write failure(write.c), it calls  jffs2_reserve_space(c,
 sizeof(*ri) + datalen, &flash_ofs, &dummy, alloc_mode);
 to get a new block (new flash_ofs), but it always return the same address.

 My understanding of the logic is as follows:
 In case of write failure, it will put the whole block in the unused queue
 and get a new block. Not just a new page on the block? And copy the content
 of the bad block to the new one?

 This is the latest jffs2 version. Is that a bug?

 -Andrew



 if (!retried && alloc_mode != ALLOC_NORETRY && (raw =
> jffs2_alloc_raw_node_ref())) {
>   /* Try to reallocate space and retry */
>   uint32_t dummy;
>   struct jffs2_eraseblock *jeb = &c->blocks[flash_ofs / c->sector_size];
>
>   retried = 1;
>
>   D1(printk(KERN_DEBUG "Retrying failed write.\n"));
>
>   jffs2_dbg_acct_sanity_check(c,jeb);
>   jffs2_dbg_acct_paranoia_check(c, jeb);
>
>   if (alloc_mode == ALLOC_GC) {
>    ret = jffs2_reserve_space_gc(c, sizeof(*ri) + datalen, &flash_ofs, 
> &dummy);
>   } else {
>    /* Locking pain */
>    up(&f->sem);
>    jffs2_complete_reservation(c);
>
>    ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &flash_ofs, &dummy, 
> alloc_mode);
>    down(&f->sem);
>   }
>
>   if (!ret) {
>    D1(printk(KERN_DEBUG "Allocated space at 0x%08x to retry failed 
> write.\n", flash_ofs));
>
>    jffs2_dbg_acct_sanity_check(c,jeb);
>    jffs2_dbg_acct_paranoia_check(c, jeb);
>
>    goto retry;
>   }
>   D1(printk(KERN_DEBUG "Failed to allocate space to retry failed write: 
> %d!\n", ret));
>   jffs2_free_raw_node_ref(raw);
>  }
>  /* Release the full_dnode which is now useless, and return */
>  jffs2_free_full_dnode(fn);
>  return ERR_PTR(ret?ret:-EIO);
> } 
