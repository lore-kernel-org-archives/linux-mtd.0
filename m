Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKE3f-0002OT-SZ
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 07:55:50 -0400
Date: Tue, 27 Sep 2005 13:55:31 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050927115531.GA20702@wohnheim.fh-wedel.de>
References: <BAY17-F26CCF10BB1004AFDDBDF51E88A0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F26CCF10BB1004AFDDBDF51E88A0@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]enhanced 1:1 mapping(revision 1)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 September 2005 15:59:41 +0800, zhao forrest wrote:
> 
> I revised the patch according to Joern's comments.
> Now the basic data structure is:
> vmalloc()/kmalloc + pointer array + slab cache.
> Also I did some code re-constructure to make it more clean.


> @@ -205,3 +215,57 @@ void jffs2_free_inode_cache(struct jffs2
>  	dbg_memalloc("%p\n", x);
>  	kmem_cache_free(inode_cache_slab, x);
>  }
> +
> +int jffs2_alloc_eraseblocks(struct jffs2_sb_info *c)
> +{
> +	uint32_t i;
> +#ifndef __ECOS
> +	if (jffs2_blocks_use_vmalloc(c))
> +		c->blocks = vmalloc(sizeof(uint8_t *) * c->nr_blocks);
> +	else
> +#endif
> +		c->blocks = kmalloc(sizeof(uint8_t *) * c->nr_blocks, GFP_KERNEL);
> +	if (!c->blocks)
> +		return -ENOMEM;
> +	memset(c->blocks, 0, sizeof(uint8_t *) * c->nr_blocks);

sizeof(uint8_t *) is rather odd.  Either this should be
sizeof(struct jffs2_eraseblock*), which is correct but admittedly
quite long, or a simple sizeof(void*).  uint8_t puts people on the
wrong track.

> +
> +	for (i=0; i<c->nr_blocks; i++) {
> +		c->blocks[i] = kmem_cache_alloc(eraseblock_slab, GFP_KERNEL);
> +		dbg_memalloc("%p\n", ret);
                                     ^^^
That should be c->blocks[i], I assume.

> +		if (!c->blocks[i]) {
> +			jffs2_free_eraseblocks(c);
> +			return -ENOMEM;
> +		}
> +		memset(c->blocks[i], 0, sizeof(struct jffs2_eraseblock));
> +	}
> +
> +	
> +	for (i=0; i<c->nr_blocks; i++) {
> +		INIT_LIST_HEAD(&c->blocks[i]->list);
> +		c->blocks[i]->offset = i * c->sector_size;
> +		c->blocks[i]->free_size = c->sector_size;
> +		c->blocks[i]->first_node = NULL;
> +		c->blocks[i]->last_node = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +void jffs2_free_eraseblocks(struct jffs2_sb_info *c)
> +{
> +	uint32_t i;
> +
> +	for (i=0; i<c->nr_blocks; i++) {
> +		if (c->blocks[i]) {
> +			dbg_memalloc("%p\n", c->blocks[i]);
> +			kmem_cache_free(eraseblock_slab, c->blocks[i]);
> +		}
> +	}
> +#ifndef __ECOS
> +	if (jffs2_blocks_use_vmalloc(c))
> +		vfree(c->blocks);
> +	else
> +#endif
> +	kfree(c->blocks);
        ^
another indentation level?  Not sure.
> +}
> +
 
It appears as if jffs2_blocks_use_vmalloc(c) was unchanged.  Maybe I
missed it, but that function should get adjusted by this patch.
Maybe we can move it into malloc.c, as that file contains the only two
remaining users, now.

Looks quite nice, thanks.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
