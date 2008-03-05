Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWsJ9-0004Df-JE
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 12:01:17 +0000
Date: Wed, 5 Mar 2008 13:00:29 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [MTD][NOR] adding physical address to point()
Message-ID: <20080305120029.GG6616@lazybastard.org>
References: <6934efce0803050213i6908afbbn5655f13d10309c38@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0803050213i6908afbbn5655f13d10309c38@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding dwmw2 to Cc: can improve chances. ;)

On Wed, 5 March 2008 02:13:10 -0800, Jared Hulbert wrote:
> 
> [MTD][NOR] adding physical address to point()
> 
> Adding the ability to get a physical address from point() in addition
> to virtual address.  This physical address is required for XIP of
> userspace code from flash.
> 
> Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
> Reviewed-by: Joern Engel <joern@logfs.org>
> ---
> 
> We've looked at this before.  Joern came up with the idea and I've
> been doing the patch.  For a while I thought I could drop this patch.
> Turns out I do need it after all.
> 
> Just to remind folks.  I need this to do ANY legitimate XIP of
> userspace code from Flash.  I've written AXFS to do XIP of userspace
> code.  Working with the linux-mm guys we come up with a way to make
> mm/filemap_xip.c to what we need it to. To XIP Flash pages we need to
> do a vm_insert_pfn().  To get a pfn we need a physical address.
> virt_to_page() doesn't work for ioremap'ed kaddr's (like mtd->virt
> mtd->cached) and Linus told us "no sneaky page table walks and don't
> screw with virt_to_page()."   So we're stuck needing to get this
> physical address from the mtd driver.  This was the way we came up
> with to do that a while back.
> 
> Any issues with this patch?  It's same as it was plus some formating
> changes to pass checkpatch.pl.  If we can merge this, it can be pulled
> from my mtd git tree on infradead.
> 
> Please, I want to merge AXFS someday.
> 
>  drivers/mtd/devices/mtdram.c      |   11 +++++++----
>  drivers/mtd/devices/phram.c       |   13 +++++++------
>  drivers/mtd/devices/pmc551.c      |   27 +++++++++++++++++----------
>  drivers/mtd/devices/slram.c       |   15 ++++++++++-----
>  drivers/mtd/maps/uclinux.c        |    6 ++++--
>  drivers/mtd/mtdpart.c             |    8 ++++----
>  fs/jffs2/erase.c                  |    7 ++++---
>  fs/jffs2/readinode.c              |    9 +++++----
>  fs/jffs2/scan.c                   |    7 ++++---
>  include/linux/mtd/mtd.h           |    6 ++++--
>  include/linux/mtd/pmc551.h        |    5 +++--
>  drivers/mtd/chips/cfi_cmdset_0001.c |   14 ++++++++------
>  12 files changed, 77 insertions(+), 51 deletions(-)
> 
> diff --git
> a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 47794d2..d2105aa 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -82,9 +82,8 @@ static struct mtd_info *cfi_intelext_setup (struct
> mtd_info *);
>  static int cfi_intelext_partition_fixup(struct mtd_info *, struct
> cfi_private **);
> 
>  static int cfi_intelext_point (struct mtd_info *mtd, loff_t from, size_t len,
> -		     size_t *retlen, u_char **mtdbuf);
> -static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr,
> loff_t from,
> -			size_t len);
> +		     size_t *retlen, void **virt, resource_size_t *phys);
> +static void cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from,
> size_t len);
> 
>  static int chip_ready (struct map_info *map, struct flchip *chip,
> unsigned long adr, int mode);
>  static int get_chip(struct map_info *map, struct flchip *chip,
> unsigned long adr, int mode);
> @@ -1237,7 +1236,8 @@ static int do_point_onechip (struct map_info
> *map, struct flchip *chip, loff_t a
>  	return ret;
>  }
> 
> -static int cfi_intelext_point (struct mtd_info *mtd, loff_t from,
> size_t len, size_t *retlen, u_char **mtdbuf)
> +static int cfi_intelext_point(struct mtd_info *mtd, loff_t from, size_t len,
> +		size_t *retlen, void **virt, resource_size_t *phys)
>  {
>  	struct map_info *map = mtd->priv;
>  	struct cfi_private *cfi = map->fldrv_priv;
> @@ -1254,8 +1254,10 @@ static int cfi_intelext_point (struct mtd_info
> *mtd, loff_t from, size_t len, si
>  	chipnum = (from >> cfi->chipshift);
>  	ofs = from - (chipnum << cfi->chipshift);
> 
> -	*mtdbuf = (void *)map->virt + cfi->chips[chipnum].start + ofs;
> +	*virt = map->virt + cfi->chips[chipnum].start + ofs;
>  	*retlen = 0;
> +	if (phys)
> +		*phys = map->phys + cfi->chips[chipnum].start + ofs;
> 
>  	while (len) {
>  		unsigned long thislen;
> @@ -1288,7 +1290,7 @@ static int cfi_intelext_point (struct mtd_info
> *mtd, loff_t from, size_t len, si
>  	return 0;
>  }
> 
> -static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr,
> loff_t from, size_t len)
> +static void cfi_intelext_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>  	struct map_info *map = mtd->priv;
>  	struct cfi_private *cfi = map->fldrv_priv;
> diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
> index e427c82..fe39a9d 100644
> --- a/drivers/mtd/devices/mtdram.c
> +++ b/drivers/mtd/devices/mtdram.c
> @@ -47,18 +47,21 @@ static int ram_erase(struct mtd_info *mtd, struct
> erase_info *instr)
>  }
> 
>  static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
> -		size_t *retlen, u_char **mtdbuf)
> +		size_t *retlen, void **virt, resource_size_t *phys)
>  {
>  	if (from + len > mtd->size)
>  		return -EINVAL;
> 
> -	*mtdbuf = mtd->priv + from;
> +	/* can we return a physical address with this driver? */
> +	if (phys)
> +		return -EINVAL;
> +
> +	*virt = mtd->priv + from;
>  	*retlen = len;
>  	return 0;
>  }
> 
> -static void ram_unpoint(struct mtd_info *mtd, u_char * addr, loff_t from,
> -		size_t len)
> +static void ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>  }
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 180298b..2b4d739 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -57,20 +57,21 @@ static int phram_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>  }
> 
>  static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
> -		size_t *retlen, u_char **mtdbuf)
> +		size_t *retlen, void **virt, resource_size_t *phys)
>  {
> -	u_char *start = mtd->priv;
> -
>  	if (from + len > mtd->size)
>  		return -EINVAL;
> 
> -	*mtdbuf = start + from;
> +	/* can we return a physical address with this driver? */
> +	if (phys)
> +		return -EINVAL;
> +
> +	*virt = mtd->priv + from;
>  	*retlen = len;
>  	return 0;
>  }
> 
> -static void phram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t from,
> -		size_t len)
> +static void phram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>  }
> 
> diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
> index 7060a08..bc99817 100644
> --- a/drivers/mtd/devices/pmc551.c
> +++ b/drivers/mtd/devices/pmc551.c
> @@ -134,7 +134,8 @@ static int pmc551_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>  	eoff_lo = end & (priv->asize - 1);
>  	soff_lo = instr->addr & (priv->asize - 1);
> 
> -	pmc551_point(mtd, instr->addr, instr->len, &retlen, &ptr);
> +	pmc551_point(mtd, instr->addr, instr->len, &retlen,
> +		     (void **)&ptr, NULL);
> 
>  	if (soff_hi == eoff_hi || mtd->size == priv->asize) {
>  		/* The whole thing fits within one access, so just one shot
> @@ -154,7 +155,8 @@ static int pmc551_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>  			}
>  			soff_hi += priv->asize;
>  			pmc551_point(mtd, (priv->base_map0 | soff_hi),
> -				     priv->asize, &retlen, &ptr);
> +				     priv->asize, &retlen,
> +				     (void **)&ptr, NULL);
>  		}
>  		memset(ptr, 0xff, eoff_lo);
>  	}
> @@ -170,7 +172,7 @@ static int pmc551_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>  }
> 
>  static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
> -			size_t * retlen, u_char ** mtdbuf)
> +			size_t *retlen, void **virt, resource_size_t *phys)
>  {
>  	struct mypriv *priv = mtd->priv;
>  	u32 soff_hi;
> @@ -188,6 +190,10 @@ static int pmc551_point(struct mtd_info *mtd,
> loff_t from, size_t len,
>  		return -EINVAL;
>  	}
> 
> +	/* can we return a physical address with this driver? */
> +	if (phys)
> +		return -EINVAL;
> +
>  	soff_hi = from & ~(priv->asize - 1);
>  	soff_lo = from & (priv->asize - 1);
> 
> @@ -198,13 +204,12 @@ static int pmc551_point(struct mtd_info *mtd,
> loff_t from, size_t len,
>  		priv->curr_map0 = soff_hi;
>  	}
> 
> -	*mtdbuf = priv->start + soff_lo;
> +	*virt = priv->start + soff_lo;
>  	*retlen = len;
>  	return 0;
>  }
> 
> -static void pmc551_unpoint(struct mtd_info *mtd, u_char * addr, loff_t from,
> -			   size_t len)
> +static void pmc551_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>  #ifdef CONFIG_MTD_PMC551_DEBUG
>  	printk(KERN_DEBUG "pmc551_unpoint()\n");
> @@ -242,7 +247,7 @@ static int pmc551_read(struct mtd_info *mtd,
> loff_t from, size_t len,
>  	soff_lo = from & (priv->asize - 1);
>  	eoff_lo = end & (priv->asize - 1);
> 
> -	pmc551_point(mtd, from, len, retlen, &ptr);
> +	pmc551_point(mtd, from, len, retlen, (void **)&ptr, NULL);
> 
>  	if (soff_hi == eoff_hi) {
>  		/* The whole thing fits within one access, so just one shot
> @@ -263,7 +268,8 @@ static int pmc551_read(struct mtd_info *mtd,
> loff_t from, size_t len,
>  				goto out;
>  			}
>  			soff_hi += priv->asize;
> -			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
> +			pmc551_point(mtd, soff_hi, priv->asize, retlen,
> +				     (void **)&ptr, NULL);
>  		}
>  		memcpy(copyto, ptr, eoff_lo);
>  		copyto += eoff_lo;
> @@ -308,7 +314,7 @@ static int pmc551_write(struct mtd_info *mtd,
> loff_t to, size_t len,
>  	soff_lo = to & (priv->asize - 1);
>  	eoff_lo = end & (priv->asize - 1);
> 
> -	pmc551_point(mtd, to, len, retlen, &ptr);
> +	pmc551_point(mtd, to, len, retlen, (void **)&ptr, NULL);
> 
>  	if (soff_hi == eoff_hi) {
>  		/* The whole thing fits within one access, so just one shot
> @@ -329,7 +335,8 @@ static int pmc551_write(struct mtd_info *mtd,
> loff_t to, size_t len,
>  				goto out;
>  			}
>  			soff_hi += priv->asize;
> -			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
> +			pmc551_point(mtd, soff_hi, priv->asize, retlen,
> +				     (void **)&ptr, NULL);
>  		}
>  		memcpy(ptr, copyfrom, eoff_lo);
>  		copyfrom += eoff_lo;
> diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
> index d293add..cb86db7 100644
> --- a/drivers/mtd/devices/slram.c
> +++ b/drivers/mtd/devices/slram.c
> @@ -76,8 +76,9 @@ static char *map;
>  static slram_mtd_list_t *slram_mtdlist = NULL;
> 
>  static int slram_erase(struct mtd_info *, struct erase_info *);
> -static int slram_point(struct mtd_info *, loff_t, size_t, size_t *, u_char **);
> -static void slram_unpoint(struct mtd_info *, u_char *, loff_t,	size_t);
> +static int slram_point(struct mtd_info *, loff_t, size_t, size_t *, void **,
> +		resource_size_t *);
> +static void slram_unpoint(struct mtd_info *, loff_t, size_t);
>  static int slram_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
>  static int slram_write(struct mtd_info *, loff_t, size_t, size_t *,
> const u_char *);
> 
> @@ -104,19 +105,23 @@ static int slram_erase(struct mtd_info *mtd,
> struct erase_info *instr)
>  }
> 
>  static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
> -		size_t *retlen, u_char **mtdbuf)
> +		size_t *retlen, void **virt, resource_size_t *phys)
>  {
>  	slram_priv_t *priv = mtd->priv;
> 
> +	/* can we return a physical address with this driver? */
> +	if (phys)
> +		return -EINVAL;
> +
>  	if (from + len > mtd->size)
>  		return -EINVAL;
> 
> -	*mtdbuf = priv->start + from;
> +	*virt = priv->start + from;
>  	*retlen = len;
>  	return(0);
>  }
> 
> -static void slram_unpoint(struct mtd_info *mtd, u_char *addr, loff_t
> from, size_t len)
> +static void slram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>  }
> 
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index 14ffb1a..c42f4b8 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -40,10 +40,12 @@ struct mtd_partition uclinux_romfs[] = {
>  /****************************************************************************/
> 
>  int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
> -	size_t *retlen, u_char **mtdbuf)
> +	size_t *retlen, void **virt, resource_size_t *phys)
>  {
>  	struct map_info *map = mtd->priv;
> -	*mtdbuf = (u_char *) (map->virt + ((int) from));
> +	*virt = map->virt + from;
> +	if (phys)
> +		*phys = map->phys + from;
>  	*retlen = len;
>  	return(0);
>  }
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index c66902d..07c7011 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -68,7 +68,7 @@ static int part_read (struct mtd_info *mtd, loff_t
> from, size_t len,
>  }
> 
>  static int part_point (struct mtd_info *mtd, loff_t from, size_t len,
> -			size_t *retlen, u_char **buf)
> +			size_t *retlen, void **virt, resource_size_t *phys)
>  {
>  	struct mtd_part *part = PART(mtd);
>  	if (from >= mtd->size)
> @@ -76,14 +76,14 @@ static int part_point (struct mtd_info *mtd,
> loff_t from, size_t len,
>  	else if (from + len > mtd->size)
>  		len = mtd->size - from;
>  	return part->master->point (part->master, from + part->offset,
> -				    len, retlen, buf);
> +				    len, retlen, virt, phys);
>  }
> 
> -static void part_unpoint (struct mtd_info *mtd, u_char *addr, loff_t
> from, size_t len)
> +static void part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>  	struct mtd_part *part = PART(mtd);
> 
> -	part->master->unpoint (part->master, addr, from + part->offset, len);
> +	part->master->unpoint(part->master, from + part->offset, len);
>  }
> 
>  static int part_read_oob(struct mtd_info *mtd, loff_t from,
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index a1db918..6c2a046 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -332,7 +332,8 @@ static int jffs2_block_check_erase(struct
> jffs2_sb_info *c, struct jffs2_erasebl
>  	if (c->mtd->point) {
>  		unsigned long *wordebuf;
> 
> -		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size, &retlen,
> (unsigned char **)&ebuf);
> +		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size,
> +				    &retlen, &ebuf, NULL);
>  		if (ret) {
>  			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
>  			goto do_flash_read;
> @@ -340,7 +341,7 @@ static int jffs2_block_check_erase(struct
> jffs2_sb_info *c, struct jffs2_erasebl
>  		if (retlen < c->sector_size) {
>  			/* Don't muck about if it won't let us point to the whole erase sector */
>  			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", retlen));
> -			c->mtd->unpoint(c->mtd, ebuf, jeb->offset, retlen);
> +			c->mtd->unpoint(c->mtd, jeb->offset, retlen);
>  			goto do_flash_read;
>  		}
>  		wordebuf = ebuf-sizeof(*wordebuf);
> @@ -349,7 +350,7 @@ static int jffs2_block_check_erase(struct
> jffs2_sb_info *c, struct jffs2_erasebl
>  		   if (*++wordebuf != ~0)
>  			   break;
>  		} while(--retlen);
> -		c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
> +		c->mtd->unpoint(c->mtd, jeb->offset, c->sector_size);
>  		if (retlen)
>  			printk(KERN_WARNING "Newly-erased block contained word 0x%lx at
> offset 0x%08tx\n",
>  			       *wordebuf, jeb->offset + c->sector_size-retlen*sizeof(*wordebuf));
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> index e512a93..22acc12 100644
> --- a/fs/jffs2/readinode.c
> +++ b/fs/jffs2/readinode.c
> @@ -63,10 +63,11 @@ static int check_node_data(struct jffs2_sb_info
> *c, struct jffs2_tmp_dnode_info
>  	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
>  	 * adding and jffs2_flash_read_end() interface. */
>  	if (c->mtd->point) {
> -		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
> +		err = c->mtd->point(c->mtd, ofs, len, &retlen,
> +				    (void **)&buffer, NULL);
>  		if (!err && retlen < len) {
>  			JFFS2_WARNING("MTD point returned len too short: %zu instead of
> %u.\n", retlen, tn->csize);
> -			c->mtd->unpoint(c->mtd, buffer, ofs, retlen);
> +			c->mtd->unpoint(c->mtd, ofs, retlen);
>  		} else if (err)
>  			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
>  		else
> @@ -100,7 +101,7 @@ static int check_node_data(struct jffs2_sb_info
> *c, struct jffs2_tmp_dnode_info
>  		kfree(buffer);
>  #ifndef __ECOS
>  	else
> -		c->mtd->unpoint(c->mtd, buffer, ofs, len);
> +		c->mtd->unpoint(c->mtd, ofs, len);
>  #endif
> 
>  	if (crc != tn->data_crc) {
> @@ -136,7 +137,7 @@ free_out:
>  		kfree(buffer);
>  #ifndef __ECOS
>  	else
> -		c->mtd->unpoint(c->mtd, buffer, ofs, len);
> +		c->mtd->unpoint(c->mtd, ofs, len);
>  #endif
>  	return err;
>  }
> diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
> index 272872d..b1b3884 100644
> --- a/fs/jffs2/scan.c
> +++ b/fs/jffs2/scan.c
> @@ -97,11 +97,12 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
>  	size_t pointlen;
> 
>  	if (c->mtd->point) {
> -		ret = c->mtd->point (c->mtd, 0, c->mtd->size, &pointlen, &flashbuf);
> +		ret = c->mtd->point(c->mtd, 0, c->mtd->size, &pointlen,
> +				    (void **)&flashbuf, NULL);
>  		if (!ret && pointlen < c->mtd->size) {
>  			/* Don't muck about if it won't let us point to the whole flash */
>  			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n",
> pointlen));
> -			c->mtd->unpoint(c->mtd, flashbuf, 0, pointlen);
> +			c->mtd->unpoint(c->mtd, 0, pointlen);
>  			flashbuf = NULL;
>  		}
>  		if (ret)
> @@ -267,7 +268,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
>  		kfree(flashbuf);
>  #ifndef __ECOS
>  	else
> -		c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
> +		c->mtd->unpoint(c->mtd, 0, c->mtd->size);
>  #endif
>  	if (s)
>  		kfree(s);
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 0a13bb3..245f909 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -143,10 +143,12 @@ struct mtd_info {
>  	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);
> 
>  	/* This stuff for eXecute-In-Place */
> -	int (*point) (struct mtd_info *mtd, loff_t from, size_t len, size_t
> *retlen, u_char **mtdbuf);
> +	/* phys is optional and may be set to NULL */
> +	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
> +			size_t *retlen, void **virt, resource_size_t *phys);
> 
>  	/* We probably shouldn't allow XIP if the unpoint isn't a NULL */
> -	void (*unpoint) (struct mtd_info *mtd, u_char * addr, loff_t from,
> size_t len);
> +	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
> 
> 
>  	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t
> *retlen, u_char *buf);
> diff --git a/include/linux/mtd/pmc551.h b/include/linux/mtd/pmc551.h
> index a7f6d20..5cc070c 100644
> --- a/include/linux/mtd/pmc551.h
> +++ b/include/linux/mtd/pmc551.h
> @@ -36,8 +36,9 @@ struct mypriv {
>   * Function Prototypes
>   */
>  static int pmc551_erase(struct mtd_info *, struct erase_info *);
> -static void pmc551_unpoint(struct mtd_info *, u_char *, loff_t, size_t);
> -static int pmc551_point (struct mtd_info *mtd, loff_t from, size_t
> len, size_t *retlen, u_char **mtdbuf);
> +static void pmc551_unpoint(struct mtd_info *, loff_t, size_t);
> +static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
> +		size_t *retlen, void **virt, resource_size_t *phys);
>  static int pmc551_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
>  static int pmc551_write(struct mtd_info *, loff_t, size_t, size_t *,
> const u_char *);
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Jörn

-- 
It does not require a majority to prevail, but rather an irate,
tireless minority keen to set brush fires in people's minds.
-- Samuel Adams
