Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoYc-00043b-DM
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:42:00 -0400
Date: Mon, 26 Sep 2005 10:41:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050926084154.GC17756@wohnheim.fh-wedel.de>
References: <BAY17-F3179BEFDF1ABD013971FD1E88B0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F3179BEFDF1ABD013971FD1E88B0@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 September 2005 16:18:15 +0800, zhao forrest wrote:
> 
> This is second revision of erase block header patch.
> Compared with revision 1, the following changes are made:
> 1 totally remove JFFS2_NODETYPE_DIRENT_EBH and
> JFFS2_NODETYPE_INODE_EBH stuff
> 2 change the node type from JFFS2_FEATURE_INCOMPAT to
> JFFS2_FEATURE_RWCOMPAT_DELETE
> 3 replace 4 with sizeof(uint32_t) in summary.c
> 
> The patch is at 
> http://www.infradead.org/~forrest/eraseblock_header_r2.patch

Didn't read it all.

> diff -auNrp ./mtd/fs/jffs2/build.c ./mtd_EBH_EBS/fs/jffs2/build.c
> --- ./mtd/fs/jffs2/build.c	2005-09-22 11:08:47.000000000 +0800
> +++ ./mtd_EBH_EBS/fs/jffs2/build.c	2005-09-23 14:19:42.000000000 +0800
> @@ -331,6 +331,8 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
>  		c->blocks[i].first_node = NULL;
>  		c->blocks[i].last_node = NULL;
>  		c->blocks[i].bad_count = 0;
> +		c->blocks[i].has_ebh = 0;
> +		c->blocks[i].erase_count = 0;
>  	}
>  
>  	INIT_LIST_HEAD(&c->clean_list);
> diff -auNrp ./mtd/fs/jffs2/erase.c ./mtd_EBH_EBS/fs/jffs2/erase.c
> --- ./mtd/fs/jffs2/erase.c	2005-09-22 11:08:47.000000000 +0800
> +++ ./mtd_EBH_EBS/fs/jffs2/erase.c	2005-09-23 14:31:42.000000000 +0800
> @@ -210,6 +210,10 @@ static void jffs2_erase_callback(struct 
>  	} else {
>  		jffs2_erase_succeeded(priv->c, priv->jeb);
>  	}	
> +
> +	if (!priv->jeb->has_ebh) {
> +		priv->jeb->has_ebh = 1;
> +	}

	priv->jeb->has_ebh = 1;

>  	kfree(instr);
>  }
>  #endif /* !__ECOS */
> @@ -362,16 +366,14 @@ static void jffs2_mark_erased_block(stru
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
>  
> -		if (jffs2_cleanmarker_oob(c)) {
> -			if (jffs2_write_nand_cleanmarker(c, jeb))
> -				goto filebad;
> -		}
> +		if (jffs2_write_nand_ebh(c, jeb))
> +			goto filebad;
>  
>  		jeb->first_node = jeb->last_node = NULL;
>  		jeb->free_size = c->sector_size;
> @@ -382,10 +384,17 @@ static void jffs2_mark_erased_block(stru
>  	} else {
>  
>  		struct kvec vecs[1];
> -		struct jffs2_unknown_node marker = {
> +		struct jffs2_eraseblock_header marker = {
>  			.magic =	cpu_to_je16(JFFS2_MAGIC_BITMASK),
> -			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
> -			.totlen =	cpu_to_je32(c->cleanmarker_size)
> +			.nodetype =	cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
> +			.totlen =	cpu_to_je32(PAD(c->ebh_size)),
> +			.fs_version =   JFFS2_VERSION,
> +			.compat_fset =  JFFS2_EBH_COMPAT_FSET,
> +			.incompat_fset = JFFS2_EBH_INCOMPAT_FSET,
> +			.rocompat_fset = JFFS2_EBH_ROCOMPAT_FSET,
> +			.erase_count =  cpu_to_je32(jeb->erase_count),
> +			.dsize =        cpu_to_je16(0),
> +			.data_crc =     cpu_to_je32(0)
>  		};
>  
>  		marker_ref = jffs2_alloc_raw_node_ref();
> @@ -395,6 +404,7 @@ static void jffs2_mark_erased_block(stru
>  		}
>  
>  		marker.hdr_crc = cpu_to_je32(crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4));
> +		marker.node_crc = cpu_to_je32(crc32(0, &marker, sizeof(struct jffs2_eraseblock_header)-8));
>  
>  		vecs[0].iov_base = (unsigned char *) &marker;
>  		vecs[0].iov_len = sizeof(marker);
> @@ -415,12 +425,12 @@ static void jffs2_mark_erased_block(stru
>  		marker_ref->next_in_ino = NULL;
>  		marker_ref->next_phys = NULL;
>  		marker_ref->flash_offset = jeb->offset | REF_NORMAL;
> -		marker_ref->__totlen = c->cleanmarker_size;
> +		marker_ref->__totlen = PAD(c->ebh_size);
>  			
>  		jeb->first_node = jeb->last_node = marker_ref;
>  			
> -		jeb->free_size = c->sector_size - c->cleanmarker_size;
> -		jeb->used_size = c->cleanmarker_size;
> +		jeb->free_size = c->sector_size - PAD(c->ebh_size);
> +		jeb->used_size = PAD(c->ebh_size);
>  		jeb->dirty_size = 0;
>  		jeb->wasted_size = 0;
>  	}
> diff -auNrp ./mtd/fs/jffs2/fs.c ./mtd_EBH_EBS/fs/jffs2/fs.c
> --- ./mtd/fs/jffs2/fs.c	2005-09-22 11:08:47.000000000 +0800
> +++ ./mtd_EBH_EBS/fs/jffs2/fs.c	2005-09-26 15:34:54.000000000 +0800
> @@ -476,6 +476,7 @@ int jffs2_do_fill_super(struct super_blo
>  	}
>  
>  	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
> +	c->ebh_size = sizeof(struct jffs2_eraseblock_header);

If you add the padding here, you don't need it everywhere else.

>  	/* Joern -- stick alignment for weird 8-byte-page flash here */
>  
>  	/* NAND (or other bizarre) flash... do setup accordingly */
> diff -auNrp ./mtd/fs/jffs2/nodelist.h ./mtd_EBH_EBS/fs/jffs2/nodelist.h
> --- ./mtd/fs/jffs2/nodelist.h	2005-09-22 11:08:47.000000000 +0800
> +++ ./mtd_EBH_EBS/fs/jffs2/nodelist.h	2005-09-23 14:25:36.000000000 +0800
> @@ -196,6 +196,9 @@ struct jffs2_eraseblock
>  	struct jffs2_raw_node_ref *last_node;
>  
>  	struct jffs2_raw_node_ref *gc_node;	/* Next node to be garbage collected */
> +
> +	uint8_t has_ebh;

This breaks your alignment.  You really need to get that into your
head.  Gcc will allocate a u32 for this field anyway - no matter how
small you make it.  It needs the extra room for alignment of the next
field.

> +	uint32_t erase_count;
>  };
 

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
