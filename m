Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwJoN-0007Bn-MW
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 07:40:50 -0500
Date: Wed, 2 Feb 2005 13:40:43 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Victor <andrew@sanpeople.com>
Message-ID: <20050202124043.GB23156@wohnheim.fh-wedel.de>
References: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 1 February 2005 11:00:03 +0200, Andrew Victor wrote:
>
> @@ -660,6 +666,14 @@
>  		if (ret)
>  			return ret;
>  	}
> +	
> +	/* and Dataflash */
> +	if (jffs2_dataflash(c)) {
> +		ret = jffs2_dataflash_setup(c);
> +		if (ret)
> +			return ret;
> +	}

This can be a bit simpler:

	ret = jffs2_dataflash_setup()
	if (ret)
		return ret;

Just move the outer condition into the called function, like this:

	if (!jffs2_data_flash(c)
		return 0; /* nothing to do */

>  	return ret;
>  }
>  
> @@ -673,4 +687,9 @@
>  	if (jffs2_nor_ecc(c)) {
>  		jffs2_nor_ecc_flash_cleanup(c);
>  	}
> +	
> +	/* and DataFlash */
> +	if (jffs2_dataflash(c)) {
> +		jffs2_dataflash_cleanup(c);
> +	}

Same here.

> diff -urN -x CVS mtd.core/fs/jffs2/os-linux.h mtd.new/fs/jffs2/os-linux.h
> --- mtd.core/fs/jffs2/os-linux.h	Tue Feb  1 10:06:13 2005
> +++ mtd.new/fs/jffs2/os-linux.h	Tue Feb  1 10:18:19 2005
> @@ -97,12 +97,16 @@
>  #endif
>  }
>  
> +#ifdef CONFIG_JFFS2_FS_DATAFLASH
> +#define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )

Not sure, but this might be slightly faster:

static inline unsigned long SECTOR_ADDR(struct jffs2_superblock_info c, uint32_t _x) {
	unsigned long x = _x;
	return x - (x % c->sector_size);
}

Plus it has the types explicit.  They may be wrong in my version, but
at least they are explicitly wrong.

> +#else
>  #define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
> +#endif
>  
>  #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
>  #define jffs2_is_writebuffered(c) (c->wbuf != NULL)
>  
> -#if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC)
> +#if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC && !defined CONFIG_JFFS2_FS_DATAFLASH)
>  #define jffs2_can_mark_obsolete(c) (1)
>  #define jffs2_cleanmarker_oob(c) (0)
>  #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
> @@ -119,6 +123,7 @@
>  #define jffs2_wbuf_timeout NULL
>  #define jffs2_wbuf_process NULL
>  #define jffs2_nor_ecc(c) (0)
> +#define jffs2_dataflash(c) (0)
>  #define jffs2_nor_ecc_flash_setup(c) (0)
>  #define jffs2_nor_ecc_flash_cleanup(c) do {} while (0)
>  
> @@ -154,6 +159,15 @@
>  #define jffs2_nor_ecc_flash_setup(c) (0)
>  #define jffs2_nor_ecc_flash_cleanup(c) do {} while (0)
>  #endif /* NOR ECC */
> +#ifdef CONFIG_JFFS2_FS_DATAFLASH
> +#define jffs2_dataflash(c) (c->mtd->type == MTD_DATAFLASH)
> +int jffs2_dataflash_setup(struct jffs2_sb_info *c);
> +void jffs2_dataflash_cleanup(struct jffs2_sb_info *c);
> +#else
> +#define jffs2_dataflash(c) (0)
> +#define jffs2_dataflash_setup(c) (0)
> +#define jffs2_dataflash_cleanup(c) do {} while (0)
> +#endf /* DATAFLASH */
>  #endif /* NAND */
>  
>  /* erase.c */
> diff -urN -x CVS mtd.core/fs/jffs2/scan.c mtd.new/fs/jffs2/scan.c
> --- mtd.core/fs/jffs2/scan.c	Tue Feb  1 10:07:55 2005
> +++ mtd.new/fs/jffs2/scan.c	Tue Feb  1 10:18:53 2005
> @@ -68,7 +68,7 @@
>  static inline int min_free(struct jffs2_sb_info *c)
>  {
>  	uint32_t min = 2 * sizeof(struct jffs2_raw_inode);
> -#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
> +#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
>  	if (!jffs2_can_mark_obsolete(c) && min < c->wbuf_pagesize)
>  		return c->wbuf_pagesize;
>  #endif
> @@ -228,7 +228,7 @@
>  		c->dirty_size -= c->nextblock->dirty_size;
>  		c->nextblock->dirty_size = 0;
>  	}
> -#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
> +#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
>  	if (!jffs2_can_mark_obsolete(c) && c->nextblock && (c->nextblock->free_size & (c->wbuf_pagesize-1))) {
>  		/* If we're going to start writing into a block which already 
>  		   contains data, and the end of the data isn't page-aligned,
> @@ -351,7 +351,10 @@
>  		}
>  #endif
>  		D1(printk(KERN_DEBUG "Block at 0x%08x is empty (erased)\n", jeb->offset));
> -		return BLK_STATE_ALLFF;	/* OK to erase if all blocks are like this */
> +		if (c->cleanmarker_size == 0)
> +			return BLK_STATE_CLEANMARKER;	/* don't bother with re-erase */

Why this?

> +		else
> +			return BLK_STATE_ALLFF;	/* OK to erase if all blocks are like this */
>  	}
>  	if (ofs) {
>  		D1(printk(KERN_DEBUG "Free space at %08x ends at %08x\n", jeb->offset,
> diff -urN -x CVS mtd.core/fs/jffs2/wbuf.c mtd.new/fs/jffs2/wbuf.c
> --- mtd.core/fs/jffs2/wbuf.c	Tue Feb  1 10:06:13 2005
> +++ mtd.new/fs/jffs2/wbuf.c	Tue Feb  1 10:17:22 2005
> @@ -435,7 +435,7 @@
>  	   if we have a switch to next page, we will not have
>  	   enough remaining space for this. 
>  	*/
> -	if (pad) {
> +	if (pad && !jffs2_dataflash(c)) {
>  		c->wbuf_len = PAD(c->wbuf_len);
>  
>  		/* Pad with JFFS2_DIRTY_BITMASK initially.  this helps out ECC'd NOR
> @@ -486,7 +486,7 @@
>  	spin_lock(&c->erase_completion_lock);
>  
>  	/* Adjust free size of the block if we padded. */
> -	if (pad) {
> +	if (pad && !jffs2_dataflash(c)) {
>  		struct jffs2_eraseblock *jeb;
>  
>  		jeb = &c->blocks[c->wbuf_ofs / c->sector_size];
> @@ -598,8 +598,14 @@
>  	return ret;
>  }
>  
> +#ifdef CONFIG_JFFS2_FS_DATAFLASH
> +#define PAGE_DIV(x) ( ((unsigned long)(x) / (unsigned long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize) )
> +#define PAGE_MOD(x) ( (unsigned long)(x) % (unsigned long)(c->wbuf_pagesize) )

See above.

> +#else
>  #define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
>  #define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
> +#endif
> +
>  int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count, loff_t to, size_t *retlen, uint32_t ino)
>  {
>  	struct kvec outvecs[3];
> @@ -1183,6 +1189,29 @@
>  	kfree(c->wbuf);
>  }
>  
> +#ifdef CONFIG_JFFS2_FS_DATAFLASH
> +int jffs2_dataflash_setup(struct jffs2_sb_info *c) {

Insert the check from above.

> +	c->cleanmarker_size = 0;		/* No cleanmarkers needed */
> +	
> +	/* Initialize write buffer */
> +	init_rwsem(&c->wbuf_sem);
> +	c->wbuf_pagesize = c->sector_size;
> +	c->wbuf_ofs = 0xFFFFFFFF;
> +
> +	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
> +	if (!c->wbuf)
> +		return -ENOMEM;
> +
> +	printk(KERN_INFO "JFFS2 write-buffering enabled (%i)\n", c->wbuf_pagesize);
> +
> +	return 0;
> +}
> +
> +void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {

dito

> +	kfree(c->wbuf);
> +}
> +#endif
> +
>  #ifdef CONFIG_JFFS2_FS_NOR_ECC
>  int jffs2_nor_ecc_flash_setup(struct jffs2_sb_info *c) {
>  	/* Cleanmarker is actually larger on the flashes */
> diff -urN -x CVS mtd.core/include/linux/jffs2_fs_sb.h mtd.new/include/linux/jffs2_fs_sb.h
> --- mtd.core/include/linux/jffs2_fs_sb.h	Wed Jan 26 16:09:40 2005
> +++ mtd.new/include/linux/jffs2_fs_sb.h	Tue Feb  1 10:17:22 2005
> @@ -94,7 +94,7 @@
>  	   to an obsoleted node. I don't like this. Alternatives welcomed. */
>  	struct semaphore erase_free_sem;
>  
> -#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
> +#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
>  	/* Write-behind buffer for NAND flash */
>  	unsigned char *wbuf;
>  	uint32_t wbuf_ofs;
> diff -urN -x CVS mtd.core/include/mtd/mtd-abi.h mtd.new/include/mtd/mtd-abi.h
> --- mtd.core/include/mtd/mtd-abi.h	Wed Jan 26 16:09:41 2005
> +++ mtd.new/include/mtd/mtd-abi.h	Tue Feb  1 10:17:22 2005
> @@ -29,6 +29,7 @@
>  #define MTD_NORFLASH		3
>  #define MTD_NANDFLASH		4
>  #define MTD_PEROM		5
> +#define MTD_DATAFLASH		6
>  #define MTD_OTHER		14
>  #define MTD_UNKNOWN		15
>  
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Jörn

-- 
...one more straw can't possibly matter...
-- Kirby Bakken
