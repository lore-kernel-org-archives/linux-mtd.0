Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8DCN-0007Oy-9w
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 04:35:10 -0400
Date: Thu, 25 Aug 2005 10:34:13 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050825083413.GA31991@wohnheim.fh-wedel.de>
References: <BAY17-F3174C2808A5F3FC0045ADAE8AB0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F3174C2808A5F3FC0045ADAE8AB0@phx.gbl>
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

On Thu, 25 August 2005 15:44:37 +0800, zhao forrest wrote:
> 
> I refine the code again according to Joern's comments.
> Here is an explanation of implementation details.
> 
> A new node type JFFS2_NODETYPE_ERASE_COUNT is introduced to store
> the erase count of each erase block. So JFFS2_NODETYPE_ERASE_COUNT
> is like JFFS2_NODETYPE_CLEANMARKER and is a per-erase-block node.
> For NOR flash, JFFS2_NODETYPE_ERASE_COUNT tightly follow the
> JFFS2_NODETYPE_CLEANMARKER; for NAND flash, JFFS2_NODETYPE_ERASE
> _COUNT is stored in the OOB area of second page.
> 
> *How to work?
> 
> [FS mounting]
> During JFFS2 mounting, the erase count is read out from 
> JFFS2_NODETYPE_ERASE_COUNT and is stored in the new field
> "erase_count" of struct jffs2_eraseblock.
> 
> [erase the block]
> Each time the erasing operation of an erase block complete,
> increase "erase_count" of struct jffs2_eraseblock. Then write
> JFFS2_NODETYPE_ERASE_COUNT to erase block after JFFS2_NODETYPE_
> CLEANMARKER has been written.

Nice explanation, thanks.  How are you going to deal with the race
condition during block erase?  If the system fails during that time,
the erase count is lost.

Some options:
o Pick the average of all existing erase counts.
o Pick zero, if no block contains erase counts.  This is the average,
  in a way.
o Pick the average plus "a bit".  With this policy, the block won't be
  erased for a while, so it can't continuously hit the same race.
o Arrange erase blocks in pairs and store the erase count for the
  block itself and its buddy.  The two buddies in a pair are
  alternately erased, so we always have a backup of the current erase
  count.

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

This is still unchanged. *grumble*

>  	}
>  
>  	INIT_LIST_HEAD(&c->clean_list);
> diff -auNrp ./mtd/fs/jffs2/erase.c ./mtd_new/fs/jffs2/erase.c
> --- ./mtd/fs/jffs2/erase.c	2005-07-23 06:00:13.000000000 +0800
> +++ ./mtd_new/fs/jffs2/erase.c	2005-08-25 15:14:51.000000000 +0800
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

*grumble*

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
> +		return -ENOMEM;
> +	}
> +	erase_count_node.hdr_crc = cpu_to_je32(crc32(0, &erase_count_node,
> +					sizeof(struct jffs2_unknown_node)-4));
> + 	erase_count_node.node_crc = cpu_to_je32(crc32(0, &erase_count_node,
> +					sizeof(struct jffs2_erase_count_node)-4));
> +	vecs[0].iov_base = (unsigned char *) &erase_count_node;
> +	vecs[0].iov_len = sizeof(erase_count_node);
> +	ret = jffs2_flash_direct_writev(c, vecs, 1, jeb->offset + PAD(c->cleanmarker_size), &retlen);
> +
> +	if (ret || retlen != sizeof(erase_count_node)) {
> +		if (ret)
> +			printk(KERN_WARNING "Write erase count to block at 0x%08x failed: %d\n",
> +					jeb->offset, ret);
> +		else
> +			printk(KERN_WARNING "Short write to newly-erased block at 0x%08x: Wanted %zd, got %zd\n",
> +					jeb->offset, sizeof(erase_count_node), retlen);

*grumble*

I will stop the review here.  You still have work left from the last
round.

Jörn

-- 
Why do musicians compose symphonies and poets write poems?
They do it because life wouldn't have any meaning for them if they didn't.
That's why I draw cartoons.  It's my life.
-- Charles Shultz
