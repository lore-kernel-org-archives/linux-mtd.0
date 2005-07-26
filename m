Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxMJf-0000mH-S0
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 11:06:08 +0100
Date: Tue, 26 Jul 2005 12:03:30 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050726100330.GF15903@wohnheim.fh-wedel.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
	<20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru> <42E5E816.5090500@inf.u-szeged.hu>
	<20050726074440.GB15903@wohnheim.fh-wedel.de>
	<42E5ECE5.4010901@inf.u-szeged.hu>
	<20050726093215.GD15903@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050726093215.GD15903@wohnheim.fh-wedel.de>
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

On Tue, 26 July 2005 11:32:15 +0200, Jörn Engel wrote:
> 
> I don't care about pretty web pages, sorry.  Can you send me the patch
> or a URL _directly_ to the patch?

Found it.  Still, for the future...

Review is focused on the simple stuff.  Most of the comments can be
repeated over and over, so just go through it yourself.  You should
focus on:
o Documentation/CodingStyle
o empty whitespace at the end of lines
o 80 columns (see CodingStyle)

When most of that stuff is done, resend the patch for the next round
of review.

PS: Sorry for being impolite.  This is one of those days...

> diff --unified --new-file --recursive Mtd-orig/fs/Kconfig mtd/fs/Kconfig
> --- Mtd-orig/fs/Kconfig	2005-05-09 10:16:08.000000000 +0200
> +++ mtd/fs/Kconfig	2005-07-18 15:42:05.000000000 +0200
> @@ -64,6 +64,19 @@
>  	    - NOR flash with transparent ECC
>  	    - DataFlash
>  
> +config JFFS2_SUMMARY
> +        bool "JFFS2 summary support (EXPERIMENTAL)" 
> +        depends on JFFS2_FS

Should depend on EXPERIMENTAL as well, judging by your own
description.

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
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/Makefile.common mtd/fs/jffs2/Makefile.common
> --- Mtd-orig/fs/jffs2/Makefile.common	2005-07-17 08:56:20.000000000 +0200
> +++ mtd/fs/jffs2/Makefile.common	2005-07-18 15:42:05.000000000 +0200
> @@ -15,3 +15,4 @@
>  jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
>  jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
>  jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
> +jffs2-$(CONFIG_JFFS2_SUMMARY)   += summary.o
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/build.c mtd/fs/jffs2/build.c

diff -Naurp is a bit nicer.  You can argue about -a, but -p definitely
helps when reading.

> --- Mtd-orig/fs/jffs2/build.c	2005-07-17 14:01:42.000000000 +0200
> +++ mtd/fs/jffs2/build.c	2005-07-18 15:42:05.000000000 +0200
> @@ -334,6 +334,10 @@
>  		c->blocks[i].first_node = NULL;
>  		c->blocks[i].last_node = NULL;
>  		c->blocks[i].bad_count = 0;
> + #ifdef CONFIG_JFFS2_SUMMARY	
> + 		c->blocks[i].sum_collected = NULL;
> + #endif
> +

Long-term the #ifdefs should go.

>  	}
>  
>  	INIT_LIST_HEAD(&c->clean_list);
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/dir.c mtd/fs/jffs2/dir.c
> --- Mtd-orig/fs/jffs2/dir.c	2005-07-17 13:13:46.000000000 +0200
> +++ mtd/fs/jffs2/dir.c	2005-07-18 15:42:05.000000000 +0200
> @@ -304,7 +304,7 @@
>  	 * Just the node will do for now, though 
>  	 */
>  	namelen = dentry->d_name.len;
> -	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);

JFFS2 generally suffers from this problem, but a line break after 80
columns (or less) would be nice.

>  
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
> @@ -364,7 +364,7 @@
>  	up(&f->sem);
>  
>  	jffs2_complete_reservation(c);
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  	if (ret) {
>  		/* Eep. */
>  		jffs2_clear_inode(inode);
> @@ -449,7 +449,7 @@
>  	 * Just the node will do for now, though 
>  	 */
>  	namelen = dentry->d_name.len;
> -	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
> @@ -492,7 +492,7 @@
>  	up(&f->sem);
>  
>  	jffs2_complete_reservation(c);
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  	if (ret) {
>  		/* Eep. */
>  		jffs2_clear_inode(inode);
> @@ -601,7 +601,7 @@
>  	 * Just the node will do for now, though 
>  	 */
>  	namelen = dentry->d_name.len;
> -	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
> @@ -646,7 +646,7 @@
>  	up(&f->sem);
>  
>  	jffs2_complete_reservation(c);
> -	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
>  	if (ret) {
>  		/* Eep. */
>  		jffs2_clear_inode(inode);
> @@ -800,4 +800,3 @@
>  
>  	return 0;
>  }
> -
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/erase.c mtd/fs/jffs2/erase.c
> --- Mtd-orig/fs/jffs2/erase.c	2005-07-17 08:56:20.000000000 +0200
> +++ mtd/fs/jffs2/erase.c	2005-07-18 15:42:05.000000000 +0200
> @@ -423,7 +423,17 @@
>  		jeb->dirty_size = 0;
>  		jeb->wasted_size = 0;
>  	}
> -
> +	

Whitespace pollution.

> +#ifdef CONFIG_JFFS2_SUMMARY
> +	
> +	if (jeb->sum_collected) {
> +	

Pointless empty line.

> +		jffs2_sum_clean_collected(jeb);
> +		jeb->sum_collected->sum_size = 0;
> +		jeb->sum_collected->sum_padded = 0;
> +	}
> +#endif
> +	
>  	spin_lock(&c->erase_completion_lock);
>  	c->erasing_size -= c->sector_size;
>  	c->free_size += jeb->free_size;
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/file.c mtd/fs/jffs2/file.c
> --- Mtd-orig/fs/jffs2/file.c	2005-07-06 14:13:09.000000000 +0200
> +++ mtd/fs/jffs2/file.c	2005-07-18 15:42:05.000000000 +0200
> @@ -21,6 +21,7 @@
>  #include <linux/jffs2.h>
>  #include "nodelist.h"
>  
> +
>  extern int generic_file_open(struct inode *, struct file *) __attribute__((weak));
>  extern loff_t generic_file_llseek(struct file *file, loff_t offset, int origin) __attribute__((weak));
>  

Remove the newline.  If you believe the extra newline makes sense,
create a seperate cleanup patch for it.

> @@ -137,7 +138,7 @@
>  		D1(printk(KERN_DEBUG "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
>  			  (unsigned int)inode->i_size, pageofs));
>  
> -		ret = jffs2_reserve_space(c, sizeof(ri), &phys_ofs, &alloc_len, ALLOC_NORMAL);
> +		ret = jffs2_reserve_space(c, sizeof(ri), &phys_ofs, &alloc_len, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  		if (ret)
>  			return ret;
>  
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/fs.c mtd/fs/jffs2/fs.c
> --- Mtd-orig/fs/jffs2/fs.c	2005-07-17 14:01:42.000000000 +0200
> +++ mtd/fs/jffs2/fs.c	2005-07-18 15:42:05.000000000 +0200
> @@ -74,7 +74,7 @@
>  		return -ENOMEM;
>  	}
>  		
> -	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen, ALLOC_NORMAL);
> +	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>  	if (ret) {
>  		jffs2_free_raw_inode(ri);
>  		if (S_ISLNK(inode->i_mode & S_IFMT))
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/gc.c mtd/fs/jffs2/gc.c
> --- Mtd-orig/fs/jffs2/gc.c	2005-07-17 14:01:43.000000000 +0200
> +++ mtd/fs/jffs2/gc.c	2005-07-18 15:42:05.000000000 +0200
> @@ -505,7 +505,8 @@
>  	uint32_t phys_ofs, alloclen;
>  	uint32_t crc, rawlen;
>  	int retried = 0;
> -
> +	struct kvec vecs[1];
> +	

Whitespace pollution.

>  	D1(printk(KERN_DEBUG "Going to GC REF_PRISTINE node at 0x%08x\n", ref_offset(raw)));
>  
>  	rawlen = ref_totlen(c, c->gcblock, raw);
> @@ -514,7 +515,7 @@
>  	   don't want to force wastage of the end of a block if splitting would
>  	   work. */
>  	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN, 
> -					      rawlen), &phys_ofs, &alloclen);
> +					      rawlen), &phys_ofs, &alloclen, rawlen); /* this is not optimal yet */
>  	if (ret)
>  		return ret;
>  
> @@ -593,9 +594,12 @@
>  	nraw->flash_offset = phys_ofs;
>  	nraw->__totlen = rawlen;
>  	nraw->next_phys = NULL;
> +	

Whitespace pollution.

> +	vecs[0].iov_base = (unsigned char *) node;
> +	vecs[0].iov_len = rawlen;
>  
> -	ret = jffs2_flash_write(c, phys_ofs, rawlen, &retlen, (char *)node);
> -
> +	ret = jffs2_flash_writev(c, vecs, 1, phys_ofs, &retlen, 0);
> +	

Whitespace pollution.

>  	if (ret || (retlen != rawlen)) {
>  		printk(KERN_NOTICE "Write of %d bytes at 0x%08x failed. returned %d, retlen %zd\n",
>                         rawlen, phys_ofs, ret, retlen);
> @@ -622,7 +626,7 @@
>  			jffs2_dbg_acct_sanity_check(c,jeb);
>  			jffs2_dbg_acct_paranoia_check(c, jeb);
>  
> -			ret = jffs2_reserve_space_gc(c, rawlen, &phys_ofs, &dummy);
> +			ret = jffs2_reserve_space_gc(c, rawlen, &phys_ofs, &dummy, rawlen); /* this is not optimal yet */
>  
>  			if (!ret) {
>  				D1(printk(KERN_DEBUG "Allocated space at 0x%08x to retry failed write.\n", phys_ofs));
> @@ -701,7 +705,7 @@
>  
>  	}
>  	
> -	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &phys_ofs, &alloclen, JFFS2_SUMMARY_INODE_SIZE);
>  	if (ret) {
>  		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_metadata failed: %d\n",
>  		       sizeof(ri)+ mdatalen, ret);
> @@ -776,7 +780,7 @@
>  	rd.node_crc = cpu_to_je32(crc32(0, &rd, sizeof(rd)-8));
>  	rd.name_crc = cpu_to_je32(crc32(0, fd->name, rd.nsize));
>  	
> -	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &phys_ofs, &alloclen, JFFS2_SUMMARY_DIRENT_SIZE(rd.nsize));
>  	if (ret) {
>  		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_dirent failed: %d\n",
>  		       sizeof(rd)+rd.nsize, ret);
> @@ -986,7 +990,7 @@
>  	ri.data_crc = cpu_to_je32(0);
>  	ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
>  
> -	ret = jffs2_reserve_space_gc(c, sizeof(ri), &phys_ofs, &alloclen);
> +	ret = jffs2_reserve_space_gc(c, sizeof(ri), &phys_ofs, &alloclen, JFFS2_SUMMARY_INODE_SIZE);
>  	if (ret) {
>  		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_hole failed: %d\n",
>  		       sizeof(ri), ret);
> @@ -1211,7 +1215,7 @@
>  		uint32_t cdatalen;
>  		uint16_t comprtype = JFFS2_COMPR_NONE;
>  
> -		ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen);
> +		ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen, JFFS2_SUMMARY_INODE_SIZE);
>  
>  		if (ret) {
>  			printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_dnode failed: %d\n",
> @@ -1268,4 +1272,3 @@
>  	jffs2_gc_release_page(c, pg_ptr, &pg);
>  	return ret;
>  }
> -
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/nodelist.h mtd/fs/jffs2/nodelist.h
> --- Mtd-orig/fs/jffs2/nodelist.h	2005-07-17 08:56:21.000000000 +0200
> +++ mtd/fs/jffs2/nodelist.h	2005-07-18 15:42:05.000000000 +0200
> @@ -20,6 +20,7 @@
>  #include <linux/jffs2.h>
>  #include <linux/jffs2_fs_sb.h>
>  #include <linux/jffs2_fs_i.h>
> +#include "summary.h"
>  
>  #ifdef __ECOS
>  #include "os-ecos.h"
> @@ -179,6 +180,10 @@
>  	int bad_count;
>  	uint32_t offset;		/* of this block in the MTD */
>  
> +#ifdef CONFIG_JFFS2_SUMMARY	
> +	struct jffs2_sum_info *sum_collected;
> +#endif
> +	
>  	uint32_t unchecked_size;
>  	uint32_t used_size;
>  	uint32_t dirty_size;
> @@ -316,8 +321,8 @@
>  
>  /* nodemgmt.c */
>  int jffs2_thread_should_wake(struct jffs2_sb_info *c);
> -int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio);
> -int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len);
> +int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio, uint32_t sumsize);
> +int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize);
>  int jffs2_add_physical_node_ref(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *new);
>  void jffs2_complete_reservation(struct jffs2_sb_info *c);
>  void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *raw);
> @@ -378,6 +383,10 @@
>  /* scan.c */
>  int jffs2_scan_medium(struct jffs2_sb_info *c);
>  void jffs2_rotate_lists(struct jffs2_sb_info *c);
> +int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
> +				uint32_t ofs, uint32_t len);
> +struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino);
> +
>  
>  /* build.c */
>  int jffs2_do_mount_fs(struct jffs2_sb_info *c);
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/nodemgmt.c mtd/fs/jffs2/nodemgmt.c
> --- Mtd-orig/fs/jffs2/nodemgmt.c	2005-07-17 08:56:21.000000000 +0200
> +++ mtd/fs/jffs2/nodemgmt.c	2005-07-18 15:42:05.000000000 +0200
> @@ -38,9 +38,9 @@
>   *	for the requested allocation.
>   */
>  
> -static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len);
> +static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize);
>  
> -int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio)
> +int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio, uint32_t sumsize)
>  {
>  	int ret = -EAGAIN;
>  	int blocksneeded = c->resv_blocks_write;
> @@ -129,7 +129,7 @@
>  			spin_lock(&c->erase_completion_lock);
>  		}
>  
> -		ret = jffs2_do_reserve_space(c, minsize, ofs, len);
> +		ret = jffs2_do_reserve_space(c, minsize, ofs, len, sumsize);
>  		if (ret) {
>  			D1(printk(KERN_DEBUG "jffs2_reserve_space: ret is %d\n", ret));
>  		}
> @@ -140,7 +140,7 @@
>  	return ret;
>  }
>  
> -int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len)
> +int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
>  {
>  	int ret = -EAGAIN;
>  	minsize = PAD(minsize);
> @@ -149,7 +149,7 @@
>  
>  	spin_lock(&c->erase_completion_lock);
>  	while(ret == -EAGAIN) {
> -		ret = jffs2_do_reserve_space(c, minsize, ofs, len);
> +		ret = jffs2_do_reserve_space(c, minsize, ofs, len, sumsize);
>  		if (ret) {
>  		        D1(printk(KERN_DEBUG "jffs2_reserve_space_gc: looping, ret is %d\n", ret));
>  		}
> @@ -159,50 +159,112 @@
>  }
>  
>  /* Called with alloc sem _and_ erase_completion_lock */
> -static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len)
> +static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
>  {
>  	struct jffs2_eraseblock *jeb = c->nextblock;
> +	uint32_t nofree_size;
>  	
>   restart:
> -	if (jeb && minsize > jeb->free_size) {
> -		/* Skip the end of this block and file it as having some dirty space */
> -		/* If there's a pending write to it, flush now */
> -		if (jffs2_wbuf_dirty(c)) {
> -			spin_unlock(&c->erase_completion_lock);
> -			D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));			    
> -			jffs2_flush_wbuf_pad(c);
> -			spin_lock(&c->erase_completion_lock);
> -			jeb = c->nextblock;
> -			goto restart;
> -		}
> -		c->wasted_size += jeb->free_size;
> -		c->free_size -= jeb->free_size;
> -		jeb->wasted_size += jeb->free_size;
> -		jeb->free_size = 0;
> +	nofree_size = 0;
> +	
> +#ifdef CONFIG_JFFS2_SUMMARY
> +
> +	if (sumsize != JFFS2_SUMMARY_NOSUM_SIZE) {
> +		int ret;
> +                if (jeb) {
> +                        if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;
> +                        nofree_size = PAD(sumsize + jeb->sum_collected->sum_size + JFFS2_SUMMARY_FRAME_SIZE);
> +                }
>  		
> -		/* Check, if we have a dirty block now, or if it was dirty already */
> -		if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
> -			c->dirty_size += jeb->wasted_size;
> -			c->wasted_size -= jeb->wasted_size;
> -			jeb->dirty_size += jeb->wasted_size;
> -			jeb->wasted_size = 0;
> -			if (VERYDIRTY(c, jeb->dirty_size)) {
> -				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +		D1(if (jeb) printk(KERN_DEBUG "JFFS2: minsize %d , jeb->free(%d) , sum_collected->size(%d) , sumsize(%d)\n",minsize,jeb->free_size,jeb->sum_collected->sum_size,sumsize));

This wraps even on my 169 column xterm.  Can you line-wrap at 80
columns before I have to buy a new monitor?

> +		
> +		if (jeb && (PAD(minsize) + PAD(jeb->sum_collected->sum_size + sumsize + JFFS2_SUMMARY_FRAME_SIZE) > jeb->free_size)) {
> +			D1(printk(KERN_DEBUG "JFFS2: generating summary for 0x%08x.\n", jeb->offset));
> +			if (jeb->sum_collected->sum_size == JFFS2_SUMMARY_NOSUM_SIZE) {
> +				sumsize = JFFS2_SUMMARY_NOSUM_SIZE;
> +				jffs2_sum_clean_collected(jeb);
> +				goto restart;
> +			}
> +			
> +			ret = jffs2_sum_write_sumnode(c);
> +			
> +			if (ret)
> +				return ret;
> +			
> +			if (jeb->sum_collected->sum_size == JFFS2_SUMMARY_NOSUM_SIZE) { //jffs2_write_sumnode can't write out the summary information
> +				sumsize = JFFS2_SUMMARY_NOSUM_SIZE;
> +				jffs2_sum_clean_collected(jeb);
> +				goto restart;
> +			}
> +			
> +			/* Check, if we have a dirty block now, or if it was dirty already */
> +			if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
> +				c->dirty_size += jeb->wasted_size;
> +				c->wasted_size -= jeb->wasted_size;
> +				jeb->dirty_size += jeb->wasted_size;
> +				jeb->wasted_size = 0;
> +				if (VERYDIRTY(c, jeb->dirty_size)) {
> +					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> +					list_add_tail(&jeb->list, &c->very_dirty_list);

Five levels of indentation are generally a sign that you should
rethink your code.

> +				} else {
> +					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> +					list_add_tail(&jeb->list, &c->dirty_list);
> +				}
> +			} else { 
> +				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
>  				  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> -				list_add_tail(&jeb->list, &c->very_dirty_list);
> -			} else {
> -				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +				list_add_tail(&jeb->list, &c->clean_list);
> +			}
> +			c->nextblock = jeb = NULL;
> +		}
> +	}
> +	else {	

Keep the above two on the same line and remove extra whitespace at the
end of the line.

> +#endif			
> +		if (jeb && minsize > jeb->free_size) {
> +			/* Skip the end of this block and file it as having some dirty space */
> +			/* If there's a pending write to it, flush now */
> +			
> +			if (jffs2_wbuf_dirty(c)) {
> +				spin_unlock(&c->erase_completion_lock);
> +				D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));			    
> +				jffs2_flush_wbuf_pad(c);
> +				spin_lock(&c->erase_completion_lock);
> +				jeb = c->nextblock;
> +				goto restart;
> +			}
> +			
> +			c->wasted_size += jeb->free_size;
> +			c->free_size -= jeb->free_size;
> +			jeb->wasted_size += jeb->free_size;
> +			jeb->free_size = 0;
> +			
> +			/* Check, if we have a dirty block now, or if it was dirty already */
> +			if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
> +				c->dirty_size += jeb->wasted_size;
> +				c->wasted_size -= jeb->wasted_size;
> +				jeb->dirty_size += jeb->wasted_size;
> +				jeb->wasted_size = 0;
> +				if (VERYDIRTY(c, jeb->dirty_size)) {
> +					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> +					list_add_tail(&jeb->list, &c->very_dirty_list);
> +				} else {
> +					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> +					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> +					list_add_tail(&jeb->list, &c->dirty_list);
> +				}
> +			} else { 
> +				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
>  				  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> -				list_add_tail(&jeb->list, &c->dirty_list);
> +				list_add_tail(&jeb->list, &c->clean_list);
>  			}
> -		} else { 
> -			D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
> -			  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
> -			list_add_tail(&jeb->list, &c->clean_list);
> +			c->nextblock = jeb = NULL;
>  		}
> -		c->nextblock = jeb = NULL;
> +#ifdef CONFIG_JFFS2_SUMMARY
>  	}
> -	
> +#endif	
>  	if (!jeb) {
>  		struct list_head *next;
>  		/* Take the next block off the 'free' list */
> @@ -266,7 +328,7 @@
>  	/* OK, jeb (==c->nextblock) is now pointing at a block which definitely has
>  	   enough space */
>  	*ofs = jeb->offset + (c->sector_size - jeb->free_size);
> -	*len = jeb->free_size;
> +	*len = jeb->free_size - nofree_size;
>  
>  	if (c->cleanmarker_size && jeb->used_size == c->cleanmarker_size &&
>  	    !jeb->first_node->next_in_ino) {
> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/os-linux.h mtd/fs/jffs2/os-linux.h
> --- Mtd-orig/fs/jffs2/os-linux.h	2005-07-17 13:13:46.000000000 +0200
> +++ mtd/fs/jffs2/os-linux.h	2005-07-18 15:42:05.000000000 +0200
> @@ -67,7 +67,13 @@
>  
>  #ifndef CONFIG_JFFS2_FS_WRITEBUFFER
>  #define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
> +
> +#ifndef CONFIG_JFFS2_SUMMARY

This bit confused me, until I noticed the "n" in ifndef.  But since
the whole conditional compilation stuff should go later on, don't
worry about it.

>  #define jffs2_can_mark_obsolete(c) (1)
> +#else
> +#define jffs2_can_mark_obsolete(c) (0)
> +#endif
> +
>  #define jffs2_is_writebuffered(c) (0)
>  #define jffs2_cleanmarker_oob(c) (0)
>  #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
> @@ -94,7 +100,12 @@
>  
>  #define jffs2_is_writebuffered(c) (c->wbuf != NULL)
>  #define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )
> +#ifndef CONFIG_JFFS2_SUMMARY
>  #define jffs2_can_mark_obsolete(c) ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & MTD_ECC)) || c->mtd->type == MTD_RAM)
> +#else
> +#define jffs2_can_mark_obsolete(c) (0)
> +#endif
> +	

Whitespace pollution.

>  #define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
>  
>  #define jffs2_flash_write_oob(c, ofs, len, retlen, buf) ((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
> @@ -186,5 +197,3 @@
>  
>  
>  #endif /* __JFFS2_OS_LINUX_H__ */
> -
> -

Cleanup patch (or just remove).

> diff --unified --new-file --recursive Mtd-orig/fs/jffs2/scan.c mtd/fs/jffs2/scan.c
> --- Mtd-orig/fs/jffs2/scan.c	2005-07-17 08:56:21.000000000 +0200
> +++ mtd/fs/jffs2/scan.c	2005-07-18 15:42:05.000000000 +0200
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
> @@ -58,13 +46,6 @@
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
> @@ -265,7 +246,7 @@
>  	return ret;
>  }
>  
> -static int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
> +int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
>  				uint32_t ofs, uint32_t len)
>  {
>  	int ret;
> @@ -294,6 +275,11 @@
>  	uint32_t hdr_crc, buf_ofs, buf_len;
>  	int err;
>  	int noise = 0;
> +
> +#ifdef CONFIG_JFFS2_SUMMARY
> +	struct jffs2_sum_marker *sm;
> +#endif	
> +
>  #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
>  	int cleanmarkerfound = 0;
>  #endif
> @@ -319,10 +305,54 @@
>  		}
>  	}
>  #endif
> +	
> +#ifdef CONFIG_JFFS2_SUMMARY	
> +	sm = (struct jffs2_sum_marker *)kmalloc(sizeof(struct jffs2_sum_marker), GFP_KERNEL);
> +	if (!sm) {
> +	    return -ENOMEM;
> +	}

Kernel coding style is 1 tab for indentation and no extra braces
unless required.

> +	
> +	err = jffs2_fill_scan_buf(c, (unsigned char *) sm, jeb->offset + c->sector_size - sizeof(struct jffs2_sum_marker), sizeof(struct jffs2_sum_marker));
> +	
> +	if (err) {
> +		kfree(sm);
> +	        return err;
> +	}
> +	

Whitespace pollution.

> +	if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC ) {
> +
> +		if(je32_to_cpu(sm->erase_size) == c->sector_size) {
> +			int ret = jffs2_sum_scan_sumnode(c,jeb,je32_to_cpu(sm->offset),&pseudo_random);

Why introduce a new variable?  Can't err and ret be merged into one?

> +			
> +			if (ret) {
> +				kfree(sm);
> +				return ret;
> +			}
> +		}
> +		
> +		printk(KERN_WARNING "FS erase_block_size != JFFS2 erase_block_size => skipping summary information\n");
> +		
> +	}
> +	
> +	kfree(sm);
> +	
> +	ofs = jeb->offset;
> +	prevofs = jeb->offset - 1;
> +	

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
