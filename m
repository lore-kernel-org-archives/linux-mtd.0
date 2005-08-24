Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7u15-0000tl-VW
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 08:06:12 -0400
Date: Wed, 24 Aug 2005 14:05:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050824120535.GA8670@wohnheim.fh-wedel.de>
References: <BAY17-F13B1D0DBDECF059C874E6FE8A80@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F13B1D0DBDECF059C874E6FE8A80@phx.gbl>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add erase count tracking support in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 24 August 2005 18:43:00 +0800, zhao forrest wrote:
> 
> I refined the patch according to your comments. In particular
> I removed some unnecessary #ifdef, reconstruct function 
> jffs2_mark_erased_block() to make it shorter and more clean.

Thou shalt not toppost.

Anyway, let's have another look...

> diff -auNrp ./mtd/fs/jffs2/build.c ./mtd_new/fs/jffs2/build.c
> --- ./mtd/fs/jffs2/build.c	2005-07-31 06:00:11.000000000 +0800
> +++ ./mtd_new/fs/jffs2/build.c	2005-08-18 13:33:55.000000000 +0800
> @@ -336,6 +336,10 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
>  		c->blocks[i].first_node = NULL;
>  		c->blocks[i].last_node = NULL;
>  		c->blocks[i].bad_count = 0;
> +#ifdef CONFIG_JFFS2_FS_ERASE_COUNT_TRACKING
> +		c->blocks[i].has_erase_count_node = 0;
> +		c->blocks[i].erase_count = 0;
> +#endif

sizeof(struct jffs2_eraseblock) is growing with your code enabled.
That means we have yet another reason to use a fixed 1:1 physical
block : virtual block mapping.

Which means that your patch can't go in before someone has written the
necessary 1:1 mapping code.

Back to your patch, you should remove this #ifdef as well.  Either
spend the memory for the two variables unconditionally and always
initialize them here, or create a helper function.

>  	}
>  
>  	INIT_LIST_HEAD(&c->clean_list);
> diff -auNrp ./mtd/fs/jffs2/erase.c ./mtd_new/fs/jffs2/erase.c
> --- ./mtd/fs/jffs2/erase.c	2005-07-23 06:00:13.000000000 +0800
> +++ ./mtd_new/fs/jffs2/erase.c	2005-08-24 18:26:14.000000000 +0800
> @@ -209,7 +209,12 @@ static void jffs2_erase_callback(struct 
>  		jffs2_erase_failed(priv->c, priv->jeb, instr->fail_addr);
>  	} else {
>  		jffs2_erase_succeeded(priv->c, priv->jeb);
> -	}	
> +	}
> +
> +#ifdef CONFIG_JFFS2_FS_ERASE_COUNT_TRACKING
> +	priv->jeb->erase_count++;
> +	priv->c->total_erase_count++;
> +#endif	

See above.  Helper function or unconditional code.

>  	kfree(instr);
>  }
>  #endif /* !__ECOS */
> @@ -349,6 +354,188 @@ fail:
>  	return ret;
>  }
>  
> +#ifdef CONFIG_JFFS2_FS_ERASE_COUNT_TRACKING
> +static int write_erase_count_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
> +{
> +	struct jffs2_raw_node_ref *erase_count_ref = NULL;
> +	struct kvec vecs[1];
> +	int ret;
> +	size_t retlen;
> +	struct jffs2_erase_count_node erase_count_node = {
> +		.magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
> +		.nodetype =     cpu_to_je16(JFFS2_NODETYPE_ERASE_COUNT),
> +		.totlen =       cpu_to_je32(c->erasecount_size),
> +		.erase_count =  cpu_to_je32(jeb->erase_count)
> +	};
> +
> +	erase_count_ref = jffs2_alloc_raw_node_ref();
> +	if (!erase_count_ref) {
> +		printk(KERN_WARNING "Failed to allocate raw node ref for erase count node.\n");
> +		return ENOMEM;
                      ^^
Looks like a bug.

> +	}
> +	erase_count_node.hdr_crc = cpu_to_je32(crc32(0, &erase_count_node,
> +					sizeof(struct jffs2_unknown_node)-4));
> + 	erase_count_node.node_crc = cpu_to_je32(crc32(0, &erase_count_node,
> +					sizeof(struct jffs2_erase_count_node)-4));
> +	vecs[0].iov_base = (unsigned char *) &erase_count_node;
> +	vecs[0].iov_len = sizeof(erase_count_node);
> +	ret = jffs2_flash_direct_writev(c, vecs, 1, jeb->offset + PAD(c->cleanmarker_size), &retlen);

Ferenc did the same thing before, now he has created a helper function
for this.  I guess you should take a look at his patch.

Since the helper function would be useful for both patches, you might
want to add the helper function in a seperate patch which imo could go
right in.

> +
> +	if (ret || retlen != sizeof(erase_count_node)) {
> +		if (ret)
> +			printk(KERN_WARNING "Write erase count to block at 0x%08x failed: %d\n",
> +					jeb->offset, ret);
> +		else
> +			printk(KERN_WARNING "Short write to newly-erased block at 0x%08x: Wanted %zd, got %zd\n",
> +					jeb->offset, sizeof(erase_count_node), retlen);

How much of this information is needed to debug problems? I think
jeb->offset, ret and retlen.  So combine the two branches into a
single printk.  Saves both code size and reading time.

> +		jffs2_free_raw_node_ref(erase_count_ref);
> +		return ret;
> +	}
> +
> +	erase_count_ref->next_in_ino = NULL;
> +	erase_count_ref->next_phys = NULL;
> +	erase_count_ref->flash_offset = (jeb->offset + PAD(c->cleanmarker_size)) | REF_NORMAL;
> +	erase_count_ref->__totlen = PAD(c->erasecount_size);
> +
> +	if (!jeb->first_node)
> +		jeb->first_node = erase_count_ref;
> +	if (jeb->last_node)
> +		jeb->last_node->next_phys = erase_count_ref;
> +	jeb->last_node = erase_count_ref;
> +
> +	return 0;
> +}
> +
> +static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
> +{
> +	struct jffs2_raw_node_ref *marker_ref = NULL;
> +	size_t retlen;
> +	int ret;
> +	uint32_t bad_offset;
> +
> +	switch (jffs2_block_check_erase(c, jeb, &bad_offset)) {
> +	case -EAGAIN:   goto refile;
> +	case -EIO:      goto filebad;
> +	}
> +
> +	/* Write the erase complete marker */
> +	D1(printk(KERN_DEBUG "Writing erased marker to block at 0x%08x\n", jeb->offset));
> +	bad_offset = jeb->offset;
> +
> +	/* Cleanmarker in oob area or no cleanmarker at all ? */
> +	if (jffs2_cleanmarker_oob(c) || c->cleanmarker_size == 0) {
> +		if (jffs2_cleanmarker_oob(c)) {
> +			if (jffs2_write_nand_cleanmarker(c, jeb))
> +				goto filebad;
> +
> +			jeb->first_node = jeb->last_node = NULL;
> +			jeb->free_size = c->sector_size;
> +			jeb->used_size = 0;
> +			jeb->dirty_size = 0;
> +			jeb->wasted_size = 0;
> +		} else {
> +			ret = write_erase_count_node(c, jeb);
> +
> +			if (ret == ENOMEM)
                                  ^^
Ok, maybe the thing above was not a but, but general convention is to
return -ENOMEM and friends.
       ^
> +				goto refile;
> +			else if (ret)
> +				goto filebad;
> +
> +			jeb->free_size = c->sector_size - PAD(c->erasecount_size);
> +			jeb->used_size = PAD(c->erasecount_size);
> +			jeb->dirty_size = 0;
> +			jeb->wasted_size = 0;                	
> +		}
> +	} else {
> +
> +		struct kvec vecs[1];
> +		struct jffs2_unknown_node marker = {
> +			.magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
> +			.nodetype =     cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
> +			.totlen =       cpu_to_je32(c->cleanmarker_size)
> +		};
> +
> +		marker_ref = jffs2_alloc_raw_node_ref();
> +		if (!marker_ref) {
> +			printk(KERN_WARNING "Failed to allocate raw node ref for clean marker. Refiling\n");
> +			goto refile;
> +		}
> +
> +		marker.hdr_crc = cpu_to_je32(crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4));
> +
> +		vecs[0].iov_base = (unsigned char *) &marker;
> +		vecs[0].iov_len = sizeof(marker);
> +		ret = jffs2_flash_direct_writev(c, vecs, 1, jeb->offset, &retlen);
> +
> +		if (ret || retlen != sizeof(marker)) {
> +			if (ret)
> +				printk(KERN_WARNING "Write clean marker to block at 0x%08x failed: %d\n",
> +					jeb->offset, ret);
> +			else
> +				printk(KERN_WARNING "Short write to newly-erased block at 0x%08x: Wanted %zd, got %zd\n",
> +					jeb->offset, sizeof(marker), retlen);
> +
> +			jffs2_free_raw_node_ref(marker_ref);
> +			goto filebad;
> +		}
> +
> +		marker_ref->next_in_ino = NULL;
> +		marker_ref->next_phys = NULL;
> +		marker_ref->flash_offset = jeb->offset | REF_NORMAL;
> +		marker_ref->__totlen = c->cleanmarker_size;
> +
> +		jeb->first_node = jeb->last_node = marker_ref;
> +
> +		ret = write_erase_count_node(c, jeb);
> +
> +		if (ret) {
> +			jffs2_free_raw_node_ref(marker_ref);
> +			if (ret == ENOMEM)
                                  ^^
> +				goto refile;
> +			else if (ret)
> +				goto filebad;
> +		}
> +
> +		jeb->free_size = c->sector_size - c->cleanmarker_size - PAD(c->erasecount_size);
> +		jeb->used_size = c->cleanmarker_size + PAD(c->erasecount_size);
> +		jeb->dirty_size = 0;
> +		jeb->wasted_size = 0;
> +	}
> +
> +	spin_lock(&c->erase_completion_lock);
> +	c->erasing_size -= c->sector_size;
> +	c->free_size += jeb->free_size;
> +	c->used_size += jeb->used_size;
> +
> +	jffs2_dbg_acct_sanity_check_nolock(c,jeb);
> +	jffs2_dbg_acct_paranoia_check_nolock(c, jeb);
> +
> +	list_add_tail(&jeb->list, &c->free_list);
> +	c->nr_erasing_blocks--;
> +	c->nr_free_blocks++;
> +	spin_unlock(&c->erase_completion_lock);
> +	wake_up(&c->erase_wait);
> +	return;
> +
> +filebad:
> +	spin_lock(&c->erase_completion_lock);
> +	/* Stick it on a list (any list) so erase_failed can take it
> +	   right off again.  Silly, but shouldn't happen often. */
> +	list_add(&jeb->list, &c->erasing_list);
> +	spin_unlock(&c->erase_completion_lock);
> +	jffs2_erase_failed(c, jeb, bad_offset);
> +	return;
> +
> +refile:
> +	/* Stick it back on the list from whence it came and come back later */
> +	jffs2_erase_pending_trigger(c);
> +	spin_lock(&c->erase_completion_lock);
> +	list_add(&jeb->list, &c->erase_complete_list);
> +	spin_unlock(&c->erase_completion_lock);
> +	return;
> +}
> +#else
> +
>  static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
>  {
>  	struct jffs2_raw_node_ref *marker_ref = NULL;
> @@ -367,7 +554,6 @@ static void jffs2_mark_erased_block(stru
>  
>  	/* Cleanmarker in oob area or no cleanmarker at all ? */
>  	if (jffs2_cleanmarker_oob(c) || c->cleanmarker_size == 0) {
> -

Can you create a seperate patch for the whitespace cleanups?

>  		if (jffs2_cleanmarker_oob(c)) {
>  			if (jffs2_write_nand_cleanmarker(c, jeb))
>  				goto filebad;
> @@ -378,7 +564,6 @@ static void jffs2_mark_erased_block(stru
>  		jeb->used_size = 0;
>  		jeb->dirty_size = 0;
>  		jeb->wasted_size = 0;
> -
>  	} else {
>  
>  		struct kvec vecs[1];
> @@ -457,3 +642,4 @@ refile:
>  	spin_unlock(&c->erase_completion_lock);
>  	return;
>  }
> +#endif

...

> diff -auNrp ./mtd/include/linux/jffs2_fs_sb.h ./mtd_new/include/linux/jffs2_fs_sb.h
> --- ./mtd/include/linux/jffs2_fs_sb.h	2005-05-20 06:00:14.000000000 +0800
> +++ ./mtd_new/include/linux/jffs2_fs_sb.h	2005-08-18 13:28:36.000000000 +0800
> @@ -40,7 +40,9 @@ struct jffs2_sb_info {
>  					   out-of-order writing of nodes. And GC. */
>  	uint32_t cleanmarker_size;	/* Size of an _inline_ CLEANMARKER
>  					 (i.e. zero for OOB CLEANMARKER */
> -
> +#ifdef CONFIG_JFFS2_FS_ERASE_COUNT_TRACKING
> +	uint32_t erasecount_size;	/* size of an _inline_ erase-count node */
> +#endif
>  	uint32_t flash_size;
>  	uint32_t used_size;
>  	uint32_t dirty_size;
> @@ -89,6 +91,10 @@ struct jffs2_sb_info {
>  	wait_queue_head_t inocache_wq;
>  	struct jffs2_inode_cache **inocache_list;
>  	spinlock_t inocache_lock;
> +
> +#ifdef CONFIG_JFFS2_FS_ERASE_COUNT_TRACKING
> +	uint32_t total_erase_count;	/* The summary erase count of all erase blocks on a Flash  */
> +#endif

This field is write-only?  What did you plan to do with it?

>  	
>  	/* Sem to allow jffs2_garbage_collect_deletion_dirent to
>  	   drop the erase_completion_lock while it's holding a pointer 
> diff -auNrp ./mtd/include/linux/jffs2.h ./mtd_new/include/linux/jffs2.h
> --- ./mtd/include/linux/jffs2.h	2005-07-27 06:00:09.000000000 +0800
> +++ ./mtd_new/include/linux/jffs2.h	2005-08-24 18:25:46.000000000 +0800
> @@ -60,6 +60,8 @@
>  #define JFFS2_NODETYPE_CLEANMARKER (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
>  #define JFFS2_NODETYPE_PADDING (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 4)
>  
> +#define JFFS2_NODETYPE_ERASE_COUNT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 5)
> +
>  // Maybe later...
>  //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
>  //#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
> @@ -146,10 +148,28 @@ struct jffs2_raw_inode
>  	uint8_t data[0];
>  } __attribute__((packed));
>  
> +struct jffs2_erase_count_node
> +{
> +	jint16_t magic;      /* A constant magic number.  */
> +	jint16_t nodetype;   /* == JFFS2_NODETYPE_ERASE_COUNT */
> +	jint32_t totlen;
> +	jint32_t hdr_crc;
> +	jint32_t erase_count; /* used to track the erase counts of each erase block */
> +	jint32_t node_crc;
> +} __attribute__((packed));

I hope Artem is peeking here.  What we could do is split this patch
into two parts:
1. data defitions
2. code to use that data

Then 1) could go in rather quickly and the existance of a struct
jffs2_erase_count_node on flash can be used as an indication of a 1:1
mapping.  We merge the code to deal with a 1:1 mapping, let it settle
for a while and then merge 2).

Comments?

> +struct jffs2_erase_count_node_oob
> +{
> +	jint16_t magic;      /* A constant magic number.  */
> +	jint16_t nodetype;   /* == JFFS2_NODETYPE_ERASE_COUNT */
> +	jint32_t erase_count; /* used to track the erase counts of each erase block */
> +} __attribute__((packed));
> +
>  union jffs2_node_union {
>  	struct jffs2_raw_inode i;
>  	struct jffs2_raw_dirent d;
>  	struct jffs2_unknown_node u;
> +	struct jffs2_erase_count_node e;
>  };
>  
>  #endif /* __LINUX_JFFS2_H__ */


Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
