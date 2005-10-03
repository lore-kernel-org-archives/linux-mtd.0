Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMOPQ-0004Yx-Mq
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 07:23:26 -0400
Date: Mon, 3 Oct 2005 13:23:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20051003112304.GD4639@wohnheim.fh-wedel.de>
References: <BAY17-F344C9EEA6AC6CEF83CBE2E88D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F344C9EEA6AC6CEF83CBE2E88D0@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 September 2005 15:33:46 +0800, zhao forrest wrote:
> 
> This is the forth version. Compared with version 3, the
> main changes are:
> 1 move "priv->jeb->has_ebh = 1;" from jffs2_erase_callback()
> to jffs2_erase_succeeded() to prevent eCos from being broken.
> 2 define ebh at the top of erase.c and this ebh is shared
> by jffs2_write_nand_ebh() in wbuf.c
> 3 remove unnecessary PAD() stuff
> 4 change has_ebh from uint32_t to one bit of flags
> 5 remove unnecessary dsize field from struct jffs2_raw_ebh{}
> 6 use ref_totlen() instead of directly getting __totlen.


> diff -auNrp mtd_9_28/fs/jffs2/erase.c mtd_9_28_EBH/fs/jffs2/erase.c
> --- mtd_9_28/fs/jffs2/erase.c	2005-09-28 10:51:57.000000000 +0800
> +++ mtd_9_28_EBH/fs/jffs2/erase.c	2005-09-28 14:38:00.000000000 +0800
> @@ -24,7 +24,18 @@ struct erase_priv_struct {
>  	struct jffs2_eraseblock *jeb;
>  	struct jffs2_sb_info *c;
>  };
> -      
> +
> +struct jffs2_raw_ebh ebh = {
> +	.magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
> +	.nodetype =     cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
> +	.totlen =       cpu_to_je32(sizeof(struct jffs2_raw_ebh)),
> +	.reserved =     0,
> +	.compat_fset =  JFFS2_EBH_COMPAT_FSET,
> +	.incompat_fset = JFFS2_EBH_INCOMPAT_FSET,
> +	.rocompat_fset = JFFS2_EBH_ROCOMPAT_FSET,
> +	.data_crc =     cpu_to_je32(0)
> +};

I don't like this.  A global variable (without locking, it appears),
not declared as static and with a 3-letter name.

You could use it as a prototype, but even that seems a bit too much
for 5 constant fields.  And as long as the struct jffs2_raw_ebh is
small enough, you can just allocate it on the stack.

> @@ -210,6 +222,7 @@ static void jffs2_erase_callback(struct 
>  	} else {
>  		jffs2_erase_succeeded(priv->c, priv->jeb);
>  	}	
> +
>  	kfree(instr);
>  }
>  #endif /* !__ECOS */

Please remove.

> @@ -351,7 +364,7 @@ fail:
>  
>  static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
>  {
> -	struct jffs2_raw_node_ref *marker_ref = NULL;
> +	struct jffs2_raw_node_ref *ebh_ref = NULL;
>  	size_t retlen;
>  	int ret;
>  	uint32_t bad_offset;
> @@ -362,16 +375,14 @@ static void jffs2_mark_erased_block(stru
>  	}
>  
>  	/* Write the erase complete marker */	
> -	D1(printk(KERN_DEBUG "Writing erased marker to block at 0x%08x\n", jeb->offset));
> +	D1(printk(KERN_DEBUG "Writing eraseblock header to block at 0x%08x\n", jeb->offset));
>  	bad_offset = jeb->offset;
>  
>  	/* Cleanmarker in oob area or no cleanmarker at all ? */
> -	if (jffs2_cleanmarker_oob(c) || c->cleanmarker_size == 0) {
> +	if (jffs2_cleanmarker_oob(c)) {

What was (c->cleanmarker_size == 0) used for?

> -		if (jffs2_cleanmarker_oob(c)) {
> -			if (jffs2_write_nand_cleanmarker(c, jeb))
> -				goto filebad;
> -		}
> +		if (jffs2_write_nand_ebh(c, jeb))
> +			goto filebad;
>  
>  		jeb->first_node = jeb->last_node = NULL;
>  		jeb->free_size = c->sector_size;
> @@ -382,45 +393,41 @@ static void jffs2_mark_erased_block(stru
>  	} else {
>  
>  		struct kvec vecs[1];
> -		struct jffs2_unknown_node marker = {
> -			.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK),
> -			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
> -			.totlen =	cpu_to_je32(c->cleanmarker_size)
> -		};

Good example of stack allocation.

> -		marker_ref = jffs2_alloc_raw_node_ref();
> -		if (!marker_ref) {
> +		ebh_ref = jffs2_alloc_raw_node_ref();
> +		if (!ebh_ref) {
>  			printk(KERN_WARNING "Failed to allocate raw node ref for clean marker. Refiling\n");
>  			goto refile;
>  		}
> +		ebh.erase_count =  cpu_to_je32(jeb->erase_count);
> +		ebh.hdr_crc = cpu_to_je32(crc32(0, &ebh, sizeof(struct jffs2_unknown_node)-4));
> +		ebh.node_crc = cpu_to_je32(crc32(0, &ebh, sizeof(struct jffs2_raw_ebh)-8));
>  
> -		marker.hdr_crc = cpu_to_je32(crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4));
> -
> -		vecs[0].iov_base = (unsigned char *) &marker;
> -		vecs[0].iov_len = sizeof(marker);
> +		vecs[0].iov_base = (unsigned char *) &ebh;
> +		vecs[0].iov_len = sizeof(ebh);
>  		ret = jffs2_flash_direct_writev(c, vecs, 1, jeb->offset, &retlen);
>  		
> -		if (ret || retlen != sizeof(marker)) {
> +		if (ret || retlen != sizeof(ebh)) {
>  			if (ret)
> -				printk(KERN_WARNING "Write clean marker to block at 0x%08x failed: %d\n",
> +				printk(KERN_WARNING "Write eraseblock header to block at 0x%08x failed: %d\n",
>  				       jeb->offset, ret);
>  			else
>  				printk(KERN_WARNING "Short write to newly-erased block at 0x%08x: Wanted %zd, got %zd\n",
> -				       jeb->offset, sizeof(marker), retlen);
> +				       jeb->offset, sizeof(ebh), retlen);
>  
> -			jffs2_free_raw_node_ref(marker_ref);
> +			jffs2_free_raw_node_ref(ebh_ref);
>  			goto filebad;
>  		}

Most of this can remain unchanged with stack allocations.

> diff -auNrp mtd_9_28/fs/jffs2/fs.c mtd_9_28_EBH/fs/jffs2/fs.c
> --- mtd_9_28/fs/jffs2/fs.c	2005-09-28 10:51:57.000000000 +0800
> +++ mtd_9_28_EBH/fs/jffs2/fs.c	2005-09-28 11:51:53.000000000 +0800
> @@ -476,6 +476,7 @@ int jffs2_do_fill_super(struct super_blo
>  	}
>  
>  	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
> +	c->ebh_size = PAD(sizeof(struct jffs2_raw_ebh));

Remove the PAD.  Instead you should make sure that PAD(sizeof(struct
jffs2_raw_ebh)) and sizeof(struct jffs2_raw_ebh) are equal.

If they aren't, you have some other problem anyway.

> @@ -196,8 +197,14 @@ struct jffs2_eraseblock
>  	struct jffs2_raw_node_ref *last_node;
>  
>  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage collected */
> +
> +	uint32_t erase_count;
>  };
>  
> +#define SET_EBFLAGS_HAS_EBH(jeb) (jeb->flags |= 1)
> +#define CLR_EBFLAGS_HAS_EBH(jeb) (jeb->flags &= ~1)
> +#define EBFLAGS_HAS_EBH(jeb) ((jeb->flags & 1) == 1)

SET_EBFLAGS_HAS_EBH and CLR_EBFLAGS_HAS_EBH don't make sense.
EBFLAGS_SET_EBH does.

>  static inline int jffs2_blocks_use_vmalloc(struct jffs2_sb_info *c)
>  {
>  	return ((c->flash_size / c->sector_size) * sizeof (struct jffs2_eraseblock)) > (128 * 1024);
> @@ -398,14 +405,15 @@ int jffs2_scan_classify_jeb(struct jffs2
>  int jffs2_do_mount_fs(struct jffs2_sb_info *c);
>  
>  /* erase.c */
> +extern struct jffs2_raw_ebh ebh;

If you need this, you have a bug.

> diff -auNrp mtd_9_28/fs/jffs2/nodemgmt.c mtd_9_28_EBH/fs/jffs2/nodemgmt.c
> --- mtd_9_28/fs/jffs2/nodemgmt.c	2005-09-28 10:51:57.000000000 +0800
> +++ mtd_9_28_EBH/fs/jffs2/nodemgmt.c	2005-09-28 13:42:53.000000000 +0800
> @@ -342,7 +342,10 @@ static int jffs2_do_reserve_space(struct
>  
>  		jeb = c->nextblock;
>  
> -		if (jeb->free_size != c->sector_size - c->cleanmarker_size) {
> +		if ((!EBFLAGS_HAS_EBH(jeb) && jeb->free_size != c->sector_size - c->cleanmarker_size) ||
> +		    (EBFLAGS_HAS_EBH(jeb) && c->ebh_size && jeb->free_size != c->sector_size - ref_totlen(c, jeb, jeb->first_node)) ||
> +		    (EBFLAGS_HAS_EBH(jeb) && !c->ebh_size && jeb->free_size != c->sector_size))
> +		{

This is too complicated.  What are you trying to do?

>  			printk(KERN_WARNING "Eep. Block 0x%08x taken from free_list had free_size of 0x%08x!!\n", jeb->offset, jeb->free_size);
>  			goto restart;
>  		}
> @@ -352,8 +355,10 @@ static int jffs2_do_reserve_space(struct
>  	*ofs = jeb->offset + (c->sector_size - jeb->free_size);
>  	*len = jeb->free_size - reserved_size;
>  
> -	if (c->cleanmarker_size && jeb->used_size == c->cleanmarker_size &&
> -	    !jeb->first_node->next_in_ino) {
> +	if ((!EBFLAGS_HAS_EBH(jeb) && c->cleanmarker_size && jeb->used_size == c->cleanmarker_size
> +	     && !jeb->first_node->next_in_ino)
> +	     || (EBFLAGS_HAS_EBH(jeb) && c->ebh_size && jeb->used_size == ref_totlen(c, jeb, jeb->first_node)
> +	     && !jeb->first_node->next_in_ino)) {

Same thing.

[...]

> +struct jffs2_raw_ebh
> +{
> +	jint16_t magic;
> +	jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
> +	jint32_t totlen;

> +	jint32_t hdr_crc;
> +	uint8_t  reserved; /* reserved for future use and alignment */
> +	uint8_t  compat_fset;
> +	uint8_t  incompat_fset;
> +	uint8_t  rocompat_fset;

> +	jint32_t erase_count; /* the erase count of this erase block */
> +	jint32_t node_crc;
> +	jint32_t data_crc;

You don't need three crc fields.  Move node_crc up just below hdr_crc
and calculate the crc over the complete header.  If it is later
extended, you know the length from totlen, so you can still check the
complete crc, even if you don't understand the fields below.

> +	jint32_t data[0];
> +} __attribute__((packed));
> +
> +
>  union jffs2_node_union 
>  {
>  	struct jffs2_raw_inode i;
>  	struct jffs2_raw_dirent d;
>  	struct jffs2_raw_summary s;
> +	struct jffs2_raw_ebh eh;
>  	struct jffs2_unknown_node u;
>  };

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
