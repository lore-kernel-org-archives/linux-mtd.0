From: bbrezillon@kernel.org (Boris Brezillon)
Date: Wed, 16 Jan 2019 18:23:31 +0100
Subject: [PATCH v2] mtd: rework partitions handling
In-Reply-To: <20190116162144.4458-1-miquel.raynal@bootlin.com>
References: <20190116162144.4458-1-miquel.raynal@bootlin.com>
Message-ID: <20190116182331.48607065@bbrezillon>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 16 Jan 2019 17:21:44 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Instead of collecting partitions in a flat list, create a hierarchy
> within the mtd_info structure: use a partitions list to keep track of
> the partitions of an MTD device (which might be itself a partition of
> another MTD device), a pointer to the parent device (NULL when the MTD
> device is the root one, not a partition).
> 
> By also saving directly in mtd_info the offset of the partition, we
> can get rid of the mtd_part structure.
> 
> All part_*() helpers are removed, the corresponding mtd_*() helpers
> are updated to handle the partitions themselves.
> 
> The part_absolute_offset() helper is also replaced by
> mtd_get_master_offset() which is very similar but not recursive and
> accepts an additional offset. Plus, it is used in both mtdcore and
> mtdpart.
> 
> While at it, be consistent in the naming of the mtd_info structures to
> ease the understanding of the new hierarchy: these structures are
> usually called 'mtd', unless there are multiple instances of the same
> structure. In this case, there is usually a parent/child bound so we
> will call them 'parent' and 'child'.

Looking at the code it seems like names employed are actually 'master'
and 'mtd'.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> This patch applies on top of:
> mtd: Implement mtd_{read,write}() as wrappers around mtd_{read,write}_oob()
> 
> Changes since v1:
> =================
> * Commit name changed "proper partition handling" -> "rework partition
>   tree".
> * Update mtd_get_device_size() to support recursive partitioning.
> * Remove part_*() helpers, update the corresponding mtd_*() helpers to
>   handle the partitions themselves.
> * Drop the global partitions lock, add a lock per mtd_info but only use
>   the root one to protect against partitions updates.
>  /**
> @@ -936,20 +944,26 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
>  
>  int __get_mtd_device(struct mtd_info *mtd)
>  {
> +	struct mtd_info *master = mtd_get_master(mtd);
>  	int err;
>  
> -	if (!try_module_get(mtd->owner))
> +	if (!try_module_get(master->owner))
>  		return -ENODEV;
>  
> -	if (mtd->_get_device) {
> -		err = mtd->_get_device(mtd);
> +	if (master->_get_device) {
> +		err = master->_get_device(mtd);

					  ^master

>  
>  		if (err) {
> -			module_put(mtd->owner);
> +			module_put(master->owner);
>  			return err;
>  		}
>  	}
> -	mtd->usecount++;
> +
> +	while (mtd->parent) {
> +		mtd->usecount++;
> +		mtd = mtd->parent;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(__get_mtd_device);

> @@ -1034,7 +1057,14 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		return 0;
>  
>  	ledtrig_mtd_activity();
> -	return mtd->_erase(mtd, instr);
> +
> +	instr->addr += mst_ofs;
> +	ret = mtd->_erase(mtd, instr);

	ret = master->erase(master, instr);

> +	if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
> +		instr->fail_addr -= mst_ofs;
> +
> +	instr->addr -= mst_ofs;
> +	return ret;
>  }
