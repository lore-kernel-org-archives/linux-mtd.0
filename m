Received: from bay17-f17.bay17.hotmail.com ([64.4.43.67] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoPN-0003ax-IY
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:33:41 -0400
Message-ID: <BAY17-F17754FE85551E948E0FCBBE88B0@phx.gbl>
In-Reply-To: <20050925103037.GA25279@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Mon, 26 Sep 2005 16:32:20 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Enhancement to current 1:1 mapping handling in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> >
> > This patch gave a possible method to improve the current 1:1
> > mapping handling in JFFS2.
> >
> > Data structure:
> > 1 A slab cache for struct jffs2_eraseblock; is created, so
> > struc jffs2_eraseblock is allocated from this slab cache.
> > 2 A pointer array is created by kmalloc(), and the pointer
> > point to the struct jffs2_eraseblock allocated from slab cache.
> >
> > By storing pointers instead of "struct jffs2_eraseblock"s into
> > continuous memory space, we reduce the pressure of continuous
> > memory space requirement.
> >
> > On a 32-bit system, 128K continuous memory allocated by kmalloc()
> > can hold 32K pointers.
> > So if the eraseblock size is 4K, it can support 128M flash memory.
> > if the eraseblock size is 8K, it can support 256M flash memory.
> >
> > I think this patch can support most of flashes now. If there's
> > size limitation report in the future, we can add another level of
> > pointers to meet the requirement.
>
>This could become a limit already.  Block devices going through a
>translation usually have 4k as erase size.  Any USB key above 128KiB
>will be a problem.
>
>Not sure what we want to do about this.

I agree with you that my patch is not a perfect solution to the
problem. But at least it's a further step of current 1:1 mapping
handling in JFFS2. I think someone can give better patch if he
meets the limit in the future. Does it make sense to you? Or 
do you agree to check in this patch after I finish revising it?

>
> > diff -auNrp ./mtd_EBH_EBS/fs/jffs2/build.c 
./mtd_EBH_EBS_1on1/fs/jffs2/build.c
> > --- ./mtd_EBH_EBS/fs/jffs2/build.c	2005-09-22 13:13:51.000000000 +0800
> > +++ ./mtd_EBH_EBS_1on1/fs/jffs2/build.c	2005-09-22 15:01:40.000000000 
+0800
> > @@ -305,34 +305,51 @@ static void jffs2_calc_trigger_levels(st
> >  		  c->nospc_dirty_size);
> >  }
> >
> > +void jffs2_free_eraseblocks(struct jffs2_sb_info *c, uint32_t number)
> > +{
> > +	uint32_t i;
> > +
> > +	for(i=0; i<number; i++) {
> > +		jffs2_free_eraseblock(c->blocks[i]);
> > +	}
> > +	return;
> > +}
>
>Is there a reason why this function doesn't encapsulate everything to
>free all objects?
>
>void jffs2_free_eraseblocks(struct jffs2_sb_info *c)
>{
>	u32 i = c->nr_blocks - 1;
>
>	for (; i>=0; i--)
>		jffs2_free_eraseblock(c->blocks[i]);
>	kfree(c->blocks);
>}
>
>Should be safe from all contexts.  Failure case is a slow path anyway,
>so iterating through the full array shouldn't matter too much.
>
OK. I'll modify the patch accordingly.

> >  int jffs2_do_mount_fs(struct jffs2_sb_info *c)
> >  {
> >  	int ret;
> > -	int i;
> > +	uint32_t i, number = 0;
> >
> >  	c->free_size = c->flash_size;
> >  	c->nr_blocks = c->flash_size / c->sector_size;
> > -#ifndef __ECOS
> > -	if (jffs2_blocks_use_vmalloc(c))
> > -		c->blocks = vmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks);
> > -	else
> > -#endif
> > -		c->blocks = kmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks, 
GFP_KERNEL);
> > +
> > +	c->blocks = kmalloc(sizeof(char *) * c->nr_blocks, GFP_KERNEL);
> >  	if (!c->blocks)
> >  		return -ENOMEM;
> > +
> > +	for (i=0; i<c->nr_blocks; i++) {
> > +		c->blocks[i] = jffs2_alloc_eraseblock();
> > +		if (!c->blocks[i]) {
> > +			ret = -ENOMEM;
> > +			number = i;
> > +			goto failed;
> > +		}
> > +	}
> > +	number = c->nr_blocks;
>
>This could be moved into a function, analog to the above.
>
OK.

>static int jffs2_alloc_eraseblocks(struct jffs2_sb_info *c)
>{
>	int i = c->nr_blocks - 1;
>
>	c->blocks = kzalloc(sizeof(char *) * c->nr_blocks, GFP_KERNEL);
>	if (!c->blocks)
>		return -ENOMEM;
>
>	for (; i>=0; i--) {
>		c->blocks[i] = jffs2_alloc_eraseblock();
>		if (!c->blocks[i]) {
>			jffs2_free_eraseblocks(c);
>			return -ENOMEM;
>		}
>	}
>	return 0;
>}
>
> >  	for (i=0; i<c->nr_blocks; i++) {
> > -		INIT_LIST_HEAD(&c->blocks[i].list);
> > -		c->blocks[i].offset = i * c->sector_size;
> > -		c->blocks[i].free_size = c->sector_size;
> > -		c->blocks[i].dirty_size = 0;
> > -		c->blocks[i].wasted_size = 0;
> > -		c->blocks[i].unchecked_size = 0;
> > -		c->blocks[i].used_size = 0;
> > -		c->blocks[i].first_node = NULL;
> > -		c->blocks[i].last_node = NULL;
> > -		c->blocks[i].bad_count = 0;
> > -		c->blocks[i].has_eraseblock_header = 0;
> > -		c->blocks[i].erase_count = 0;
> > +		INIT_LIST_HEAD(&c->blocks[i]->list);
> > +		c->blocks[i]->offset = i * c->sector_size;
> > +		c->blocks[i]->free_size = c->sector_size;
> > +		c->blocks[i]->dirty_size = 0;
> > +		c->blocks[i]->wasted_size = 0;
> > +		c->blocks[i]->unchecked_size = 0;
> > +		c->blocks[i]->used_size = 0;
> > +		c->blocks[i]->first_node = NULL;
> > +		c->blocks[i]->last_node = NULL;
> > +		c->blocks[i]->bad_count = 0;
> > +		c->blocks[i]->has_eraseblock_header = 0;
> > +		c->blocks[i]->erase_count = 0;
> >  	}
>
>Most of those fields are initialized to 0 or NULL.  Maybe we should
>just kzalloc() or memset() the complete object, then initialize the
>few fields that are non-zero.  If that reduces the text size, it'd be
>worth it.
>
OK.

> >  	INIT_LIST_HEAD(&c->clean_list);
> > @@ -351,22 +368,22 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
> >
> >  	ret = jffs2_sum_init(c);
> >  	if (ret)
> > -		return ret;
> > +		goto failed;
> >
> >  	if (jffs2_build_filesystem(c)) {
> >  		dbg_fsbuild("build_fs failed\n");
> > -		jffs2_free_ino_caches(c);
> > -		jffs2_free_raw_node_refs(c);
> > -#ifndef __ECOS
> > -		if (jffs2_blocks_use_vmalloc(c))
> > -			vfree(c->blocks);
> > -		else
> > -#endif
> > -			kfree(c->blocks);
> > -
> > -		return -EIO;
> > -	}
> > +		ret = -EIO;
> > +	} else
> > +		goto out;
> > +
> > +failed:
> > +	jffs2_free_ino_caches(c);
> > +	jffs2_free_raw_node_refs(c);
> > +	jffs2_free_eraseblocks(c, number);
> > +	kfree(jffs2_free_eraseblocks);
> > +	return ret;
>
>This logic would be a bit simpler if allocation is moved into a
>function.
OK

I'll send out the revised patch soon.

Thanks,
Forrest
