Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwJVp-0006l5-3v
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 07:21:39 -0500
Date: Wed, 2 Feb 2005 13:21:20 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Victor <andrew@sanpeople.com>
Message-ID: <20050202122120.GA23156@wohnheim.fh-wedel.de>
References: <1107247455.22636.36.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107247455.22636.36.camel@fuzzie.sanpeople.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 1 - Core changes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 February 2005 10:44:15 +0200, Andrew Victor wrote:
> 
> Based on the previous comments, the patch has been split up.
> 
> The changes included in this patch are:
> 
> DataFlash page-sizes are not a power of two (they're multiples of 528
> bytes).  There are a few places in JFFS2 code where sector_size is used
> as a bitmask.  A new macro (SECTOR_ADDR) was defined to calculate these
> sector addresses. For non-DataFlash devices, the original (faster)
> bitmask operation is still used.

Nice.  Being independent of specific sector sizes (power of 2,
whatever) makes jffs2 more flexible.  People can decide to spend a few
bytes for for error correction, etc.

> In scan.c, the EMPTY_SCAN_SIZE was a constant of 1024. 
> Since this could be larger than the sector size of the DataFlash, this
> is now basically set to MIN(sector_size, 1024).

Ok.

> Addition of a jffs2_is_writebuffered() macro.

Hmm.  See below.

Overall I like the patch, module comments below.

> diff -urN -x CVS mtd.orig/fs/jffs2/erase.c mtd.core/fs/jffs2/erase.c
> --- mtd.orig/fs/jffs2/erase.c	Wed Jan 26 16:07:57 2005
> +++ mtd.core/fs/jffs2/erase.c	Tue Feb  1 10:06:13 2005
> @@ -233,7 +233,7 @@
>  			continue;
>  		} 
>  
> -		if (((*prev)->flash_offset & ~(c->sector_size -1)) == jeb->offset) {
> +		if (SECTOR_ADDR((*prev)->flash_offset) == jeb->offset) {
>  			/* It's in the block we're erasing */
>  			struct jffs2_raw_node_ref *this;
>  
> diff -urN -x CVS mtd.orig/fs/jffs2/gc.c mtd.core/fs/jffs2/gc.c
> --- mtd.orig/fs/jffs2/gc.c	Wed Jan 26 16:07:57 2005
> +++ mtd.core/fs/jffs2/gc.c	Tue Feb  1 10:06:13 2005
> @@ -816,8 +816,7 @@
>  
>  			/* Doesn't matter if there's one in the same erase block. We're going to 
>  			   delete it too at the same time. */
> -			if ((raw->flash_offset & ~(c->sector_size-1)) ==
> -			    (fd->raw->flash_offset & ~(c->sector_size-1)))
> +			if (SECTOR_ADDR(raw->flash_offset) == SECTOR_ADDR(fd->raw->flash_offset))
>  				continue;
>  
>  			D1(printk(KERN_DEBUG "Check potential deletion dirent at %08x\n", ref_offset(raw)));
> diff -urN -x CVS mtd.orig/fs/jffs2/os-linux.h mtd.core/fs/jffs2/os-linux.h
> --- mtd.orig/fs/jffs2/os-linux.h	Wed Jan 26 16:07:58 2005
> +++ mtd.core/fs/jffs2/os-linux.h	Tue Feb  1 10:06:13 2005
> @@ -97,7 +97,10 @@
>  #endif
>  }
>  
> +#define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
> +
>  #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
> +#define jffs2_is_writebuffered(c) (c->wbuf != NULL)

if (jffs2_is_writebuffered(c))
if (c->wbuf)

With your definition, the code is getting longer.  Not sure if I like
that part.

>  
>  #if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC)
>  #define jffs2_can_mark_obsolete(c) (1)
> diff -urN -x CVS mtd.orig/fs/jffs2/scan.c mtd.core/fs/jffs2/scan.c
> --- mtd.orig/fs/jffs2/scan.c	Wed Jan 26 16:07:58 2005
> +++ mtd.core/fs/jffs2/scan.c	Tue Feb  1 10:07:55 2005
> @@ -19,7 +19,7 @@
>  #include <linux/compiler.h>
>  #include "nodelist.h"
>  
> -#define EMPTY_SCAN_SIZE 1024
> +#define DEFAULT_EMPTY_SCAN_SIZE 1024
>  
>  #define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
>  		c->free_size -= _x; c->dirty_size += _x; \
> @@ -75,6 +75,14 @@
>  	return min;
>  
>  }
> +
> +static inline uint32_t EMPTY_SCAN_SIZE(uint32_t sector_size) {
> +	if (sector_size < DEFAULT_EMPTY_SCAN_SIZE)
> +		return sector_size;
> +	else
> +		return DEFAULT_EMPTY_SCAN_SIZE;
> +}
> +

Better use min() or at least min_t().  Also, if you pass c instead of
c->sector_size, the calling code is a bit simpler.

>  int jffs2_scan_medium(struct jffs2_sb_info *c)
>  {
>  	int i, ret;
> @@ -316,7 +324,7 @@
>  	if (!buf_size) {
>  		buf_len = c->sector_size;
>  	} else {
> -		buf_len = EMPTY_SCAN_SIZE;
> +		buf_len = EMPTY_SCAN_SIZE(c->sector_size);
>  		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
>  		if (err)
>  			return err;
> @@ -326,10 +334,10 @@
>  	ofs = 0;
>  
>  	/* Scan only 4KiB of 0xFF before declaring it's empty */
> -	while(ofs < EMPTY_SCAN_SIZE && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
> +	while(ofs < EMPTY_SCAN_SIZE(c->sector_size) && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
>  		ofs += 4;
>  
> -	if (ofs == EMPTY_SCAN_SIZE) {
> +	if (ofs == EMPTY_SCAN_SIZE(c->sector_size)) {
>  #ifdef CONFIG_JFFS2_FS_NAND
>  		if (jffs2_cleanmarker_oob(c)) {
>  			/* scan oob, take care of cleanmarker */
> @@ -423,7 +431,7 @@
>  			   bail now */
>  			if (buf_ofs == jeb->offset && jeb->used_size == PAD(c->cleanmarker_size) && 
>  			    c->cleanmarker_size && !jeb->dirty_size && !jeb->first_node->next_in_ino) {
> -				D1(printk(KERN_DEBUG "%d bytes at start of block seems clean... assuming all clean\n", EMPTY_SCAN_SIZE));
> +				D1(printk(KERN_DEBUG "%d bytes at start of block seems clean... assuming all clean\n", EMPTY_SCAN_SIZE(c->sector_size)));
>  				return BLK_STATE_CLEANMARKER;
>  			}
>  
> diff -urN -x CVS mtd.orig/fs/jffs2/wbuf.c mtd.core/fs/jffs2/wbuf.c
> --- mtd.orig/fs/jffs2/wbuf.c	Wed Jan 26 16:07:58 2005
> +++ mtd.core/fs/jffs2/wbuf.c	Tue Feb  1 10:06:13 2005
> @@ -415,9 +415,9 @@
>  	int ret;
>  	size_t retlen;
>  
> -	/* Nothing to do if not NAND flash. In particular, we shouldn't
> +	/* Nothing to do if not write-buffering the flash. In particular, we shouldn't
>  	   del_timer() the timer we never initialised. */
> -	if (jffs2_can_mark_obsolete(c))
> +	if (!jffs2_is_writebuffered(c))
>  		return 0;
>  
>  	if (!down_trylock(&c->alloc_sem)) {
> @@ -426,7 +426,7 @@
>  		BUG();
>  	}
>  
> -	if(!c->wbuf || !c->wbuf_len)
> +	if (!c->wbuf_len)	/* already checked c->wbuf above */
>  		return 0;
>  
>  	/* claim remaining space on the page
> @@ -614,7 +614,7 @@
>  	uint32_t outvec_to = to;
>  
>  	/* If not NAND flash, don't bother */
> -	if (!c->wbuf)
> +	if (!jffs2_is_writebuffered(c))
>  		return jffs2_flash_direct_writev(c, invecs, count, to, retlen);
>  	
>  	down_write(&c->wbuf_sem);
> @@ -643,7 +643,7 @@
>  	   erase block. Anything else, and you die.
>  	   New block starts at xxx000c (0-b = block header)
>  	*/
> -	if ( (to & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) {
> +	if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) {
>  		/* It's a write to a new block */
>  		if (c->wbuf_len) {
>  			D1(printk(KERN_DEBUG "jffs2_flash_writev() to 0x%lx causes flush of wbuf at 0x%08x\n", (unsigned long)to, c->wbuf_ofs));
> @@ -841,7 +841,7 @@
>  {
>  	struct kvec vecs[1];
>  
> -	if (jffs2_can_mark_obsolete(c))
> +	if (!jffs2_is_writebuffered(c))
>  		return c->mtd->write(c->mtd, ofs, len, retlen, buf);
>  
>  	vecs[0].iov_base = (unsigned char *) buf;
> @@ -857,39 +857,39 @@
>  	loff_t	orbf = 0, owbf = 0, lwbf = 0;
>  	int	ret;
>  
> +	if (!jffs2_is_writebuffered(c))
> +		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
> +
>  	/* Read flash */
> -	if (!jffs2_can_mark_obsolete(c)) {
> -		down_read(&c->wbuf_sem);
> +	down_read(&c->wbuf_sem);
>  
> -		if (jffs2_cleanmarker_oob(c))
> -			ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
> -		else
> -			ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
> +	if (jffs2_cleanmarker_oob(c))
> +		ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
> +	else
> +		ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
>  
> -		if ( (ret == -EBADMSG) && (*retlen == len) ) {
> -			printk(KERN_WARNING "mtd->read(0x%zx bytes from 0x%llx) returned ECC error\n",
> -			       len, ofs);
> -			/* 
> -			 * We have the raw data without ECC correction in the buffer, maybe 
> -			 * we are lucky and all data or parts are correct. We check the node.
> -			 * If data are corrupted node check will sort it out.
> -			 * We keep this block, it will fail on write or erase and the we
> -			 * mark it bad. Or should we do that now? But we should give him a chance.
> -			 * Maybe we had a system crash or power loss before the ecc write or  
> -			 * a erase was completed.
> -			 * So we return success. :)
> -			 */
> -		 	ret = 0;
> -		 }	
> -	} else
> -		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
> +	if ( (ret == -EBADMSG) && (*retlen == len) ) {
> +		printk(KERN_WARNING "mtd->read(0x%zx bytes from 0x%llx) returned ECC error\n",
> +		       len, ofs);
> +		/* 
> +		 * We have the raw data without ECC correction in the buffer, maybe 
> +		 * we are lucky and all data or parts are correct. We check the node.
> +		 * If data are corrupted node check will sort it out.
> +		 * We keep this block, it will fail on write or erase and the we
> +		 * mark it bad. Or should we do that now? But we should give him a chance.
> +		 * Maybe we had a system crash or power loss before the ecc write or  
> +		 * a erase was completed.
> +		 * So we return success. :)
> +		 */
> +	 	ret = 0;
> +	}	
>  
>  	/* if no writebuffer available or write buffer empty, return */
>  	if (!c->wbuf_pagesize || !c->wbuf_len)
>  		goto exit;
>  
>  	/* if we read in a different block, return */
> -	if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) 
> +	if (SECTOR_ADDR(ofs) != SECTOR_ADDR(c->wbuf_ofs))
>  		goto exit;
>  
>  	if (ofs >= c->wbuf_ofs) {
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
