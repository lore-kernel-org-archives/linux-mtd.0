Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVAQF-0000ft-Un
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 04:38:21 +0000
Received: by mail-pf0-x242.google.com with SMTP id g202so16393161pfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 03 Aug 2016 21:37:59 -0700 (PDT)
Date: Thu, 4 Aug 2016 12:37:51 +0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 George Spelvin <linux@sciencehorizons.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: introduce the mtd_pairing_scheme concept
Message-ID: <20160804043751.GA914@localhost>
References: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
 <1466430618-9713-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466430618-9713-2-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Jun 20, 2016 at 03:50:16PM +0200, Boris Brezillon wrote:
> MLC and TLC NAND devices are using NAND cells exposing more than one bit,
> but instead of attaching all the bits in a given cell to a single NAND
> page, each bit is usually attached to a different page. This concept is
> called 'page pairing', and has significant impacts on the flash storage
> usage.
> The main problem showed by these devices is that interrupting a page
> program operation may not only corrupt the page we are programming
> but also the page it is paired with, hence the need to expose to MTD
> users the pairing scheme information.
> 
> The pairing APIs allows one to query pairing information attached to a
> given page (here called wunit), or the other way around (the wunit
> pointed by pairing information).
> It also provides several helpers to help the conversion between absolute
> offsets and wunits, and query the number of pairing groups.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Overall, the comments and documentation are a lot better on this one.
Thanks for doing that! I only have a few more small comments, and with
those, I think it's ready to land IMO. I'll try to review the NAND
implementation bits too (look OK for now), but I'm not as worried about
that, if we agree on the high-level API.

BTW, I don't know if we're likely to hit any conflicts on the
mtdcore and mtd.h bits. Perhaps it will make sense for us to apply this
first patch as a mini-branch to both our trees? Maybe if you just fixup
any last comments, you can send me a trivial pull request / tag /
whatever (doesn't need to be formal), with just this patch.

> ---
>  drivers/mtd/mtdcore.c   |  94 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/mtdpart.c   |   1 +
>  include/linux/mtd/mtd.h | 106 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 201 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index e3936b847c6b..decceb9fdf32 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -376,6 +376,100 @@ static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
>  }
>  
>  /**
> + * mtd_wunit_to_pairing_info - get pairing information of a wunit
> + * @mtd: pointer to new MTD device info structure
> + * @wunit: write unit we are interrested in

s/interrested/interested/

> + * @info: pairing information struct

Maybe something to indicate this is the return value? e.g., "returned
pairing information"?

> + *
> + * Retrieve pairing information associated to the wunit.
> + * This is mainly useful when dealing with MLC/TLC NANDs where pages can be
> + * paired together, and where programming a page may influence the page it is
> + * paired with.
> + * The notion of page is replaced by the term wunit (write-unit) to stay
> + * consistent with the ->writesize field.
> + *
> + * The @wunit argument can be extracted from an absolute offset using
> + * mtd_offset_to_wunit(). @info is filled with the pairing information attached
> + * to @wunit.
> + *
> + * From the pairing info the MTD user can find all the wunits paired with
> + * @wunit using the following loop:
> + *
> + * for (i = 0; i < mtd_pairing_groups(mtd); i++) {
> + *	info.pair = i;
> + *	mtd_pairing_info_to_wunit(mtd, &info);
> + *	...
> + * }
> + */
> +void mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
> +			       struct mtd_pairing_info *info)
> +{

Do we want to do any range-checking here? i.e., make this return int? Or
is that too paranoid? We've done similarly on most of the rest of the
MTD API.

Notably, I think we're probably safe keeping the ->pairing->get_info()
callback as returning void, since the driver can expect this core helper
to do the range checking for us.

> +	if (!mtd->pairing || !mtd->pairing->get_info) {
> +		info->group = 0;
> +		info->pair = wunit;
> +	} else {
> +		mtd->pairing->get_info(mtd, wunit, info);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtd_wunit_to_pairing_info);
> +
> +/**
> + * mtd_wunit_to_pairing_info - get wunit from pairing information
> + * @mtd: pointer to new MTD device info structure
> + * @info: pairing information struct
> + *
> + * Returns a positive number representing the wunit associated to the info
> + * struct, or a negative error code.
> + *
> + * This is the reverse of mtd_wunit_to_pairing_info(), and can help one to
> + * iterate over all wunits of a given pair (see mtd_wunit_to_pairing_info()
> + * doc).
> + *
> + * It can also be used to only program the first page of each pair (i.e.
> + * page attached to group 0), which allows one to use an MLC NAND in
> + * software-emulated SLC mode:
> + *
> + * info.group = 0;
> + * for (info.pair = 0; info < mtd_wunit_per_eb(mtd); info.pair++) {

(I know it's just example code, but...) the second clause should have
'info.pair < ...', not 'info < ...'.

> + *	wunit = mtd_pairing_info_to_wunit(mtd, &info);
> + *	mtd_write(mtd, mtd_wunit_to_offset(mtd, blkoffs, wunit),
> + *		  mtd->writesize, &retlen, buf + (i * mtd->writesize));
> + * }
> + */
> +int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
> +			      const struct mtd_pairing_info *info)
> +{

Any range checking on info->group or info->pair? What about
NULL-checking 'info'?

> +	if (!mtd->pairing || !mtd->pairing->get_info) {
> +		if (info->group)
> +			return -EINVAL;
> +
> +		return info->pair;
> +	}
> +
> +	return mtd->pairing->get_wunit(mtd, info);
> +}
> +EXPORT_SYMBOL_GPL(mtd_pairing_info_to_wunit);
> +
> +/**
> + * mtd_pairing_groups - get the number of pairing groups
> + * @mtd: pointer to new MTD device info structure
> + *
> + * Returns the number of pairing groups.
> + *
> + * This number is usually equal to the number of bits exposed by a single
> + * cell, and can be used in conjunction with mtd_pairing_info_to_wunit()
> + * to iterate over all pages of a given pair.
> + */
> +int mtd_pairing_groups(struct mtd_info *mtd)
> +{
> +	if (!mtd->pairing || !mtd->pairing->ngroups)
> +		return 1;
> +
> +	return mtd->pairing->ngroups;
> +}
> +EXPORT_SYMBOL_GPL(mtd_pairing_groups);
> +
> +/**
>   *	add_mtd_device - register an MTD device
>   *	@mtd: pointer to new MTD device info structure
>   *
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 1f13e32556f8..e32a0ac2298f 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -397,6 +397,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  	slave->mtd.oobsize = master->oobsize;
>  	slave->mtd.oobavail = master->oobavail;
>  	slave->mtd.subpage_sft = master->subpage_sft;
> +	slave->mtd.pairing = master->pairing;
>  
>  	slave->mtd.name = name;
>  	slave->mtd.owner = master->owner;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 29a170612203..00bcacb16176 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -127,6 +127,81 @@ struct mtd_ooblayout_ops {
>  		    struct mtd_oob_region *oobfree);
>  };
>  
> +/**
> + * struct mtd_pairing_info - page pairing information
> + *
> + * @pair: pair id
> + * @group: group id
> + *
> + * The pair word is used here, even though TLC NANDs might group pages by 3

Nit: "The pair word is used" is somewhat confusing on first read, IMO. I
think maybe it's partly the ordering of the words, as well as the use
"word" which has different technical meaning sometime... Maybe one of
the following?

  The word "pair" is used here ...
  The term "pair" is used here ...

(Sorry, very nitpicky.)

> + * (3 bits in a single cell). A pair should regroup all pages that are sharing
> + * the same cell. Pairs are then indexed in ascending order.
> + *
> + * @group is defining the position of a page in a given pair. It can also be
> + * seen as the bit position in the cell: page attached to bit 0 belongs to
> + * group 0, page attached to bit 1 belongs to group 1, etc.
> + *
> + * Example:
> + * The H27UCG8T2BTR-BC datasheet describes the following pairing scheme:
> + *
> + *		group-0		group-1
> + *
> + *  pair-0	page-0		page-4
> + *  pair-1	page-1		page-5
> + *  pair-2	page-2		page-8
> + *  ...
> + *  pair-127	page-251	page-255
> + *
> + *
> + * Note that the "group" and "pair" terms were extracted from Samsung and
> + * Hynix datasheets, and might be referenced under other names in other
> + * datasheets (Micron is describing this concept as "shared pages").

Very, very helpful (to me, even though I'm moderately familiar with the
concepts, but hopefully moreso for others who want to read and
understand this). Thanks for writing this up.

> + */
> +struct mtd_pairing_info {
> +	int pair;
> +	int group;
> +};
> +
> +/**
> + * struct mtd_pairing_scheme - page pairing scheme description
> + *
> + * @ngroups: number of groups. Should be related to the number of bits
> + *	     per cell.
> + * @get_info: converts a write-unit (page number within an erase block) into
> + *	      mtd_pairing information (pair + group). This function should
> + *	      fill the info parameter based on the wunit index.
> + * @get_wunit: converts pairing information into a write-unit (page) number.
> + *	       This function should return the wunit index pointed by the
> + *	       pairing information described in the info argument. It should
> + *	       return -EINVAL, if there's no wunit corresponding to the
> + *	       passed pairing information.
> + *
> + * See mtd_pairing_info documentation for a detailed explanation of the
> + * pair and group concepts.
> + *
> + * The mtd_pairing_scheme structure provides a generic solution to represent
> + * NAND page pairing scheme. Instead of exposing two big tables to do the
> + * write-unit <-> (pair + group) conversions, we ask the MTD drivers to
> + * implement the ->get_info() and ->get_wunit() functions.
> + *
> + * MTD users will then be able to query these information by using the
> + * mtd_pairing_info_to_wunit() and mtd_wunit_to_pairing_info() helpers.
> + *
> + * @ngroups is here to help MTD users iterating over all the pages in a
> + * given pair. This value can be retrieved by MTD users using the
> + * mtd_pairing_groups() helper.
> + *
> + * Examples are given in the mtd_pairing_info_to_wunit() and
> + * mtd_wunit_to_pairing_info() documentation.
> + */
> +struct mtd_pairing_scheme {
> +	int ngroups;
> +	void (*get_info)(struct mtd_info *mtd, int wunit,
> +			 struct mtd_pairing_info *info);
> +	int (*get_wunit)(struct mtd_info *mtd,
> +			 const struct mtd_pairing_info *info);

Wait, I noted above that get_info() doesn't return errors (and that's
OK, if we do bounds checking in mtdcore), but why does get_wunit(),
then? From the looks of it, you don't actually do any bounds checking in
the implementations in patch 2, right? And couldn't we do any checking
in the mtdcore.c helper anyway?

Unless I'm misunderstanding something, I think we should have both
return errors, or neither.

> +};
> +
>  struct module;	/* only needed for owner field in mtd_info */
>  
>  struct mtd_info {
> @@ -188,6 +263,9 @@ struct mtd_info {
>  	/* OOB layout description */
>  	const struct mtd_ooblayout_ops *ooblayout;
>  
> +	/* NAND pairing scheme, only provided for MLC/TLC NANDs */
> +	const struct mtd_pairing_scheme *pairing;
> +
>  	/* the ecc step size. */
>  	unsigned int ecc_step_size;
>  
> @@ -296,6 +374,12 @@ static inline void mtd_set_ooblayout(struct mtd_info *mtd,
>  	mtd->ooblayout = ooblayout;
>  }
>  
> +static inline void mtd_set_pairing_scheme(struct mtd_info *mtd,
> +				const struct mtd_pairing_scheme *pairing)
> +{
> +	mtd->pairing = pairing;
> +}
> +
>  static inline void mtd_set_of_node(struct mtd_info *mtd,
>  				   struct device_node *np)
>  {
> @@ -312,6 +396,11 @@ static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
>  	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;
>  }
>  
> +void mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
> +			       struct mtd_pairing_info *info);
> +int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
> +			      const struct mtd_pairing_info *info);
> +int mtd_pairing_groups(struct mtd_info *mtd);
>  int mtd_erase(struct mtd_info *mtd, struct erase_info *instr);
>  int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
>  	      void **virt, resource_size_t *phys);
> @@ -397,6 +486,23 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
>  	return do_div(sz, mtd->writesize);
>  }
>  
> +static inline int mtd_wunit_per_eb(struct mtd_info *mtd)
> +{
> +	return mtd->erasesize / mtd->writesize;
> +}
> +
> +static inline int mtd_offset_to_wunit(struct mtd_info *mtd, loff_t offs)
> +{
> +	return mtd_div_by_ws(mtd_mod_by_eb(offs, mtd), mtd);
> +}
> +
> +static inline loff_t mtd_wunit_to_offset(struct mtd_info *mtd, loff_t base,
> +					 int wunit)
> +{
> +	return base + (wunit * mtd->writesize);
> +}
> +
> +
>  static inline int mtd_has_oob(const struct mtd_info *mtd)
>  {
>  	return mtd->_read_oob && mtd->_write_oob;

With the above addressed:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
