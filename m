Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4baK-0006R5-RG
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 05:49:11 -0400
Date: Mon, 15 Aug 2005 11:48:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050815094816.GA27229@wohnheim.fh-wedel.de>
References: <42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
	<20050726100330.GF15903@wohnheim.fh-wedel.de>
	<42EDF04C.1010108@inf.u-szeged.hu>
	<20050801095645.GA32464@wohnheim.fh-wedel.de>
	<42EDF470.4060208@inf.u-szeged.hu>
	<20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42FB68AE.6070805@inf.u-szeged.hu>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 11 August 2005 17:03:10 +0200, Ferenc Havasi wrote:
>
> Here is our new patch: 
> http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050811-v2.patch

Next round of comments below.

Jörn

-- 
To my face you have the audacity to advise me to become a thief - the worst
kind of thief that is conceivable, a thief of spiritual things, a thief of
ideas! It is insufferable, intolerable!
-- M. Binet in Scarabouche

There are still quite a few non-conformances to coding style.  I
suggest you run Lindent over the new code.  Or use this one instead,
as it ignored long lines:
indent -kr -i8 -ts8 -sob -l0 -ss -ncs "$@"


My comments are not strictly in order, as I jumped back and forth
through the code.  I hope you still get their meaning.

One big issue for this round is the number of explicit casts.  Most of
them are plain superfluous.  The rest can be removed by changing types
from uchar* to void*.  If there are any problematic ones you're not
sure about, I'll take a look in the next review round.

> diff -Narup Mtd-orig/fs/Kconfig mtd/fs/Kconfig
> --- Mtd-orig/fs/Kconfig	2005-05-09 10:16:08.000000000 +0200
> +++ mtd/fs/Kconfig	2005-08-11 15:35:06.000000000 +0200
> @@ -64,6 +64,19 @@ config JFFS2_FS_WRITEBUFFER
>  	    - NOR flash with transparent ECC
>  	    - DataFlash
>  
> +config JFFS2_SUMMARY
> +        bool "JFFS2 summary support (EXPERIMENTAL)"
> +        depends on JFFS2_FS && EXPERIMENTAL
> +        default n
> +        help 
> +          This feature makes it possible to use summary information
> +          for faster filesystem mount - specially on NAND.
> +
> +          The summary information can be inserted into a filesystem image
> +          by the utility 'sumtool'.
> +
> +          If unsure, say 'N'.
> +
>  config JFFS2_COMPRESSION_OPTIONS
>  	bool "Advanced compression options for JFFS2"
>  	default n
> diff -Narup Mtd-orig/fs/jffs2/Makefile.common mtd/fs/jffs2/Makefile.common
> --- Mtd-orig/fs/jffs2/Makefile.common	2005-07-17 08:56:20.000000000 +0200
> +++ mtd/fs/jffs2/Makefile.common	2005-08-11 15:17:41.000000000 +0200
> @@ -15,3 +15,4 @@ jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= 
>  jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
>  jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
>  jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
> +jffs2-$(CONFIG_JFFS2_SUMMARY)   += summary.o
> diff -Narup Mtd-orig/fs/jffs2/build.c mtd/fs/jffs2/build.c
> --- Mtd-orig/fs/jffs2/build.c	2005-07-30 17:29:27.000000000 +0200
> +++ mtd/fs/jffs2/build.c	2005-08-11 15:17:41.000000000 +0200
> @@ -336,6 +336,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
>  		c->blocks[i].first_node = NULL;
>  		c->blocks[i].last_node = NULL;
>  		c->blocks[i].bad_count = 0;
> +		c->blocks[i].sum_collected = NULL;
>  	}
>  
>  	INIT_LIST_HEAD(&c->clean_list);
> diff -Narup Mtd-orig/fs/jffs2/dir.c mtd/fs/jffs2/dir.c
> --- Mtd-orig/fs/jffs2/dir.c	2005-07-17 13:13:46.000000000 +0200
> +++ mtd/fs/jffs2/dir.c	2005-08-11 15:17:41.000000000 +0200
> @@ -304,7 +304,8 @@ static int jffs2_symlink (struct inode *
>  	 * Just the node will do for now, though 
>  	 */
>  	namelen = dentry->d_name.len;
> -	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
> @@ -364,7 +365,8 @@ static int jffs2_symlink (struct inode *
>  	up(&f->sem);
>  
>  	jffs2_complete_reservation(c);
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  	if (ret) {
>  		/* Eep. */
>  		jffs2_clear_inode(inode);
> @@ -449,7 +451,8 @@ static int jffs2_mkdir (struct inode *di
>  	 * Just the node will do for now, though 
>  	 */
>  	namelen = dentry->d_name.len;
> -	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL,
> +				JFFS2_SUMMARY_INODE_SIZE);
>  
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
> @@ -492,7 +495,8 @@ static int jffs2_mkdir (struct inode *di
>  	up(&f->sem);
>  
>  	jffs2_complete_reservation(c);
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  	if (ret) {
>  		/* Eep. */
>  		jffs2_clear_inode(inode);
> @@ -601,7 +605,8 @@ static int jffs2_mknod (struct inode *di
>  	 * Just the node will do for now, though 
>  	 */
>  	namelen = dentry->d_name.len;
> -	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
> @@ -646,7 +651,8 @@ static int jffs2_mknod (struct inode *di
>  	up(&f->sem);
>  
>  	jffs2_complete_reservation(c);
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  	if (ret) {
>  		/* Eep. */
>  		jffs2_clear_inode(inode);
> diff -Narup Mtd-orig/fs/jffs2/erase.c mtd/fs/jffs2/erase.c
> --- Mtd-orig/fs/jffs2/erase.c	2005-07-22 12:32:08.000000000 +0200
> +++ mtd/fs/jffs2/erase.c	2005-08-11 15:17:41.000000000 +0200
> @@ -425,6 +425,8 @@ static void jffs2_mark_erased_block(stru
>  		jeb->wasted_size = 0;
>  	}
>  
> +	jffs2_sum_reset_collected(jeb);
> +
>  	spin_lock(&c->erase_completion_lock);
>  	c->erasing_size -= c->sector_size;
>  	c->free_size += jeb->free_size;
> diff -Narup Mtd-orig/fs/jffs2/file.c mtd/fs/jffs2/file.c
> --- Mtd-orig/fs/jffs2/file.c	2005-07-06 14:13:09.000000000 +0200
> +++ mtd/fs/jffs2/file.c	2005-08-11 15:17:41.000000000 +0200
> @@ -137,7 +137,8 @@ static int jffs2_prepare_write (struct f
>  		D1(printk(KERN_DEBUG "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
>  			  (unsigned int)inode->i_size, pageofs));
>  
> -		ret = jffs2_reserve_space(c, sizeof(ri), &phys_ofs, &alloc_len, ALLOC_NORMAL);
> +		ret = jffs2_reserve_space(c, sizeof(ri), &phys_ofs, &alloc_len,
> +					ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  		if (ret)
>  			return ret;
>  
> diff -Narup Mtd-orig/fs/jffs2/fs.c mtd/fs/jffs2/fs.c
> --- Mtd-orig/fs/jffs2/fs.c	2005-08-06 06:51:30.000000000 +0200
> +++ mtd/fs/jffs2/fs.c	2005-08-11 15:17:41.000000000 +0200
> @@ -74,7 +74,8 @@ static int jffs2_do_setattr (struct inod
>  		return -ENOMEM;
>  	}
>  		
> -	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
>  		if (S_ISLNK(inode->i_mode & S_IFMT))
> diff -Narup Mtd-orig/fs/jffs2/gc.c mtd/fs/jffs2/gc.c
> --- Mtd-orig/fs/jffs2/gc.c	2005-07-24 17:14:14.000000000 +0200
> +++ mtd/fs/jffs2/gc.c	2005-08-11 15:17:41.000000000 +0200
> @@ -513,8 +513,11 @@ static int jffs2_garbage_collect_pristin
>  	/* Ask for a small amount of space (or the totlen if smaller) because we
>  	   don't want to force wastage of the end of a block if splitting would
>  	   work. */
> -	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN, 
> -					      rawlen), &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) +
> +				JFFS2_MIN_DATA_LEN, rawlen), &phys_ofs, &alloclen, rawlen);
> +				/* this is not the exact summary size of it,
> +					it is only an upper estimation */
> +
>  	if (ret)
>  		return ret;
>  
> @@ -622,7 +625,9 @@ static int jffs2_garbage_collect_pristin
>  			jffs2_dbg_acct_sanity_check(c,jeb);
>  			jffs2_dbg_acct_paranoia_check(c, jeb);
>  
> -			ret = jffs2_reserve_space_gc(c, rawlen, &phys_ofs, &dummy);
> +			ret = jffs2_reserve_space_gc(c, rawlen, &phys_ofs, &dummy, rawlen);
> +						/* this is not the exact summary size of it,
> +							it is only an upper estimation */
>  
>  			if (!ret) {
>  				D1(printk(KERN_DEBUG "Allocated space at 0x%08x to retry failed write.\n", phys_ofs));
> @@ -701,7 +706,8 @@ static int jffs2_garbage_collect_metadat
>  
>  	}
>  	
> -	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &phys_ofs, &alloclen,
> +				JFFS2_SUMMARY_INODE_SIZE);
>  	if (ret) {
>  		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_metadata failed: %d\n",
>  		       sizeof(ri)+ mdatalen, ret);
> @@ -776,7 +782,8 @@ static int jffs2_garbage_collect_dirent(
>  	rd.node_crc = cpu_to_je32(crc32(0, &rd, sizeof(rd)-8));
>  	rd.name_crc = cpu_to_je32(crc32(0, fd->name, rd.nsize));
>  	
> -	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &phys_ofs, &alloclen,
> +				JFFS2_SUMMARY_DIRENT_SIZE(rd.nsize));
>  	if (ret) {
>  		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_dirent failed: %d\n",
>  		       sizeof(rd)+rd.nsize, ret);
> @@ -986,7 +993,8 @@ static int jffs2_garbage_collect_hole(st
>  	ri.data_crc = cpu_to_je32(0);
>  	ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
>  
> -	ret = jffs2_reserve_space_gc(c, sizeof(ri), &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, sizeof(ri), &phys_ofs, &alloclen,
> +				JFFS2_SUMMARY_INODE_SIZE);
>  	if (ret) {
>  		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_hole failed: %d\n",
>  		       sizeof(ri), ret);
> @@ -1211,7 +1219,8 @@ static int jffs2_garbage_collect_dnode(s
>  		uint32_t cdatalen;
>  		uint16_t comprtype = JFFS2_COMPR_NONE;
>  
> -		ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen);
> +		ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN, &phys_ofs,
> +					&alloclen, JFFS2_SUMMARY_INODE_SIZE);
>  
>  		if (ret) {
>  			printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_dnode failed: %d\n",
> @@ -1268,4 +1277,3 @@ static int jffs2_garbage_collect_dnode(s
>  	jffs2_gc_release_page(c, pg_ptr, &pg);
>  	return ret;
>  }
> -
> diff -Narup Mtd-orig/fs/jffs2/nodelist.h mtd/fs/jffs2/nodelist.h
> --- Mtd-orig/fs/jffs2/nodelist.h	2005-08-01 14:05:19.000000000 +0200
> +++ mtd/fs/jffs2/nodelist.h	2005-08-11 15:17:41.000000000 +0200
> @@ -20,6 +20,7 @@
>  #include <linux/jffs2.h>
>  #include <linux/jffs2_fs_sb.h>
>  #include <linux/jffs2_fs_i.h>
> +#include "summary.h"
>  
>  #ifdef __ECOS
>  #include "os-ecos.h"
> @@ -195,6 +196,7 @@ struct jffs2_eraseblock
>  	struct jffs2_raw_node_ref *last_node;
>  
>  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage collected */
> +	struct jffs2_sum_info *sum_collected;
>  };
>  
>  /* Calculate totlen from surrounding nodes or eraseblock */
> @@ -321,8 +323,10 @@ int jffs2_add_older_frag_to_fragtree(str
>  
>  /* nodemgmt.c */
>  int jffs2_thread_should_wake(struct jffs2_sb_info *c);
> -int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio);
> -int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len);
> +int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs,
> +			uint32_t *len, int prio, uint32_t sumsize);
> +int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs,
> +			uint32_t *len, uint32_t sumsize);
>  int jffs2_add_physical_node_ref(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *new);
>  void jffs2_complete_reservation(struct jffs2_sb_info *c);
>  void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *raw);
> @@ -381,6 +385,10 @@ char *jffs2_getlink(struct jffs2_sb_info
>  /* scan.c */
>  int jffs2_scan_medium(struct jffs2_sb_info *c);
>  void jffs2_rotate_lists(struct jffs2_sb_info *c);
> +int jffs2_fill_scan_buf(struct jffs2_sb_info *c, unsigned char *buf,
> +				uint32_t ofs, uint32_t len);
> +struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino);
> +int jffs2_scan_classify_jeb(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
>  
>  /* build.c */
>  int jffs2_do_mount_fs(struct jffs2_sb_info *c);
> diff -Narup Mtd-orig/fs/jffs2/nodemgmt.c mtd/fs/jffs2/nodemgmt.c
> --- Mtd-orig/fs/jffs2/nodemgmt.c	2005-07-20 17:32:28.000000000 +0200
> +++ mtd/fs/jffs2/nodemgmt.c	2005-08-11 15:46:11.000000000 +0200
> @@ -38,9 +38,11 @@
>   *	for the requested allocation.
>   */
>  
> -static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len);
> +static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize,
> +					uint32_t *ofs, uint32_t *len, uint32_t sumsize);
>  
> -int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio)
> +int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs,
> +			uint32_t *len, int prio, uint32_t sumsize)
>  {
>  	int ret = -EAGAIN;
>  	int blocksneeded = c->resv_blocks_write;
> @@ -129,7 +131,7 @@ int jffs2_reserve_space(struct jffs2_sb_
>  			spin_lock(&c->erase_completion_lock);
>  		}
>  
> -		ret = jffs2_do_reserve_space(c, minsize, ofs, len);
> +		ret = jffs2_do_reserve_space(c, minsize, ofs, len, sumsize);
>  		if (ret) {
>  			D1(printk(KERN_DEBUG "jffs2_reserve_space: ret is %d\n", ret));
>  		}
> @@ -140,7 +142,8 @@ int jffs2_reserve_space(struct jffs2_sb_
>  	return ret;
>  }
>  
> -int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len)
> +int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs,
> +			uint32_t *len, uint32_t sumsize)
>  {
>  	int ret = -EAGAIN;
>  	minsize = PAD(minsize);
> @@ -149,7 +152,7 @@ int jffs2_reserve_space_gc(struct jffs2_
>  
>  	spin_lock(&c->erase_completion_lock);
>  	while(ret == -EAGAIN) {
> -		ret = jffs2_do_reserve_space(c, minsize, ofs, len);
> +		ret = jffs2_do_reserve_space(c, minsize, ofs, len, sumsize);
>  		if (ret) {
>  		        D1(printk(KERN_DEBUG "jffs2_reserve_space_gc: looping, ret is %d\n", ret));
>  		}
> @@ -158,105 +161,168 @@ int jffs2_reserve_space_gc(struct jffs2_
>  	return ret;
>  }
>  
> -/* Called with alloc sem _and_ erase_completion_lock */
> -static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len)
> +static void jffs2_close_nextblock(struct jffs2_sb_info *c, struct jffs2_eraseblock **jeb)
>  {
> -	struct jffs2_eraseblock *jeb = c->nextblock;
> -	
> - restart:
> -	if (jeb && minsize > jeb->free_size) {
> -		/* Skip the end of this block and file it as having some dirty space */
> -		/* If there's a pending write to it, flush now */
> -		if (jffs2_wbuf_dirty(c)) {
> +
> +	/* Check, if we have a dirty block now, or if it was dirty already */
> +	if (ISDIRTY ((*jeb)->wasted_size + (*jeb)->dirty_size)) {
> +		c->dirty_size += (*jeb)->wasted_size;
> +		c->wasted_size -= (*jeb)->wasted_size;
> +		(*jeb)->dirty_size += (*jeb)->wasted_size;
> +		(*jeb)->wasted_size = 0;
> +		if (VERYDIRTY(c, (*jeb)->dirty_size)) {
> +			D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +			  (*jeb)->offset, (*jeb)->free_size, (*jeb)->dirty_size, (*jeb)->used_size));
> +			list_add_tail(&(*jeb)->list, &c->very_dirty_list);
> +		} else {
> +			D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +			  (*jeb)->offset, (*jeb)->free_size, (*jeb)->dirty_size, (*jeb)->used_size));
> +			list_add_tail(&(*jeb)->list, &c->dirty_list);
> +		}
> +	} else { 
> +		D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +		  (*jeb)->offset, (*jeb)->free_size, (*jeb)->dirty_size, (*jeb)->used_size));
> +		list_add_tail(&(*jeb)->list, &c->clean_list);
> +	}
> +	c->nextblock = *jeb = NULL;
> +}
> +
> +
> +static int jffs2_find_nextblock(struct jffs2_sb_info *c)
> +{
> +	struct list_head *next;
> +	/* Take the next block off the 'free' list */
> +
> +	if (list_empty(&c->free_list)) {
> +
> +		if (!c->nr_erasing_blocks &&
> +			!list_empty(&c->erasable_list)) {
> +			struct jffs2_eraseblock *ejeb;
> +
> +			ejeb = list_entry(c->erasable_list.next, struct jffs2_eraseblock, list);
> +			list_del(&ejeb->list);
> +			list_add_tail(&ejeb->list, &c->erase_pending_list);
> +			c->nr_erasing_blocks++;
> +			jffs2_erase_pending_trigger(c);
> +			D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Triggering erase of erasable block at 0x%08x\n",
> +				  ejeb->offset));
> +		}
> +
> +		if (!c->nr_erasing_blocks &&
> +			!list_empty(&c->erasable_pending_wbuf_list)) {
> +			D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));
> +			/* c->nextblock is NULL, no update to c->nextblock allowed */			    
>  			spin_unlock(&c->erase_completion_lock);
> -			D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));			    
>  			jffs2_flush_wbuf_pad(c);
>  			spin_lock(&c->erase_completion_lock);
> -			jeb = c->nextblock;
> -			goto restart;
> +			/* Have another go. It'll be on the erasable_list now */
> +			return -EAGAIN;
>  		}
> -		c->wasted_size += jeb->free_size;
> -		c->free_size -= jeb->free_size;
> -		jeb->wasted_size += jeb->free_size;
> -		jeb->free_size = 0;
> -		
> -		/* Check, if we have a dirty block now, or if it was dirty already */
> -		if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
> -			c->dirty_size += jeb->wasted_size;
> -			c->wasted_size -= jeb->wasted_size;
> -			jeb->dirty_size += jeb->wasted_size;
> -			jeb->wasted_size = 0;
> -			if (VERYDIRTY(c, jeb->dirty_size)) {
> -				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> -				  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> -				list_add_tail(&jeb->list, &c->very_dirty_list);
> -			} else {
> -				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> -				  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> -				list_add_tail(&jeb->list, &c->dirty_list);
> -			}
> -		} else { 
> -			D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> -			  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> -			list_add_tail(&jeb->list, &c->clean_list);
> +
> +		if (!c->nr_erasing_blocks) {
> +			/* Ouch. We're in GC, or we wouldn't have got here.
> +			   And there's no space left. At all. */
> +			printk(KERN_CRIT "Argh. No free space left for GC. nr_erasing_blocks is %d. nr_free_blocks is %d. (erasableempty: %s, erasingempty: %s, erasependingempty: %s)\n", 
> +				   c->nr_erasing_blocks, c->nr_free_blocks, list_empty(&c->erasable_list)?"yes":"no", 
> +				   list_empty(&c->erasing_list)?"yes":"no", list_empty(&c->erase_pending_list)?"yes":"no");
> +			return -ENOSPC;
>  		}
> -		c->nextblock = jeb = NULL;
> +
> +		spin_unlock(&c->erase_completion_lock);
> +		/* Don't wait for it; just erase one right now */
> +		jffs2_erase_pending_blocks(c, 1);
> +		spin_lock(&c->erase_completion_lock);
> +
> +		/* An erase may have failed, decreasing the
> +		   amount of free space available. So we must
> +		   restart from the beginning */
> +		return -EAGAIN;
>  	}
> -	
> -	if (!jeb) {
> -		struct list_head *next;
> -		/* Take the next block off the 'free' list */
>  
> -		if (list_empty(&c->free_list)) {
> +	next = c->free_list.next;
> +	list_del(next);
> +	c->nextblock = list_entry(next, struct jffs2_eraseblock, list);
> +	c->nr_free_blocks--;
>  
> -			if (!c->nr_erasing_blocks && 
> -			    !list_empty(&c->erasable_list)) {
> -				struct jffs2_eraseblock *ejeb;
> -
> -				ejeb = list_entry(c->erasable_list.next, struct jffs2_eraseblock, list);
> -				list_del(&ejeb->list);
> -				list_add_tail(&ejeb->list, &c->erase_pending_list);
> -				c->nr_erasing_blocks++;
> -				jffs2_erase_pending_trigger(c);
> -				D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Triggering erase of erasable block at 0x%08x\n",
> -					  ejeb->offset));
> +	return 0;
> +}
> +
> +/* Called with alloc sem _and_ erase_completion_lock */
> +static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
> +{
> +	struct jffs2_eraseblock *jeb = c->nextblock;
> +	uint32_t nofree_size;
> +	int ret;
> +
> + restart:
> +	nofree_size = 0;
> +
> +	if (jffs2_sum_active() && (sumsize != JFFS2_SUMMARY_NOSUM_SIZE)) {
> +							/* NOSUM_SIZE means not to generate summary*/
> +
> +		if (jeb) {
> +			if ((ret = jffs2_sum_care_sum_collected(jeb))) return ret;
> +			nofree_size = PAD(sumsize + jeb->sum_collected->sum_size + JFFS2_SUMMARY_FRAME_SIZE);
> +		}
> +
> +		D1(if (jeb) printk(KERN_DEBUG "JFFS2: minsize %d , jeb->free(%d) ,"
> +						"sum_collected->size(%d) , sumsize(%d)\n", minsize,
> +						jeb->free_size, jeb->sum_collected->sum_size, sumsize));
> +
> +		if (jeb && (PAD(minsize) + PAD(jeb->sum_collected->sum_size + sumsize +
> +					JFFS2_SUMMARY_FRAME_SIZE) > jeb->free_size)) {
> +
> +			D1(printk(KERN_DEBUG "JFFS2: generating summary for 0x%08x.\n", jeb->offset));
> +			if (jeb->sum_collected->sum_size == JFFS2_SUMMARY_NOSUM_SIZE) {
> +				sumsize = JFFS2_SUMMARY_NOSUM_SIZE;
> +				jffs2_sum_clean_collected(jeb);
> +				goto restart;
>  			}
>  
> -			if (!c->nr_erasing_blocks && 
> -			    !list_empty(&c->erasable_pending_wbuf_list)) {
> -				D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));
> -				/* c->nextblock is NULL, no update to c->nextblock allowed */			    
> +			ret = jffs2_sum_write_sumnode(c);
> +
> +			if (ret)
> +				return ret;
> +
> +			if (jeb->sum_collected->sum_size == JFFS2_SUMMARY_NOSUM_SIZE) {
> +				/* jffs2_write_sumnode can't write out the summary information */
> +				sumsize = JFFS2_SUMMARY_NOSUM_SIZE;
> +				jffs2_sum_clean_collected(jeb);
> +				goto restart;
> +			}
> +
> +			jffs2_close_nextblock(c, &jeb);
> +		}
> +	}
> +	else {
> +		if (jeb && minsize > jeb->free_size) {
> +			/* Skip the end of this block and file it as having some dirty space */
> +			/* If there's a pending write to it, flush now */
> +
> +			if (jffs2_wbuf_dirty(c)) {
>  				spin_unlock(&c->erase_completion_lock);
> +				D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));
>  				jffs2_flush_wbuf_pad(c);
>  				spin_lock(&c->erase_completion_lock);
> -				/* Have another go. It'll be on the erasable_list now */
> -				return -EAGAIN;
> -			}
> -
> -			if (!c->nr_erasing_blocks) {
> -				/* Ouch. We're in GC, or we wouldn't have got here.
> -				   And there's no space left. At all. */
> -				printk(KERN_CRIT "Argh. No free space left for GC. nr_erasing_blocks is %d. nr_free_blocks is %d. (erasableempty: %s, erasingempty: %s, erasependingempty: %s)\n", 
> -				       c->nr_erasing_blocks, c->nr_free_blocks, list_empty(&c->erasable_list)?"yes":"no", 
> -				       list_empty(&c->erasing_list)?"yes":"no", list_empty(&c->erase_pending_list)?"yes":"no");
> -				return -ENOSPC;
> +				jeb = c->nextblock;
> +				goto restart;
>  			}
>  
> -			spin_unlock(&c->erase_completion_lock);
> -			/* Don't wait for it; just erase one right now */
> -			jffs2_erase_pending_blocks(c, 1);
> -			spin_lock(&c->erase_completion_lock);
> +			c->wasted_size += jeb->free_size;
> +			c->free_size -= jeb->free_size;
> +			jeb->wasted_size += jeb->free_size;
> +			jeb->free_size = 0;
>  
> -			/* An erase may have failed, decreasing the
> -			   amount of free space available. So we must
> -			   restart from the beginning */
> -			return -EAGAIN;
> +			jffs2_close_nextblock(c, &jeb);
>  		}
> +	}
> +	if (!jeb) {
> +
> +		ret = jffs2_find_nextblock(c);
> +		if (ret)
> +			return ret;
>  
> -		next = c->free_list.next;
> -		list_del(next);
> -		c->nextblock = jeb = list_entry(next, struct jffs2_eraseblock, list);
> -		c->nr_free_blocks--;
> +		jeb = c->nextblock;
>  
>  		if (jeb->free_size != c->sector_size - c->cleanmarker_size) {
>  			printk(KERN_WARNING "Eep. Block 0x%08x taken from free_list had free_size of 0x%08x!!\n", jeb->offset, jeb->free_size);
> @@ -266,7 +332,7 @@ static int jffs2_do_reserve_space(struct
>  	/* OK, jeb (==c->nextblock) is now pointing at a block which definitely has
>  	   enough space */
>  	*ofs = jeb->offset + (c->sector_size - jeb->free_size);
> -	*len = jeb->free_size;
> +	*len = jeb->free_size - nofree_size;
>  
>  	if (c->cleanmarker_size && jeb->used_size == c->cleanmarker_size &&
>  	    !jeb->first_node->next_in_ino) {
> diff -Narup Mtd-orig/fs/jffs2/os-linux.h mtd/fs/jffs2/os-linux.h
> --- Mtd-orig/fs/jffs2/os-linux.h	2005-08-06 06:51:30.000000000 +0200
> +++ mtd/fs/jffs2/os-linux.h	2005-08-11 15:17:41.000000000 +0200
> @@ -67,12 +67,18 @@ static inline void jffs2_init_inode_info
>  
>  #ifndef CONFIG_JFFS2_FS_WRITEBUFFER
>  #define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
> +
> +#ifdef CONFIG_JFFS2_SUMMARY
> +#define jffs2_can_mark_obsolete(c) (0)
> +#else
>  #define jffs2_can_mark_obsolete(c) (1)
> +#endif
> +
>  #define jffs2_is_writebuffered(c) (0)
>  #define jffs2_cleanmarker_oob(c) (0)
>  #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
>  
> -#define jffs2_flash_write(c, ofs, len, retlen, buf) ((c)->mtd->write((c)->mtd, ofs, len, retlen, buf))
> +#define jffs2_flash_write(c, ofs, len, retlen, buf) jffs2_flash_direct_write(c, ofs, len, retlen, buf)
>  #define jffs2_flash_read(c, ofs, len, retlen, buf) ((c)->mtd->read((c)->mtd, ofs, len, retlen, buf))
>  #define jffs2_flush_wbuf_pad(c) ({ (void)(c), 0; })
>  #define jffs2_flush_wbuf_gc(c, i) ({ (void)(c), (void) i, 0; })
> @@ -97,9 +103,15 @@ static inline void jffs2_init_inode_info
>  
>  #define jffs2_is_writebuffered(c) (c->wbuf != NULL)
>  #define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )
> +
> +#ifdef CONFIG_JFFS2_SUMMARY
> +#define jffs2_can_mark_obsolete(c) (0)
> +#else
>  #define jffs2_can_mark_obsolete(c) \
>    ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & (MTD_ECC|MTD_PROGRAM_REGIONS))) || \
>     c->mtd->type == MTD_RAM)
> +#endif
> +
>  #define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
>  
>  #define jffs2_flash_write_oob(c, ofs, len, retlen, buf) ((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
> @@ -192,7 +204,8 @@ void jffs2_flash_cleanup(struct jffs2_sb
>  /* writev.c */
>  int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs, 
>  		       unsigned long count, loff_t to, size_t *retlen);
> -
> +int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
> +			size_t *retlen, const u_char *buf);
>  
>  #endif /* __JFFS2_OS_LINUX_H__ */
>  
> diff -Narup Mtd-orig/fs/jffs2/scan.c mtd/fs/jffs2/scan.c
> --- Mtd-orig/fs/jffs2/scan.c	2005-07-20 17:32:28.000000000 +0200
> +++ mtd/fs/jffs2/scan.c	2005-08-11 16:37:16.000000000 +0200
> @@ -18,22 +18,10 @@
>  #include <linux/crc32.h>
>  #include <linux/compiler.h>
>  #include "nodelist.h"
> +#include "summary.h"
>  
>  #define DEFAULT_EMPTY_SCAN_SIZE 1024
>  
> -#define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
> -		c->free_size -= _x; c->dirty_size += _x; \
> -		jeb->free_size -= _x ; jeb->dirty_size += _x; \
> -		}while(0)
> -#define USED_SPACE(x) do { typeof(x) _x = (x); \
> -		c->free_size -= _x; c->used_size += _x; \
> -		jeb->free_size -= _x ; jeb->used_size += _x; \
> -		}while(0)
> -#define UNCHECKED_SPACE(x) do { typeof(x) _x = (x); \
> -		c->free_size -= _x; c->unchecked_size += _x; \
> -		jeb->free_size -= _x ; jeb->unchecked_size += _x; \
> -		}while(0)
> -
>  #define noisy_printk(noise, args...) do { \
>  	if (*(noise)) { \
>  		printk(KERN_NOTICE args); \
> @@ -58,13 +46,6 @@ static int jffs2_scan_inode_node(struct 
>  static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
>  				 struct jffs2_raw_dirent *rd, uint32_t ofs);
>  
> -#define BLK_STATE_ALLFF		0
> -#define BLK_STATE_CLEAN		1
> -#define BLK_STATE_PARTDIRTY	2
> -#define BLK_STATE_CLEANMARKER	3
> -#define BLK_STATE_ALLDIRTY	4
> -#define BLK_STATE_BADBLOCK	5
> -
>  static inline int min_free(struct jffs2_sb_info *c)
>  {
>  	uint32_t min = 2 * sizeof(struct jffs2_raw_inode);
> @@ -265,7 +246,7 @@ int jffs2_scan_medium(struct jffs2_sb_in
>  	return ret;
>  }
>  
> -static int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
> +int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
>  				uint32_t ofs, uint32_t len)
>  {
>  	int ret;
> @@ -286,14 +267,36 @@ static int jffs2_fill_scan_buf (struct j
>  	return 0;
>  }
>  
> +int jffs2_scan_classify_jeb(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
> +{
> +	if ((jeb->used_size + jeb->unchecked_size) == PAD(c->cleanmarker_size) && !jeb->dirty_size
> +		&& (!jeb->first_node || !jeb->first_node->next_phys) )
> +		return BLK_STATE_CLEANMARKER;
> +
> +	/* move blocks with max 4 byte dirty space to cleanlist */
> +	else if (!ISDIRTY(c->sector_size - (jeb->used_size + jeb->unchecked_size))) {
> +		c->dirty_size -= jeb->dirty_size;
> +		c->wasted_size += jeb->dirty_size;
> +		jeb->wasted_size += jeb->dirty_size;
> +		jeb->dirty_size = 0;
> +		return BLK_STATE_CLEAN;
> +	} else if (jeb->used_size || jeb->unchecked_size)
> +		return BLK_STATE_PARTDIRTY;
> +	else
> +		return BLK_STATE_ALLDIRTY;
> +}
> +
>  static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
>  				  unsigned char *buf, uint32_t buf_size) {
>  	struct jffs2_unknown_node *node;
>  	struct jffs2_unknown_node crcnode;
> +	struct jffs2_sum_marker *sm;
>  	uint32_t ofs, prevofs;
>  	uint32_t hdr_crc, buf_ofs, buf_len;
>  	int err;
>  	int noise = 0;
> +
> +
>  #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
>  	int cleanmarkerfound = 0;
>  #endif
> @@ -319,10 +322,52 @@ static int jffs2_scan_eraseblock (struct
>  		}
>  	}
>  #endif
> +
> +	if (jffs2_sum_active()) {
> +		sm = (struct jffs2_sum_marker *)kmalloc(sizeof(struct jffs2_sum_marker), GFP_KERNEL);

Remove cast.

> +		if (!sm) {
> +			return -ENOMEM;
> +		}
> +
> +		err = jffs2_fill_scan_buf(c, (unsigned char *) sm, jeb->offset + c->sector_size -
> +					sizeof(struct jffs2_sum_marker), sizeof(struct jffs2_sum_marker));
> +
> +		if (err) {
> +			kfree(sm);
> +			return err;
> +		}
> +
> +		if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC ) {
> +
> +			if(je32_to_cpu(sm->erase_size) == c->sector_size) {
> +				err = jffs2_sum_scan_sumnode(c,jeb,je32_to_cpu(sm->offset),&pseudo_random);
> +
> +				if (err) {
> +					kfree(sm);
> +					return err;
> +				}
> +			}
> +			printk(KERN_WARNING "FS erase_block_size != JFFS2 erase_block_size => skipping summary information\n");
> +		}
> +
> +		kfree(sm);
> +
> +		ofs = jeb->offset;
> +		prevofs = jeb->offset - 1;
> +	}
> +
>  	buf_ofs = jeb->offset;
>  
>  	if (!buf_size) {
>  		buf_len = c->sector_size;
> +
> +		if (jffs2_sum_active()) {
> +			/* must reread because of summary test */
> +			err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
> +			if (err)
> +				return err;
> +		}
> +
>  	} else {
>  		buf_len = EMPTY_SCAN_SIZE(c->sector_size);
>  		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
> @@ -367,6 +412,8 @@ static int jffs2_scan_eraseblock (struct
>  
>  	noise = 10;
>  
> +	D1(printk(KERN_DEBUG "JFFS2: no summary found in jeb 0x%08x. Apply original scan.\n",jeb->offset));
> +
>  scan_more:	
>  	while(ofs < jeb->offset + c->sector_size) {
>  
> @@ -582,6 +629,8 @@ scan_more:	
>  			break;
>  
>  		case JFFS2_NODETYPE_PADDING:
> +			if (jffs2_sum_active())
> +				jffs2_sum_add_padding_mem(jeb,je32_to_cpu(node->totlen));
>  			DIRTY_SPACE(PAD(je32_to_cpu(node->totlen)));
>  			ofs += PAD(je32_to_cpu(node->totlen));
>  			break;
> @@ -616,6 +665,20 @@ scan_more:	
>  		}
>  	}
>  
> +	if (jffs2_sum_active()) {
> +		if (jeb->sum_collected) {
> +			if (PAD(jeb->sum_collected->sum_size + JFFS2_SUMMARY_FRAME_SIZE) > jeb->free_size) {
> +				D1(printk(KERN_WARNING "JFFS2 SUMMARY: There is not enough space for "
> +					"summary information, freeing up summary info!\n"));
> +				jffs2_sum_clean_collected(jeb);
> +				/* don't try to write out summary for this node */
> +				jeb->sum_collected->sum_size = JFFS2_SUMMARY_NOSUM_SIZE;
> +			}
> +		}
> +		else {
> +			D1(printk(KERN_WARNING "JFFS2 SUMMARY: Empty summary info found\n"));
> +		}
> +	}
>  
>  	D1(printk(KERN_DEBUG "Block at 0x%08x: free 0x%08x, dirty 0x%08x, unchecked 0x%08x, used 0x%08x\n", jeb->offset, 
>  		  jeb->free_size, jeb->dirty_size, jeb->unchecked_size, jeb->used_size));
> @@ -628,24 +691,10 @@ scan_more:	
>  		jeb->wasted_size = 0;
>  	}
>  
> -	if ((jeb->used_size + jeb->unchecked_size) == PAD(c->cleanmarker_size) && !jeb->dirty_size 
> -		&& (!jeb->first_node || !jeb->first_node->next_phys) )
> -		return BLK_STATE_CLEANMARKER;
> -		
> -	/* move blocks with max 4 byte dirty space to cleanlist */	
> -	else if (!ISDIRTY(c->sector_size - (jeb->used_size + jeb->unchecked_size))) {
> -		c->dirty_size -= jeb->dirty_size;
> -		c->wasted_size += jeb->dirty_size; 
> -		jeb->wasted_size += jeb->dirty_size;
> -		jeb->dirty_size = 0;
> -		return BLK_STATE_CLEAN;
> -	} else if (jeb->used_size || jeb->unchecked_size)
> -		return BLK_STATE_PARTDIRTY;
> -	else
> -		return BLK_STATE_ALLDIRTY;
> +	return jffs2_scan_classify_jeb(c, jeb);
>  }
>  
> -static struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino)
> +struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino)
>  {
>  	struct jffs2_inode_cache *ic;
>  
> @@ -739,6 +788,10 @@ static int jffs2_scan_inode_node(struct 
>  	pseudo_random += je32_to_cpu(ri->version);
>  
>  	UNCHECKED_SPACE(PAD(je32_to_cpu(ri->totlen)));
> +
> +	if (jffs2_sum_active())
> +		jffs2_sum_add_inode_mem(jeb, ri, ofs);
> +
>  	return 0;
>  }
>  
> @@ -790,6 +843,7 @@ static int jffs2_scan_dirent_node(struct
>  		printk(KERN_NOTICE "jffs2_scan_dirent_node(): allocation of node reference failed\n");
>  		return -ENOMEM;
>  	}
> +
>  	ic = jffs2_scan_make_ino_cache(c, je32_to_cpu(rd->pino));
>  	if (!ic) {
>  		jffs2_free_full_dirent(fd);
> @@ -817,6 +871,9 @@ static int jffs2_scan_dirent_node(struct
>  	USED_SPACE(PAD(je32_to_cpu(rd->totlen)));
>  	jffs2_add_fd_to_list(c, fd, &ic->scan_dents);
>  
> +	if (jffs2_sum_active())
> +		jffs2_sum_add_dirent_mem(jeb,rd,ofs);
> +
>  	return 0;
>  }
>  
> diff -Narup Mtd-orig/fs/jffs2/summary.c mtd/fs/jffs2/summary.c
> --- Mtd-orig/fs/jffs2/summary.c	1970-01-01 01:00:00.000000000 +0100
> +++ mtd/fs/jffs2/summary.c	2005-08-11 16:13:06.000000000 +0200
> @@ -0,0 +1,732 @@
> +/*
> + * JFFS2 -- Journalling Flash File System, Version 2.
> + *
> + * Copyright (C) 2004  Ferenc Havasi <havasi@inf.u-szeged.hu>,
> + *                     Zoltan Sogor <weth@inf.u-szeged.hu>,
> + *                     Patrik Kluba <pajko@halom.u-szeged.hu>,
> + *                     University of Szeged, Hungary
> + *
> + * For licensing information, see the file 'LICENCE' in this directory.
> + *
> + * $Id$
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/pagemap.h>
> +#include <linux/crc32.h>
> +#include <linux/compiler.h>
> +#include <linux/vmalloc.h>
> +#include "nodelist.h"
> +
> +int jffs2_sum_init(struct jffs2_sb_info *c)
> +{
> +	c->summary_buf = (jint32_t *) vmalloc(c->sector_size);

Remove cast.

> +	if (!c->summary_buf) {
> +		printk(KERN_WARNING "JFFS2: can't allocate memory to dump summary information!\n");
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +void jffs2_sum_exit(struct jffs2_sb_info *c) 
> +{
> +	if (c->summary_buf) {
> +		vfree(c->summary_buf);
> +		c->summary_buf = NULL;
> +	}

Remove condition.  vfree() already checks for NULL pointers.

> +}
> +
> +int jffs2_sum_care_sum_collected(struct jffs2_eraseblock *jeb)
> +{
> +	if (!jeb->sum_collected) {
> +		jeb->sum_collected = (struct jffs2_sum_info *) kmalloc(sizeof(struct jffs2_sum_info), GFP_KERNEL);

Remove cast.

> +		if (!jeb->sum_collected)
> +			return -ENOMEM;
> +
> +		jeb->sum_collected->sum_list = NULL;
> +		jeb->sum_collected->sum_num = 0;
> +		jeb->sum_collected->sum_size = 0;
> +		jeb->sum_collected->sum_padded = 0;
> +	}
> +	return 0;
> +}
> +
> +static int jffs2_sum_add_mem(struct jffs2_eraseblock *jeb, union jffs2_sum_mem *item)
> +{
> +
> +	union jffs2_sum_mem *walk;
> +	int ret;
> +
> +	if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;

Condition and conditional code on the same line are only obfuscating
the code.  Unless you have to hide something, put them onto seperate
lines.

I personally also dislike having assignments inside the condition.
Gcc is right to warn about it, but the suggestion to use double
brackets doesn't help.

Ergo:

	ret = jffs2_sum_care_sum_collected(jeb);
	if (ret)
		return ret;

> +	if (!jeb->sum_collected->sum_list) {
> +		jeb->sum_collected->sum_list = (union jffs2_sum_mem *) item;
> +	}
> +	else {
> +		walk = jeb->sum_collected->sum_list;
> +
> +		while (walk->u.next) {
> +			walk = walk->u.next;
> +		}
> +		walk->u.next = (union jffs2_sum_mem *) item;
> +	}

Your hand-crafted list has runtime of O(n).  Why don't you just use
the stuff in <linux/list.h>, which is O(1)?

> +	switch (je16_to_cpu(item->u.nodetype)) {
> +		case JFFS2_NODETYPE_INODE:
> +			jeb->sum_collected->sum_size += JFFS2_SUMMARY_INODE_SIZE;
> +			jeb->sum_collected->sum_num++;
> +			break;
> +		case JFFS2_NODETYPE_DIRENT:
> +			jeb->sum_collected->sum_size += JFFS2_SUMMARY_DIRENT_SIZE(item->d.nsize);
> +			jeb->sum_collected->sum_num++;
> +			break;
> +		default:
> +			printk(KERN_WARNING "__jffs2_add_sum_mem(): UNKNOWN node type %d\n", je16_to_cpu(item->u.nodetype));
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +void jffs2_sum_clean_all_info(struct jffs2_sb_info *c)
> +{
> +	int i;
> +
> +	for (i=0; i<c->nr_blocks; i++) {
> +		struct jffs2_eraseblock *jeb = &c->blocks[i];
> +
> +		jffs2_sum_clean_collected(jeb);
> +		kfree(jeb->sum_collected);
> +		jeb->sum_collected = NULL;
> +	}
> +}
> +
> +/* These 3 functions are called from scan.c to collect summary info for not closed jeb */
> +
> +int jffs2_sum_add_padding_mem(struct jffs2_eraseblock *jeb, uint32_t size)
> +{
> +	int ret;
> +
> +	if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;
> +	jeb->sum_collected->sum_padded += size;
> +	return 0;
> +}
> +
> +int jffs2_sum_add_inode_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_inode *ri, uint32_t ofs)
> +{
> +
> +	struct jffs2_sum_inode_mem *temp = (struct jffs2_sum_inode_mem *) kmalloc(sizeof(struct jffs2_sum_inode_mem), GFP_KERNEL);

Remove cast.

> +	if (!temp)
> +		return -ENOMEM;
> +
> +	ofs -= jeb->offset;
> +
> +	temp->nodetype = ri->nodetype;
> +	temp->inode = ri->ino;
> +	temp->version = ri->version;
> +	temp->offset = cpu_to_je32(ofs); 
> +	temp->totlen = ri->totlen;
> +	temp->next = NULL;
> +
> +	return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
> +}
> +
> +int jffs2_sum_add_dirent_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_dirent *rd, uint32_t ofs)
> +{
> +
> +	struct jffs2_sum_dirent_mem *temp = (struct jffs2_sum_dirent_mem *)

Remove cast.

> +
> +	if (!temp)
> +		return -ENOMEM;
> +
> +	ofs -= jeb->offset;
> +
> +	temp->nodetype = rd->nodetype;
> +	temp->totlen = rd->totlen;
> +	temp->offset = cpu_to_je32(ofs);
> +	temp->pino = rd->pino;
> +	temp->version = rd->version;
> +	temp->ino = rd->ino;
> +	temp->nsize = rd->nsize;
> +	temp->type = rd->type;
> +	temp->next = NULL;
> +
> +	memcpy(temp->name, rd->name, rd->nsize);
> +
> +	return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
> +}
> +
> +/* Cleanup every collected summary information */
> +
> +void jffs2_sum_clean_collected(struct jffs2_eraseblock *jeb)
> +{
> +
> +	union jffs2_sum_mem *temp;
> +
> +	if (jeb && jeb->sum_collected) {
> +
> +		while (jeb->sum_collected->sum_list) {
> +			temp = jeb->sum_collected->sum_list;
> +			jeb->sum_collected->sum_list = jeb->sum_collected->sum_list->u.next;
> +			kfree(temp);
> +			jeb->sum_collected->sum_num--;
> +		}
> +
> +		if (jeb->sum_collected->sum_num != 0) {
> +			printk(KERN_WARNING "Ooops, something wrong happened! sum_num != 0, but sum_list = null ???");
> +			jeb->sum_collected->sum_num = 0;
> +		}
> +	}
> +}
> +
> +void jffs2_sum_reset_collected(struct jffs2_eraseblock *jeb)
> +{
> +	if (jeb->sum_collected) {
> +		jffs2_sum_clean_collected(jeb);
> +		jeb->sum_collected->sum_size = 0;
> +		jeb->sum_collected->sum_padded = 0;
> +	}
> +}
> +
> +/* Called from wbuf.c to collect writed node info */
> +
> +int jffs2_sum_add_kvec(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count, uint32_t ofs)
> +{
> +	union jffs2_node_union *node;
> +	struct jffs2_eraseblock *jeb;
> +	int ret;
> +
> +	node = (union jffs2_node_union *) invecs[0].iov_base;

Remove cast.

> +	jeb = &c->blocks[ofs / c->sector_size];
> +	ofs -= jeb->offset;
> +
> +	if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;

You really don't want people to understand this line quickly, do you?
;)

> +	switch (je16_to_cpu(node->u.nodetype)) {
> +		case JFFS2_NODETYPE_INODE : {
> +			struct jffs2_sum_inode_mem *temp = (struct jffs2_sum_inode_mem *)
> +				kmalloc(sizeof(struct jffs2_sum_inode_mem), GFP_KERNEL);

Remove cast.

> +
> +			if (!temp)
> +				return -ENOMEM;
> +
> +			temp->nodetype = node->i.nodetype;
> +			temp->inode = node->i.ino;
> +			temp->version = node->i.version;
> +			temp->offset = cpu_to_je32(ofs);
> +			temp->totlen = node->i.totlen;
> +			temp->next = NULL;
> +
> +			return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
> +
> +			break;

Break after return has no effect.  Just remove it.

> +		}
> +
> +		case JFFS2_NODETYPE_DIRENT : {
> +			struct jffs2_sum_dirent_mem *temp = (struct jffs2_sum_dirent_mem *)
> +				kmalloc(sizeof(struct jffs2_sum_dirent_mem) + node->d.nsize, GFP_KERNEL);

Return value of kmalloc() is void* for a reason.  It implicitly gets
casted to any pointer type.  So just remove the superfluous explicit
one.

> +			if (!temp)
> +				return -ENOMEM;
> +
> +			temp->nodetype = node->d.nodetype;
> +			temp->totlen = node->d.totlen;
> +			temp->offset = cpu_to_je32(ofs);
> +			temp->pino = node->d.pino;
> +			temp->version = node->d.version;
> +			temp->ino = node->d.ino;
> +			temp->nsize = node->d.nsize;
> +			temp->type = node->d.type;
> +			temp->next = NULL;
> +
> +			switch (count) {
> +
> +				case 1 :
> +					memcpy(temp->name,node->d.name,node->d.nsize);
> +					break;
> +
> +				case 2 :
> +					memcpy(temp->name,invecs[1].iov_base,node->d.nsize);
> +					break;
> +
> +				default :
> +					printk(KERN_WARNING "jffs2_sum_add_kvec(): bad count value \n");
> +					break;
> +			}
> +
> +			return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
> +			break;

Remove.

> +		}
> +
> +		case JFFS2_NODETYPE_PADDING : {
> +			D1(printk(KERN_DEBUG "jffs2_sum_add_kvec(): Node PADDING\n"));
> +			jeb->sum_collected->sum_padded += je32_to_cpu(node->u.totlen);
> +			break;
> +		}
> +
> +		case JFFS2_NODETYPE_CLEANMARKER : {
> +			D1(printk(KERN_DEBUG "jffs2_sum_add_kvec(): Node CLEANMARKER\n"));
> +			break;
> +		}
> +
> +		case JFFS2_NODETYPE_SUMMARY : {
> +			D1(printk(KERN_DEBUG "jffs2_sum_add_kvec(): Node SUMMARY\n"));
> +			break;
> +		}
> +
> +		default : {
> +			printk(KERN_WARNING "jffs2_sum_add_kvec(): Node not supported\n");
> +			BUG();

BUG() should already print out enough information to debug this.  Is
the extra printk() really useful?

> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* Process the summary information - called from jffs2_scan_eraseblock() */
> +
> +int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t ofs, uint32_t *pseudo_random)
> +{
> +
> +	struct jffs2_unknown_node crcnode;
> +	struct jffs2_raw_node_ref *raw;
> +	struct jffs2_raw_node_ref *cache_ref;
> +	struct jffs2_inode_cache *ic;
> +	struct jffs2_full_dirent *fd;
> +
> +	int i, err;
> +	int bad_sum = 0;
> +	int sumsize;
> +	uint32_t ino;
> +	uint32_t crc;
> +	struct jffs2_summary_node *summary;
> +
> +	sumsize = c->sector_size - ofs;
> +	ofs += jeb->offset;
> +
> +	D1(printk(KERN_DEBUG "JFFS2: summary found for 0x%08x at 0x%08x (0x%x bytes)\n", jeb->offset, ofs, sumsize));
> +
> +	summary = (struct jffs2_summary_node *) kmalloc(sumsize, GFP_KERNEL);

Remove cast.

> +	if (!summary) {
> +		return -ENOMEM;
> +	}
> +
> +	err = jffs2_fill_scan_buf(c, (unsigned char *)summary, ofs, sumsize);

jffs2_fill_scan_buf() should be changed to take a void* as buffer
argument.  That's the type of choice for "just a chunk of memory".
And it gets rid of the explicit cast as well.

> +	if (err) {
> +		kfree(summary);
> +		return err;
> +	}
> +
> +	/* OK, now check for node validity and CRC */
> +	crcnode.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
> +	crcnode.nodetype = cpu_to_je16(JFFS2_NODETYPE_SUMMARY);
> +	crcnode.totlen = summary->totlen;
> +	crc = crc32(0, &crcnode, sizeof(crcnode)-4);
> +
> +	if (je32_to_cpu(summary->hdr_crc) != crc) {
> +		D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node header is corrupt (bad CRC or no summary at all)\n"));
> +		bad_sum = 1;
> +	}
> +
> +	if ((!bad_sum) && (je32_to_cpu(summary->totlen) != sumsize)) {
> +		D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node is corrupt (wrong erasesize?)\n"));
> +		bad_sum = 1;
> +	}
> +
> +	crc = crc32(0, summary, sizeof(struct jffs2_summary_node)-8);
> +
> +	if ((!bad_sum) && (je32_to_cpu(summary->node_crc) != crc)) {
> +		D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node is corrupt (bad CRC)\n"));
> +		bad_sum = 1;
> +	}
> +
> +	crc = crc32(0, summary->sum, sumsize - sizeof(struct jffs2_summary_node));
> +
> +	if ((!bad_sum) && (je32_to_cpu(summary->sum_crc) != crc)) {
> +		D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node data is corrupt (bad CRC)\n"));
> +		bad_sum = 1;
> +	}
> +
> +	if (!bad_sum) {
> +
> +		struct jffs2_sum_unknown_flash *sp;
> +		sp = (struct jffs2_sum_unknown_flash *) summary->sum;
> +
> +		if ( je32_to_cpu(summary->cln_mkr) ) {
> +
> +			D1(printk(KERN_DEBUG "Summary : CLEANMARKER node \n"));
> +
> +			if (je32_to_cpu(summary->cln_mkr) != c->cleanmarker_size) {
> +				D1(printk(KERN_DEBUG "CLEANMARKER node has totlen 0x%x != normal 0x%x\n", 
> +					je32_to_cpu(summary->cln_mkr), c->cleanmarker_size));
> +				UNCHECKED_SPACE(PAD(je32_to_cpu(summary->cln_mkr)));
> +			} 
> +			else if (jeb->first_node) {
> +				D1(printk(KERN_DEBUG "CLEANMARKER node not first node in block (0x%08x)\n", jeb->offset));
> +				UNCHECKED_SPACE(PAD(je32_to_cpu(summary->cln_mkr)));
> +			}
> +			else {
> +				struct jffs2_raw_node_ref *marker_ref = jffs2_alloc_raw_node_ref();
> +
> +				if (!marker_ref) {
> +					D1(printk(KERN_NOTICE "Failed to allocate node ref for clean marker\n"));
> +					kfree(summary);
> +					return -ENOMEM;
> +				}
> +
> +				marker_ref->next_in_ino = NULL;
> +				marker_ref->next_phys = NULL;
> +				marker_ref->flash_offset = jeb->offset | REF_NORMAL;
> +				marker_ref->__totlen = je32_to_cpu(summary->cln_mkr);
> +				jeb->first_node = jeb->last_node = marker_ref;
> +
> +				USED_SPACE( PAD(je32_to_cpu(summary->cln_mkr)) );
> +			}
> +		}
> +
> +		if (je32_to_cpu(summary->padded)) {
> +			DIRTY_SPACE(je32_to_cpu(summary->padded));
> +		}
> +
> +		for(i=0; i<je16_to_cpu(summary->sum_num); i++) {
> +			uint8_t *temp8ptr = NULL;
> +			D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Processing summary information %d\n", i));
> +
> +			switch (je16_to_cpu(sp->nodetype)) {
> +				case JFFS2_NODETYPE_INODE : {
> +					struct jffs2_sum_inode_flash *spi;
> +					spi = (struct jffs2_sum_inode_flash *) sp;
> +
> +					ino = je32_to_cpu(spi->inode);
> +					D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Inode at 0x%08x\n", jeb->offset + je32_to_cpu(spi->offset)));
> +					raw = jffs2_alloc_raw_node_ref();
> +					if (!raw) {
> +						printk(KERN_NOTICE "jffs2_scan_eraseblock(): allocation of node reference failed\n");
> +						kfree(summary);
> +						return -ENOMEM;
> +					}
> +
> +					ic = jffs2_scan_make_ino_cache(c, ino);
> +					if (!ic) {
> +						printk(KERN_NOTICE "jffs2_scan_eraseblock(): scan_make_ino_cache failed\n");
> +						jffs2_free_raw_node_ref(raw);
> +						kfree(summary);
> +						return -ENOMEM;
> +					}
> +
> +					raw->flash_offset = (jeb->offset + je32_to_cpu(spi->offset)) | REF_UNCHECKED;
> +					raw->__totlen = PAD(je32_to_cpu(spi->totlen));
> +					raw->next_phys = NULL;
> +					raw->next_in_ino = ic->nodes;
> +
> +					ic->nodes = raw;
> +					if (!jeb->first_node)
> +						jeb->first_node = raw;
> +					if (jeb->last_node)
> +						jeb->last_node->next_phys = raw;
> +					jeb->last_node = raw;
> +					*pseudo_random += je32_to_cpu(spi->version);
> +
> +					UNCHECKED_SPACE(PAD(je32_to_cpu(spi->totlen)));
> +
> +					temp8ptr = (uint8_t *) sp;
> +					temp8ptr += JFFS2_SUMMARY_INODE_SIZE;
> +					sp = (struct jffs2_sum_unknown_flash *) temp8ptr;

Gcc supports arithmetic on void*.  While sizeof(void*) is 0, adding
JFFS2_SUMMARY_INODE_SIZE to a void* has the same effect as adding it
to your temp8ptr.  But it has the big advantage of not requiring any
casts, which only distract readers from the intent.

> +
> +					break;
> +				}
> +
> +				case JFFS2_NODETYPE_DIRENT : {
> +					struct jffs2_sum_dirent_flash *spd;
> +					spd = (struct jffs2_sum_dirent_flash *) sp;
> +
> +					fd = jffs2_alloc_full_dirent(spd->nsize+1);
> +					if (!fd) {
> +						kfree(summary);
> +						return -ENOMEM;
> +					}
> +
> +					memcpy(&fd->name, spd->name, spd->nsize);
> +					fd->name[spd->nsize] = 0;
> +
> +					raw = jffs2_alloc_raw_node_ref();
> +					if (!raw) {
> +						jffs2_free_full_dirent(fd);
> +						printk(KERN_NOTICE "jffs2_scan_dirent_node(): allocation of node reference failed\n");
> +						kfree(summary);
> +						return -ENOMEM;
> +					}
> +
> +					ic = jffs2_scan_make_ino_cache(c, je32_to_cpu(spd->pino));
> +					if (!ic) {
> +						jffs2_free_full_dirent(fd);
> +						jffs2_free_raw_node_ref(raw);
> +						kfree(summary);
> +						return -ENOMEM;
> +					}
> +
> +					raw->__totlen = PAD(je32_to_cpu(spd->totlen));
> +					raw->flash_offset = (jeb->offset + je32_to_cpu(spd->offset)) | REF_PRISTINE;
> +					raw->next_phys = NULL;
> +					raw->next_in_ino = ic->nodes;
> +					ic->nodes = raw;
> +					if (!jeb->first_node)
> +						jeb->first_node = raw;
> +					if (jeb->last_node)
> +						jeb->last_node->next_phys = raw;
> +					jeb->last_node = raw;
> +
> +					fd->raw = raw;
> +					fd->next = NULL;
> +					fd->version = je32_to_cpu(spd->version);
> +					fd->ino = je32_to_cpu(spd->ino);
> +					fd->nhash = full_name_hash(fd->name, spd->nsize);
> +					fd->type = spd->type;
> +					USED_SPACE(PAD(je32_to_cpu(spd->totlen)));
> +					jffs2_add_fd_to_list(c, fd, &ic->scan_dents);
> +
> +					*pseudo_random += je32_to_cpu(spd->version);
> +
> +					temp8ptr = (uint8_t *) sp;
> +					temp8ptr += JFFS2_SUMMARY_DIRENT_SIZE(spd->nsize);
> +					sp = (struct jffs2_sum_unknown_flash *) temp8ptr;

void*

> +					break;
> +				}
> +
> +				default : {
> +					printk(KERN_WARNING "Kernel doesn't support this type of node !!! Exiting");
> +					return -EIO;
> +					break;
> +				}
> +			}
> +		}
> +
> +		kfree(summary);
> +
> +		/* for ACCT_PARANOIA_CHECK */
> +		cache_ref = jffs2_alloc_raw_node_ref();
> +
> +		if (!cache_ref) {
> +			printk(KERN_NOTICE "Failed to allocate node ref for cache\n");
> +			return -ENOMEM;
> +		}
> +
> +		cache_ref->next_in_ino = NULL;
> +		cache_ref->next_phys = NULL;
> +		cache_ref->flash_offset = ofs | REF_NORMAL;
> +		cache_ref->__totlen = sumsize;
> +
> +		if (!jeb->first_node)
> +			jeb->first_node = cache_ref;
> +		if (jeb->last_node)
> +			jeb->last_node->next_phys = cache_ref;
> +		jeb->last_node = cache_ref;
> +
> +		USED_SPACE(sumsize);
> +
> +		jeb->wasted_size += jeb->free_size;
> +		c->wasted_size += jeb->free_size;
> +		c->free_size -= jeb->free_size;
> +		jeb->free_size = 0;
> +		
> +		return jffs2_scan_classify_jeb(c, jeb);
> +	}
> +
> +	return 0;
> +}

Function has >200 lines.  Split it up.

> +/* Write out summary information - called from jffs2_do_reserve_space */
> +
> +int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
> +{
> +	struct jffs2_summary_node isum;
> +	struct jffs2_raw_node_ref *summary_ref;
> +	union jffs2_sum_mem *temp;
> +	jint32_t offset;
> +	jint32_t *wpage;
> +	uint8_t *tempptr;
> +	int datasize;
> +	int infosize;
> +	int padsize;
> +	size_t retlen;
> +	int ret;
> +	struct jffs2_eraseblock *jeb;
> +	struct kvec vecs[2];
> +	jint32_t magic = cpu_to_je32(JFFS2_SUM_MAGIC);

This one as well.  Just reading the variable definitions is scary
enough to keep me awake at night.  eek.

> +	D2(printk(KERN_DEBUG "jffs2_sum_write_sumnode()\n"));
> +
> +	jeb = c->nextblock;
> +
> +	if (!jeb->sum_collected->sum_num || !jeb->sum_collected->sum_list) {
> +		printk(KERN_WARNING "JFFS2: jffs2_sum_write_sumnode(): empty summary info!!!\n");
> +		BUG();
> +	}
> +
> +	datasize = jeb->sum_collected->sum_size + sizeof(struct jffs2_sum_marker);
> +	infosize = sizeof(struct jffs2_summary_node) + datasize;
> +	padsize = jeb->free_size - infosize;
> +	infosize += padsize; datasize += padsize;
> +	offset = cpu_to_je32(c->sector_size - jeb->free_size);
> +
> +	if (padsize < 0) { // if jeb hasn't got enought free space for summary
                                                      ^
Typo

> +
> +		union jffs2_sum_mem *temp;
> +
> +		while(jeb->sum_collected->sum_list){ //cleanup sum_list
> +			temp = jeb->sum_collected->sum_list;
> +			jeb->sum_collected->sum_list = jeb->sum_collected->sum_list->u.next;
> +			kfree(temp);
> +			jeb->sum_collected->sum_num--;
> +		}
> +
> +		jeb->sum_collected->sum_list = NULL;
> +		jeb->sum_collected->sum_num = 0;
> +		jeb->sum_collected->sum_size = JFFS2_SUMMARY_NOSUM_SIZE; // don't try to write out summary for this node
> +
> +		printk(KERN_WARNING "JFFS2: not enough space for summary, padsize = %d\n",padsize);
> +		return 0;
> +	}
> +
> +	memset(c->summary_buf, 0xff, datasize);
> +	memset(&isum, 0, sizeof(isum));
> +
> +	isum.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
> +	isum.nodetype = cpu_to_je16(JFFS2_NODETYPE_SUMMARY);
> +	isum.totlen = cpu_to_je32(infosize);
> +	isum.hdr_crc = cpu_to_je32(crc32(0, &isum, sizeof(struct jffs2_unknown_node) - 4));
> +	isum.padded = cpu_to_je32(jeb->sum_collected->sum_padded);
> +
> +	if (c->cleanmarker_size) {
> +		isum.cln_mkr = cpu_to_je32(c->cleanmarker_size);
> +	}
> +	else {
> +		isum.cln_mkr = cpu_to_je32(0);
> +	}

What is the difference between those two cases?

> +	isum.sum_num = cpu_to_je16(jeb->sum_collected->sum_num);
> +	wpage = c->summary_buf;
> +
> +	while (jeb->sum_collected->sum_num) { // write sum_data 
                                                 ^^^^^^^^^^^^^^
You could turn this comment into a function name and move all relevant
code into that function.

> +
> +		switch(je16_to_cpu(jeb->sum_collected->sum_list->u.nodetype)){
> +			case JFFS2_NODETYPE_INODE : {
> +				jint16_t *temp16ptr = (jint16_t *)wpage;
> +
> +				*(temp16ptr++) = jeb->sum_collected->sum_list->i.nodetype;
> +				wpage = (jint32_t *) temp16ptr;
> +
> +				*(wpage++) = jeb->sum_collected->sum_list->i.inode;
> +				*(wpage++) = jeb->sum_collected->sum_list->i.version;
> +				*(wpage++) = jeb->sum_collected->sum_list->i.offset;
> +				*(wpage++) = jeb->sum_collected->sum_list->i.totlen;
> +				break;
> +			}
> +
> +			case JFFS2_NODETYPE_DIRENT : {
> +				jint16_t *temp16ptr = (jint16_t *) wpage;
> +				uint8_t *temp8ptr = NULL;
> +
> +				*(temp16ptr++) = jeb->sum_collected->sum_list->d.nodetype;
> +				wpage = (jint32_t *) temp16ptr;
> +
> +				*(wpage++) = jeb->sum_collected->sum_list->d.totlen;
> +				*(wpage++) = jeb->sum_collected->sum_list->d.offset;
> +				*(wpage++) = jeb->sum_collected->sum_list->d.pino;
> +				*(wpage++) = jeb->sum_collected->sum_list->d.version;
> +				*(wpage++) = jeb->sum_collected->sum_list->d.ino;

I'm not sure about this pointer stuff.  It looks complicated and hence
easy to get wrong.  Something simpler would be nice.  But I don't have
a good idea right now.

> +				temp8ptr = (uint8_t *) wpage;
> +				*(temp8ptr++) = jeb->sum_collected->sum_list->d.nsize;
> +				*(temp8ptr++) = jeb->sum_collected->sum_list->d.type;
> +
> +				memcpy(temp8ptr,jeb->sum_collected->sum_list->d.name,jeb->sum_collected->sum_list->d.nsize);
> +				temp8ptr += jeb->sum_collected->sum_list->d.nsize;
> +				wpage = (jint32_t *) temp8ptr;
> +
> +				break;
> +			}
> +
> +			default : {
> +				printk(KERN_WARNING "Unknown node in summary information!!!\n");
> +				BUG();
> +			}
> +		}
> +
> +		temp = jeb->sum_collected->sum_list;
> +		jeb->sum_collected->sum_list = jeb->sum_collected->sum_list->u.next;
> +		kfree(temp);
> +
> +		jeb->sum_collected->sum_num--;
> +	}
> +
> +	jeb->sum_collected->sum_size = 0;
> +	jeb->sum_collected->sum_padded = 0;
> +
> +	tempptr = (uint8_t *) wpage;
> +	tempptr += padsize;
> +	wpage = (jint32_t *) tempptr;
> +
> +	*(wpage++) = offset;
> +	*(wpage++) = cpu_to_je32(c->sector_size);
> +	*(wpage++) = magic;
> +	isum.sum_crc = cpu_to_je32(crc32(0, c->summary_buf, datasize));
> +	isum.node_crc = cpu_to_je32(crc32(0, &isum, sizeof(isum) - 8));
> +
> +	vecs[0].iov_base = &isum;
> +	vecs[0].iov_len = sizeof(isum);
> +	vecs[1].iov_base = c->summary_buf;
> +	vecs[1].iov_len = datasize;
> +
> +	D1(printk(KERN_DEBUG "JFFS2: writing out data to flash to pos : 0x%08x\n",
> +			jeb->offset + c->sector_size - jeb->free_size));
> +
> +	spin_unlock(&c->erase_completion_lock);
> +	ret = jffs2_flash_writev(c, vecs, 2, jeb->offset + c->sector_size - jeb->free_size, &retlen, 0);
> +	spin_lock(&c->erase_completion_lock);
> +
> +
> +	if (ret || (retlen != infosize)) {
> +		printk(KERN_WARNING "JFFS2: write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n",
> +			infosize, jeb->offset + c->sector_size - jeb->free_size, ret, retlen);
> +
> +		jeb->sum_collected->sum_size = JFFS2_SUMMARY_NOSUM_SIZE;
> +		WASTED_SPACE(infosize);
> +
> +		return 0;
> +	}
> +
> +	/* for ACCT_PARANOIA_CHECK */
> +	spin_unlock(&c->erase_completion_lock);
> +	summary_ref = jffs2_alloc_raw_node_ref();
> +	spin_lock(&c->erase_completion_lock);
> +
> +	if (!summary_ref) {
> +		printk(KERN_NOTICE "Failed to allocate node ref for summary\n");
> +		return -ENOMEM;
> +	}
> +
> +	summary_ref->next_in_ino = NULL;
> +	summary_ref->next_phys = NULL;
> +	summary_ref->flash_offset = (jeb->offset + c->sector_size - jeb->free_size) | REF_NORMAL;
> +	summary_ref->__totlen = infosize;
> +
> +	if (!jeb->first_node)
> +		jeb->first_node = summary_ref;
> +	if (jeb->last_node)
> +		jeb->last_node->next_phys = summary_ref;
> +	jeb->last_node = summary_ref;
> +
> +	USED_SPACE(infosize);
> +
> +	return 0;
> +}
> diff -Narup Mtd-orig/fs/jffs2/summary.h mtd/fs/jffs2/summary.h
> --- Mtd-orig/fs/jffs2/summary.h	1970-01-01 01:00:00.000000000 +0100
> +++ mtd/fs/jffs2/summary.h	2005-08-11 16:21:04.000000000 +0200
> @@ -0,0 +1,172 @@
> +/*
> + * JFFS2 -- Journalling Flash File System, Version 2.
> + *
> + * Copyright (C) 2004  Ferenc Havasi <havasi@inf.u-szeged.hu>,
> + *                     Zoltan Sogor <weth@inf.u-szeged.hu>,
> + *                     Patrik Kluba <pajko@halom.u-szeged.hu>,
> + *                     University of Szeged, Hungary
> + *
> + * For licensing information, see the file 'LICENCE' in this directory.
> + *
> + * $Id$
> + *
> + */
> +
> +#ifndef JFFS2_SUMMARY_H
> +#define JFFS2_SUMMARY_H
> +
> +#include <linux/uio.h>
> +#include <linux/jffs2.h>
> +
> +#define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
> +		c->free_size -= _x; c->dirty_size += _x; \
> +		jeb->free_size -= _x ; jeb->dirty_size += _x; \
> +		}while(0)
> +#define USED_SPACE(x) do { typeof(x) _x = (x); \
> +		c->free_size -= _x; c->used_size += _x; \
> +		jeb->free_size -= _x ; jeb->used_size += _x; \
> +		}while(0)
> +#define WASTED_SPACE(x) do { typeof(x) _x = (x); \
> +		c->free_size -= _x; c->wasted_size += _x; \
> +		jeb->free_size -= _x ; jeb->wasted_size += _x; \
> +		}while(0)
> +#define UNCHECKED_SPACE(x) do { typeof(x) _x = (x); \
> +		c->free_size -= _x; c->unchecked_size += _x; \
> +		jeb->free_size -= _x ; jeb->unchecked_size += _x; \
> +		}while(0)
> +
> +#define BLK_STATE_ALLFF		0
> +#define BLK_STATE_CLEAN		1
> +#define BLK_STATE_PARTDIRTY	2
> +#define BLK_STATE_CLEANMARKER	3
> +#define BLK_STATE_ALLDIRTY	4
> +#define BLK_STATE_BADBLOCK	5
> +
> +#define JFFS2_SUMMARY_NOSUM_SIZE 0xffffffff
> +#define JFFS2_SUMMARY_INODE_SIZE (sizeof(struct jffs2_sum_inode_flash))
> +#define JFFS2_SUMMARY_DIRENT_SIZE(x) (sizeof(struct jffs2_sum_dirent_flash) + (x))
> +
> +struct jffs2_sum_unknown_flash
> +{
> +	jint16_t nodetype;	/* node type */
> +};
> +
> +struct jffs2_sum_inode_flash
> +{
> +	jint16_t nodetype;	/* node type */
> +	jint32_t inode;		/* inode number */
> +	jint32_t version;	/* inode version */
> +	jint32_t offset;	/* offset on jeb */
> +	jint32_t totlen; 	/* record length */
> +} __attribute__((packed));
> +
> +struct jffs2_sum_dirent_flash
> +{
> +	jint16_t nodetype;	/* == JFFS_NODETYPE_DIRENT */
> +	jint32_t totlen;	/* record length */
> +	jint32_t offset;	/* ofset on jeb */
> +	jint32_t pino;		/* parent inode */
> +	jint32_t version;	/* dirent version */
> +	jint32_t ino; 		/* == zero for unlink */
> +	uint8_t nsize;		/* dirent name size */
> +	uint8_t type;		/* dirent type */
> +	uint8_t name[0];	/* dirent name */
> +} __attribute__((packed));
> +
> +union jffs2_sum_flash
> +{
> +	struct jffs2_sum_unknown_flash u;
> +	struct jffs2_sum_inode_flash i;
> +	struct jffs2_sum_dirent_flash d;
> +};
> +
> +/* list version of jffs2_sum_*flash for kernel and sumtool */
> +struct jffs2_sum_unknown_mem
> +{
> +	union jffs2_sum_mem *next;
> +	jint16_t nodetype;	/* node type */
> +};
> +
> +struct jffs2_sum_inode_mem
> +{
> +	union jffs2_sum_mem *next;
> +	jint16_t nodetype;	/* node type */
> +	jint32_t inode;		/* inode number */
> +	jint32_t version;	/* inode version */
> +	jint32_t offset;	/* offset on jeb */
> +	jint32_t totlen; 	/* record length */
> +} __attribute__((packed));
> +
> +struct jffs2_sum_dirent_mem
> +{
> +	union jffs2_sum_mem *next;
> +	jint16_t nodetype;	/* == JFFS_NODETYPE_DIRENT */
> +	jint32_t totlen;	/* record length */
> +	jint32_t offset;	/* ofset on jeb */
> +	jint32_t pino;		/* parent inode */
> +	jint32_t version;	/* dirent version */
> +	jint32_t ino; 		/* == zero for unlink */
> +	uint8_t nsize;		/* dirent name size */
> +	uint8_t type;		/* dirent type */
> +	uint8_t name[0];	/* dirent name */
> +} __attribute__((packed));
> +
> +union jffs2_sum_mem
> +{
> +	struct jffs2_sum_unknown_mem u;
> +	struct jffs2_sum_inode_mem i;
> +	struct jffs2_sum_dirent_mem d;
> +};
> +
> +struct jffs2_sum_info
> +{
> +	uint32_t sum_size;
> +	uint32_t sum_num;
> +	uint32_t sum_padded;
> +	union jffs2_sum_mem *sum_list;
> +};
> +
> +struct jffs2_sum_marker
> +{
> +	jint32_t offset;
> +	jint32_t erase_size;
> +	jint32_t magic;
> +};
> +
> +#define JFFS2_SUMMARY_FRAME_SIZE (sizeof(struct jffs2_summary_node) + sizeof(struct jffs2_sum_marker))
> +
> +int jffs2_sum_init(struct jffs2_sb_info *c);
> +void jffs2_sum_exit(struct jffs2_sb_info *c);
> +void jffs2_sum_clean_all_info(struct jffs2_sb_info *c); /* clean up all summary information in all jeb (umount) */
> +
> +#ifdef CONFIG_JFFS2_SUMMARY		// SUMMARY SUPPORT ENABLED
> +#define jffs2_sum_active() (1)
> +void jffs2_sum_reset_collected(struct jffs2_eraseblock *jeb);
> +int jffs2_sum_add_kvec(struct jffs2_sb_info *c, const struct kvec *invecs,
> +			unsigned long count,  uint32_t to);
> +int jffs2_sum_care_sum_collected(struct jffs2_eraseblock *jeb);
> +void jffs2_sum_clean_collected(struct jffs2_eraseblock *jeb);
> +	
> +int jffs2_sum_write_sumnode(struct jffs2_sb_info *c);
> +int jffs2_sum_add_padding_mem(struct jffs2_eraseblock *jeb, uint32_t size);
> +int jffs2_sum_add_inode_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_inode *ri, uint32_t ofs);
> +int jffs2_sum_add_dirent_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_dirent *rd, uint32_t ofs);
> +
> +int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
> +			uint32_t ofs, uint32_t *pseudo_random);
> +
> +#else	// SUMMARY NOT ENABLED
> +#define jffs2_sum_active() (0)
> +#define jffs2_sum_reset_collected(a)
> +#define jffs2_sum_add_kvec(a,b,c,d) (0)
> +#define jffs2_sum_care_sum_collected(a) (0)
> +#define jffs2_sum_clean_collected(a)
> +#define jffs2_sum_write_sumnode(a) (0)
> +#define jffs2_sum_add_padding_mem(a,b)
> +#define jffs2_sum_add_inode_mem(a,b,c)
> +#define jffs2_sum_add_dirent_mem(a,b,c)
> +#define jffs2_sum_scan_sumnode(a,b,c,d) (0)
> +
> +#endif // CONFIG_JFFS2_SUMMARY
> +
> +#endif /* JFFS2_SUMMARY_H */
> diff -Narup Mtd-orig/fs/jffs2/super-v24.c mtd/fs/jffs2/super-v24.c
> --- Mtd-orig/fs/jffs2/super-v24.c	2005-07-20 16:21:40.000000000 +0200
> +++ mtd/fs/jffs2/super-v24.c	2005-08-11 15:17:41.000000000 +0200
> @@ -24,6 +24,7 @@
>  #include <linux/mtd/mtd.h>
>  #include "compr.h"
>  #include "nodelist.h"
> +#include "summary.h"
>  
>  #ifndef MTD_BLOCK_MAJOR
>  #define MTD_BLOCK_MAJOR 31
> @@ -82,6 +83,9 @@ static struct super_block *jffs2_read_su
>  		return NULL;
>  	}
>  
> +	if (jffs2_sum_active())
> +		jffs2_sum_init(c);
> +

Just jffs2_sum_init(c).  That function should contain something like
	if (!jffs2_sum_active)
		return;
before all other code.

>  	return sb;
>  }
>  
> @@ -97,6 +101,12 @@ static void jffs2_put_super (struct supe
>  	down(&c->alloc_sem);
>  	jffs2_flush_wbuf_pad(c);
>  	up(&c->alloc_sem);
> +
> +	if (jffs2_sum_active()) {
> +		jffs2_sum_clean_all_info(c);
> +		jffs2_sum_exit(c);
> +	}
> +

These two functions are never called alone.  Combine them somehow.
And while you're at it, move the jffs2_sum_active() check inside the
converged function as well.

>  	jffs2_free_ino_caches(c);
>  	jffs2_free_raw_node_refs(c);
>  	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
> @@ -122,6 +132,9 @@ static int __init init_jffs2_fs(void)
>  #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
>  	       " (NAND)"
>  #endif
> +#ifdef CONFIG_JFFS2_SUMMARY
> +	       " (SUMMARY)"
> +#endif
>  	       " (C) 2001-2003 Red Hat, Inc.\n");
>  
>  #ifdef JFFS2_OUT_OF_KERNEL
> diff -Narup Mtd-orig/fs/jffs2/super.c mtd/fs/jffs2/super.c
> --- Mtd-orig/fs/jffs2/super.c	2005-07-12 18:37:08.000000000 +0200
> +++ mtd/fs/jffs2/super.c	2005-08-11 15:17:41.000000000 +0200
> @@ -161,6 +161,9 @@ static struct super_block *jffs2_get_sb_
>  		return ERR_PTR(ret);
>  	}
>  
> +	if (jffs2_sum_active())
> +		jffs2_sum_init(c);
> +
>  	sb->s_flags |= MS_ACTIVE;
>  	return sb;
>  
> @@ -282,6 +285,12 @@ static void jffs2_put_super (struct supe
>  	down(&c->alloc_sem);
>  	jffs2_flush_wbuf_pad(c);
>  	up(&c->alloc_sem);
> +
> +	if (jffs2_sum_active()) {
> +		jffs2_sum_clean_all_info(c);
> +		jffs2_sum_exit(c);
> +	}
> +
>  	jffs2_free_ino_caches(c);
>  	jffs2_free_raw_node_refs(c);
>  	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
> @@ -321,6 +330,9 @@ static int __init init_jffs2_fs(void)
>  #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
>  	       " (NAND)"
>  #endif
> +#ifdef CONFIG_JFFS2_SUMMARY
> +	       " (SUMMARY) "
> +#endif
>  	       " (C) 2001-2003 Red Hat, Inc.\n");
>  
>  	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
> diff -Narup Mtd-orig/fs/jffs2/wbuf.c mtd/fs/jffs2/wbuf.c
> --- Mtd-orig/fs/jffs2/wbuf.c	2005-08-06 06:51:30.000000000 +0200
> +++ mtd/fs/jffs2/wbuf.c	2005-08-11 15:24:16.000000000 +0200
> @@ -263,7 +263,7 @@ static void jffs2_wbuf_recover(struct jf
>  
>  
>  	/* ... and get an allocation of space from a shiny new block instead */
> -	ret = jffs2_reserve_space_gc(c, end-start, &ofs, &len);
> +	ret = jffs2_reserve_space_gc(c, end-start, &ofs, &len, JFFS2_SUMMARY_NOSUM_SIZE);
>  	if (ret) {
>  		printk(KERN_WARNING "Failed to allocate space for wbuf recovery. Data loss ensues.\n");
>  		kfree(buf);
> @@ -834,6 +834,12 @@ int jffs2_flash_writev(struct jffs2_sb_i
>  alldone:
>  	*retlen = donelen;
>  
> +	if (jffs2_sum_active()) {
> +		if (jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to)) {
> +			printk("jffs2_sum_add_kvec(): MEMORY ALLOCATION ERROR!");
> +		}
> +	}
> +

Please fold all this into jffs2_sum_add_kvec().  You really only want
a single line plus error recovery in the calling code.  And printk()
is *not* error recovery.  "return -EIO" would be.

>  	if (c->wbuf_len && ino)
>  		jffs2_wbuf_dirties_inode(c, ino);
>  
> @@ -853,7 +859,7 @@ int jffs2_flash_write(struct jffs2_sb_in
>  	struct kvec vecs[1];
>  
>  	if (!jffs2_is_writebuffered(c))
> -		return c->mtd->write(c->mtd, ofs, len, retlen, buf);
> +		return jffs2_flash_direct_write(c, ofs, len, retlen, buf);
>  
>  	vecs[0].iov_base = (unsigned char *) buf;
>  	vecs[0].iov_len = len;
> diff -Narup Mtd-orig/fs/jffs2/write.c mtd/fs/jffs2/write.c
> --- Mtd-orig/fs/jffs2/write.c	2005-07-20 17:50:51.000000000 +0200
> +++ mtd/fs/jffs2/write.c	2005-08-11 15:17:41.000000000 +0200
> @@ -153,13 +153,15 @@ struct jffs2_full_dnode *jffs2_write_dno
>  			jffs2_dbg_acct_paranoia_check(c, jeb);
>  
>  			if (alloc_mode == ALLOC_GC) {
> -				ret = jffs2_reserve_space_gc(c, sizeof(*ri) + datalen, &flash_ofs, &dummy);
> +				ret = jffs2_reserve_space_gc(c, sizeof(*ri) + datalen, &flash_ofs,
> +							&dummy, JFFS2_SUMMARY_INODE_SIZE);
>  			} else {
>  				/* Locking pain */
>  				up(&f->sem);
>  				jffs2_complete_reservation(c);
>  			
> -				ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &flash_ofs, &dummy, alloc_mode);
> +				ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &flash_ofs,
> +							&dummy, alloc_mode, JFFS2_SUMMARY_INODE_SIZE);
>  				down(&f->sem);
>  			}
>  
> @@ -299,13 +301,15 @@ struct jffs2_full_dirent *jffs2_write_di
>  			jffs2_dbg_acct_paranoia_check(c, jeb);
>  
>  			if (alloc_mode == ALLOC_GC) {
> -				ret = jffs2_reserve_space_gc(c, sizeof(*rd) + namelen, &flash_ofs, &dummy);
> +				ret = jffs2_reserve_space_gc(c, sizeof(*rd) + namelen, &flash_ofs,
> +							&dummy, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  			} else {
>  				/* Locking pain */
>  				up(&f->sem);
>  				jffs2_complete_reservation(c);
>  			
> -				ret = jffs2_reserve_space(c, sizeof(*rd) + namelen, &flash_ofs, &dummy, alloc_mode);
> +				ret = jffs2_reserve_space(c, sizeof(*rd) + namelen, &flash_ofs,
> +							&dummy, alloc_mode, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  				down(&f->sem);
>  			}
>  
> @@ -362,7 +366,8 @@ int jffs2_write_inode_range(struct jffs2
>  	retry:
>  		D2(printk(KERN_DEBUG "jffs2_commit_write() loop: 0x%x to write to 0x%x\n", writelen, offset));
>  
> -		ret = jffs2_reserve_space(c, sizeof(*ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +		ret = jffs2_reserve_space(c, sizeof(*ri) + JFFS2_MIN_DATA_LEN, &phys_ofs,
> +					&alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  		if (ret) {
>  			D1(printk(KERN_DEBUG "jffs2_reserve_space returned %d\n", ret));
>  			break;
> @@ -449,7 +454,8 @@ int jffs2_do_create(struct jffs2_sb_info
>  	/* Try to reserve enough space for both node and dirent. 
>  	 * Just the node will do for now, though 
>  	 */
> -	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL,
> +				JFFS2_SUMMARY_INODE_SIZE);
>  	D1(printk(KERN_DEBUG "jffs2_do_create(): reserved 0x%x bytes\n", alloclen));
>  	if (ret) {
>  		up(&f->sem);
> @@ -478,7 +484,8 @@ int jffs2_do_create(struct jffs2_sb_info
>  
>  	up(&f->sem);
>  	jffs2_complete_reservation(c);
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  		
>  	if (ret) {
>  		/* Eep. */
> @@ -548,7 +555,8 @@ int jffs2_do_unlink(struct jffs2_sb_info
>  		if (!rd)
>  			return -ENOMEM;
>  
> -		ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_DELETION);
> +		ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
> +					ALLOC_DELETION, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  		if (ret) {
>  			jffs2_free_raw_dirent(rd);
>  			return ret;
> @@ -657,7 +665,8 @@ int jffs2_do_link (struct jffs2_sb_info 
>  	if (!rd)
>  		return -ENOMEM;
>  
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
> +				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  	if (ret) {
>  		jffs2_free_raw_dirent(rd);
>  		return ret;
> diff -Narup Mtd-orig/fs/jffs2/writev.c mtd/fs/jffs2/writev.c
> --- Mtd-orig/fs/jffs2/writev.c	2004-11-16 21:36:12.000000000 +0100
> +++ mtd/fs/jffs2/writev.c	2005-08-11 16:16:17.000000000 +0200
> @@ -44,7 +44,33 @@ int jffs2_flash_direct_writev(struct jff
>  {
>  	if (c->mtd->writev)
>  		return c->mtd->writev(c->mtd, vecs, count, to, retlen);
> -	else
> +	else {
> +		if (jffs2_sum_active()) {
> +			D1(printk("SUMMARY: jffs2_flash_direct_writev(): Without NAND support\n"));
> +			if (jffs2_sum_add_kvec(c, vecs, count, (uint32_t) to)) {
> +				printk("jffs2_sum_add_kvec(): MEMORY ALLOCATION ERROR!");
> +			}
> +		}

Fold into jffs2_sum_add_kvec().

>  		return mtd_fake_writev(c->mtd, vecs, count, to, retlen);
> +	}
>  }
>  
> +int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
> +			size_t *retlen, const u_char *buf)
> +{
> +	int ret;
> +	ret = c->mtd->write(c->mtd, ofs, len, retlen, buf);
> +
> +	if (jffs2_sum_active()) {
> +		struct kvec vecs[1];
> +
> +		vecs[0].iov_base = (unsigned char *) buf;
> +		vecs[0].iov_len = len;
> +
> +		if (jffs2_sum_add_kvec(c, vecs, 1, (uint32_t) ofs)) {
> +			printk("%s(): MEMORY ALLOCATION ERROR!",__FUNCTION__);
> +		}

Fold into jffs2_sum_add_kvec().

> +	}
> +	return ret;
> +}
> diff -Narup Mtd-orig/include/linux/jffs2.h mtd/include/linux/jffs2.h
> --- Mtd-orig/include/linux/jffs2.h	2005-07-26 15:19:36.000000000 +0200
> +++ mtd/include/linux/jffs2.h	2005-08-11 16:16:39.000000000 +0200
> @@ -28,6 +28,9 @@
>  #define JFFS2_EMPTY_BITMASK 0xffff
>  #define JFFS2_DIRTY_BITMASK 0x0000
>  
> +/* Summary node MAGIC marker */
> +#define JFFS2_SUM_MAGIC	0x02851885
> +
>  /* We only allow a single char for length, and 0xFF is empty flash so
>     we don't want it confused with a real length. Hence max 254.
>  */
> @@ -60,6 +63,8 @@
>  #define JFFS2_NODETYPE_CLEANMARKER (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
>  #define JFFS2_NODETYPE_PADDING (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 4)
>  
> +#define JFFS2_NODETYPE_SUMMARY (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 6)
> +
>  // Maybe later...
>  //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
>  //#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
> @@ -146,10 +151,24 @@ struct jffs2_raw_inode
>  	uint8_t data[0];
>  } __attribute__((packed));
>  
> +struct jffs2_summary_node{
> +	jint16_t magic;
> +	jint16_t nodetype; 	/* = JFFS2_NODETYPE_INODE_SUM */
> +	jint32_t totlen;
> +	jint32_t hdr_crc;
> +	jint16_t sum_num;	/* number of sum entries*/

This breaks natural alignment on some architectures.  Besides wasting
memory on them, it can also defeat the purpose of
__attribute__((packed)), creating an incompatibility between different
architectures.

You should rearrange the fields or add some padding.

> +	jint32_t cln_mkr;	/* clean marker size, 0 = no cleanmarker */
> +	jint32_t padded;	/* sum of the size of padding nodes */
> +	jint32_t sum_crc;	/* summary information crc */
> +	jint32_t node_crc; 	/* node crc */
> +	jint32_t sum[0]; 	/* inode summary info */
> +} __attribute__((packed));
> +
>  union jffs2_node_union {
>  	struct jffs2_raw_inode i;
>  	struct jffs2_raw_dirent d;
>  	struct jffs2_unknown_node u;
> +	struct jffs2_summary_node s;
>  };
>  
>  #endif /* __LINUX_JFFS2_H__ */
> diff -Narup Mtd-orig/include/linux/jffs2_fs_sb.h mtd/include/linux/jffs2_fs_sb.h
> --- Mtd-orig/include/linux/jffs2_fs_sb.h	2005-05-19 18:12:17.000000000 +0200
> +++ mtd/include/linux/jffs2_fs_sb.h	2005-08-11 15:17:41.000000000 +0200
> @@ -112,6 +112,8 @@ struct jffs2_sb_info {
>  	uint32_t fsdata_len;
>  #endif
>  
> +	jint32_t *summary_buf;		// buffer for Erase Block Summary
> +
>  	/* OS-private pointer for getting back to master superblock info */
>  	void *os_priv;
>  };
