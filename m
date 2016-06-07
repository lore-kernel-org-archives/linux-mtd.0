Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAG0Z-0006ji-Lc
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 12:21:33 +0000
Date: Tue, 7 Jun 2016 14:20:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com
Subject: Re: [PATCH 11/13] ubi: LEB consolidation
Message-ID: <20160607142043.56c40549@bbrezillon>
In-Reply-To: <1464609874-15488-12-git-send-email-richard@nod.at>
References: <1464609874-15488-1-git-send-email-richard@nod.at>
 <1464609874-15488-12-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 May 2016 14:04:32 +0200
Richard Weinberger <richard@nod.at> wrote:

> Implements LEB consolidation for MLC NAND. By default data is written
> in SLC mode. As soon UBI runs out of space two fully written PEBs will
> get merged to produce free space.
> The merge operation takes two PEB written in SLC mode and writes back
> all data into one PEB in MLC mode. The operation works almost as atomic
> LEB change and is power cut safe.
> This patch was implemented by Boris Brezillon and me.
>=20
> TODO:
> - Reconstruct =E2=80=9Cfull=E2=80=9D-states upon attach
> - Make all paths generic for pairings > 2 too to support TLC NAND in futu=
re

Hm, I thought it was already the case. Could you point places that are
assuming ->lebs_per_consolidated_peb is <=3D 2?

> - Cut the new on-flash layout into stone and raise UBI version (by having=
 feature flags)
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/Kconfig       |   4 +
>  drivers/mtd/ubi/Makefile      |   1 +
>  drivers/mtd/ubi/attach.c      | 407 ++++++++++++++++++++--------------
>  drivers/mtd/ubi/build.c       |  18 +-
>  drivers/mtd/ubi/cdev.c        |  12 +-
>  drivers/mtd/ubi/consolidate.c | 499 ++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/mtd/ubi/debug.c       |  16 +-
>  drivers/mtd/ubi/debug.h       |   2 +-
>  drivers/mtd/ubi/eba.c         | 411 ++++++++++++++++++++++++++++------
>  drivers/mtd/ubi/fastmap-wl.c  |  19 +-
>  drivers/mtd/ubi/fastmap.c     | 261 +++++++++++++++-------
>  drivers/mtd/ubi/kapi.c        |  14 +-
>  drivers/mtd/ubi/ubi-media.h   |  18 +-
>  drivers/mtd/ubi/ubi.h         | 162 +++++++++++---
>  drivers/mtd/ubi/upd.c         |   2 +-
>  drivers/mtd/ubi/vmt.c         | 104 +++++----
>  drivers/mtd/ubi/vtbl.c        |  87 +++++---
>  drivers/mtd/ubi/wl.c          | 187 +++++++++++-----
>  18 files changed, 1718 insertions(+), 506 deletions(-)
>  create mode 100644 drivers/mtd/ubi/consolidate.c
>=20
> diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
> index f0855ce..a6f7d3b 100644
> --- a/drivers/mtd/ubi/Kconfig
> +++ b/drivers/mtd/ubi/Kconfig
> @@ -103,4 +103,8 @@ config MTD_UBI_BLOCK
> =20
>  	   If in doubt, say "N".
> =20
> +config MTD_UBI_CONSOLIDATE
> +	bool "LEB consolidation support"
> +	default n
> +
>  endif # MTD_UBI
> diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
> index e9d4b1d..86a77c5 100644
> --- a/drivers/mtd/ubi/Makefile
> +++ b/drivers/mtd/ubi/Makefile
> @@ -4,5 +4,6 @@ ubi-y +=3D vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o=
 io.o wl.o attach.o
>  ubi-y +=3D work.o misc.o debug.o
>  ubi-$(CONFIG_MTD_UBI_FASTMAP) +=3D fastmap.o
>  ubi-$(CONFIG_MTD_UBI_BLOCK) +=3D block.o
> +ubi-$(CONFIG_MTD_UBI_CONSOLIDATE) +=3D consolidate.o
> =20
>  obj-$(CONFIG_MTD_UBI_GLUEBI) +=3D gluebi.o
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index c1aaf03..d1bd34c 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -116,10 +116,14 @@ static struct ubi_vid_hdr *vidh;
>   * returns zero in case of success and a negative error code in case of
>   * failure.
>   */
> -static int add_to_list(struct ubi_attach_info *ai, int pnum, int vol_id,
> -		       int lnum, int ec, int to_head, struct list_head *list)
> +static void add_peb_to_list(struct ubi_attach_info *ai,
> +			    struct ubi_ainf_peb *aeb, int to_head,
> +			    struct list_head *list)
>  {
> -	struct ubi_ainf_peb *aeb;
> +	int pnum =3D aeb->pnum, ec =3D aeb->ec;
> +
> +	if (!list_empty(&aeb->list))
> +		list_del(&aeb->list);
> =20
>  	if (list =3D=3D &ai->free) {
>  		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
> @@ -131,18 +135,28 @@ static int add_to_list(struct ubi_attach_info *ai, =
int pnum, int vol_id,
>  	} else
>  		BUG();
> =20
> -	aeb =3D kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
> +	if (to_head)
> +		list_add(&aeb->list, list);
> +	else
> +		list_add_tail(&aeb->list, list);
> +
> +}
> +
> +static int add_to_list(struct ubi_attach_info *ai, int pnum, int ec,
> +		       int to_head, struct list_head *list)
> +{
> +	struct ubi_ainf_peb *aeb;
> +
> +	aeb =3D kmem_cache_zalloc(ai->apeb_slab_cache, GFP_KERNEL);
>  	if (!aeb)
>  		return -ENOMEM;
> =20
> +	INIT_LIST_HEAD(&aeb->list);
>  	aeb->pnum =3D pnum;
> -	aeb->vol_id =3D vol_id;
> -	aeb->lnum =3D lnum;
>  	aeb->ec =3D ec;
> -	if (to_head)
> -		list_add(&aeb->u.list, list);
> -	else
> -		list_add_tail(&aeb->u.list, list);
> +
> +	add_peb_to_list(ai, aeb, to_head, list);
> +
>  	return 0;
>  }
> =20
> @@ -163,14 +177,15 @@ static int add_corrupted(struct ubi_attach_info *ai=
, int pnum, int ec)
> =20
>  	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
> =20
> -	aeb =3D kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
> +	aeb =3D kmem_cache_alloc(ai->apeb_slab_cache, GFP_KERNEL);
>  	if (!aeb)
>  		return -ENOMEM;
> =20
> +	INIT_LIST_HEAD(&aeb->list);
>  	ai->corr_peb_count +=3D 1;
>  	aeb->pnum =3D pnum;
>  	aeb->ec =3D ec;
> -	list_add(&aeb->u.list, &ai->corr);
> +	list_add(&aeb->list, &ai->corr);
>  	return 0;
>  }
> =20
> @@ -321,8 +336,8 @@ static struct ubi_ainf_volume *add_volume(struct ubi_=
attach_info *ai,
>   *     o bit 2 is cleared: the older LEB is not corrupted;
>   *     o bit 2 is set: the older LEB is corrupted.
>   */
> -int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *=
aeb,
> -			int pnum, const struct ubi_vid_hdr *vid_hdr)
> +int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_leb *=
aeb,
> +		     int pnum, const struct ubi_vid_hdr *vid_hdr)
>  {
>  	int len, err, second_is_newer, bitflips =3D 0, corrupted =3D 0;
>  	uint32_t data_crc, crc;
> @@ -362,6 +377,8 @@ int ubi_compare_lebs(struct ubi_device *ubi, const st=
ruct ubi_ainf_peb *aeb,
>  			return 1;
>  		}
>  	} else {
> +		int nvidh =3D ubi->lebs_per_cpeb;
> +
>  		if (!aeb->copy_flag) {
>  			/* It is not a copy, so it is newer */
>  			dbg_bld("first PEB %d is newer, copy_flag is unset",
> @@ -373,8 +390,8 @@ int ubi_compare_lebs(struct ubi_device *ubi, const st=
ruct ubi_ainf_peb *aeb,
>  		if (!vh)
>  			return -ENOMEM;
> =20
> -		pnum =3D aeb->pnum;
> -		err =3D ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
> +		pnum =3D aeb->peb->pnum;
> +		err =3D ubi_io_read_vid_hdrs(ubi, pnum, vh, &nvidh, 0);
>  		if (err) {
>  			if (err =3D=3D UBI_IO_BITFLIPS)
>  				bitflips =3D 1;
> @@ -388,7 +405,8 @@ int ubi_compare_lebs(struct ubi_device *ubi, const st=
ruct ubi_ainf_peb *aeb,
>  			}
>  		}
> =20
> -		vid_hdr =3D vh;
> +		ubi_assert(aeb->peb_pos < nvidh);
> +		vid_hdr =3D &vh[aeb->peb_pos];
>  	}
> =20
>  	/* Read the data of the copy and check the CRC */
> @@ -446,18 +464,21 @@ out_free_vidh:
>   * to be picked, while the older one has to be dropped. This function re=
turns
>   * zero in case of success and a negative error code in case of failure.
>   */
> -int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, in=
t pnum,
> -		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips)
> +int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai,
> +		  struct ubi_ainf_peb *peb, const struct ubi_vid_hdr *vid_hdr,
> +		  int peb_pos, int bitflips, bool full)
>  {
> -	int err, vol_id, lnum;
> +	int err, vol_id, lnum, pnum, ec;
>  	unsigned long long sqnum;
>  	struct ubi_ainf_volume *av;
> -	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_leb *leb;
>  	struct rb_node **p, *parent =3D NULL;
> =20
>  	vol_id =3D be32_to_cpu(vid_hdr->vol_id);
>  	lnum =3D be32_to_cpu(vid_hdr->lnum);
>  	sqnum =3D be64_to_cpu(vid_hdr->sqnum);
> +	pnum =3D peb->pnum;
> +	ec =3D peb->ec;
> =20
>  	dbg_bld("PEB %d, LEB %d:%d, EC %d, sqnum %llu, bitflips %d",
>  		pnum, vol_id, lnum, ec, sqnum, bitflips);
> @@ -478,9 +499,9 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_=
attach_info *ai, int pnum,
>  		int cmp_res;
> =20
>  		parent =3D *p;
> -		aeb =3D rb_entry(parent, struct ubi_ainf_peb, u.rb);
> -		if (lnum !=3D aeb->lnum) {
> -			if (lnum < aeb->lnum)
> +		leb =3D rb_entry(parent, struct ubi_ainf_leb, rb);
> +		if (lnum !=3D leb->desc.lnum) {
> +			if (lnum < leb->desc.lnum)
>  				p =3D &(*p)->rb_left;
>  			else
>  				p =3D &(*p)->rb_right;
> @@ -493,7 +514,7 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_=
attach_info *ai, int pnum,
>  		 */
> =20
>  		dbg_bld("this LEB already exists: PEB %d, sqnum %llu, EC %d",
> -			aeb->pnum, aeb->sqnum, aeb->ec);
> +			leb->peb->pnum, leb->sqnum, leb->peb->ec);
> =20
>  		/*
>  		 * Make sure that the logical eraseblocks have different
> @@ -508,10 +529,10 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ub=
i_attach_info *ai, int pnum,
>  		 * images, but refuse attaching old images with duplicated
>  		 * logical eraseblocks because there was an unclean reboot.
>  		 */
> -		if (aeb->sqnum =3D=3D sqnum && sqnum !=3D 0) {
> +		if (leb->sqnum =3D=3D sqnum && sqnum !=3D 0) {
>  			ubi_err(ubi, "two LEBs with same sequence number %llu",
>  				sqnum);
> -			ubi_dump_aeb(aeb, 0);
> +			ubi_dump_aeb(leb, 0);
>  			ubi_dump_vid_hdr(vid_hdr);
>  			return -EINVAL;
>  		}
> @@ -520,7 +541,7 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_=
attach_info *ai, int pnum,
>  		 * Now we have to drop the older one and preserve the newer
>  		 * one.
>  		 */
> -		cmp_res =3D ubi_compare_lebs(ubi, aeb, pnum, vid_hdr);
> +		cmp_res =3D ubi_compare_lebs(ubi, leb, pnum, vid_hdr);
>  		if (cmp_res < 0)
>  			return cmp_res;
> =20
> @@ -533,19 +554,16 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ub=
i_attach_info *ai, int pnum,
>  			if (err)
>  				return err;
> =20
> -			err =3D add_to_list(ai, aeb->pnum, aeb->vol_id,
> -					  aeb->lnum, aeb->ec, cmp_res & 4,
> -					  &ai->erase);
> -			if (err)
> -				return err;
> +			if (--leb->peb->refcount <=3D 0)
> +				add_peb_to_list(ai, leb->peb, cmp_res & 4,
> +						&ai->erase);
> =20
> -			aeb->ec =3D ec;
> -			aeb->pnum =3D pnum;
> -			aeb->vol_id =3D vol_id;
> -			aeb->lnum =3D lnum;
> -			aeb->scrub =3D ((cmp_res & 2) || bitflips);
> -			aeb->copy_flag =3D vid_hdr->copy_flag;
> -			aeb->sqnum =3D sqnum;
> +			leb->peb_pos =3D peb_pos;
> +			leb->peb =3D peb;
> +			peb->scrub =3D ((cmp_res & 2) || bitflips || peb->scrub);
> +			leb->copy_flag =3D vid_hdr->copy_flag;
> +			leb->sqnum =3D sqnum;
> +			leb->full =3D full;
> =20
>  			if (av->highest_lnum =3D=3D lnum)
>  				av->last_data_size =3D
> @@ -557,8 +575,11 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi=
_attach_info *ai, int pnum,
>  			 * This logical eraseblock is older than the one found
>  			 * previously.
>  			 */
> -			return add_to_list(ai, pnum, vol_id, lnum, ec,
> -					   cmp_res & 4, &ai->erase);
> +			if (--peb->refcount <=3D 0)
> +				add_peb_to_list(ai, peb, cmp_res & 4,
> +						&ai->erase);
> +
> +			return 0;
>  		}
>  	}
> =20
> @@ -571,17 +592,18 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ub=
i_attach_info *ai, int pnum,
>  	if (err)
>  		return err;
> =20
> -	aeb =3D kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
> -	if (!aeb)
> +	leb =3D kmem_cache_alloc(ai->aleb_slab_cache, GFP_KERNEL);
> +	if (!leb)
>  		return -ENOMEM;
> =20
> -	aeb->ec =3D ec;
> -	aeb->pnum =3D pnum;
> -	aeb->vol_id =3D vol_id;
> -	aeb->lnum =3D lnum;
> -	aeb->scrub =3D bitflips;
> -	aeb->copy_flag =3D vid_hdr->copy_flag;
> -	aeb->sqnum =3D sqnum;
> +	leb->peb =3D peb;
> +	leb->peb_pos =3D peb_pos;
> +	leb->desc.vol_id =3D vol_id;
> +	leb->desc.lnum =3D lnum;
> +	peb->scrub =3D (bitflips || peb->scrub);
> +	leb->copy_flag =3D vid_hdr->copy_flag;
> +	leb->sqnum =3D sqnum;
> +	leb->full =3D full;
> =20
>  	if (av->highest_lnum <=3D lnum) {
>  		av->highest_lnum =3D lnum;
> @@ -589,8 +611,8 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_=
attach_info *ai, int pnum,
>  	}
> =20
>  	av->leb_count +=3D 1;
> -	rb_link_node(&aeb->u.rb, parent, p);
> -	rb_insert_color(&aeb->u.rb, &av->root);
> +	rb_link_node(&leb->rb, parent, p);
> +	rb_insert_color(&leb->rb, &av->root);
>  	return 0;
>  }
> =20
> @@ -631,14 +653,17 @@ struct ubi_ainf_volume *ubi_find_av(const struct ub=
i_attach_info *ai,
>  void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *a=
v)
>  {
>  	struct rb_node *rb;
> -	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_leb *aeb;
> =20
>  	dbg_bld("remove attaching information about volume %d", av->vol_id);
> =20
>  	while ((rb =3D rb_first(&av->root))) {
> -		aeb =3D rb_entry(rb, struct ubi_ainf_peb, u.rb);
> -		rb_erase(&aeb->u.rb, &av->root);
> -		list_add_tail(&aeb->u.list, &ai->erase);
> +		aeb =3D rb_entry(rb, struct ubi_ainf_leb, rb);
> +		rb_erase(&aeb->rb, &av->root);
> +		if (--aeb->peb->refcount <=3D 0)
> +			list_move(&aeb->peb->list, &ai->erase);
> +
> +		kmem_cache_free(ai->aleb_slab_cache, aeb);
>  	}
> =20
>  	rb_erase(&av->rb, &ai->volumes);
> @@ -713,8 +738,8 @@ struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_dev=
ice *ubi,
>  	struct ubi_ainf_peb *aeb, *tmp_aeb;
> =20
>  	if (!list_empty(&ai->free)) {
> -		aeb =3D list_entry(ai->free.next, struct ubi_ainf_peb, u.list);
> -		list_del(&aeb->u.list);
> +		aeb =3D list_entry(ai->free.next, struct ubi_ainf_peb, list);
> +		list_del(&aeb->list);
>  		dbg_bld("return free PEB %d, EC %d", aeb->pnum, aeb->ec);
>  		return aeb;
>  	}
> @@ -725,7 +750,7 @@ struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_dev=
ice *ubi,
>  	 * so forth. We don't want to take care about bad eraseblocks here -
>  	 * they'll be handled later.
>  	 */
> -	list_for_each_entry_safe(aeb, tmp_aeb, &ai->erase, u.list) {
> +	list_for_each_entry_safe(aeb, tmp_aeb, &ai->erase, list) {
>  		if (aeb->ec =3D=3D UBI_UNKNOWN)
>  			aeb->ec =3D ai->mean_ec;
> =20
> @@ -734,7 +759,7 @@ struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_dev=
ice *ubi,
>  			continue;
> =20
>  		aeb->ec +=3D 1;
> -		list_del(&aeb->u.list);
> +		list_del(&aeb->list);
>  		dbg_bld("return PEB %d, EC %d", aeb->pnum, aeb->ec);
>  		return aeb;
>  	}
> @@ -820,7 +845,9 @@ static int scan_peb(struct ubi_device *ubi, struct ub=
i_attach_info *ai,
>  		    int pnum, int *vid, unsigned long long *sqnum)
>  {
>  	long long uninitialized_var(ec);
> -	int err, bitflips =3D 0, vol_id =3D -1, ec_err =3D 0;
> +	int err, bitflips =3D 0, vol_id =3D -1, ec_err =3D 0, nvidh, i;
> +	struct ubi_ainf_peb *aeb;
> +	bool full =3D false;
> =20
>  	dbg_bld("scan PEB %d", pnum);
> =20
> @@ -844,12 +871,10 @@ static int scan_peb(struct ubi_device *ubi, struct =
ubi_attach_info *ai,
>  		break;
>  	case UBI_IO_FF:
>  		ai->empty_peb_count +=3D 1;
> -		return add_to_list(ai, pnum, UBI_UNKNOWN, UBI_UNKNOWN,
> -				   UBI_UNKNOWN, 0, &ai->erase);
> +		return add_to_list(ai, pnum, UBI_UNKNOWN, 0, &ai->erase);
>  	case UBI_IO_FF_BITFLIPS:
>  		ai->empty_peb_count +=3D 1;
> -		return add_to_list(ai, pnum, UBI_UNKNOWN, UBI_UNKNOWN,
> -				   UBI_UNKNOWN, 1, &ai->erase);
> +		return add_to_list(ai, pnum, UBI_UNKNOWN, 1, &ai->erase);
>  	case UBI_IO_BAD_HDR_EBADMSG:
>  	case UBI_IO_BAD_HDR:
>  		/*
> @@ -915,8 +940,8 @@ static int scan_peb(struct ubi_device *ubi, struct ub=
i_attach_info *ai,
>  	}
> =20
>  	/* OK, we've done with the EC header, let's look at the VID header */
> -
> -	err =3D ubi_io_read_vid_hdr(ubi, pnum, vidh, 0);
> +	nvidh =3D ubi->lebs_per_cpeb;
> +	err =3D ubi_io_read_vid_hdrs(ubi, pnum, vidh, &nvidh, 0);
>  	if (err < 0)
>  		return err;
>  	switch (err) {
> @@ -960,8 +985,7 @@ static int scan_peb(struct ubi_device *ubi, struct ub=
i_attach_info *ai,
>  			return err;
>  		else if (!err)
>  			/* This corruption is caused by a power cut */
> -			err =3D add_to_list(ai, pnum, UBI_UNKNOWN,
> -					  UBI_UNKNOWN, ec, 1, &ai->erase);
> +			err =3D add_to_list(ai, pnum, ec, 1, &ai->erase);
>  		else
>  			/* This is an unexpected corruption */
>  			err =3D add_corrupted(ai, pnum, ec);
> @@ -969,23 +993,20 @@ static int scan_peb(struct ubi_device *ubi, struct =
ubi_attach_info *ai,
>  			return err;
>  		goto adjust_mean_ec;
>  	case UBI_IO_FF_BITFLIPS:
> -		err =3D add_to_list(ai, pnum, UBI_UNKNOWN, UBI_UNKNOWN,
> -				  ec, 1, &ai->erase);
> +		err =3D add_to_list(ai, pnum, ec, 1, &ai->erase);
>  		if (err)
>  			return err;
>  		goto adjust_mean_ec;
>  	case UBI_IO_FF:
>  		if (ec_err || bitflips)
> -			err =3D add_to_list(ai, pnum, UBI_UNKNOWN,
> -					  UBI_UNKNOWN, ec, 1, &ai->erase);
> +			err =3D add_to_list(ai, pnum, ec, 1, &ai->erase);
>  		else
> -			err =3D add_to_list(ai, pnum, UBI_UNKNOWN,
> -					  UBI_UNKNOWN, ec, 0, &ai->free);
> +			err =3D add_to_list(ai, pnum, ec, 0, &ai->free);
>  		if (err)
>  			return err;
>  		goto adjust_mean_ec;
>  	default:
> -		ubi_err(ubi, "'ubi_io_read_vid_hdr()' returned unknown code %d",
> +		ubi_err(ubi, "'ubi_io_read_vid_hdrs()' returned unknown code %d",
>  			err);
>  		return -EINVAL;
>  	}
> @@ -1006,8 +1027,7 @@ static int scan_peb(struct ubi_device *ubi, struct =
ubi_attach_info *ai,
>  				ubi_msg(ubi, "\"delete\" compatible internal volume %d:%d found, wil=
l remove it",
>  					vol_id, lnum);
>  			}
> -			err =3D add_to_list(ai, pnum, vol_id, lnum,
> -					  ec, 1, &ai->erase);
> +			err =3D add_to_list(ai, pnum, ec, 1, &ai->erase);
>  			if (err)
>  				return err;
>  			return 0;
> @@ -1021,8 +1041,7 @@ static int scan_peb(struct ubi_device *ubi, struct =
ubi_attach_info *ai,
>  		case UBI_COMPAT_PRESERVE:
>  			ubi_msg(ubi, "\"preserve\" compatible internal volume %d:%d found",
>  				vol_id, lnum);
> -			err =3D add_to_list(ai, pnum, vol_id, lnum,
> -					  ec, 0, &ai->alien);
> +			err =3D add_to_list(ai, pnum, ec, 0, &ai->alien);
>  			if (err)
>  				return err;
>  			return 0;
> @@ -1037,9 +1056,30 @@ static int scan_peb(struct ubi_device *ubi, struct=
 ubi_attach_info *ai,
>  	if (ec_err)
>  		ubi_warn(ubi, "valid VID header but corrupted EC header at PEB %d",
>  			 pnum);
> -	err =3D ubi_add_to_av(ubi, ai, pnum, ec, vidh, bitflips);
> -	if (err)
> -		return err;
> +
> +	if (nvidh =3D=3D 1) {
> +		err =3D ubi_io_read(ubi, ech, pnum,
> +				  ubi->peb_size - ubi->hdrs_min_io_size,
> +				  ubi->hdrs_min_io_size);
> +		if (!err && !ubi_check_pattern(ech, 0xff, ubi->hdrs_min_io_size))
> +			full =3D true;
> +	}
> +
> +	aeb =3D kmem_cache_zalloc(ai->apeb_slab_cache, GFP_KERNEL);
> +	if (!aeb)
> +		return -ENOMEM;
> +
> +	aeb->consolidated =3D nvidh > 1;
> +	aeb->refcount =3D nvidh;
> +	aeb->pnum =3D pnum;
> +	aeb->ec =3D ec;
> +	list_add_tail(&aeb->list, &ai->used);
> +
> +	for (i =3D 0; i < nvidh; i++) {
> +		err =3D ubi_add_to_av(ubi, ai, aeb, &vidh[i], i, bitflips, full);
> +		if (err)
> +			return err;
> +	}
> =20
>  adjust_mean_ec:
>  	if (!ec_err) {
> @@ -1082,7 +1122,7 @@ static int late_analysis(struct ubi_device *ubi, st=
ruct ubi_attach_info *ai)
>  		ubi_err(ubi, "%d PEBs are corrupted and preserved",
>  			ai->corr_peb_count);
>  		pr_err("Corrupted PEBs are:");
> -		list_for_each_entry(aeb, &ai->corr, u.list)
> +		list_for_each_entry(aeb, &ai->corr, list)
>  			pr_cont(" %d", aeb->pnum);
>  		pr_cont("\n");
> =20
> @@ -1136,7 +1176,7 @@ static int late_analysis(struct ubi_device *ubi, st=
ruct ubi_attach_info *ai)
>   */
>  static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volum=
e *av)
>  {
> -	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_leb *aeb;
>  	struct rb_node *this =3D av->root.rb_node;
> =20
>  	while (this) {
> @@ -1145,16 +1185,16 @@ static void destroy_av(struct ubi_attach_info *ai=
, struct ubi_ainf_volume *av)
>  		else if (this->rb_right)
>  			this =3D this->rb_right;
>  		else {
> -			aeb =3D rb_entry(this, struct ubi_ainf_peb, u.rb);
> +			aeb =3D rb_entry(this, struct ubi_ainf_leb, rb);
>  			this =3D rb_parent(this);
>  			if (this) {
> -				if (this->rb_left =3D=3D &aeb->u.rb)
> +				if (this->rb_left =3D=3D &aeb->rb)
>  					this->rb_left =3D NULL;
>  				else
>  					this->rb_right =3D NULL;
>  			}
> =20
> -			kmem_cache_free(ai->aeb_slab_cache, aeb);
> +			kmem_cache_free(ai->aleb_slab_cache, aeb);
>  		}
>  	}
>  	kfree(av);
> @@ -1170,23 +1210,6 @@ static void destroy_ai(struct ubi_attach_info *ai)
>  	struct ubi_ainf_volume *av;
>  	struct rb_node *rb;
> =20
> -	list_for_each_entry_safe(aeb, aeb_tmp, &ai->alien, u.list) {
> -		list_del(&aeb->u.list);
> -		kmem_cache_free(ai->aeb_slab_cache, aeb);
> -	}
> -	list_for_each_entry_safe(aeb, aeb_tmp, &ai->erase, u.list) {
> -		list_del(&aeb->u.list);
> -		kmem_cache_free(ai->aeb_slab_cache, aeb);
> -	}
> -	list_for_each_entry_safe(aeb, aeb_tmp, &ai->corr, u.list) {
> -		list_del(&aeb->u.list);
> -		kmem_cache_free(ai->aeb_slab_cache, aeb);
> -	}
> -	list_for_each_entry_safe(aeb, aeb_tmp, &ai->free, u.list) {
> -		list_del(&aeb->u.list);
> -		kmem_cache_free(ai->aeb_slab_cache, aeb);
> -	}
> -
>  	/* Destroy the volume RB-tree */
>  	rb =3D ai->volumes.rb_node;
>  	while (rb) {
> @@ -1209,7 +1232,29 @@ static void destroy_ai(struct ubi_attach_info *ai)
>  		}
>  	}
> =20
> -	kmem_cache_destroy(ai->aeb_slab_cache);
> +	list_for_each_entry_safe(aeb, aeb_tmp, &ai->alien, list) {
> +		list_del(&aeb->list);
> +		kmem_cache_free(ai->apeb_slab_cache, aeb);
> +	}
> +	list_for_each_entry_safe(aeb, aeb_tmp, &ai->erase, list) {
> +		list_del(&aeb->list);
> +		kmem_cache_free(ai->apeb_slab_cache, aeb);
> +	}
> +	list_for_each_entry_safe(aeb, aeb_tmp, &ai->corr, list) {
> +		list_del(&aeb->list);
> +		kmem_cache_free(ai->apeb_slab_cache, aeb);
> +	}
> +	list_for_each_entry_safe(aeb, aeb_tmp, &ai->free, list) {
> +		list_del(&aeb->list);
> +		kmem_cache_free(ai->apeb_slab_cache, aeb);
> +	}
> +	list_for_each_entry_safe(aeb, aeb_tmp, &ai->used, list) {
> +		list_del(&aeb->list);
> +		kmem_cache_free(ai->apeb_slab_cache, aeb);
> +	}
> +
> +	kmem_cache_destroy(ai->apeb_slab_cache);
> +	kmem_cache_destroy(ai->aleb_slab_cache);
>  	kfree(ai);
>  }
> =20
> @@ -1227,8 +1272,6 @@ static int scan_all(struct ubi_device *ubi, struct =
ubi_attach_info *ai,
>  		    int start)
>  {
>  	int err, pnum;
> -	struct rb_node *rb1, *rb2;
> -	struct ubi_ainf_volume *av;
>  	struct ubi_ainf_peb *aeb;
> =20
>  	err =3D -ENOMEM;
> @@ -1264,22 +1307,20 @@ static int scan_all(struct ubi_device *ubi, struc=
t ubi_attach_info *ai,
>  	 * In case of unknown erase counter we use the mean erase counter
>  	 * value.
>  	 */
> -	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
> -		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
> -			if (aeb->ec =3D=3D UBI_UNKNOWN)
> -				aeb->ec =3D ai->mean_ec;
> -	}
> =20
> -	list_for_each_entry(aeb, &ai->free, u.list) {
> +	list_for_each_entry(aeb, &ai->erase, list)
> +		if (aeb->ec =3D=3D UBI_UNKNOWN)
> +			aeb->ec =3D ai->mean_ec;
> +
> +	list_for_each_entry(aeb, &ai->free, list)
>  		if (aeb->ec =3D=3D UBI_UNKNOWN)
>  			aeb->ec =3D ai->mean_ec;
> -	}
> =20
> -	list_for_each_entry(aeb, &ai->corr, u.list)
> +	list_for_each_entry(aeb, &ai->corr, list)
>  		if (aeb->ec =3D=3D UBI_UNKNOWN)
>  			aeb->ec =3D ai->mean_ec;
> =20
> -	list_for_each_entry(aeb, &ai->erase, u.list)
> +	list_for_each_entry(aeb, &ai->erase, list)
>  		if (aeb->ec =3D=3D UBI_UNKNOWN)
>  			aeb->ec =3D ai->mean_ec;
> =20
> @@ -1311,16 +1352,28 @@ static struct ubi_attach_info *alloc_ai(void)
>  	INIT_LIST_HEAD(&ai->free);
>  	INIT_LIST_HEAD(&ai->erase);
>  	INIT_LIST_HEAD(&ai->alien);
> +	INIT_LIST_HEAD(&ai->used);
>  	ai->volumes =3D RB_ROOT;
> -	ai->aeb_slab_cache =3D kmem_cache_create("ubi_aeb_slab_cache",
> +	ai->apeb_slab_cache =3D kmem_cache_create("ubi_apeb_slab_cache",
>  					       sizeof(struct ubi_ainf_peb),
>  					       0, 0, NULL);
> -	if (!ai->aeb_slab_cache) {
> -		kfree(ai);
> -		ai =3D NULL;
> -	}
> +	if (!ai->apeb_slab_cache)
> +		goto err_free_ai;
> +
> +	ai->aleb_slab_cache =3D kmem_cache_create("ubi_aleb_slab_cache",
> +					       sizeof(struct ubi_ainf_leb),
> +					       0, 0, NULL);
> +	if (!ai->aleb_slab_cache)
> +		goto err_destroy_apeb_cache;
> =20
>  	return ai;
> +
> +err_destroy_apeb_cache:
> +	kmem_cache_destroy(ai->apeb_slab_cache);
> +err_free_ai:
> +	kfree(ai);
> +
> +	return NULL;
>  }
> =20
>  #ifdef CONFIG_MTD_UBI_FASTMAP
> @@ -1451,10 +1504,14 @@ int ubi_attach(struct ubi_device *ubi, int force_=
scan)
>  	if (err)
>  		goto out_vtbl;
> =20
> -	err =3D ubi_eba_init(ubi, ai);
> +	err =3D ubi_conso_init(ubi);
>  	if (err)
>  		goto out_wl;
> =20
> +	err =3D ubi_eba_init(ubi, ai);
> +	if (err)
> +		goto out_conso;
> +
>  #ifdef CONFIG_MTD_UBI_FASTMAP
>  	if (ubi->fm && ubi_dbg_chk_fastmap(ubi)) {
>  		struct ubi_attach_info *scan_ai;
> @@ -1482,6 +1539,8 @@ int ubi_attach(struct ubi_device *ubi, int force_sc=
an)
>  	destroy_ai(ai);
>  	return 0;
> =20
> +out_conso:
> +	ubi_conso_close(ubi);
>  out_wl:
>  	ubi_wl_close(ubi);
>  out_vtbl:
> @@ -1505,7 +1564,8 @@ static int self_check_ai(struct ubi_device *ubi, st=
ruct ubi_attach_info *ai)
>  	int pnum, err, vols_found =3D 0;
>  	struct rb_node *rb1, *rb2;
>  	struct ubi_ainf_volume *av;
> -	struct ubi_ainf_peb *aeb, *last_aeb;
> +	struct ubi_ainf_peb *peb;
> +	struct ubi_ainf_leb *leb, *last_leb;
>  	uint8_t *buf;
> =20
>  	if (!ubi_dbg_chk_gen(ubi))
> @@ -1556,38 +1616,39 @@ static int self_check_ai(struct ubi_device *ubi, =
struct ubi_attach_info *ai)
>  			goto bad_av;
>  		}
> =20
> -		last_aeb =3D NULL;
> -		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
> +		last_leb =3D NULL;
> +		ubi_rb_for_each_entry(rb2, leb, &av->root, rb) {
>  			cond_resched();
> =20
> -			last_aeb =3D aeb;
> +			last_leb =3D leb;
>  			leb_count +=3D 1;
> +			peb =3D leb->peb;
> =20
> -			if (aeb->pnum < 0 || aeb->ec < 0) {
> +			if (peb->pnum < 0 || peb->ec < 0) {
>  				ubi_err(ubi, "negative values");
>  				goto bad_aeb;
>  			}
> =20
> -			if (aeb->ec < ai->min_ec) {
> +			if (peb->ec < ai->min_ec) {
>  				ubi_err(ubi, "bad ai->min_ec (%d), %d found",
> -					ai->min_ec, aeb->ec);
> +					ai->min_ec, peb->ec);
>  				goto bad_aeb;
>  			}
> =20
> -			if (aeb->ec > ai->max_ec) {
> +			if (peb->ec > ai->max_ec) {
>  				ubi_err(ubi, "bad ai->max_ec (%d), %d found",
> -					ai->max_ec, aeb->ec);
> +					ai->max_ec, peb->ec);
>  				goto bad_aeb;
>  			}
> =20
> -			if (aeb->pnum >=3D ubi->peb_count) {
> +			if (peb->pnum >=3D ubi->peb_count) {
>  				ubi_err(ubi, "too high PEB number %d, total PEBs %d",
> -					aeb->pnum, ubi->peb_count);
> +					peb->pnum, ubi->peb_count);
>  				goto bad_aeb;
>  			}
> =20
>  			if (av->vol_type =3D=3D UBI_STATIC_VOLUME) {
> -				if (aeb->lnum >=3D av->used_ebs) {
> +				if (leb->desc.lnum >=3D av->used_ebs) {
>  					ubi_err(ubi, "bad lnum or used_ebs");
>  					goto bad_aeb;
>  				}
> @@ -1598,7 +1659,7 @@ static int self_check_ai(struct ubi_device *ubi, st=
ruct ubi_attach_info *ai)
>  				}
>  			}
> =20
> -			if (aeb->lnum > av->highest_lnum) {
> +			if (leb->desc.lnum > av->highest_lnum) {
>  				ubi_err(ubi, "incorrect highest_lnum or lnum");
>  				goto bad_aeb;
>  			}
> @@ -1610,12 +1671,12 @@ static int self_check_ai(struct ubi_device *ubi, =
struct ubi_attach_info *ai)
>  			goto bad_av;
>  		}
> =20
> -		if (!last_aeb)
> +		if (!last_leb)
>  			continue;
> =20
> -		aeb =3D last_aeb;
> +		leb =3D last_leb;
> =20
> -		if (aeb->lnum !=3D av->highest_lnum) {
> +		if (leb->desc.lnum !=3D av->highest_lnum) {
>  			ubi_err(ubi, "bad highest_lnum");
>  			goto bad_aeb;
>  		}
> @@ -1629,15 +1690,19 @@ static int self_check_ai(struct ubi_device *ubi, =
struct ubi_attach_info *ai)
> =20
>  	/* Check that attaching information is correct */
>  	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
> -		last_aeb =3D NULL;
> -		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
> +		struct ubi_vid_hdr *vh;
> +
> +		last_leb =3D NULL;
> +		ubi_rb_for_each_entry(rb2, leb, &av->root, rb) {
>  			int vol_type;
> +			int nvidh =3D ubi->lebs_per_cpeb;
> =20
>  			cond_resched();
> =20
> -			last_aeb =3D aeb;
> +			last_leb =3D leb;
> +			peb =3D leb->peb;
> =20
> -			err =3D ubi_io_read_vid_hdr(ubi, aeb->pnum, vidh, 1);
> +			err =3D ubi_io_read_vid_hdrs(ubi, peb->pnum, vidh, &nvidh, 1);
>  			if (err && err !=3D UBI_IO_BITFLIPS) {
>  				ubi_err(ubi, "VID header is not OK (%d)",
>  					err);
> @@ -1646,53 +1711,56 @@ static int self_check_ai(struct ubi_device *ubi, =
struct ubi_attach_info *ai)
>  				return err;
>  			}
> =20
> -			vol_type =3D vidh->vol_type =3D=3D UBI_VID_DYNAMIC ?
> +			ubi_assert(leb->peb_pos < nvidh);
> +			vh =3D &vidh[leb->peb_pos];
> +
> +			vol_type =3D vh->vol_type =3D=3D UBI_VID_DYNAMIC ?
>  				   UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
>  			if (av->vol_type !=3D vol_type) {
>  				ubi_err(ubi, "bad vol_type");
>  				goto bad_vid_hdr;
>  			}
> =20
> -			if (aeb->sqnum !=3D be64_to_cpu(vidh->sqnum)) {
> -				ubi_err(ubi, "bad sqnum %llu", aeb->sqnum);
> +			if (leb->sqnum !=3D be64_to_cpu(vh->sqnum)) {
> +				ubi_err(ubi, "bad sqnum %llu", leb->sqnum);
>  				goto bad_vid_hdr;
>  			}
> =20
> -			if (av->vol_id !=3D be32_to_cpu(vidh->vol_id)) {
> +			if (av->vol_id !=3D be32_to_cpu(vh->vol_id)) {
>  				ubi_err(ubi, "bad vol_id %d", av->vol_id);
>  				goto bad_vid_hdr;
>  			}
> =20
> -			if (av->compat !=3D vidh->compat) {
> -				ubi_err(ubi, "bad compat %d", vidh->compat);
> +			if (av->compat !=3D vh->compat) {
> +				ubi_err(ubi, "bad compat %d", vh->compat);
>  				goto bad_vid_hdr;
>  			}
> =20
> -			if (aeb->lnum !=3D be32_to_cpu(vidh->lnum)) {
> -				ubi_err(ubi, "bad lnum %d", aeb->lnum);
> +			if (leb->desc.lnum !=3D be32_to_cpu(vh->lnum)) {
> +				ubi_err(ubi, "bad lnum %d", leb->desc.lnum);
>  				goto bad_vid_hdr;
>  			}
> =20
> -			if (av->used_ebs !=3D be32_to_cpu(vidh->used_ebs)) {
> +			if (av->used_ebs !=3D be32_to_cpu(vh->used_ebs)) {
>  				ubi_err(ubi, "bad used_ebs %d", av->used_ebs);
>  				goto bad_vid_hdr;
>  			}
> =20
> -			if (av->data_pad !=3D be32_to_cpu(vidh->data_pad)) {
> +			if (av->data_pad !=3D be32_to_cpu(vh->data_pad)) {
>  				ubi_err(ubi, "bad data_pad %d", av->data_pad);
>  				goto bad_vid_hdr;
>  			}
>  		}
> =20
> -		if (!last_aeb)
> +		if (!last_leb)
>  			continue;
> =20
> -		if (av->highest_lnum !=3D be32_to_cpu(vidh->lnum)) {
> +		if (av->highest_lnum !=3D be32_to_cpu(vh->lnum)) {
>  			ubi_err(ubi, "bad highest_lnum %d", av->highest_lnum);
>  			goto bad_vid_hdr;
>  		}
> =20
> -		if (av->last_data_size !=3D be32_to_cpu(vidh->data_size)) {
> +		if (av->last_data_size !=3D be32_to_cpu(vh->data_size)) {
>  			ubi_err(ubi, "bad last_data_size %d",
>  				av->last_data_size);
>  			goto bad_vid_hdr;
> @@ -1716,21 +1784,20 @@ static int self_check_ai(struct ubi_device *ubi, =
struct ubi_attach_info *ai)
>  			buf[pnum] =3D 1;
>  	}
> =20
> -	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb)
> -		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
> -			buf[aeb->pnum] =3D 1;
> +	list_for_each_entry(peb, &ai->used, list)
> +		buf[peb->pnum] =3D 1;
> =20
> -	list_for_each_entry(aeb, &ai->free, u.list)
> -		buf[aeb->pnum] =3D 1;
> +	list_for_each_entry(peb, &ai->free, list)
> +		buf[peb->pnum] =3D 1;
> =20
> -	list_for_each_entry(aeb, &ai->corr, u.list)
> -		buf[aeb->pnum] =3D 1;
> +	list_for_each_entry(peb, &ai->corr, list)
> +		buf[peb->pnum] =3D 1;
> =20
> -	list_for_each_entry(aeb, &ai->erase, u.list)
> -		buf[aeb->pnum] =3D 1;
> +	list_for_each_entry(peb, &ai->erase, list)
> +		buf[peb->pnum] =3D 1;
> =20
> -	list_for_each_entry(aeb, &ai->alien, u.list)
> -		buf[aeb->pnum] =3D 1;
> +	list_for_each_entry(peb, &ai->alien, list)
> +		buf[peb->pnum] =3D 1;
> =20
>  	err =3D 0;
>  	for (pnum =3D 0; pnum < ubi->peb_count; pnum++)
> @@ -1745,8 +1812,8 @@ static int self_check_ai(struct ubi_device *ubi, st=
ruct ubi_attach_info *ai)
>  	return 0;
> =20
>  bad_aeb:
> -	ubi_err(ubi, "bad attaching information about LEB %d", aeb->lnum);
> -	ubi_dump_aeb(aeb, 0);
> +	ubi_err(ubi, "bad attaching information about LEB %d", leb->desc.lnum);
> +	ubi_dump_aeb(leb, 0);
>  	ubi_dump_av(av);
>  	goto out;
> =20
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 99e31ed..306d71f 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -368,7 +368,9 @@ static ssize_t dev_attribute_show(struct device *dev,
>  	if (attr =3D=3D &dev_eraseblock_size)
>  		ret =3D sprintf(buf, "%d\n", ubi->leb_size);
>  	else if (attr =3D=3D &dev_avail_eraseblocks)
> -		ret =3D sprintf(buf, "%d\n", ubi->avail_pebs);
> +		ret =3D sprintf(buf, "%d\n",
> +			      ubi->avail_pebs *
> +			      ubi->lebs_per_cpeb);
>  	else if (attr =3D=3D &dev_total_eraseblocks)
>  		ret =3D sprintf(buf, "%d\n", ubi->good_peb_count);
>  	else if (attr =3D=3D &dev_volumes_count)
> @@ -653,7 +655,7 @@ static int io_init(struct ubi_device *ubi, int max_be=
b_per1024)
>  	ubi->consolidated_peb_size =3D ubi->mtd->erasesize;
>  	ubi->peb_size   =3D ubi->consolidated_peb_size /
>  			  mtd_pairing_groups_per_eb(ubi->mtd);
> -	ubi->lebs_per_consolidated_peb =3D mtd_pairing_groups_per_eb(ubi->mtd);
> +	ubi->lebs_per_cpeb =3D mtd_pairing_groups_per_eb(ubi->mtd);
>  	ubi->peb_count  =3D mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
>  	ubi->flash_size =3D ubi->mtd->size;
> =20
> @@ -797,7 +799,7 @@ static int autoresize(struct ubi_device *ubi, int vol=
_id)
>  {
>  	struct ubi_volume_desc desc;
>  	struct ubi_volume *vol =3D ubi->volumes[vol_id];
> -	int err, old_reserved_pebs =3D vol->reserved_pebs;
> +	int err, old_reserved_lebs =3D vol->reserved_lebs;
> =20
>  	if (ubi->ro_mode) {
>  		ubi_warn(ubi, "skip auto-resize because of R/O mode");
> @@ -824,9 +826,11 @@ static int autoresize(struct ubi_device *ubi, int vo=
l_id)
>  			ubi_err(ubi, "cannot clean auto-resize flag for volume %d",
>  				vol_id);
>  	} else {
> +		int avail_lebs =3D ubi->avail_pebs *
> +				 ubi->lebs_per_cpeb;
> +
>  		desc.vol =3D vol;
> -		err =3D ubi_resize_volume(&desc,
> -					old_reserved_pebs + ubi->avail_pebs);
> +		err =3D ubi_resize_volume(&desc, old_reserved_lebs + avail_lebs);
>  		if (err)
>  			ubi_err(ubi, "cannot auto-resize volume %d",
>  				vol_id);
> @@ -836,7 +840,7 @@ static int autoresize(struct ubi_device *ubi, int vol=
_id)
>  		return err;
> =20
>  	ubi_msg(ubi, "volume %d (\"%s\") re-sized from %d to %d LEBs",
> -		vol_id, vol->name, old_reserved_pebs, vol->reserved_pebs);
> +		vol_id, vol->name, old_reserved_lebs, vol->reserved_lebs);
>  	return 0;
>  }
> =20
> @@ -1026,7 +1030,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ub=
i_num,
>  		ubi->image_seq);
>  	ubi_msg(ubi, "available PEBs: %d, total reserved PEBs: %d, PEBs reserve=
d for bad PEB handling: %d",
>  		ubi->avail_pebs, ubi->rsvd_pebs, ubi->beb_rsvd_pebs);
> -	ubi_msg(ubi, "LEBs per PEB: %d", ubi->lebs_per_consolidated_peb);
> +	ubi_msg(ubi, "LEBs per PEB: %d", ubi->lebs_per_cpeb);
> =20
>  	/*
>  	 * The below lock makes sure we do not race with 'ubi_thread()' which
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index 833c0a82..230232f 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -415,7 +415,7 @@ static long vol_cdev_ioctl(struct file *file, unsigne=
d int cmd,
>  			break;
>  		}
> =20
> -		rsvd_bytes =3D (long long)vol->reserved_pebs *
> +		rsvd_bytes =3D (long long)vol->reserved_lebs *
>  					ubi->leb_size-vol->data_pad;
>  		if (bytes < 0 || bytes > rsvd_bytes) {
>  			err =3D -EINVAL;
> @@ -454,7 +454,7 @@ static long vol_cdev_ioctl(struct file *file, unsigne=
d int cmd,
> =20
>  		/* Validate the request */
>  		err =3D -EINVAL;
> -		if (req.lnum < 0 || req.lnum >=3D vol->reserved_pebs ||
> +		if (req.lnum < 0 || req.lnum >=3D vol->reserved_lebs ||
>  		    req.bytes < 0 || req.bytes > vol->usable_leb_size)
>  			break;
> =20
> @@ -485,7 +485,7 @@ static long vol_cdev_ioctl(struct file *file, unsigne=
d int cmd,
>  			break;
>  		}
> =20
> -		if (lnum < 0 || lnum >=3D vol->reserved_pebs) {
> +		if (lnum < 0 || lnum >=3D vol->reserved_lebs) {
>  			err =3D -EINVAL;
>  			break;
>  		}
> @@ -909,7 +909,7 @@ static long ubi_cdev_ioctl(struct file *file, unsigne=
d int cmd,
>  	/* Re-size volume command */
>  	case UBI_IOCRSVOL:
>  	{
> -		int pebs;
> +		int lebs;
>  		struct ubi_rsvol_req req;
> =20
>  		dbg_gen("re-size volume");
> @@ -929,11 +929,11 @@ static long ubi_cdev_ioctl(struct file *file, unsig=
ned int cmd,
>  			break;
>  		}
> =20
> -		pebs =3D div_u64(req.bytes + desc->vol->usable_leb_size - 1,
> +		lebs =3D div_u64(req.bytes + desc->vol->usable_leb_size - 1,
>  			       desc->vol->usable_leb_size);
> =20
>  		mutex_lock(&ubi->device_mutex);
> -		err =3D ubi_resize_volume(desc, pebs);
> +		err =3D ubi_resize_volume(desc, lebs);
>  		mutex_unlock(&ubi->device_mutex);
>  		ubi_close_volume(desc);
>  		break;
> diff --git a/drivers/mtd/ubi/consolidate.c b/drivers/mtd/ubi/consolidate.c
> new file mode 100644
> index 0000000..de1479d
> --- /dev/null
> +++ b/drivers/mtd/ubi/consolidate.c
> @@ -0,0 +1,499 @@
> +#include <linux/slab.h>
> +#include <linux/crc32.h>
> +#include "ubi.h"
> +
> +static void consolidation_unlock(struct ubi_device *ubi,
> +				 struct ubi_leb_desc *clebs)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ubi->lebs_per_cpeb; i++)
> +		ubi_eba_leb_write_unlock(ubi, clebs[i].vol_id, clebs[i].lnum);
> +}
> +
> +static int find_consolidable_lebs(struct ubi_device *ubi,
> +				  struct ubi_leb_desc *clebs,
> +				  struct ubi_volume **vols)
> +{
> +	struct ubi_full_leb *fleb;
> +	LIST_HEAD(found);
> +	int i, err =3D 0;
> +
> +	spin_lock(&ubi->full_lock);
> +	if (ubi->full_count < ubi->lebs_per_cpeb)
> +		err =3D -EAGAIN;
> +	spin_unlock(&ubi->full_lock);
> +	if (err)
> +		return err;
> +
> +	for (i =3D 0; i < ubi->lebs_per_cpeb;) {
> +		spin_lock(&ubi->full_lock);
> +		fleb =3D list_first_entry_or_null(&ubi->full,
> +						struct ubi_full_leb, node);
> +		spin_unlock(&ubi->full_lock);
> +
> +		if (!fleb) {
> +			err =3D -EAGAIN;
> +			goto err;
> +		} else {
> +			list_del_init(&fleb->node);
> +			list_add_tail(&fleb->node, &found);
> +			ubi->full_count--;
> +		}
> +
> +		clebs[i] =3D fleb->desc;
> +
> +		err =3D ubi_eba_leb_write_lock_nested(ubi, clebs[i].vol_id,
> +						    clebs[i].lnum, i);
> +		if (err) {
> +			spin_lock(&ubi->full_lock);
> +			list_del(&fleb->node);
> +			list_add_tail(&fleb->node, &ubi->full);
> +			ubi->full_count++;
> +			spin_unlock(&ubi->full_lock);
> +			goto err;
> +		}
> +
> +		spin_lock(&ubi->volumes_lock);
> +		vols[i] =3D ubi->volumes[vol_id2idx(ubi, clebs[i].vol_id)];
> +		spin_unlock(&ubi->volumes_lock);
> +		/* volume vanished under us */
> +		//TODO clarify/document when/why this can happen
> +		if (!vols[i]) {
> +			ubi_assert(0);
> +			ubi_eba_leb_write_unlock(ubi, clebs[i].vol_id, clebs[i].lnum);
> +			spin_lock(&ubi->full_lock);
> +			list_del_init(&fleb->node);
> +			kfree(fleb);
> +			spin_unlock(&ubi->full_lock);
> +			continue;
> +		}
> +
> +		i++;
> +	}
> +
> +	while(!list_empty(&found)) {
> +		fleb =3D list_first_entry(&found, struct ubi_full_leb, node);
> +		list_del(&fleb->node);
> +		kfree(fleb);
> +	}
> +
> +	if (i < ubi->lebs_per_cpeb - 1) {
> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while(!list_empty(&found)) {
> +		spin_lock(&ubi->full_lock);
> +		fleb =3D list_first_entry(&found, struct ubi_full_leb, node);
> +		list_del(&fleb->node);
> +		list_add_tail(&fleb->node, &ubi->full);
> +		ubi->full_count++;
> +		spin_unlock(&ubi->full_lock);
> +		ubi_eba_leb_write_unlock(ubi, fleb->desc.vol_id, fleb->desc.lnum);
> +	}
> +
> +	return err;
> +}
> +
> +static int consolidate_lebs(struct ubi_device *ubi)
> +{
> +	int i, pnum, offset =3D ubi->leb_start, err =3D 0;
> +	struct ubi_vid_hdr *vid_hdrs;
> +	struct ubi_leb_desc *clebs =3D NULL, *new_clebs =3D NULL;
> +	struct ubi_volume **vols =3D NULL;
> +	int *opnums =3D NULL;
> +
> +	if (!ubi_conso_consolidation_needed(ubi))
> +		return 0;
> +
> +	vols =3D kzalloc(sizeof(*vols) * ubi->lebs_per_cpeb, GFP_KERNEL);
> +	if (!vols)
> +		return -ENOMEM;
> +
> +	opnums =3D kzalloc(sizeof(*opnums) * ubi->lebs_per_cpeb, GFP_KERNEL);
> +	if (!opnums) {
> +		err =3D -ENOMEM;
> +		goto err_free_mem;
> +	}
> +
> +	clebs =3D kzalloc(sizeof(*clebs) * ubi->lebs_per_cpeb, GFP_KERNEL);
> +	if (!clebs) {
> +		err =3D -ENOMEM;
> +		goto err_free_mem;
> +	}
> +
> +	new_clebs =3D kzalloc(sizeof(*clebs) * ubi->lebs_per_cpeb, GFP_KERNEL);
> +	if (!new_clebs) {
> +		err =3D -ENOMEM;
> +		goto err_free_mem;
> +	}
> +
> +	err =3D find_consolidable_lebs(ubi, clebs, vols);
> +	if (err)
> +		goto err_free_mem;
> +
> +	memcpy(new_clebs, clebs, sizeof(*clebs) * ubi->lebs_per_cpeb);
> +
> +	mutex_lock(&ubi->buf_mutex);
> +
> +	pnum =3D ubi_wl_get_peb(ubi, true);
> +	if (pnum < 0) {
> +		err =3D pnum;
> +		//TODO cleanup exit path
> +		mutex_unlock(&ubi->buf_mutex);
> +		up_read(&ubi->fm_eba_sem);
> +		goto err_unlock_lebs;
> +	}
> +
> +	memset(ubi->peb_buf, 0, ubi->peb_size);
> +	vid_hdrs =3D ubi->peb_buf + ubi->vid_hdr_aloffset + ubi->vid_hdr_shift;
> +
> +	for (i =3D 0; i < ubi->lebs_per_cpeb; i++) {
> +		int vol_id =3D clebs[i].vol_id, lnum =3D clebs[i].lnum, lpos =3D clebs=
[i].lpos;
> +		void *buf =3D ubi->peb_buf + offset;
> +		struct ubi_volume *vol =3D vols[i];
> +		int spnum;
> +		int data_size;
> +		u32 crc;
> +		bool raw;
> +
> +		spnum =3D vol->eba_tbl[lnum];
> +
> +		/* we raced against leb unmap */
> +		if (spnum =3D=3D UBI_LEB_UNMAPPED) {
> +			//TODO: should be fixed now and no longer trigger.
> +			ubi_assert(0);
> +			err =3D 0;
> +			goto err_unlock_fm_eba;
> +		}
> +
> +		if (ubi->consolidated[spnum]) {
> +			ubi_assert(ubi_conso_invalidate_leb(ubi, spnum, vol_id, lnum) =3D=3D =
true);
> +			raw =3D true;
> +		} else {
> +			ubi_assert(!lpos);
> +			raw =3D false;
> +		}
> +
> +		ubi_assert(offset + ubi->leb_size < ubi->consolidated_peb_size);
> +
> +		if (!raw)
> +			err =3D ubi_io_read(ubi, buf, spnum, ubi->leb_start, ubi->leb_size);
> +		else
> +			err =3D ubi_io_raw_read(ubi, buf, spnum, ubi->leb_start + (lpos * ubi=
->leb_size), ubi->leb_size);
> +
> +		if (err && err !=3D UBI_IO_BITFLIPS)
> +			goto err_unlock_fm_eba;
> +
> +		if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {
> +			data_size =3D ubi->leb_size - vol->data_pad;
> +			vid_hdrs[i].vol_type =3D UBI_VID_DYNAMIC;
> +		} else {
> +			int nvidh =3D ubi->lebs_per_cpeb;
> +			struct ubi_vid_hdr *vh;
> +
> +			vh =3D ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
> +			if (!vh) {
> +				err =3D -ENOMEM;
> +				goto err_unlock_fm_eba;
> +			}
> +
> +			err =3D ubi_io_read_vid_hdrs(ubi, spnum, vh, &nvidh, 0);
> +			if (err && err !=3D UBI_IO_BITFLIPS) {
> +				ubi_free_vid_hdr(ubi, vh);
> +				goto err_unlock_fm_eba;
> +			}
> +
> +			ubi_free_vid_hdr(ubi, vh);
> +
> +			data_size =3D be32_to_cpu(vh[lpos].data_size);
> +			vid_hdrs[i].vol_type =3D UBI_VID_STATIC;
> +			vid_hdrs[i].used_ebs =3D cpu_to_be32(vol->used_ebs);
> +		}
> +
> +		vid_hdrs[i].data_pad =3D cpu_to_be32(vol->data_pad);
> +		vid_hdrs[i].sqnum =3D cpu_to_be64(ubi_next_sqnum(ubi));
> +		vid_hdrs[i].vol_id =3D cpu_to_be32(vol_id);
> +		vid_hdrs[i].lnum =3D cpu_to_be32(lnum);
> +		vid_hdrs[i].compat =3D ubi_get_compat(ubi, vol_id);
> +		vid_hdrs[i].data_size =3D cpu_to_be32(data_size);
> +		vid_hdrs[i].copy_flag =3D 1;
> +		crc =3D crc32(UBI_CRC32_INIT, buf, data_size);
> +		vid_hdrs[i].data_crc =3D cpu_to_be32(crc);
> +		offset +=3D ubi->leb_size;
> +
> +		new_clebs[i].lpos =3D i;
> +	}
> +
> +	/*
> +	 * Pad remaining pages with zeros to prevent problem on some MLC chip
> +	 * that expect the whole block to be programmed in order to work
> +	 * reliably (some Hynix chips are impacted).
> +	 */
> +	memset(ubi->peb_buf + offset, 0, ubi->consolidated_peb_size - offset);
> +
> +	err =3D ubi_io_write_vid_hdrs(ubi, pnum, vid_hdrs, ubi->lebs_per_cpeb);
> +	if (err) {
> +		ubi_warn(ubi, "failed to write VID headers to PEB %d",
> +			 pnum);
> +		goto err_unlock_lebs;
> +	}
> +
> +	err =3D ubi_io_raw_write(ubi, ubi->peb_buf + ubi->leb_start,
> +			       pnum, ubi->leb_start,
> +			       ubi->consolidated_peb_size - ubi->leb_start);
> +	if (err) {
> +		ubi_warn(ubi, "failed to write %d bytes of data to PEB %d",
> +			 ubi->consolidated_peb_size - ubi->leb_start, pnum);
> +		goto err_unlock_fm_eba;
> +	}
> +
> +	for (i =3D 0; i < ubi->lebs_per_cpeb; i++) {
> +		struct ubi_volume *vol =3D vols[i];
> +		int lnum =3D clebs[i].lnum;
> +
> +		opnums[i] =3D vol->eba_tbl[lnum];
> +
> +		vol->eba_tbl[lnum] =3D pnum;
> +	}
> +	ubi->consolidated[pnum] =3D new_clebs;
> +
> +	up_read(&ubi->fm_eba_sem);
> +	mutex_unlock(&ubi->buf_mutex);
> +	consolidation_unlock(ubi, clebs);
> +
> +	for (i =3D 0; i < ubi->lebs_per_cpeb; i++) {
> +		//TODO set torture if needed
> +		ubi_wl_put_peb(ubi, opnums[i], 0);
> +	}
> +
> +	kfree(clebs);
> +	kfree(opnums);
> +	kfree(vols);
> +
> +	return 0;
> +
> +err_unlock_fm_eba:
> +	mutex_unlock(&ubi->buf_mutex);
> +	up_read(&ubi->fm_eba_sem);
> +
> +	for (i =3D 0; i < ubi->lebs_per_cpeb; i++)
> +		ubi_coso_add_full_leb(ubi, clebs[i].vol_id, clebs[i].lnum, clebs[i].lp=
os);
> +
> +	ubi_wl_put_peb(ubi, pnum, 0);
> +err_unlock_lebs:
> +	consolidation_unlock(ubi, clebs);
> +err_free_mem:
> +	kfree(new_clebs);
> +	kfree(clebs);
> +	kfree(opnums);
> +	kfree(vols);
> +
> +	return err;
> +}
> +
> +static int consolidation_worker(struct ubi_device *ubi,
> +				struct ubi_work *wrk,
> +				int shutdown)
> +{
> +	int ret;
> +
> +	if (shutdown)
> +		return 0;
> +
> +	ret =3D consolidate_lebs(ubi);
> +	if (ret =3D=3D -EAGAIN)
> +		ret =3D 0;
> +
> +	ubi->conso_scheduled =3D 0;
> +	smp_wmb();
> +
> +	if (ubi_conso_consolidation_needed(ubi))
> +		ubi_conso_schedule(ubi);
> +
> +	return ret;
> +}
> +
> +static bool consolidation_possible(struct ubi_device *ubi)
> +{
> +	if (ubi->lebs_per_cpeb < 2)
> +		return false;
> +
> +	if (ubi->full_count < ubi->lebs_per_cpeb)
> +		return false;
> +
> +	return true;
> +}
> +
> +bool ubi_conso_consolidation_needed(struct ubi_device *ubi)
> +{
> +	if (!consolidation_possible(ubi))
> +		return false;
> +
> +	return ubi->free_count - ubi->beb_rsvd_pebs <=3D
> +	       ubi->consolidation_threshold;
> +}
> +
> +void ubi_conso_schedule(struct ubi_device *ubi)
> +{
> +	struct ubi_work *wrk;
> +
> +	if (ubi->conso_scheduled)
> +		return;
> +
> +	wrk =3D ubi_alloc_work(ubi);
> +	if (wrk) {
> +		ubi->conso_scheduled =3D 1;
> +		smp_wmb();
> +
> +		wrk->func =3D &consolidation_worker;
> +		INIT_LIST_HEAD(&wrk->list);
> +		ubi_schedule_work(ubi, wrk);
> +	} else
> +		BUG();
> +}
> +
> +void ubi_eba_consolidate(struct ubi_device *ubi)
> +{
> +	if (consolidation_possible(ubi) && ubi->consolidation_pnum >=3D 0)
> +		ubi_conso_schedule(ubi);
> +}
> +
> +void ubi_conso_remove_full_leb(struct ubi_device *ubi, int vol_id, int l=
num)
> +{
> +	struct ubi_full_leb *fleb;
> +
> +	spin_lock(&ubi->full_lock);
> +	list_for_each_entry(fleb, &ubi->full, node) {
> +		if (fleb->desc.lnum =3D=3D lnum && fleb->desc.vol_id =3D=3D vol_id) {
> +			ubi->full_count--;
> +			list_del(&fleb->node);
> +			kfree(fleb);
> +			break;
> +		}
> +	}
> +	spin_unlock(&ubi->full_lock);
> +}
> +
> +struct ubi_leb_desc *
> +ubi_conso_get_consolidated(struct ubi_device *ubi, int pnum)
> +{
> +	if (ubi->consolidated)
> +		return ubi->consolidated[pnum];
> +
> +	return NULL;
> +}
> +
> +int ubi_coso_add_full_leb(struct ubi_device *ubi, int vol_id, int lnum, =
int lpos)
> +{
> +	struct ubi_full_leb *fleb;
> +
> +	/*
> +	 * We don't track full LEBs if we don't need to (which is the case
> +	 * when UBI does not need or does not support LEB consolidation).
> +	 */
> +	if (!ubi->consolidated)
> +		return 0;
> +
> +	fleb =3D kzalloc(sizeof(*fleb), GFP_KERNEL);
> +	if (!fleb)
> +		return -ENOMEM;
> +
> +	fleb->desc.vol_id =3D vol_id;
> +	fleb->desc.lnum =3D lnum;
> +	fleb->desc.lpos =3D lpos;
> +
> +	spin_lock(&ubi->full_lock);
> +	list_add_tail(&fleb->node, &ubi->full);
> +	ubi->full_count++;
> +	spin_unlock(&ubi->full_lock);
> +
> +	return 0;
> +}
> +
> +bool ubi_conso_invalidate_leb(struct ubi_device *ubi, int pnum,
> +				   int vol_id, int lnum)
> +{
> +	struct ubi_leb_desc *clebs =3D NULL;
> +
> +	if (!ubi->consolidated)
> +		return true;
> +
> +	clebs =3D ubi->consolidated[pnum];
> +	if (!clebs)
> +		return true;
> +
> +	//TODO: make this generic again
> +	BUG_ON(ubi->lebs_per_cpeb > 2);
> +
> +	if (clebs[0].lnum =3D=3D lnum && clebs[0].vol_id =3D=3D vol_id) {
> +		clebs[0].lnum =3D -1;
> +		clebs[0].vol_id =3D -1;
> +
> +		if (clebs[1].lnum > -1 && clebs[1].vol_id > -1) {
> +			ubi_coso_add_full_leb(ubi, clebs[1].vol_id, clebs[1].lnum, clebs[1].l=
pos);
> +
> +			return false;
> +		}
> +	} else if (clebs[1].lnum =3D=3D lnum && clebs[1].vol_id =3D=3D vol_id) {
> +		clebs[1].lnum =3D -1;
> +		clebs[1].vol_id =3D -1;
> +
> +		if (clebs[0].lnum > -1 && clebs[0].vol_id > -1) {
> +			ubi_coso_add_full_leb(ubi, clebs[0].vol_id, clebs[0].lnum, clebs[0].l=
pos);
> +
> +			return false;
> +		}
> +	} else
> +		ubi_assert(0);
> +
> +	ubi->consolidated[pnum] =3D NULL;
> +	kfree(clebs);
> +
> +	return true;
> +}
> +
> +int ubi_conso_init(struct ubi_device *ubi)
> +{
> +	spin_lock_init(&ubi->full_lock);
> +	INIT_LIST_HEAD(&ubi->full);
> +	ubi->full_count =3D 0;
> +	ubi->consolidation_threshold =3D (ubi->avail_pebs + ubi->rsvd_pebs) / 3;
> +
> +	if (ubi->consolidation_threshold < ubi->lebs_per_cpeb)
> +		ubi->consolidation_threshold =3D ubi->lebs_per_cpeb;
> +
> +	if (ubi->lebs_per_cpeb =3D=3D 1)
> +		return 0;
> +
> +	if (ubi->avail_pebs < UBI_CONSO_RESERVED_PEBS) {
> +		ubi_err(ubi, "no enough physical eraseblocks (%d, need %d)",
> +			ubi->avail_pebs, UBI_CONSO_RESERVED_PEBS);
> +		if (ubi->corr_peb_count)
> +			ubi_err(ubi, "%d PEBs are corrupted and not used",
> +				ubi->corr_peb_count);
> +		return -ENOSPC;
> +	}
> +
> +	ubi->avail_pebs -=3D UBI_CONSO_RESERVED_PEBS;
> +	ubi->rsvd_pebs +=3D UBI_CONSO_RESERVED_PEBS;
> +
> +	return 0;
> +}
> +
> +void ubi_conso_close(struct ubi_device *ubi)
> +{
> +	struct ubi_full_leb *fleb;
> +
> +	while(!list_empty(&ubi->full)) {
> +		fleb =3D list_first_entry(&ubi->full, struct ubi_full_leb, node);
> +		list_del(&fleb->node);
> +		kfree(fleb);
> +		ubi->full_count--;
> +	}
> +
> +	ubi_assert(ubi->full_count =3D=3D 0);
> +}
> diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
> index ed23009..6178fa1 100644
> --- a/drivers/mtd/ubi/debug.c
> +++ b/drivers/mtd/ubi/debug.c
> @@ -36,7 +36,7 @@ void ubi_dump_flash(struct ubi_device *ubi, int pnum, i=
nt offset, int len)
>  	int err;
>  	size_t read;
>  	void *buf;
> -	loff_t addr =3D (loff_t)pnum * ubi->peb_size + offset;
> +	loff_t addr =3D (loff_t)pnum * ubi->consolidated_peb_size + offset;
> =20
>  	buf =3D vmalloc(len);
>  	if (!buf)
> @@ -108,7 +108,7 @@ void ubi_dump_vol_info(const struct ubi_volume *vol)
>  {
>  	pr_err("Volume information dump:\n");
>  	pr_err("\tvol_id          %d\n", vol->vol_id);
> -	pr_err("\treserved_pebs   %d\n", vol->reserved_pebs);
> +	pr_err("\treserved_lebs   %d\n", vol->reserved_lebs);
>  	pr_err("\talignment       %d\n", vol->alignment);
>  	pr_err("\tdata_pad        %d\n", vol->data_pad);
>  	pr_err("\tvol_type        %d\n", vol->vol_type);
> @@ -140,7 +140,7 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_recor=
d *r, int idx)
>  	int name_len =3D be16_to_cpu(r->name_len);
> =20
>  	pr_err("Volume table record %d dump:\n", idx);
> -	pr_err("\treserved_pebs   %d\n", be32_to_cpu(r->reserved_pebs));
> +	pr_err("\treserved_pebs   %d\n", be32_to_cpu(r->reserved_lebs));
>  	pr_err("\talignment       %d\n", be32_to_cpu(r->alignment));
>  	pr_err("\tdata_pad        %d\n", be32_to_cpu(r->data_pad));
>  	pr_err("\tvol_type        %d\n", (int)r->vol_type);
> @@ -185,14 +185,14 @@ void ubi_dump_av(const struct ubi_ainf_volume *av)
>   * @aeb: the object to dump
>   * @type: object type: 0 - not corrupted, 1 - corrupted
>   */
> -void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type)
> +void ubi_dump_aeb(const struct ubi_ainf_leb *aeb, int type)
>  {
>  	pr_err("eraseblock attaching information dump:\n");
> -	pr_err("\tec       %d\n", aeb->ec);
> -	pr_err("\tpnum     %d\n", aeb->pnum);
> +	pr_err("\tec       %d\n", aeb->peb->ec);
> +	pr_err("\tpnum     %d\n", aeb->peb->pnum);
>  	if (type =3D=3D 0) {
> -		pr_err("\tlnum     %d\n", aeb->lnum);
> -		pr_err("\tscrub    %d\n", aeb->scrub);
> +		pr_err("\tlnum     %d\n", aeb->desc.lnum);
> +		pr_err("\tscrub    %d\n", aeb->peb->scrub);
>  		pr_err("\tsqnum    %llu\n", aeb->sqnum);
>  	}
>  }
> diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
> index 47c447d..c3ed0d5 100644
> --- a/drivers/mtd/ubi/debug.h
> +++ b/drivers/mtd/ubi/debug.h
> @@ -56,7 +56,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr=
);
>  void ubi_dump_vol_info(const struct ubi_volume *vol);
>  void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
>  void ubi_dump_av(const struct ubi_ainf_volume *av);
> -void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type);
> +void ubi_dump_aeb(const struct ubi_ainf_leb *aeb, int type);
>  void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
>  int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
>  			  int len);
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 229be7c..953091e 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -69,21 +69,6 @@ unsigned long long ubi_next_sqnum(struct ubi_device *u=
bi)
>  }
> =20
>  /**
> - * ubi_get_compat - get compatibility flags of a volume.
> - * @ubi: UBI device description object
> - * @vol_id: volume ID
> - *
> - * This function returns compatibility flags for an internal volume. User
> - * volumes have no compatibility flags, so %0 is returned.
> - */
> -static int ubi_get_compat(const struct ubi_device *ubi, int vol_id)
> -{
> -	if (vol_id =3D=3D UBI_LAYOUT_VOLUME_ID)
> -		return UBI_LAYOUT_VOLUME_COMPAT;
> -	return 0;
> -}
> -
> -/**
>   * ltree_lookup - look up the lock tree.
>   * @ubi: UBI device description object
>   * @vol_id: volume ID
> @@ -256,6 +241,31 @@ static int leb_write_lock(struct ubi_device *ubi, in=
t vol_id, int lnum)
>  }
> =20
>  /**
> + * ubi_eba_leb_write_lock_nested - lock logical eraseblock for writing, =
allow nesting.
> + * @ubi: UBI device description object
> + * @vol_id: volume ID
> + * @lnum: logical eraseblock number
> + * @level: nesting level
> + *
> + * This function locks a logical eraseblock for consolidation.
> + * Returns zero in case of success and a negative error code in case
> + * of failure.
> + */
> +int ubi_eba_leb_write_lock_nested(struct ubi_device *ubi, int vol_id, in=
t lnum,
> +				  int level)
> +{
> +	struct ubi_ltree_entry *le;
> +
> +	le =3D ltree_add_entry(ubi, vol_id, lnum);
> +	if (IS_ERR(le))
> +		return PTR_ERR(le);
> +
> +	down_write_nested(&le->mutex, level);
> +
> +	return 0;
> +}
> +
> +/**
>   * leb_write_lock - lock logical eraseblock for writing.
>   * @ubi: UBI device description object
>   * @vol_id: volume ID
> @@ -295,7 +305,7 @@ static int leb_write_trylock(struct ubi_device *ubi, =
int vol_id, int lnum)
>   * @vol_id: volume ID
>   * @lnum: logical eraseblock number
>   */
> -static void leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnu=
m)
> +void ubi_eba_leb_write_unlock(struct ubi_device *ubi, int vol_id, int ln=
um)
>  {
>  	struct ubi_ltree_entry *le;
> =20
> @@ -311,6 +321,7 @@ static void leb_write_unlock(struct ubi_device *ubi, =
int vol_id, int lnum)
>  	spin_unlock(&ubi->ltree_lock);
>  }
> =20
> +
>  /**
>   * ubi_eba_unmap_leb - un-map logical eraseblock.
>   * @ubi: UBI device description object
> @@ -325,6 +336,7 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struct =
ubi_volume *vol,
>  		      int lnum)
>  {
>  	int err, pnum, vol_id =3D vol->vol_id;
> +	bool release_peb =3D false;
> =20
>  	if (ubi->ro_mode)
>  		return -EROFS;
> @@ -342,11 +354,15 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struc=
t ubi_volume *vol,
> =20
>  	down_read(&ubi->fm_eba_sem);
>  	vol->eba_tbl[lnum] =3D UBI_LEB_UNMAPPED;
> +	release_peb =3D ubi_conso_invalidate_leb(ubi, pnum, vol_id, lnum);
>  	up_read(&ubi->fm_eba_sem);
> -	err =3D ubi_wl_put_peb(ubi, pnum, 0);
> +	ubi_conso_remove_full_leb(ubi, vol_id, lnum);
> =20
>  out_unlock:
> -	leb_write_unlock(ubi, vol_id, lnum);
> +	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
> +	if (release_peb)
> +		err =3D ubi_wl_put_peb(ubi, pnum, 0);
> +
>  	return err;
>  }
> =20
> @@ -372,9 +388,10 @@ out_unlock:
>  int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int=
 lnum,
>  		     void *buf, int offset, int len, int check)
>  {
> -	int err, pnum, scrub =3D 0, vol_id =3D vol->vol_id;
> +	int err, pnum, scrub =3D 0, vol_id =3D vol->vol_id, loffs =3D 0, lpos =
=3D 0;
>  	struct ubi_vid_hdr *vid_hdr;
>  	uint32_t uninitialized_var(crc);
> +	struct ubi_leb_desc *clebs;
> =20
>  	err =3D leb_read_lock(ubi, vol_id, lnum);
>  	if (err)
> @@ -401,15 +418,31 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct=
 ubi_volume *vol, int lnum,
>  	if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME)
>  		check =3D 0;
> =20
> +	clebs =3D ubi_conso_get_consolidated(ubi, pnum);
> +	if (clebs) {
> +		for (; lpos < ubi->lebs_per_cpeb; lpos++) {
> +			if (clebs[lpos].vol_id =3D=3D vol->vol_id &&
> +			    clebs[lpos].lnum =3D=3D lnum)
> +				break;
> +		}
> +
> +		if (lpos =3D=3D ubi->lebs_per_cpeb)
> +			return -EINVAL;
> +
> +		loffs =3D ubi->leb_start + (lpos * ubi->leb_size);
> +	}
> +
>  retry:
>  	if (check) {
> +		int nvidh =3D ubi->lebs_per_cpeb;
> +
>  		vid_hdr =3D ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
>  		if (!vid_hdr) {
>  			err =3D -ENOMEM;
>  			goto out_unlock;
>  		}
> =20
> -		err =3D ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 1);
> +		err =3D ubi_io_read_vid_hdrs(ubi, pnum, vid_hdr, &nvidh, 1);
>  		if (err && err !=3D UBI_IO_BITFLIPS) {
>  			if (err > 0) {
>  				/*
> @@ -451,14 +484,18 @@ retry:
>  		} else if (err =3D=3D UBI_IO_BITFLIPS)
>  			scrub =3D 1;
> =20
> -		ubi_assert(lnum < be32_to_cpu(vid_hdr->used_ebs));
> -		ubi_assert(len =3D=3D be32_to_cpu(vid_hdr->data_size));
> +		ubi_assert(lnum < be32_to_cpu(vid_hdr[lpos].used_ebs));
> +		ubi_assert(len =3D=3D be32_to_cpu(vid_hdr[lpos].data_size));
> =20
> -		crc =3D be32_to_cpu(vid_hdr->data_crc);
> +		crc =3D be32_to_cpu(vid_hdr[lpos].data_crc);
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  	}
> =20
> -	err =3D ubi_io_read_data(ubi, buf, pnum, offset, len);
> +	if (!clebs)
> +		err =3D ubi_io_read_data(ubi, buf, pnum, offset, len);
> +	else
> +		err =3D ubi_io_raw_read(ubi, buf, pnum, offset + loffs, len);
> +
>  	if (err) {
>  		if (err =3D=3D UBI_IO_BITFLIPS)
>  			scrub =3D 1;
> @@ -581,7 +618,7 @@ static int recover_peb(struct ubi_device *ubi, int pn=
um, int vol_id, int lnum,
>  		return -ENOMEM;
> =20
>  retry:
> -	new_pnum =3D ubi_wl_get_peb(ubi);
> +	new_pnum =3D ubi_wl_get_peb(ubi, false);
>  	if (new_pnum < 0) {
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  		up_read(&ubi->fm_eba_sem);
> @@ -633,7 +670,7 @@ retry:
> =20
>  	vol->eba_tbl[lnum] =3D new_pnum;
>  	up_read(&ubi->fm_eba_sem);
> -	ubi_wl_put_peb(ubi, vol_id, 1);
> +	ubi_wl_put_peb(ubi, pnum, 1);
> =20
>  	ubi_msg(ubi, "data was successfully recovered");
>  	return 0;
> @@ -679,16 +716,24 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struc=
t ubi_volume *vol, int lnum,
>  {
>  	int err, pnum, tries =3D 0, vol_id =3D vol->vol_id;
>  	struct ubi_vid_hdr *vid_hdr;
> +	struct ubi_leb_desc *clebs;
> +	bool full;
> =20
>  	if (ubi->ro_mode)
>  		return -EROFS;
> =20
> +	full =3D (offset + len > ubi->leb_size - ubi->min_io_size);
> +
>  	err =3D leb_write_lock(ubi, vol_id, lnum);
>  	if (err)
>  		return err;
> =20
>  	pnum =3D vol->eba_tbl[lnum];
>  	if (pnum >=3D 0) {
> +		clebs =3D ubi_conso_get_consolidated(ubi, pnum);
> +		/* TODO: handle the write on consolidated PEB case */
> +		BUG_ON(clebs);
> +
>  		dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d",
>  			len, offset, vol_id, lnum, pnum);
> =20
> @@ -701,7 +746,22 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct=
 ubi_volume *vol, int lnum,
>  			if (err)
>  				ubi_ro_mode(ubi);
>  		}
> -		leb_write_unlock(ubi, vol_id, lnum);
> +
> +		if (full) {
> +			int ret;
> +
> +			ret =3D ubi_coso_add_full_leb(ubi, vol_id, lnum, 0);
> +			if (ret)
> +				ubi_warn(ubi,
> +					 "failed to add LEB %d:%d to the full LEB list",
> +					 vol_id, lnum);
> +		}
> +
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
> +
> +		if (full && !err && ubi_conso_consolidation_needed(ubi))
> +			ubi_conso_schedule(ubi);
> +
>  		return err;
>  	}
> =20
> @@ -711,7 +771,7 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct =
ubi_volume *vol, int lnum,
>  	 */
>  	vid_hdr =3D ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
>  	if (!vid_hdr) {
> -		leb_write_unlock(ubi, vol_id, lnum);
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  		return -ENOMEM;
>  	}
> =20
> @@ -723,10 +783,10 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struc=
t ubi_volume *vol, int lnum,
>  	vid_hdr->data_pad =3D cpu_to_be32(vol->data_pad);
> =20
>  retry:
> -	pnum =3D ubi_wl_get_peb(ubi);
> +	pnum =3D ubi_wl_get_peb(ubi, false);
>  	if (pnum < 0) {
>  		ubi_free_vid_hdr(ubi, vid_hdr);
> -		leb_write_unlock(ubi, vol_id, lnum);
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  		up_read(&ubi->fm_eba_sem);
>  		return pnum;
>  	}
> @@ -755,14 +815,26 @@ retry:
>  	vol->eba_tbl[lnum] =3D pnum;
>  	up_read(&ubi->fm_eba_sem);
> =20
> -	leb_write_unlock(ubi, vol_id, lnum);
> +	if (full) {
> +		err =3D ubi_coso_add_full_leb(ubi, vol_id, lnum, 0);
> +		if (err)
> +			ubi_warn(ubi,
> +				 "failed to add LEB %d:%d to the full LEB list",
> +				 vol_id, lnum);
> +	}
> +
> +	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  	ubi_free_vid_hdr(ubi, vid_hdr);
> +
> +	if (full && ubi_conso_consolidation_needed(ubi))
> +		ubi_conso_schedule(ubi);
> +
>  	return 0;
> =20
>  write_error:
>  	if (err !=3D -EIO || !ubi->bad_allowed) {
>  		ubi_ro_mode(ubi);
> -		leb_write_unlock(ubi, vol_id, lnum);
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  		return err;
>  	}
> @@ -775,7 +847,7 @@ write_error:
>  	err =3D ubi_wl_put_peb(ubi, pnum, 1);
>  	if (err || ++tries > UBI_IO_RETRIES) {
>  		ubi_ro_mode(ubi);
> -		leb_write_unlock(ubi, vol_id, lnum);
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  		return err;
>  	}
> @@ -846,10 +918,10 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi, st=
ruct ubi_volume *vol,
>  	vid_hdr->data_crc =3D cpu_to_be32(crc);
> =20
>  retry:
> -	pnum =3D ubi_wl_get_peb(ubi);
> +	pnum =3D ubi_wl_get_peb(ubi, false);
>  	if (pnum < 0) {
>  		ubi_free_vid_hdr(ubi, vid_hdr);
> -		leb_write_unlock(ubi, vol_id, lnum);
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  		up_read(&ubi->fm_eba_sem);
>  		return pnum;
>  	}
> @@ -875,10 +947,20 @@ retry:
> =20
>  	ubi_assert(vol->eba_tbl[lnum] < 0);
>  	vol->eba_tbl[lnum] =3D pnum;
> +	vol->used_ebs =3D used_ebs; //XXX
>  	up_read(&ubi->fm_eba_sem);
> =20
> -	leb_write_unlock(ubi, vol_id, lnum);
> +	err =3D ubi_coso_add_full_leb(ubi, vol_id, lnum, 0);
> +	if (err)
> +		ubi_warn(ubi, "failed to add LEB %d:%d to the full LEB list",
> +			 vol_id, lnum);
> +
> +	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  	ubi_free_vid_hdr(ubi, vid_hdr);
> +
> +	if (ubi_conso_consolidation_needed(ubi))
> +		ubi_conso_schedule(ubi);
> +
>  	return 0;
> =20
>  write_error:
> @@ -889,7 +971,7 @@ write_error:
>  		 * mode just in case.
>  		 */
>  		ubi_ro_mode(ubi);
> -		leb_write_unlock(ubi, vol_id, lnum);
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  		return err;
>  	}
> @@ -897,7 +979,7 @@ write_error:
>  	err =3D ubi_wl_put_peb(ubi, pnum, 1);
>  	if (err || ++tries > UBI_IO_RETRIES) {
>  		ubi_ro_mode(ubi);
> -		leb_write_unlock(ubi, vol_id, lnum);
> +		ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  		return err;
>  	}
> @@ -926,7 +1008,9 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi=
, struct ubi_volume *vol,
>  {
>  	int err, pnum, old_pnum, tries =3D 0, vol_id =3D vol->vol_id;
>  	struct ubi_vid_hdr *vid_hdr;
> +	bool release_peb =3D false;
>  	uint32_t crc;
> +	bool full;
> =20
>  	if (ubi->ro_mode)
>  		return -EROFS;
> @@ -942,6 +1026,8 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi=
, struct ubi_volume *vol,
>  		return ubi_eba_write_leb(ubi, vol, lnum, NULL, 0, 0);
>  	}
> =20
> +	full =3D (len > ubi->leb_size - ubi->min_io_size);
> +
>  	vid_hdr =3D ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
>  	if (!vid_hdr)
>  		return -ENOMEM;
> @@ -963,7 +1049,7 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi=
, struct ubi_volume *vol,
>  	vid_hdr->data_crc =3D cpu_to_be32(crc);
> =20
>  retry:
> -	pnum =3D ubi_wl_get_peb(ubi);
> +	pnum =3D ubi_wl_get_peb(ubi, false);
>  	if (pnum < 0) {
>  		err =3D pnum;
>  		up_read(&ubi->fm_eba_sem);
> @@ -991,18 +1077,33 @@ retry:
> =20
>  	old_pnum =3D vol->eba_tbl[lnum];
>  	vol->eba_tbl[lnum] =3D pnum;
> +	if (old_pnum >=3D 0)
> +		release_peb =3D ubi_conso_invalidate_leb(ubi, old_pnum, vol_id, lnum);
>  	up_read(&ubi->fm_eba_sem);
> +	ubi_conso_remove_full_leb(ubi, vol_id, lnum);
> +	if (full) {
> +		int ret;
> +
> +		ret =3D ubi_coso_add_full_leb(ubi, vol_id, lnum, 0);
> +		if (ret)
> +			ubi_warn(ubi,
> +				"failed to add LEB %d:%d to the full LEB list",
> +				vol_id, lnum);
> +	}
> =20
> -	if (old_pnum >=3D 0) {
> +out_leb_unlock:
> +	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
> +	if (release_peb) {
>  		err =3D ubi_wl_put_peb(ubi, old_pnum, 0);
>  		if (err)
>  			goto out_leb_unlock;
>  	}
> -
> -out_leb_unlock:
> -	leb_write_unlock(ubi, vol_id, lnum);
>  out_mutex:
>  	ubi_free_vid_hdr(ubi, vid_hdr);
> +
> +	if (full && !err && ubi_conso_consolidation_needed(ubi))
> +		ubi_conso_schedule(ubi);
> +
>  	return err;
> =20
>  write_error:
> @@ -1224,7 +1325,178 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int =
from, int to,
>  out_unlock_buf:
>  	mutex_unlock(&ubi->buf_mutex);
>  out_unlock_leb:
> -	leb_write_unlock(ubi, vol_id, lnum);
> +	ubi_eba_leb_write_unlock(ubi, vol_id, lnum);
> +	return err;
> +}
> +
> +
> +/**
> + * ubi_eba_copy_lebs - copy consolidated logical eraseblocks.
> + *
> + * Works like ubi_eba_copy_leb but on consolidated LEB.
> + * It is less complicated as a PEB containing consolidated LEBs
> + * has only full LEBs and we don't have to do a lot of space
> + * calucation.
> + * TODO: clean this function up, more clean error handling, etc...
> + */
> +int ubi_eba_copy_lebs(struct ubi_device *ubi, int from, int to,
> +		     struct ubi_vid_hdr *vid_hdr, int nvidh)
> +{
> +	int err, i;
> +	int *vol_id =3D NULL, *lnum =3D NULL;
> +	struct ubi_volume **vol =3D NULL;
> +	uint32_t crc;
> +
> +	vol_id =3D kmalloc(nvidh * sizeof(*vol_id), GFP_NOFS);
> +	lnum =3D kmalloc(nvidh * sizeof(*lnum), GFP_NOFS);
> +	vol =3D kmalloc(nvidh * sizeof(*vol), GFP_NOFS);
> +
> +	if (!vol_id || !lnum || !vol) {
> +		kfree(vol_id);
> +		kfree(lnum);
> +		kfree(vol);
> +		return -ENOMEM;
> +	}
> +
> +	dbg_wl("copy LEBs of PEB %d to PEB %d", from, to);
> +
> +	spin_lock(&ubi->volumes_lock);
> +
> +	for (i =3D 0; i < nvidh; i++) {
> +		vol_id[i] =3D be32_to_cpu(vid_hdr[i].vol_id);
> +		lnum[i] =3D be32_to_cpu(vid_hdr[i].lnum);
> +		vol[i] =3D ubi->volumes[vol_id2idx(ubi, vol_id[i])];
> +	}
> +
> +	/*
> +	 * Note, we may race with volume deletion, which means that the volume
> +	 * this logical eraseblock belongs to might be being deleted. Since the
> +	 * volume deletion un-maps all the volume's logical eraseblocks, it will
> +	 * be locked in 'ubi_wl_put_peb()' and wait for the WL worker to finish.
> +	 */
> +	spin_unlock(&ubi->volumes_lock);
> +
> +	for (i =3D 0; i < nvidh; i++) {
> +		if (!vol[i]) {
> +			/* No need to do further work, cancel */
> +			ubi_msg(ubi, "volume %d is being removed, cancel", vol_id[i]);
> +			kfree(vol_id);
> +			kfree(lnum);
> +			kfree(vol);
> +			return MOVE_CANCEL_RACE;
> +		}
> +	}
> +
> +	/*
> +	 * We do not want anybody to write to this logical eraseblock while we
> +	 * are moving it, so lock it.
> +	 *
> +	 * Note, we are using non-waiting locking here, because we cannot sleep
> +	 * on the LEB, since it may cause deadlocks. Indeed, imagine a task is
> +	 * unmapping the LEB which is mapped to the PEB we are going to move
> +	 * (@from). This task locks the LEB and goes sleep in the
> +	 * 'ubi_wl_put_peb()' function on the @ubi->move_mutex. In turn, we are
> +	 * holding @ubi->move_mutex and go sleep on the LEB lock. So, if the
> +	 * LEB is already locked, we just do not move it and return
> +	 * %MOVE_RETRY. Note, we do not return %MOVE_CANCEL_RACE here because
> +	 * we do not know the reasons of the contention - it may be just a
> +	 * normal I/O on this LEB, so we want to re-try.
> +	 */
> +
> +	for (i =3D 0; i < nvidh; i++) {
> +		err =3D leb_write_trylock(ubi, vol_id[i], lnum[i]);
> +		if (err) {
> +			int j;
> +
> +			for (j =3D 0; j < i; j++)
> +				ubi_eba_leb_write_unlock(ubi, vol_id[j], lnum[j]);
> +
> +			kfree(vol_id);
> +			kfree(lnum);
> +			kfree(vol);
> +			return MOVE_RETRY;
> +		}
> +	}
> +	for (i =3D 0; i < nvidh; i++) {
> +		/*
> +		 * The LEB might have been put meanwhile, and the task which put it is
> +		 * probably waiting on @ubi->move_mutex. No need to continue the work,
> +		 * cancel it.
> +		 */
> +		if (vol[i]->eba_tbl[lnum[i]] !=3D from) {
> +			ubi_msg(ubi, "LEB %d:%d is no longer mapped to PEB %d, mapped to PEB =
%d, cancel",
> +			       vol_id[i], lnum[i], from, vol[i]->eba_tbl[lnum[i]]);
> +			err =3D MOVE_CANCEL_RACE;
> +			goto out_unlock_leb;
> +		}
> +	}
> +
> +	/*
> +	 * OK, now the LEB is locked and we can safely start moving it. Since
> +	 * this function utilizes the @ubi->peb_buf buffer which is shared
> +	 * with some other functions - we lock the buffer by taking the
> +	 * @ubi->buf_mutex.
> +	 */
> +	mutex_lock(&ubi->buf_mutex);
> +	dbg_wl("read %d bytes of data", ubi->consolidated_peb_size - ubi->leb_s=
tart);
> +	err =3D ubi_io_raw_read(ubi, ubi->peb_buf, from, ubi->leb_start, ubi->c=
onsolidated_peb_size - ubi->leb_start);
> +	if (err && err !=3D UBI_IO_BITFLIPS) {
> +		ubi_warn(ubi, "error %d while reading data from PEB %d",
> +			 err, from);
> +		err =3D MOVE_SOURCE_RD_ERR;
> +		goto out_unlock_buf;
> +	}
> +
> +	cond_resched();
> +	for (i =3D 0; i < nvidh; i++) {
> +		//TODO: we could skip crc calucation as consolidated LEB _always_ hav =
copy_flag=3D1 and hence also a valid crc...
> +		crc =3D crc32(UBI_CRC32_INIT, ubi->peb_buf + ubi->leb_start + (i * ubi=
->leb_size), be32_to_cpu(vid_hdr[i].data_size));
> +		vid_hdr[i].copy_flag =3D 1;
> +		vid_hdr[i].data_crc =3D cpu_to_be32(crc);
> +		vid_hdr[i].sqnum =3D cpu_to_be64(ubi_next_sqnum(ubi));
> +
> +		cond_resched();
> +	}
> +
> +
> +	err =3D ubi_io_write_vid_hdrs(ubi, to, vid_hdr, nvidh);
> +	if (err) {
> +		if (err =3D=3D -EIO)
> +			err =3D MOVE_TARGET_WR_ERR;
> +		goto out_unlock_buf;
> +	}
> +
> +	cond_resched();
> +
> +	err =3D ubi_io_raw_write(ubi, ubi->peb_buf, to, ubi->leb_start, ubi->co=
nsolidated_peb_size - ubi->leb_start);
> +	if (err) {
> +		if (err =3D=3D -EIO)
> +			err =3D MOVE_TARGET_WR_ERR;
> +		goto out_unlock_buf;
> +	}
> +
> +	cond_resched();
> +
> +	down_read(&ubi->fm_eba_sem);
> +	for (i =3D 0; i < nvidh; i++) {
> +		ubi_assert(vol[i]->eba_tbl[lnum[i]] =3D=3D from);
> +		vol[i]->eba_tbl[lnum[i]] =3D to;
> +	}
> +
> +	ubi->consolidated[to] =3D ubi->consolidated[from];
> +	ubi->consolidated[from] =3D NULL;
> +
> +	up_read(&ubi->fm_eba_sem);
> +
> +out_unlock_buf:
> +	mutex_unlock(&ubi->buf_mutex);
> +out_unlock_leb:
> +	for (i =3D 0; i < nvidh; i++)
> +		ubi_eba_leb_write_unlock(ubi, vol_id[i], lnum[i]);
> +	kfree(vol_id);
> +	kfree(lnum);
> +	kfree(vol);
> +
>  	return err;
>  }
> =20
> @@ -1286,7 +1558,7 @@ int self_check_eba(struct ubi_device *ubi, struct u=
bi_attach_info *ai_fastmap,
>  	int **scan_eba, **fm_eba;
>  	struct ubi_ainf_volume *av;
>  	struct ubi_volume *vol;
> -	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_leb *aeb;
>  	struct rb_node *rb;
> =20
>  	num_volumes =3D ubi->vtbl_slots + UBI_INT_VOL_COUNT;
> @@ -1306,38 +1578,38 @@ int self_check_eba(struct ubi_device *ubi, struct=
 ubi_attach_info *ai_fastmap,
>  		if (!vol)
>  			continue;
> =20
> -		scan_eba[i] =3D kmalloc(vol->reserved_pebs * sizeof(**scan_eba),
> +		scan_eba[i] =3D kmalloc(vol->reserved_lebs * sizeof(**scan_eba),
>  				      GFP_KERNEL);
>  		if (!scan_eba[i]) {
>  			ret =3D -ENOMEM;
>  			goto out_free;
>  		}
> =20
> -		fm_eba[i] =3D kmalloc(vol->reserved_pebs * sizeof(**fm_eba),
> +		fm_eba[i] =3D kmalloc(vol->reserved_lebs * sizeof(**fm_eba),
>  				    GFP_KERNEL);
>  		if (!fm_eba[i]) {
>  			ret =3D -ENOMEM;
>  			goto out_free;
>  		}
> =20
> -		for (j =3D 0; j < vol->reserved_pebs; j++)
> +		for (j =3D 0; j < vol->reserved_lebs; j++)
>  			scan_eba[i][j] =3D fm_eba[i][j] =3D UBI_LEB_UNMAPPED;
> =20
>  		av =3D ubi_find_av(ai_scan, idx2vol_id(ubi, i));
>  		if (!av)
>  			continue;
> =20
> -		ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb)
> -			scan_eba[i][aeb->lnum] =3D aeb->pnum;
> +		ubi_rb_for_each_entry(rb, aeb, &av->root, rb)
> +			scan_eba[i][aeb->desc.lnum] =3D aeb->peb->pnum;
> =20
>  		av =3D ubi_find_av(ai_fastmap, idx2vol_id(ubi, i));
>  		if (!av)
>  			continue;
> =20
> -		ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb)
> -			fm_eba[i][aeb->lnum] =3D aeb->pnum;
> +		ubi_rb_for_each_entry(rb, aeb, &av->root, rb)
> +			fm_eba[i][aeb->desc.lnum] =3D aeb->peb->pnum;
> =20
> -		for (j =3D 0; j < vol->reserved_pebs; j++) {
> +		for (j =3D 0; j < vol->reserved_lebs; j++) {
>  			if (scan_eba[i][j] !=3D fm_eba[i][j]) {
>  				if (scan_eba[i][j] =3D=3D UBI_LEB_UNMAPPED ||
>  					fm_eba[i][j] =3D=3D UBI_LEB_UNMAPPED)
> @@ -1378,8 +1650,9 @@ int ubi_eba_init(struct ubi_device *ubi, struct ubi=
_attach_info *ai)
>  	int i, j, err, num_volumes;
>  	struct ubi_ainf_volume *av;
>  	struct ubi_volume *vol;
> -	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_leb *aeb;
>  	struct rb_node *rb;
> +	int eba_rsvd =3D EBA_RESERVED_PEBS;
> =20
>  	dbg_eba("initialize EBA sub-system");
> =20
> @@ -1396,43 +1669,48 @@ int ubi_eba_init(struct ubi_device *ubi, struct u=
bi_attach_info *ai)
> =20
>  		cond_resched();
> =20
> -		vol->eba_tbl =3D kmalloc(vol->reserved_pebs * sizeof(int),
> +		vol->eba_tbl =3D kmalloc(vol->reserved_lebs * sizeof(int),
>  				       GFP_KERNEL);
>  		if (!vol->eba_tbl) {
>  			err =3D -ENOMEM;
>  			goto out_free;
>  		}
> =20
> -		for (j =3D 0; j < vol->reserved_pebs; j++)
> +		for (j =3D 0; j < vol->reserved_lebs; j++)
>  			vol->eba_tbl[j] =3D UBI_LEB_UNMAPPED;
> =20
>  		av =3D ubi_find_av(ai, idx2vol_id(ubi, i));
>  		if (!av)
>  			continue;
> =20
> -		ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb) {
> -			if (aeb->lnum >=3D vol->reserved_pebs)
> +		ubi_rb_for_each_entry(rb, aeb, &av->root, rb) {
> +			if (aeb->desc.lnum >=3D vol->reserved_lebs) {
>  				/*
>  				 * This may happen in case of an unclean reboot
>  				 * during re-size.
>  				 */
> -				ubi_move_aeb_to_list(av, aeb, &ai->erase);
> -			else
> -				vol->eba_tbl[aeb->lnum] =3D aeb->pnum;
> +				if (--aeb->peb->refcount <=3D 0)
> +					list_move_tail(&aeb->peb->list, &ai->erase);
> +			} else {
> +				vol->eba_tbl[aeb->desc.lnum] =3D aeb->peb->pnum;
> +				if (aeb->full)
> +					ubi_coso_add_full_leb(ubi, vol->vol_id,
> +							      aeb->desc.lnum, 0);
> +			}
>  		}
>  	}
> =20
> -	if (ubi->avail_pebs < EBA_RESERVED_PEBS) {
> +	if (ubi->avail_pebs < eba_rsvd) {
>  		ubi_err(ubi, "no enough physical eraseblocks (%d, need %d)",
> -			ubi->avail_pebs, EBA_RESERVED_PEBS);
> +			ubi->avail_pebs, eba_rsvd);
>  		if (ubi->corr_peb_count)
>  			ubi_err(ubi, "%d PEBs are corrupted and not used",
>  				ubi->corr_peb_count);
>  		err =3D -ENOSPC;
>  		goto out_free;
>  	}
> -	ubi->avail_pebs -=3D EBA_RESERVED_PEBS;
> -	ubi->rsvd_pebs +=3D EBA_RESERVED_PEBS;
> +	ubi->avail_pebs -=3D eba_rsvd;
> +	ubi->rsvd_pebs +=3D eba_rsvd;
> =20
>  	if (ubi->bad_allowed) {
>  		ubi_calculate_reserved(ubi);
> @@ -1448,6 +1726,9 @@ int ubi_eba_init(struct ubi_device *ubi, struct ubi=
_attach_info *ai)
>  		ubi->rsvd_pebs  +=3D ubi->beb_rsvd_pebs;
>  	}
> =20
> +	if (ubi->lebs_per_cpeb > 1)
> +		ubi_conso_schedule(ubi);
> +
>  	dbg_eba("EBA sub-system is initialized");
>  	return 0;
> =20
> diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
> index cafa7b0..ec593fc 100644
> --- a/drivers/mtd/ubi/fastmap-wl.c
> +++ b/drivers/mtd/ubi/fastmap-wl.c
> @@ -180,6 +180,8 @@ void ubi_refill_pools(struct ubi_device *ubi)
>   * disabled. Returns zero in case of success and a negative error code i=
n case
>   * of failure.
>   */
> +
> +#error call ubi_eba_consolidate
>  static int produce_free_peb(struct ubi_device *ubi)
>  {
>  	while (!ubi->free.rb_node) {
> @@ -201,7 +203,7 @@ static int produce_free_peb(struct ubi_device *ubi)
>   * negative error code in case of failure.
>   * Returns with ubi->fm_eba_sem held in read mode!
>   */
> -int ubi_wl_get_peb(struct ubi_device *ubi)
> +int ubi_wl_get_peb(struct ubi_device *ubi, bool nested)
>  {
>  	int ret, retried =3D 0;
>  	struct ubi_fm_pool *pool =3D &ubi->fm_pool;
> @@ -211,6 +213,15 @@ again:
>  	down_read(&ubi->fm_eba_sem);
>  	spin_lock(&ubi->wl_lock);
> =20
> +	if (nested) {
> +		if (pool->used =3D=3D pool->size) {
> +			ret =3D -ENOSPC;
> +			goto out_unlock;
> +		}
> +
> +		goto out_get_peb;
> +	}
> +
>  	/* We check here also for the WL pool because at this point we can
>  	 * refill the WL pool synchronous. */
>  	if (pool->used =3D=3D pool->size || wl_pool->used =3D=3D wl_pool->size)=
 {
> @@ -243,9 +254,11 @@ again:
>  		goto again;
>  	}
> =20
> +out_get_peb:
>  	ubi_assert(pool->used < pool->size);
>  	ret =3D pool->pebs[pool->used++];
>  	prot_queue_add(ubi, ubi->lookuptbl[ret]);
> +out_unlock:
>  	spin_unlock(&ubi->wl_lock);
>  out:
>  	return ret;
> @@ -291,7 +304,7 @@ int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
>  	ubi->wl_scheduled =3D 1;
>  	spin_unlock(&ubi->wl_lock);
> =20
> -	wrk =3D kmalloc(sizeof(struct ubi_work), GFP_NOFS);
> +	wrk =3D ubi_alloc_work(ubi);
>  	if (!wrk) {
>  		spin_lock(&ubi->wl_lock);
>  		ubi->wl_scheduled =3D 0;
> @@ -342,7 +355,7 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct =
ubi_wl_entry *fm_e,
>  	spin_unlock(&ubi->wl_lock);
> =20
>  	vol_id =3D lnum ? UBI_FM_DATA_VOLUME_ID : UBI_FM_SB_VOLUME_ID;
> -	return schedule_erase(ubi, e, torture);
> +	return schedule_erase(ubi, e, torture, false);
>  }
> =20
>  /**
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index c878313..61f8fc6 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -143,15 +143,13 @@ static int add_aeb(struct ubi_attach_info *ai, stru=
ct list_head *list,
>  {
>  	struct ubi_ainf_peb *aeb;
> =20
> -	aeb =3D kmem_cache_alloc(ai->aeb_slab_cache, GFP_KERNEL);
> +	aeb =3D kmem_cache_alloc(ai->apeb_slab_cache, GFP_KERNEL);
>  	if (!aeb)
>  		return -ENOMEM;
> =20
>  	aeb->pnum =3D pnum;
>  	aeb->ec =3D ec;
> -	aeb->lnum =3D -1;
>  	aeb->scrub =3D scrub;
> -	aeb->copy_flag =3D aeb->sqnum =3D 0;
> =20
>  	ai->ec_sum +=3D aeb->ec;
>  	ai->ec_count++;
> @@ -162,7 +160,7 @@ static int add_aeb(struct ubi_attach_info *ai, struct=
 list_head *list,
>  	if (ai->min_ec > aeb->ec)
>  		ai->min_ec =3D aeb->ec;
> =20
> -	list_add_tail(&aeb->u.list, list);
> +	list_add_tail(&aeb->list, list);
> =20
>  	return 0;
>  }
> @@ -229,19 +227,19 @@ out:
>   * @av: target scan volume
>   */
>  static void assign_aeb_to_av(struct ubi_attach_info *ai,
> -			     struct ubi_ainf_peb *aeb,
> +			     struct ubi_ainf_leb *aeb,
>  			     struct ubi_ainf_volume *av)
>  {
> -	struct ubi_ainf_peb *tmp_aeb;
> +	struct ubi_ainf_leb *tmp_aeb;
>  	struct rb_node **p =3D &ai->volumes.rb_node, *parent =3D NULL;
> =20
>  	p =3D &av->root.rb_node;
>  	while (*p) {
>  		parent =3D *p;
> =20
> -		tmp_aeb =3D rb_entry(parent, struct ubi_ainf_peb, u.rb);
> -		if (aeb->lnum !=3D tmp_aeb->lnum) {
> -			if (aeb->lnum < tmp_aeb->lnum)
> +		tmp_aeb =3D rb_entry(parent, struct ubi_ainf_leb, rb);
> +		if (aeb->desc.lnum !=3D tmp_aeb->desc.lnum) {
> +			if (aeb->desc.lnum < tmp_aeb->desc.lnum)
>  				p =3D &(*p)->rb_left;
>  			else
>  				p =3D &(*p)->rb_right;
> @@ -251,11 +249,10 @@ static void assign_aeb_to_av(struct ubi_attach_info=
 *ai,
>  			break;
>  	}
> =20
> -	list_del(&aeb->u.list);
>  	av->leb_count++;
> =20
> -	rb_link_node(&aeb->u.rb, parent, p);
> -	rb_insert_color(&aeb->u.rb, &av->root);
> +	rb_link_node(&aeb->rb, parent, p);
> +	rb_insert_color(&aeb->rb, &av->root);
>  }
> =20
>  /**
> @@ -270,18 +267,18 @@ static void assign_aeb_to_av(struct ubi_attach_info=
 *ai,
>   */
>  static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  		      struct ubi_ainf_volume *av, struct ubi_vid_hdr *new_vh,
> -		      struct ubi_ainf_peb *new_aeb)
> +		      struct ubi_ainf_peb *new_peb, int peb_pos, bool full)
>  {
>  	struct rb_node **p =3D &av->root.rb_node, *parent =3D NULL;
> -	struct ubi_ainf_peb *aeb, *victim;
> -	int cmp_res;
> +	struct ubi_ainf_leb *aeb;
> +	int cmp_res, lnum =3D be32_to_cpu(new_vh->lnum);
> =20
>  	while (*p) {
>  		parent =3D *p;
> -		aeb =3D rb_entry(parent, struct ubi_ainf_peb, u.rb);
> +		aeb =3D rb_entry(parent, struct ubi_ainf_leb, rb);
> =20
> -		if (be32_to_cpu(new_vh->lnum) !=3D aeb->lnum) {
> -			if (be32_to_cpu(new_vh->lnum) < aeb->lnum)
> +		if (be32_to_cpu(new_vh->lnum) !=3D aeb->desc.lnum) {
> +			if (be32_to_cpu(new_vh->lnum) < aeb->desc.lnum)
>  				p =3D &(*p)->rb_left;
>  			else
>  				p =3D &(*p)->rb_right;
> @@ -293,51 +290,58 @@ static int update_vol(struct ubi_device *ubi, struc=
t ubi_attach_info *ai,
>  		 * because of a volume change (creation, deletion, ..).
>  		 * Then a PEB can be within the persistent EBA and the pool.
>  		 */
> -		if (aeb->pnum =3D=3D new_aeb->pnum) {
> -			ubi_assert(aeb->lnum =3D=3D new_aeb->lnum);
> -			kmem_cache_free(ai->aeb_slab_cache, new_aeb);
> +		if (aeb->peb->pnum =3D=3D new_peb->pnum) {
> +			ubi_assert(aeb->desc.lnum =3D=3D lnum);
> +			kmem_cache_free(ai->apeb_slab_cache, new_peb);
> =20
>  			return 0;
>  		}
> =20
> -		cmp_res =3D ubi_compare_lebs(ubi, aeb, new_aeb->pnum, new_vh);
> +		cmp_res =3D ubi_compare_lebs(ubi, aeb, new_peb->pnum, new_vh);
>  		if (cmp_res < 0)
>  			return cmp_res;
> =20
>  		/* new_aeb is newer */
>  		if (cmp_res & 1) {
> -			victim =3D kmem_cache_alloc(ai->aeb_slab_cache,
> -				GFP_KERNEL);
> -			if (!victim)
> -				return -ENOMEM;
> -
> -			victim->ec =3D aeb->ec;
> -			victim->pnum =3D aeb->pnum;
> -			list_add_tail(&victim->u.list, &ai->erase);
> +			if (--aeb->peb->refcount <=3D 0)
> +				list_move(&aeb->peb->list, &ai->erase);
> =20
>  			if (av->highest_lnum =3D=3D be32_to_cpu(new_vh->lnum))
>  				av->last_data_size =3D
>  					be32_to_cpu(new_vh->data_size);
> =20
>  			dbg_bld("vol %i: AEB %i's PEB %i is the newer",
> -				av->vol_id, aeb->lnum, new_aeb->pnum);
> +				av->vol_id, aeb->desc.lnum,
> +				new_peb->pnum);
> =20
> -			aeb->ec =3D new_aeb->ec;
> -			aeb->pnum =3D new_aeb->pnum;
> +			aeb->peb_pos =3D peb_pos;
> +			aeb->peb =3D new_peb;
>  			aeb->copy_flag =3D new_vh->copy_flag;
> -			aeb->scrub =3D new_aeb->scrub;
> -			kmem_cache_free(ai->aeb_slab_cache, new_aeb);
> +			aeb->sqnum =3D be64_to_cpu(new_vh->sqnum);
> +			aeb->full =3D full;
> =20
>  		/* new_aeb is older */
>  		} else {
>  			dbg_bld("vol %i: AEB %i's PEB %i is old, dropping it",
> -				av->vol_id, aeb->lnum, new_aeb->pnum);
> -			list_add_tail(&new_aeb->u.list, &ai->erase);
> +				av->vol_id, aeb->desc.lnum, new_peb->pnum);
> +			if (--aeb->peb->refcount <=3D 0)
> +				list_move(&aeb->peb->list, &ai->erase);
>  		}
> =20
>  		return 0;
>  	}
>  	/* This LEB is new, let's add it to the volume */
> +	aeb =3D kmem_cache_alloc(ai->aleb_slab_cache, GFP_KERNEL);
> +	if (!aeb)
> +		return -ENOMEM;
> +
> +	aeb->peb =3D new_peb;
> +	aeb->peb_pos =3D peb_pos;
> +	aeb->copy_flag =3D new_vh->copy_flag;
> +	aeb->full =3D full;
> +	aeb->sqnum =3D be64_to_cpu(new_vh->sqnum);
> +	aeb->desc.lnum =3D lnum;
> +	aeb->desc.vol_id =3D be32_to_cpu(new_vh->vol_id);
> =20
>  	if (av->highest_lnum <=3D be32_to_cpu(new_vh->lnum)) {
>  		av->highest_lnum =3D be32_to_cpu(new_vh->lnum);
> @@ -349,8 +353,8 @@ static int update_vol(struct ubi_device *ubi, struct =
ubi_attach_info *ai,
> =20
>  	av->leb_count++;
> =20
> -	rb_link_node(&new_aeb->u.rb, parent, p);
> -	rb_insert_color(&new_aeb->u.rb, &av->root);
> +	rb_link_node(&aeb->rb, parent, p);
> +	rb_insert_color(&aeb->rb, &av->root);
> =20
>  	return 0;
>  }
> @@ -366,7 +370,8 @@ static int update_vol(struct ubi_device *ubi, struct =
ubi_attach_info *ai,
>   */
>  static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_in=
fo *ai,
>  			    struct ubi_vid_hdr *new_vh,
> -			    struct ubi_ainf_peb *new_aeb)
> +			    struct ubi_ainf_peb *new_aeb, int peb_pos,
> +			    bool full)
>  {
>  	struct ubi_ainf_volume *av, *tmp_av =3D NULL;
>  	struct rb_node **p =3D &ai->volumes.rb_node, *parent =3D NULL;
> @@ -374,7 +379,7 @@ static int process_pool_aeb(struct ubi_device *ubi, s=
truct ubi_attach_info *ai,
> =20
>  	if (be32_to_cpu(new_vh->vol_id) =3D=3D UBI_FM_SB_VOLUME_ID ||
>  		be32_to_cpu(new_vh->vol_id) =3D=3D UBI_FM_DATA_VOLUME_ID) {
> -		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
> +		kmem_cache_free(ai->apeb_slab_cache, new_aeb);
> =20
>  		return 0;
>  	}
> @@ -398,13 +403,13 @@ static int process_pool_aeb(struct ubi_device *ubi,=
 struct ubi_attach_info *ai,
>  		av =3D tmp_av;
>  	else {
>  		ubi_err(ubi, "orphaned volume in fastmap pool!");
> -		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
> +		kmem_cache_free(ai->apeb_slab_cache, new_aeb);
>  		return UBI_BAD_FASTMAP;
>  	}
> =20
>  	ubi_assert(be32_to_cpu(new_vh->vol_id) =3D=3D av->vol_id);
> =20
> -	return update_vol(ubi, ai, av, new_vh, new_aeb);
> +	return update_vol(ubi, ai, av, new_vh, new_aeb, peb_pos, full);
>  }
> =20
>  /**
> @@ -419,18 +424,20 @@ static void unmap_peb(struct ubi_attach_info *ai, i=
nt pnum)
>  {
>  	struct ubi_ainf_volume *av;
>  	struct rb_node *node, *node2;
> -	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_leb *aeb;
> =20
>  	for (node =3D rb_first(&ai->volumes); node; node =3D rb_next(node)) {
>  		av =3D rb_entry(node, struct ubi_ainf_volume, rb);
> =20
>  		for (node2 =3D rb_first(&av->root); node2;
>  		     node2 =3D rb_next(node2)) {
> -			aeb =3D rb_entry(node2, struct ubi_ainf_peb, u.rb);
> -			if (aeb->pnum =3D=3D pnum) {
> -				rb_erase(&aeb->u.rb, &av->root);
> +			aeb =3D rb_entry(node2, struct ubi_ainf_leb, rb);
> +			if (aeb->peb->pnum =3D=3D pnum) {
> +				rb_erase(&aeb->rb, &av->root);
>  				av->leb_count--;
> -				kmem_cache_free(ai->aeb_slab_cache, aeb);
> +				if (--aeb->peb->refcount <=3D 0)
> +					list_move(&aeb->peb->list, &ai->erase);
> +				kmem_cache_free(ai->apeb_slab_cache, aeb);
>  				return;
>  			}
>  		}
> @@ -456,7 +463,7 @@ static int scan_pool(struct ubi_device *ubi, struct u=
bi_attach_info *ai,
>  	struct ubi_vid_hdr *vh;
>  	struct ubi_ec_hdr *ech;
>  	struct ubi_ainf_peb *new_aeb;
> -	int i, pnum, err, ret =3D 0;
> +	int i, pnum, err, ret =3D 0, nvid;
> =20
>  	ech =3D kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
>  	if (!ech)
> @@ -508,7 +515,9 @@ static int scan_pool(struct ubi_device *ubi, struct u=
bi_attach_info *ai,
>  			goto out;
>  		}
> =20
> -		err =3D ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
> +		/* TODO: support consolidate PEBs */
> +		nvid =3D ubi->lebs_per_cpeb;
> +		err =3D ubi_io_read_vid_hdrs(ubi, pnum, vh, &nvid, 0);
>  		if (err =3D=3D UBI_IO_FF || err =3D=3D UBI_IO_FF_BITFLIPS) {
>  			unsigned long long ec =3D be64_to_cpu(ech->ec);
>  			unmap_peb(ai, pnum);
> @@ -519,12 +528,15 @@ static int scan_pool(struct ubi_device *ubi, struct=
 ubi_attach_info *ai,
>  				add_aeb(ai, free, pnum, ec, 0);
>  			continue;
>  		} else if (err =3D=3D 0 || err =3D=3D UBI_IO_BITFLIPS) {
> +			bool full =3D false;
> +			int peb_pos;
> +
>  			dbg_bld("Found non empty PEB:%i in pool", pnum);
> =20
>  			if (err =3D=3D UBI_IO_BITFLIPS)
>  				scrub =3D 1;
> =20
> -			new_aeb =3D kmem_cache_alloc(ai->aeb_slab_cache,
> +			new_aeb =3D kmem_cache_alloc(ai->apeb_slab_cache,
>  						   GFP_KERNEL);
>  			if (!new_aeb) {
>  				ret =3D -ENOMEM;
> @@ -533,18 +545,33 @@ static int scan_pool(struct ubi_device *ubi, struct=
 ubi_attach_info *ai,
> =20
>  			new_aeb->ec =3D be64_to_cpu(ech->ec);
>  			new_aeb->pnum =3D pnum;
> +			new_aeb->refcount =3D 1;
> +/*
>  			new_aeb->lnum =3D be32_to_cpu(vh->lnum);
>  			new_aeb->sqnum =3D be64_to_cpu(vh->sqnum);
>  			new_aeb->copy_flag =3D vh->copy_flag;
> +*/
>  			new_aeb->scrub =3D scrub;
> +			if (nvid =3D=3D 1) {
> +				err =3D ubi_io_read(ubi, ech, pnum,
> +						  ubi->peb_size - ubi->hdrs_min_io_size,
> +						  ubi->hdrs_min_io_size);
> +				if (!err && !ubi_check_pattern(ech, 0xff, ubi->hdrs_min_io_size))
> +					full =3D true;
> +			}
> =20
> -			if (*max_sqnum < new_aeb->sqnum)
> -				*max_sqnum =3D new_aeb->sqnum;
> +			new_aeb->consolidated =3D nvid > 1;
> =20
> -			err =3D process_pool_aeb(ubi, ai, vh, new_aeb);
> -			if (err) {
> -				ret =3D err > 0 ? UBI_BAD_FASTMAP : err;
> -				goto out;
> +			for (peb_pos =3D 0; peb_pos < nvid; peb_pos++) {
> +				if (*max_sqnum < be64_to_cpu(vh[peb_pos].sqnum))
> +					*max_sqnum =3D be64_to_cpu(vh[peb_pos].sqnum);
> +
> +				err =3D process_pool_aeb(ubi, ai, &vh[peb_pos], new_aeb,
> +						       peb_pos, full);
> +				if (err) {
> +					ret =3D err > 0 ? UBI_BAD_FASTMAP : err;
> +					goto out;
> +				}
>  			}
>  		} else {
>  			/* We are paranoid and fall back to scanning mode */
> @@ -568,19 +595,16 @@ out:
>  static int count_fastmap_pebs(struct ubi_attach_info *ai)
>  {
>  	struct ubi_ainf_peb *aeb;
> -	struct ubi_ainf_volume *av;
> -	struct rb_node *rb1, *rb2;
>  	int n =3D 0;
> =20
> -	list_for_each_entry(aeb, &ai->erase, u.list)
> +	list_for_each_entry(aeb, &ai->erase, list)
>  		n++;
> =20
> -	list_for_each_entry(aeb, &ai->free, u.list)
> +	list_for_each_entry(aeb, &ai->free, list)
>  		n++;
> =20
> -	 ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb)
> -		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
> -			n++;
> +	list_for_each_entry(aeb, &ai->used, list)
> +		n++;
> =20
>  	return n;
>  }
> @@ -731,6 +755,9 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
> =20
>  	/* Iterate over all volumes and read their EBA table */
>  	for (i =3D 0; i < be32_to_cpu(fmhdr->vol_count); i++) {
> +		struct ubi_fm_consolidated_leb *fclebs =3D NULL;
> +		int nconso =3D 0;
> +
>  		fmvhdr =3D (struct ubi_fm_volhdr *)(fm_raw + fm_pos);
>  		fm_pos +=3D sizeof(*fmvhdr);
>  		if (fm_pos >=3D fm_size)
> @@ -760,6 +787,18 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  		if (ai->highest_vol_id < be32_to_cpu(fmvhdr->vol_id))
>  			ai->highest_vol_id =3D be32_to_cpu(fmvhdr->vol_id);
> =20
> +		nconso =3D be32_to_cpu(fmvhdr->consolidated_ebs);
> +		if (nconso) {
> +			struct ubi_fm_consolidated *fmconso =3D NULL;
> +
> +			fmconso =3D fm_raw + fm_pos;
> +			if (be32_to_cpu(fmvhdr->magic) !=3D UBI_FM_CONSO_MAGIC)
> +				goto fail_bad;
> +
> +			fclebs =3D fmconso->lebs;
> +			fm_pos +=3D sizeof(*fmconso) + (nconso * sizeof(*fclebs));
> +		}
> +
>  		fm_eba =3D (struct ubi_fm_eba *)(fm_raw + fm_pos);
>  		fm_pos +=3D sizeof(*fm_eba);
>  		fm_pos +=3D (sizeof(__be32) * be32_to_cpu(fm_eba->reserved_pebs));
> @@ -774,12 +813,14 @@ static int ubi_attach_fastmap(struct ubi_device *ub=
i,
> =20
>  		for (j =3D 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
>  			int pnum =3D be32_to_cpu(fm_eba->pnum[j]);
> +			struct ubi_ainf_leb *leb;
> +			int k;
> =20
>  			if (pnum < 0)
>  				continue;
> =20
>  			aeb =3D NULL;
> -			list_for_each_entry(tmp_aeb, &used, u.list) {
> +			list_for_each_entry(tmp_aeb, &used, list) {
>  				if (tmp_aeb->pnum =3D=3D pnum) {
>  					aeb =3D tmp_aeb;
>  					break;
> @@ -791,18 +832,34 @@ static int ubi_attach_fastmap(struct ubi_device *ub=
i,
>  				goto fail_bad;
>  			}
> =20
> -			aeb->lnum =3D j;
> +			leb =3D kmem_cache_alloc(ai->aleb_slab_cache, GFP_KERNEL);
> +			if (!leb)
> +				goto fail_bad;
> +
> +			leb->desc.lnum =3D j;
> +			leb->desc.vol_id =3D av->vol_id;
> +			leb->peb_pos =3D 0;
> +			for (k =3D 0; k < nconso; k++) {
> +				if (be32_to_cpu(fclebs[k].lnum) !=3D
> +				    leb->desc.lnum)
> +					continue;
> =20
> -			if (av->highest_lnum <=3D aeb->lnum)
> -				av->highest_lnum =3D aeb->lnum;
> +				leb->peb_pos =3D be32_to_cpu(fclebs[k].peb_pos);
> +				aeb->consolidated =3D true;
> +			}
> +			leb->peb =3D aeb;
> =20
> -			assign_aeb_to_av(ai, aeb, av);
> +			if (av->highest_lnum <=3D leb->desc.lnum)
> +				av->highest_lnum =3D leb->desc.lnum;
> +
> +			assign_aeb_to_av(ai, leb, av);
> =20
>  			dbg_bld("inserting PEB:%i (LEB %i) to vol %i",
> -				aeb->pnum, aeb->lnum, av->vol_id);
> +				aeb->pnum, leb->desc.lnum, av->vol_id);
>  		}
>  	}
> =20
> +
>  	ret =3D scan_pool(ubi, ai, fmpl->pebs, pool_size, &max_sqnum, &free);
>  	if (ret)
>  		goto fail;
> @@ -814,11 +871,11 @@ static int ubi_attach_fastmap(struct ubi_device *ub=
i,
>  	if (max_sqnum > ai->max_sqnum)
>  		ai->max_sqnum =3D max_sqnum;
> =20
> -	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list)
> -		list_move_tail(&tmp_aeb->u.list, &ai->free);
> +	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, list)
> +		list_move_tail(&tmp_aeb->list, &ai->free);
> =20
> -	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list)
> -		list_move_tail(&tmp_aeb->u.list, &ai->erase);
> +	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, list)
> +		list_move_tail(&tmp_aeb->list, &ai->erase);
> =20
>  	ubi_assert(list_empty(&free));
> =20
> @@ -837,13 +894,13 @@ static int ubi_attach_fastmap(struct ubi_device *ub=
i,
>  fail_bad:
>  	ret =3D UBI_BAD_FASTMAP;
>  fail:
> -	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
> -		list_del(&tmp_aeb->u.list);
> -		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
> +	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, list) {
> +		list_del(&tmp_aeb->list);
> +		kmem_cache_free(ai->apeb_slab_cache, tmp_aeb);
>  	}
> -	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
> -		list_del(&tmp_aeb->u.list);
> -		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
> +	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, list) {
> +		list_del(&tmp_aeb->list);
> +		kmem_cache_free(ai->apeb_slab_cache, tmp_aeb);
>  	}
> =20
>  	return ret;
> @@ -1242,6 +1299,8 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>  	fmh->erase_peb_count =3D cpu_to_be32(erase_peb_count);
> =20
>  	for (i =3D 0; i < UBI_MAX_VOLUMES + UBI_INT_VOL_COUNT; i++) {
> +		int nconso =3D 0;
> +
>  		vol =3D ubi->volumes[i];
> =20
>  		if (!vol)
> @@ -1263,11 +1322,49 @@ static int ubi_write_fastmap(struct ubi_device *u=
bi,
>  		ubi_assert(vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME ||
>  			vol->vol_type =3D=3D UBI_STATIC_VOLUME);
> =20
> +		if (ubi->consolidated) {
> +			struct ubi_fm_consolidated *fconso;
> +			struct ubi_fm_consolidated_leb *fcleb;
> +
> +			fconso =3D (struct ubi_fm_consolidated *)(fm_raw + fm_pos);
> +			for (j =3D 0; j < vol->reserved_lebs; j++) {
> +				struct ubi_leb_desc *cleb;
> +				int k;
> +
> +				cleb =3D ubi->consolidated[vol->eba_tbl[j]];
> +				if (!cleb)
> +					continue;
> +
> +				fcleb =3D &fconso->lebs[nconso];
> +				fcleb->lnum =3D cpu_to_be32(j);
> +				for (k =3D 0; k < ubi->lebs_per_cpeb;
> +				     k++) {
> +					if (cleb[k].vol_id !=3D vol->vol_id ||
> +					    cleb[k].lnum !=3D j)
> +						continue;
> +
> +					fcleb->peb_pos =3D cpu_to_be32(k);
> +					break;
> +				}
> +
> +				if (k > ubi->lebs_per_cpeb) {
> +					ret =3D -EAGAIN;
> +					goto out_kfree;
> +				}
> +
> +				nconso++;
> +			}
> +
> +			if (nconso)
> +				fm_pos +=3D sizeof(*fconso) +
> +					  (nconso * sizeof(*fcleb));
> +		}
> +
>  		feba =3D (struct ubi_fm_eba *)(fm_raw + fm_pos);
> -		fm_pos +=3D sizeof(*feba) + (sizeof(__be32) * vol->reserved_pebs);
> +		fm_pos +=3D sizeof(*feba) + (sizeof(__be32) * vol->reserved_lebs);
>  		ubi_assert(fm_pos <=3D ubi->fm_size);
> =20
> -		for (j =3D 0; j < vol->reserved_pebs; j++)
> +		for (j =3D 0; j < vol->reserved_lebs; j++)
>  			feba->pnum[j] =3D cpu_to_be32(vol->eba_tbl[j]);
> =20
>  		feba->reserved_pebs =3D cpu_to_be32(j);
> diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> index dc315c2..c880897 100644
> --- a/drivers/mtd/ubi/kapi.c
> +++ b/drivers/mtd/ubi/kapi.c
> @@ -82,7 +82,7 @@ void ubi_do_get_volume_info(struct ubi_device *ubi, str=
uct ubi_volume *vol,
>  {
>  	vi->vol_id =3D vol->vol_id;
>  	vi->ubi_num =3D ubi->ubi_num;
> -	vi->size =3D vol->reserved_pebs;
> +	vi->size =3D vol->reserved_lebs;
>  	vi->used_bytes =3D vol->used_bytes;
>  	vi->vol_type =3D vol->vol_type;
>  	vi->corrupted =3D vol->corrupted;
> @@ -532,7 +532,7 @@ int ubi_leb_write(struct ubi_volume_desc *desc, int l=
num, const void *buf,
>  	if (desc->mode =3D=3D UBI_READONLY || vol->vol_type =3D=3D UBI_STATIC_V=
OLUME)
>  		return -EROFS;
> =20
> -	if (lnum < 0 || lnum >=3D vol->reserved_pebs || offset < 0 || len < 0 ||
> +	if (lnum < 0 || lnum >=3D vol->reserved_lebs || offset < 0 || len < 0 ||
>  	    offset + len > vol->usable_leb_size ||
>  	    offset & (ubi->min_io_size - 1) || len & (ubi->min_io_size - 1))
>  		return -EINVAL;
> @@ -577,7 +577,7 @@ int ubi_leb_change(struct ubi_volume_desc *desc, int =
lnum, const void *buf,
>  	if (desc->mode =3D=3D UBI_READONLY || vol->vol_type =3D=3D UBI_STATIC_V=
OLUME)
>  		return -EROFS;
> =20
> -	if (lnum < 0 || lnum >=3D vol->reserved_pebs || len < 0 ||
> +	if (lnum < 0 || lnum >=3D vol->reserved_lebs || len < 0 ||
>  	    len > vol->usable_leb_size || len & (ubi->min_io_size - 1))
>  		return -EINVAL;
> =20
> @@ -614,7 +614,7 @@ int ubi_leb_erase(struct ubi_volume_desc *desc, int l=
num)
>  	if (desc->mode =3D=3D UBI_READONLY || vol->vol_type =3D=3D UBI_STATIC_V=
OLUME)
>  		return -EROFS;
> =20
> -	if (lnum < 0 || lnum >=3D vol->reserved_pebs)
> +	if (lnum < 0 || lnum >=3D vol->reserved_lebs)
>  		return -EINVAL;
> =20
>  	if (vol->upd_marker)
> @@ -674,7 +674,7 @@ int ubi_leb_unmap(struct ubi_volume_desc *desc, int l=
num)
>  	if (desc->mode =3D=3D UBI_READONLY || vol->vol_type =3D=3D UBI_STATIC_V=
OLUME)
>  		return -EROFS;
> =20
> -	if (lnum < 0 || lnum >=3D vol->reserved_pebs)
> +	if (lnum < 0 || lnum >=3D vol->reserved_lebs)
>  		return -EINVAL;
> =20
>  	if (vol->upd_marker)
> @@ -710,7 +710,7 @@ int ubi_leb_map(struct ubi_volume_desc *desc, int lnu=
m)
>  	if (desc->mode =3D=3D UBI_READONLY || vol->vol_type =3D=3D UBI_STATIC_V=
OLUME)
>  		return -EROFS;
> =20
> -	if (lnum < 0 || lnum >=3D vol->reserved_pebs)
> +	if (lnum < 0 || lnum >=3D vol->reserved_lebs)
>  		return -EINVAL;
> =20
>  	if (vol->upd_marker)
> @@ -745,7 +745,7 @@ int ubi_is_mapped(struct ubi_volume_desc *desc, int l=
num)
> =20
>  	dbg_gen("test LEB %d:%d", vol->vol_id, lnum);
> =20
> -	if (lnum < 0 || lnum >=3D vol->reserved_pebs)
> +	if (lnum < 0 || lnum >=3D vol->reserved_lebs)
>  		return -EINVAL;
> =20
>  	if (vol->upd_marker)
> diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
> index 22ed3f6..500d7da 100644
> --- a/drivers/mtd/ubi/ubi-media.h
> +++ b/drivers/mtd/ubi/ubi-media.h
> @@ -363,7 +363,7 @@ struct ubi_vid_hdr {
>   * Empty records contain all zeroes and the CRC checksum of those zeroes.
>   */
>  struct ubi_vtbl_record {
> -	__be32  reserved_pebs;
> +	__be32  reserved_lebs;
>  	__be32  alignment;
>  	__be32  data_pad;
>  	__u8    vol_type;
> @@ -388,6 +388,7 @@ struct ubi_vtbl_record {
>  #define UBI_FM_VHDR_MAGIC	0xFA370ED1
>  #define UBI_FM_POOL_MAGIC	0x67AF4D08
>  #define UBI_FM_EBA_MAGIC	0xf0c040a8
> +#define UBI_FM_CONSO_MAGIC	0xc025011d
> =20
>  /* A fastmap supber block can be located between PEB 0 and
>   * UBI_FM_MAX_START */
> @@ -444,7 +445,7 @@ struct ubi_fm_hdr {
>  	__be32 bad_peb_count;
>  	__be32 erase_peb_count;
>  	__be32 vol_count;
> -	__u8 padding[4];
> +	__be32 consolidated_count;
>  } __packed;
> =20
>  /* struct ubi_fm_hdr is followed by two struct ubi_fm_scan_pool */
> @@ -494,7 +495,8 @@ struct ubi_fm_volhdr {
>  	__be32 data_pad;
>  	__be32 used_ebs;
>  	__be32 last_eb_bytes;
> -	__u8 padding2[8];
> +	__be32 consolidated_ebs;
> +	__u8 padding2[4];
>  } __packed;
> =20
>  /* struct ubi_fm_volhdr is followed by one struct ubi_fm_eba records */
> @@ -510,4 +512,14 @@ struct ubi_fm_eba {
>  	__be32 reserved_pebs;
>  	__be32 pnum[0];
>  } __packed;
> +
> +struct ubi_fm_consolidated_leb {
> +	__be32 lnum;
> +	__be32 peb_pos;
> +} __packed;
> +
> +struct ubi_fm_consolidated {
> +	__be32 magic;
> +	struct ubi_fm_consolidated_leb lebs[0];
> +} __packed;
>  #endif /* !__UBI_MEDIA_H__ */
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index aab984f..47e5219 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -90,6 +90,12 @@ void ubi_err(const struct ubi_device *ubi, const char =
*fmt, ...);
>  /* The volume ID/LEB number/erase counter is unknown */
>  #define UBI_UNKNOWN -1
> =20
> +#ifdef CONFIG_MTD_UBI_CONSOLIDATE
> +/* Number of PEBs reserved for consolidation */
> +#define UBI_CONSO_RESERVED_PEBS 1
> +#else
> +#define UBI_CONSO_RESERVED_PEBS 0
> +#endif
>  /*
>   * The UBI debugfs directory name pattern and maximum name length (3 for=
 "ubi"
>   * + 2 for the number plus 1 for the trailing zero byte.
> @@ -169,6 +175,20 @@ enum {
>  };
> =20
>  /**
> + * struct ubi_leb_desc - UBI logical eraseblock description.
> + * @vol_id: volume ID of the locked logical eraseblock
> + * @lnum: locked logical eraseblock number
> + * @lpos: n'th LEB within this PEB, starting at 0
> + *
> + * This data structure is used in describe a logical eraseblock.
> + */
> +struct ubi_leb_desc {
> +	int vol_id;
> +	int lnum;
> +	int lpos;
> +};
> +
> +/**
>   * struct ubi_wl_entry - wear-leveling entry.
>   * @u.rb: link in the corresponding (free/used) RB-tree
>   * @u.list: link in the protection queue
> @@ -210,6 +230,11 @@ struct ubi_ltree_entry {
>  	struct rw_semaphore mutex;
>  };
> =20
> +struct ubi_full_leb {
> +	struct list_head node;
> +	struct ubi_leb_desc desc;
> +};
> +
>  /**
>   * struct ubi_rename_entry - volume re-name description data structure.
>   * @new_name_len: new volume name length
> @@ -269,6 +294,18 @@ struct ubi_fm_pool {
>  };
> =20
>  /**
> + * struct ubi_consolidable_leb - UBI consolidable LEB.
> + * @list: links RB-tree nodes
> + * @vol_id: volume ID
> + * @lnum: locked logical eraseblock number
> + */
> +struct ubi_consolidable_leb {
> +	struct list_head list;
> +	int vol_id;
> +	int lnum;
> +};
> +
> +/**
>   * struct ubi_volume - UBI volume description data structure.
>   * @dev: device object to make use of the the Linux device model
>   * @cdev: character device object to create character device
> @@ -329,7 +366,7 @@ struct ubi_volume {
>  	int exclusive;
>  	int metaonly;
> =20
> -	int reserved_pebs;
> +	int reserved_lebs;
>  	int vol_type;
>  	int usable_leb_size;
>  	int used_ebs;
> @@ -561,6 +598,15 @@ struct ubi_device {
>  	spinlock_t ltree_lock;
>  	struct rb_root ltree;
> =20
> +	int lebs_per_cpeb;
> +	struct ubi_leb_desc **consolidated;
> +	spinlock_t full_lock;
> +	struct list_head full;
> +	int full_count;
> +	int consolidation_threshold;
> +	int consolidation_pnum;
> +	struct list_head consolidable;
> +
>  	/* Fastmap stuff */
>  	int fm_disabled;
>  	struct ubi_fastmap_layout *fm;
> @@ -587,6 +633,7 @@ struct ubi_device {
>  	struct mutex work_mutex;
>  	struct ubi_work *cur_work;
>  	int wl_scheduled;
> +	int conso_scheduled;
>  	struct ubi_wl_entry **lookuptbl;
>  	struct ubi_wl_entry *move_from;
>  	struct ubi_wl_entry *move_to;
> @@ -648,17 +695,22 @@ struct ubi_device {
>   * volume, the @vol_id and @lnum fields are initialized to %UBI_UNKNOWN.
>   */
>  struct ubi_ainf_peb {
> +	struct list_head list;
>  	int ec;
>  	int pnum;
> -	int vol_id;
> -	int lnum;
> +	int refcount;
>  	unsigned int scrub:1;
> -	unsigned int copy_flag:1;
> +	unsigned int consolidated:1;
> +};
> +
> +struct ubi_ainf_leb {
> +	struct rb_node rb;
> +	struct ubi_leb_desc desc;
>  	unsigned long long sqnum;
> -	union {
> -		struct rb_node rb;
> -		struct list_head list;
> -	} u;
> +	unsigned int copy_flag:1;
> +	unsigned int full:1;
> +	int peb_pos;
> +	struct ubi_ainf_peb *peb;
>  };
> =20
>  /**
> @@ -685,6 +737,7 @@ struct ubi_ainf_peb {
>  struct ubi_ainf_volume {
>  	int vol_id;
>  	int highest_lnum;
> +	unsigned long long int highest_sqnum;
>  	int leb_count;
>  	int vol_type;
>  	int used_ebs;
> @@ -731,6 +784,7 @@ struct ubi_attach_info {
>  	struct list_head free;
>  	struct list_head erase;
>  	struct list_head alien;
> +	struct list_head used;
>  	int corr_peb_count;
>  	int empty_peb_count;
>  	int alien_peb_count;
> @@ -745,7 +799,8 @@ struct ubi_attach_info {
>  	int mean_ec;
>  	uint64_t ec_sum;
>  	int ec_count;
> -	struct kmem_cache *aeb_slab_cache;
> +	struct kmem_cache *apeb_slab_cache;
> +	struct kmem_cache *aleb_slab_cache;
>  };
> =20
>  /**
> @@ -790,8 +845,9 @@ extern struct mutex ubi_devices_mutex;
>  extern struct blocking_notifier_head ubi_notifiers;
> =20
>  /* attach.c */
> -int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, in=
t pnum,
> -		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
> +int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai,
> +		  struct ubi_ainf_peb *peb, const struct ubi_vid_hdr *vid_hdr,
> +		  int peb_pos, int bitflips, bool full);
>  struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
>  				    int vol_id);
>  void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *a=
v);
> @@ -849,13 +905,56 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ub=
i, struct ubi_volume *vol,
>  			      int lnum, const void *buf, int len);
>  int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
>  		     struct ubi_vid_hdr *vid_hdr);
> +int ubi_eba_copy_lebs(struct ubi_device *ubi, int from, int to,
> +		     struct ubi_vid_hdr *vid_hdr, int nvidh);
>  int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
>  unsigned long long ubi_next_sqnum(struct ubi_device *ubi);
> +int ubi_eba_leb_write_lock_nested(struct ubi_device *ubi, int vol_id, in=
t lnum,
> +				  int level);
> +void ubi_eba_leb_write_unlock(struct ubi_device *ubi, int vol_id, int ln=
um);
>  int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fa=
stmap,
>  		   struct ubi_attach_info *ai_scan);
> =20
> +/* consolidate.c */
> +#ifdef CONFIG_MTD_UBI_CONSOLIDATE
> +bool ubi_conso_consolidation_needed(struct ubi_device *ubi);
> +void ubi_conso_schedule(struct ubi_device *ubi);
> +void ubi_eba_consolidate(struct ubi_device *ubi);
> +void ubi_conso_remove_full_leb(struct ubi_device *ubi, int vol_id, int l=
num);
> +struct ubi_leb_desc *ubi_conso_get_consolidated(struct ubi_device *ubi,
> +						int pnum);
> +bool ubi_conso_invalidate_leb(struct ubi_device *ubi, int pnum,
> +			      int vol_id, int lnum);
> +int ubi_coso_add_full_leb(struct ubi_device *ubi, int vol_id, int lnum, =
int lpos);
> +int ubi_conso_init(struct ubi_device *ubi);
> +void ubi_conso_close(struct ubi_device *ubi);
> +#else
> +static inline bool ubi_conso_consolidation_needed(struct ubi_device *ubi)
> +{
> +	return false;
> +}
> +static inline void ubi_conso_schedule(struct ubi_device *ubi) {}
> +static inline void ubi_eba_consolidate(struct ubi_device *ubi) {}
> +static inline void ubi_conso_remove_full_leb(struct ubi_device *ubi, int=
 vol_id, int lnum) {}
> +static inline struct ubi_leb_desc *ubi_conso_get_consolidated(struct ubi=
_device *ubi, int pnum)
> +{
> +	return NULL;
> +}
> +static inline bool ubi_conso_invalidate_leb(struct ubi_device *ubi, int =
pnum, int vol_id, int lnum)
> +{
> +	return true;
> +}
> +static inline int ubi_coso_add_full_leb(struct ubi_device *ubi, int vol_=
id, int lnum, int lpos)
> +{
> +	return 0;
> +}
> +static inline int ubi_conso_init(struct ubi_device *ubi) { return 0; }
> +static inline void ubi_conso_close(struct ubi_device *ubi) {}
> +#endif
> +
>  /* wl.c */
> -int ubi_wl_get_peb(struct ubi_device *ubi);
> +int ubi_wl_get_peb(struct ubi_device *ubi, bool producing);
> +int ubi_wl_flush(struct ubi_device *ubi);
>  int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture);
>  int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
>  int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai);
> @@ -876,7 +975,9 @@ void ubi_work_close(struct ubi_device *ubi, int error=
);
>  struct ubi_work *ubi_alloc_work(struct ubi_device *ubi);
>  int ubi_work_flush(struct ubi_device *ubi);
>  bool ubi_work_join_one(struct ubi_device *ubi);
> -
> +struct ubi_work *ubi_alloc_erase_work(struct ubi_device *ubi,
> +				      struct ubi_wl_entry *e,
> +				      int torture);
>  /* io.c */
>  int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int o=
ffset,
>  		int len);
> @@ -923,8 +1024,8 @@ void ubi_do_get_device_info(struct ubi_device *ubi, =
struct ubi_device_info *di);
>  void ubi_do_get_volume_info(struct ubi_device *ubi, struct ubi_volume *v=
ol,
>  			    struct ubi_volume_info *vi);
>  /* scan.c */
> -int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *=
aeb,
> -		      int pnum, const struct ubi_vid_hdr *vid_hdr);
> +int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_leb *=
aeb,
> +		     int pnum, const struct ubi_vid_hdr *vid_hdr);
> =20
>  /* fastmap.c */
>  #ifdef CONFIG_MTD_UBI_FASTMAP
> @@ -955,6 +1056,22 @@ static inline int ubiblock_remove(struct ubi_volume=
_info *vi)
>  }
>  #endif
> =20
> +/**
> + * ubi_get_compat - get compatibility flags of a volume.
> + * @ubi: UBI device description object
> + * @vol_id: volume ID
> + *
> + * This function returns compatibility flags for an internal volume. User
> + * volumes have no compatibility flags, so %0 is returned.
> + */
> +static inline int ubi_get_compat(const struct ubi_device *ubi, int vol_i=
d)
> +{
> +	if (vol_id =3D=3D UBI_LAYOUT_VOLUME_ID)
> +		return UBI_LAYOUT_VOLUME_COMPAT;
> +	return 0;
> +}
> +
> +
>  /*
>   * ubi_for_each_free_peb - walk the UBI free RB tree.
>   * @ubi: UBI device description object
> @@ -1006,21 +1123,6 @@ static inline int ubiblock_remove(struct ubi_volum=
e_info *vi)
>  	     rb =3D rb_next(rb),                                               \
>  	     pos =3D (rb ? container_of(rb, typeof(*pos), member) : NULL))
> =20
> -/*
> - * ubi_move_aeb_to_list - move a PEB from the volume tree to a list.
> - *
> - * @av: volume attaching information
> - * @aeb: attaching eraseblock information
> - * @list: the list to move to
> - */
> -static inline void ubi_move_aeb_to_list(struct ubi_ainf_volume *av,
> -					 struct ubi_ainf_peb *aeb,
> -					 struct list_head *list)
> -{
> -		rb_erase(&aeb->u.rb, &av->root);
> -		list_add_tail(&aeb->u.list, list);
> -}
> -
>  /**
>   * ubi_zalloc_vid_hdr - allocate a volume identifier header object.
>   * @ubi: UBI device description object
> diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
> index ffaface..cc21f64 100644
> --- a/drivers/mtd/ubi/upd.c
> +++ b/drivers/mtd/ubi/upd.c
> @@ -142,7 +142,7 @@ int ubi_start_update(struct ubi_device *ubi, struct u=
bi_volume *vol,
>  		return err;
> =20
>  	/* Before updating - wipe out the volume */
> -	for (i =3D 0; i < vol->reserved_pebs; i++) {
> +	for (i =3D 0; i < vol->reserved_lebs; i++) {
>  		err =3D ubi_eba_unmap_leb(ubi, vol, i);
>  		if (err)
>  			return err;
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index 8a2e081..736acb2 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -86,7 +86,7 @@ static ssize_t vol_attribute_show(struct device *dev,
>  	spin_unlock(&ubi->volumes_lock);
> =20
>  	if (attr =3D=3D &attr_vol_reserved_ebs)
> -		ret =3D sprintf(buf, "%d\n", vol->reserved_pebs);
> +		ret =3D sprintf(buf, "%d\n", vol->reserved_lebs);
>  	else if (attr =3D=3D &attr_vol_type) {
>  		const char *tp;
> =20
> @@ -158,6 +158,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct =
ubi_mkvol_req *req)
>  	int i, err, vol_id =3D req->vol_id, do_free =3D 1;
>  	struct ubi_volume *vol;
>  	struct ubi_vtbl_record vtbl_rec;
> +	int rsvd_pebs =3D 0;
>  	dev_t dev;
> =20
>  	if (ubi->ro_mode)
> @@ -208,11 +209,13 @@ int ubi_create_volume(struct ubi_device *ubi, struc=
t ubi_mkvol_req *req)
> =20
>  	/* Calculate how many eraseblocks are requested */
>  	vol->usable_leb_size =3D ubi->leb_size - ubi->leb_size % req->alignment;
> -	vol->reserved_pebs =3D div_u64(req->bytes + vol->usable_leb_size - 1,
> +	vol->reserved_lebs =3D div_u64(req->bytes + vol->usable_leb_size - 1,
>  				     vol->usable_leb_size);
> =20
>  	/* Reserve physical eraseblocks */
> -	if (vol->reserved_pebs > ubi->avail_pebs) {
> +	rsvd_pebs =3D DIV_ROUND_UP(vol->reserved_lebs,
> +				 ubi->lebs_per_cpeb);
> +	if (rsvd_pebs > ubi->avail_pebs) {
>  		ubi_err(ubi, "not enough PEBs, only %d available",
>  			ubi->avail_pebs);
>  		if (ubi->corr_peb_count)
> @@ -221,8 +224,8 @@ int ubi_create_volume(struct ubi_device *ubi, struct =
ubi_mkvol_req *req)
>  		err =3D -ENOSPC;
>  		goto out_unlock;
>  	}
> -	ubi->avail_pebs -=3D vol->reserved_pebs;
> -	ubi->rsvd_pebs +=3D vol->reserved_pebs;
> +	ubi->avail_pebs -=3D rsvd_pebs;
> +	ubi->rsvd_pebs +=3D rsvd_pebs;
>  	spin_unlock(&ubi->volumes_lock);
> =20
>  	vol->vol_id    =3D vol_id;
> @@ -241,17 +244,31 @@ int ubi_create_volume(struct ubi_device *ubi, struc=
t ubi_mkvol_req *req)
>  	if (err)
>  		goto out_acc;
> =20
> -	vol->eba_tbl =3D kmalloc(vol->reserved_pebs * sizeof(int), GFP_KERNEL);
> +	vol->eba_tbl =3D kmalloc(vol->reserved_lebs * sizeof(int), GFP_KERNEL);
>  	if (!vol->eba_tbl) {
>  		err =3D -ENOMEM;
>  		goto out_acc;
>  	}
> =20
> -	for (i =3D 0; i < vol->reserved_pebs; i++)
> +#ifdef CONFIG_UBI_EXTENDED_PEB
> +	/*
> +	 * TODO: check in the underlying MTD device has a page pairing scheme
> +	 * requiring the consolidated bitmap creation.
> +	 */
> +	vol->consolidated =3D kzalloc(DIV_ROUND_UP(vol->reserved_lebs,
> +						 BITS_PER_LONG),
> +				    GFP_KERNEL);
> +	if (!vol->consolidated) {
> +		err =3D -ENOMEM;
> +		goto out_mapping;
> +	}
> +#endif
> +
> +	for (i =3D 0; i < vol->reserved_lebs; i++)
>  		vol->eba_tbl[i] =3D UBI_LEB_UNMAPPED;
> =20
>  	if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {
> -		vol->used_ebs =3D vol->reserved_pebs;
> +		vol->used_ebs =3D vol->reserved_lebs;
>  		vol->last_eb_bytes =3D vol->usable_leb_size;
>  		vol->used_bytes =3D
>  			(long long)vol->used_ebs * vol->usable_leb_size;
> @@ -290,7 +307,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct =
ubi_mkvol_req *req)
> =20
>  	/* Fill volume table record */
>  	memset(&vtbl_rec, 0, sizeof(struct ubi_vtbl_record));
> -	vtbl_rec.reserved_pebs =3D cpu_to_be32(vol->reserved_pebs);
> +	vtbl_rec.reserved_lebs =3D cpu_to_be32(vol->reserved_lebs);
>  	vtbl_rec.alignment     =3D cpu_to_be32(vol->alignment);
>  	vtbl_rec.data_pad      =3D cpu_to_be32(vol->data_pad);
>  	vtbl_rec.name_len      =3D cpu_to_be16(vol->name_len);
> @@ -328,12 +345,16 @@ out_sysfs:
>  out_cdev:
>  	cdev_del(&vol->cdev);
>  out_mapping:
> -	if (do_free)
> +	if (do_free) {
>  		kfree(vol->eba_tbl);
> +#ifdef CONFIG_UBI_EXTENDED_PEB
> +		kfree(vol->consolidated);
> +#endif
> +	}
>  out_acc:
>  	spin_lock(&ubi->volumes_lock);
> -	ubi->rsvd_pebs -=3D vol->reserved_pebs;
> -	ubi->avail_pebs +=3D vol->reserved_pebs;
> +	ubi->rsvd_pebs -=3D rsvd_pebs;
> +	ubi->avail_pebs +=3D rsvd_pebs;
>  out_unlock:
>  	spin_unlock(&ubi->volumes_lock);
>  	if (do_free)
> @@ -358,7 +379,7 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, i=
nt no_vtbl)
>  {
>  	struct ubi_volume *vol =3D desc->vol;
>  	struct ubi_device *ubi =3D vol->ubi;
> -	int i, err, vol_id =3D vol->vol_id, reserved_pebs =3D vol->reserved_peb=
s;
> +	int i, err, vol_id =3D vol->vol_id, reserved_pebs;
> =20
>  	dbg_gen("remove device %d, volume %d", ubi->ubi_num, vol_id);
>  	ubi_assert(desc->mode =3D=3D UBI_EXCLUSIVE);
> @@ -385,7 +406,7 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, i=
nt no_vtbl)
>  			goto out_err;
>  	}
> =20
> -	for (i =3D 0; i < vol->reserved_pebs; i++) {
> +	for (i =3D 0; i < vol->reserved_lebs; i++) {
>  		err =3D ubi_eba_unmap_leb(ubi, vol, i);
>  		if (err)
>  			goto out_err;
> @@ -394,6 +415,8 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, i=
nt no_vtbl)
>  	cdev_del(&vol->cdev);
>  	device_unregister(&vol->dev);
> =20
> +	reserved_pebs =3D DIV_ROUND_UP(vol->reserved_lebs,
> +				     ubi->lebs_per_cpeb);
>  	spin_lock(&ubi->volumes_lock);
>  	ubi->rsvd_pebs -=3D reserved_pebs;
>  	ubi->avail_pebs +=3D reserved_pebs;
> @@ -425,9 +448,9 @@ out_unlock:
>   * negative error code in case of failure. The caller has to have the
>   * @ubi->device_mutex locked.
>   */
> -int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
> +int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_lebs)
>  {
> -	int i, err, pebs, *new_mapping;
> +	int i, err, lebs, pebs, *new_mapping;
>  	struct ubi_volume *vol =3D desc->vol;
>  	struct ubi_device *ubi =3D vol->ubi;
>  	struct ubi_vtbl_record vtbl_rec;
> @@ -437,24 +460,24 @@ int ubi_resize_volume(struct ubi_volume_desc *desc,=
 int reserved_pebs)
>  		return -EROFS;
> =20
>  	dbg_gen("re-size device %d, volume %d to from %d to %d PEBs",
> -		ubi->ubi_num, vol_id, vol->reserved_pebs, reserved_pebs);
> +		ubi->ubi_num, vol_id, vol->reserved_lebs, reserved_lebs);
> =20
>  	if (vol->vol_type =3D=3D UBI_STATIC_VOLUME &&
> -	    reserved_pebs < vol->used_ebs) {
> +	    reserved_lebs < vol->used_ebs) {
>  		ubi_err(ubi, "too small size %d, %d LEBs contain data",
> -			reserved_pebs, vol->used_ebs);
> +			reserved_lebs, vol->used_ebs);
>  		return -EINVAL;
>  	}
> =20
>  	/* If the size is the same, we have nothing to do */
> -	if (reserved_pebs =3D=3D vol->reserved_pebs)
> +	if (reserved_lebs =3D=3D vol->reserved_lebs)
>  		return 0;
> =20
> -	new_mapping =3D kmalloc(reserved_pebs * sizeof(int), GFP_KERNEL);
> +	new_mapping =3D kmalloc(reserved_lebs * sizeof(int), GFP_KERNEL);
>  	if (!new_mapping)
>  		return -ENOMEM;
> =20
> -	for (i =3D 0; i < reserved_pebs; i++)
> +	for (i =3D 0; i < reserved_lebs; i++)
>  		new_mapping[i] =3D UBI_LEB_UNMAPPED;
> =20
>  	spin_lock(&ubi->volumes_lock);
> @@ -466,8 +489,12 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, =
int reserved_pebs)
>  	spin_unlock(&ubi->volumes_lock);
> =20
>  	/* Reserve physical eraseblocks */
> -	pebs =3D reserved_pebs - vol->reserved_pebs;
> -	if (pebs > 0) {
> +	lebs =3D reserved_lebs - vol->reserved_lebs;
> +	pebs =3D DIV_ROUND_UP(reserved_lebs,
> +			    ubi->lebs_per_cpeb) -
> +	       DIV_ROUND_UP(vol->reserved_lebs,
> +			    ubi->lebs_per_cpeb);
> +	if (lebs > 0) {
>  		spin_lock(&ubi->volumes_lock);
>  		if (pebs > ubi->avail_pebs) {
>  			ubi_err(ubi, "not enough PEBs: requested %d, available %d",
> @@ -481,7 +508,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, i=
nt reserved_pebs)
>  		}
>  		ubi->avail_pebs -=3D pebs;
>  		ubi->rsvd_pebs +=3D pebs;
> -		for (i =3D 0; i < vol->reserved_pebs; i++)
> +		for (i =3D 0; i < vol->reserved_lebs; i++)
>  			new_mapping[i] =3D vol->eba_tbl[i];
>  		kfree(vol->eba_tbl);
>  		vol->eba_tbl =3D new_mapping;
> @@ -490,31 +517,32 @@ int ubi_resize_volume(struct ubi_volume_desc *desc,=
 int reserved_pebs)
> =20
>  	/* Change volume table record */
>  	vtbl_rec =3D ubi->vtbl[vol_id];
> -	vtbl_rec.reserved_pebs =3D cpu_to_be32(reserved_pebs);
> +	vtbl_rec.reserved_lebs =3D cpu_to_be32(reserved_lebs);
>  	err =3D ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
>  	if (err)
>  		goto out_acc;
> =20
> -	if (pebs < 0) {
> -		for (i =3D 0; i < -pebs; i++) {
> -			err =3D ubi_eba_unmap_leb(ubi, vol, reserved_pebs + i);
> +	if (lebs < 0) {
> +		for (i =3D 0; i < -lebs; i++) {
> +			err =3D ubi_eba_unmap_leb(ubi, vol, reserved_lebs + i);
>  			if (err)
>  				goto out_acc;
>  		}
> +
>  		spin_lock(&ubi->volumes_lock);
>  		ubi->rsvd_pebs +=3D pebs;
>  		ubi->avail_pebs -=3D pebs;
>  		ubi_update_reserved(ubi);
> -		for (i =3D 0; i < reserved_pebs; i++)
> +		for (i =3D 0; i < reserved_lebs; i++)
>  			new_mapping[i] =3D vol->eba_tbl[i];
>  		kfree(vol->eba_tbl);
>  		vol->eba_tbl =3D new_mapping;
>  		spin_unlock(&ubi->volumes_lock);
>  	}
> =20
> -	vol->reserved_pebs =3D reserved_pebs;
> +	vol->reserved_lebs =3D reserved_lebs;
>  	if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {
> -		vol->used_ebs =3D reserved_pebs;
> +		vol->used_ebs =3D reserved_lebs;
>  		vol->last_eb_bytes =3D vol->usable_leb_size;
>  		vol->used_bytes =3D
>  			(long long)vol->used_ebs * vol->usable_leb_size;
> @@ -525,7 +553,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, i=
nt reserved_pebs)
>  	return err;
> =20
>  out_acc:
> -	if (pebs > 0) {
> +	if (lebs > 0) {
>  		spin_lock(&ubi->volumes_lock);
>  		ubi->rsvd_pebs -=3D pebs;
>  		ubi->avail_pebs +=3D pebs;
> @@ -653,7 +681,7 @@ static int self_check_volume(struct ubi_device *ubi, =
int vol_id)
>  	const char *name;
> =20
>  	spin_lock(&ubi->volumes_lock);
> -	reserved_pebs =3D be32_to_cpu(ubi->vtbl[vol_id].reserved_pebs);
> +	reserved_pebs =3D be32_to_cpu(ubi->vtbl[vol_id].reserved_lebs);
>  	vol =3D ubi->volumes[idx];
> =20
>  	if (!vol) {
> @@ -665,7 +693,7 @@ static int self_check_volume(struct ubi_device *ubi, =
int vol_id)
>  		return 0;
>  	}
> =20
> -	if (vol->reserved_pebs < 0 || vol->alignment < 0 || vol->data_pad < 0 ||
> +	if (vol->reserved_lebs < 0 || vol->alignment < 0 || vol->data_pad < 0 ||
>  	    vol->name_len < 0) {
>  		ubi_err(ubi, "negative values");
>  		goto fail;
> @@ -698,7 +726,7 @@ static int self_check_volume(struct ubi_device *ubi, =
int vol_id)
>  		goto fail;
>  	}
> =20
> -	if (vol->reserved_pebs > ubi->good_peb_count) {
> +	if (vol->reserved_lebs > ubi->good_peb_count) {
>  		ubi_err(ubi, "too large reserved_pebs");
>  		goto fail;
>  	}
> @@ -727,7 +755,7 @@ static int self_check_volume(struct ubi_device *ubi, =
int vol_id)
>  			ubi_err(ubi, "corrupted dynamic volume");
>  			goto fail;
>  		}
> -		if (vol->used_ebs !=3D vol->reserved_pebs) {
> +		if (vol->used_ebs !=3D vol->reserved_lebs) {
>  			ubi_err(ubi, "bad used_ebs");
>  			goto fail;
>  		}
> @@ -740,7 +768,7 @@ static int self_check_volume(struct ubi_device *ubi, =
int vol_id)
>  			goto fail;
>  		}
>  	} else {
> -		if (vol->used_ebs < 0 || vol->used_ebs > vol->reserved_pebs) {
> +		if (vol->used_ebs < 0 || vol->used_ebs > vol->reserved_lebs) {
>  			ubi_err(ubi, "bad used_ebs");
>  			goto fail;
>  		}
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index d85c197..fd40fe5 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -170,7 +170,7 @@ int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
>  static int vtbl_check(const struct ubi_device *ubi,
>  		      const struct ubi_vtbl_record *vtbl)
>  {
> -	int i, n, reserved_pebs, alignment, data_pad, vol_type, name_len;
> +	int i, n, reserved_lebs, alignment, data_pad, vol_type, name_len;
>  	int upd_marker, err;
>  	uint32_t crc;
>  	const char *name;
> @@ -178,7 +178,7 @@ static int vtbl_check(const struct ubi_device *ubi,
>  	for (i =3D 0; i < ubi->vtbl_slots; i++) {
>  		cond_resched();
> =20
> -		reserved_pebs =3D be32_to_cpu(vtbl[i].reserved_pebs);
> +		reserved_lebs =3D be32_to_cpu(vtbl[i].reserved_lebs);
>  		alignment =3D be32_to_cpu(vtbl[i].alignment);
>  		data_pad =3D be32_to_cpu(vtbl[i].data_pad);
>  		upd_marker =3D vtbl[i].upd_marker;
> @@ -194,7 +194,7 @@ static int vtbl_check(const struct ubi_device *ubi,
>  			return 1;
>  		}
> =20
> -		if (reserved_pebs =3D=3D 0) {
> +		if (reserved_lebs =3D=3D 0) {
>  			if (memcmp(&vtbl[i], &empty_vtbl_record,
>  						UBI_VTBL_RECORD_SIZE)) {
>  				err =3D 2;
> @@ -203,7 +203,7 @@ static int vtbl_check(const struct ubi_device *ubi,
>  			continue;
>  		}
> =20
> -		if (reserved_pebs < 0 || alignment < 0 || data_pad < 0 ||
> +		if (reserved_lebs < 0 || alignment < 0 || data_pad < 0 ||
>  		    name_len < 0) {
>  			err =3D 3;
>  			goto bad;
> @@ -237,9 +237,10 @@ static int vtbl_check(const struct ubi_device *ubi,
>  			goto bad;
>  		}
> =20
> -		if (reserved_pebs > ubi->good_peb_count) {
> -			ubi_err(ubi, "too large reserved_pebs %d, good PEBs %d",
> -				reserved_pebs, ubi->good_peb_count);
> +		reserved_lebs =3D DIV_ROUND_UP(reserved_lebs, ubi->lebs_per_cpeb);
> +		if (reserved_lebs > ubi->good_peb_count) {
> +			ubi_err(ubi, "too large reserved_lebs %d, good PEBs %d",
> +				reserved_lebs, ubi->good_peb_count);
>  			err =3D 9;
>  			goto bad;
>  		}
> @@ -333,12 +334,20 @@ retry:
>  	if (err)
>  		goto write_error;
> =20
> +	if (ubi->vtbl_size < ubi->leb_size) { //XXX
> +		err =3D ubi_io_write_data(ubi, vtbl, new_aeb->pnum,
> +					ubi->leb_size - ubi->min_io_size,
> +					ubi->min_io_size);
> +	}
> +
> +	if (err)
> +		goto write_error;
>  	/*
>  	 * And add it to the attaching information. Don't delete the old version
>  	 * of this LEB as it will be deleted and freed in 'ubi_add_to_av()'.
>  	 */
> -	err =3D ubi_add_to_av(ubi, ai, new_aeb->pnum, new_aeb->ec, vid_hdr, 0);
> -	kmem_cache_free(ai->aeb_slab_cache, new_aeb);
> +	list_add_tail(&new_aeb->list, &ai->used);
> +	err =3D ubi_add_to_av(ubi, ai, new_aeb, vid_hdr, 0, 0, true);
>  	ubi_free_vid_hdr(ubi, vid_hdr);
>  	return err;
> =20
> @@ -348,10 +357,10 @@ write_error:
>  		 * Probably this physical eraseblock went bad, try to pick
>  		 * another one.
>  		 */
> -		list_add(&new_aeb->u.list, &ai->erase);
> +		list_add(&new_aeb->list, &ai->erase);
>  		goto retry;
>  	}
> -	kmem_cache_free(ai->aeb_slab_cache, new_aeb);
> +	kmem_cache_free(ai->apeb_slab_cache, new_aeb);
>  out_free:
>  	ubi_free_vid_hdr(ubi, vid_hdr);
>  	return err;
> @@ -374,7 +383,7 @@ static struct ubi_vtbl_record *process_lvol(struct ub=
i_device *ubi,
>  {
>  	int err;
>  	struct rb_node *rb;
> -	struct ubi_ainf_peb *aeb;
> +	struct ubi_ainf_leb *aeb;
>  	struct ubi_vtbl_record *leb[UBI_LAYOUT_VOLUME_EBS] =3D { NULL, NULL };
>  	int leb_corrupted[UBI_LAYOUT_VOLUME_EBS] =3D {1, 1};
> =20
> @@ -406,15 +415,22 @@ static struct ubi_vtbl_record *process_lvol(struct =
ubi_device *ubi,
>  	dbg_gen("check layout volume");
> =20
>  	/* Read both LEB 0 and LEB 1 into memory */
> -	ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb) {
> -		leb[aeb->lnum] =3D vzalloc(ubi->vtbl_size);
> -		if (!leb[aeb->lnum]) {
> +	ubi_rb_for_each_entry(rb, aeb, &av->root, rb) {
> +		leb[aeb->desc.lnum] =3D vzalloc(ubi->vtbl_size);
> +		if (!leb[aeb->desc.lnum]) {
>  			err =3D -ENOMEM;
>  			goto out_free;
>  		}
> =20
> -		err =3D ubi_io_read_data(ubi, leb[aeb->lnum], aeb->pnum, 0,
> -				       ubi->vtbl_size);
> +		if (!aeb->peb->consolidated) {
> +			err =3D ubi_io_read_data(ubi, leb[aeb->desc.lnum],
> +				aeb->peb->pnum, 0, ubi->vtbl_size);
> +		} else {
> +			err =3D ubi_io_raw_read(ubi, leb[aeb->desc.lnum],
> +				aeb->peb->pnum, ubi->leb_start + (aeb->peb_pos * ubi->leb_size),
> +				ubi->vtbl_size);
> +		}
> +
>  		if (err =3D=3D UBI_IO_BITFLIPS || mtd_is_eccerr(err))
>  			/*
>  			 * Scrub the PEB later. Note, -EBADMSG indicates an
> @@ -426,7 +442,7 @@ static struct ubi_vtbl_record *process_lvol(struct ub=
i_device *ubi,
>  			 * aeb->scrub will be cleared in
>  			 * 'ubi_add_to_av()'.
>  			 */
> -			aeb->scrub =3D 1;
> +			aeb->peb->scrub =3D 1;
>  		else if (err)
>  			goto out_free;
>  	}
> @@ -531,21 +547,21 @@ static int init_volumes(struct ubi_device *ubi,
>  			const struct ubi_attach_info *ai,
>  			const struct ubi_vtbl_record *vtbl)
>  {
> -	int i, reserved_pebs =3D 0;
> +	int i, reserved_lebs =3D 0;
>  	struct ubi_ainf_volume *av;
>  	struct ubi_volume *vol;
> =20
>  	for (i =3D 0; i < ubi->vtbl_slots; i++) {
>  		cond_resched();
> =20
> -		if (be32_to_cpu(vtbl[i].reserved_pebs) =3D=3D 0)
> +		if (be32_to_cpu(vtbl[i].reserved_lebs) =3D=3D 0)
>  			continue; /* Empty record */
> =20
>  		vol =3D kzalloc(sizeof(struct ubi_volume), GFP_KERNEL);
>  		if (!vol)
>  			return -ENOMEM;
> =20
> -		vol->reserved_pebs =3D be32_to_cpu(vtbl[i].reserved_pebs);
> +		vol->reserved_lebs =3D be32_to_cpu(vtbl[i].reserved_lebs);
>  		vol->alignment =3D be32_to_cpu(vtbl[i].alignment);
>  		vol->data_pad =3D be32_to_cpu(vtbl[i].data_pad);
>  		vol->upd_marker =3D vtbl[i].upd_marker;
> @@ -573,14 +589,14 @@ static int init_volumes(struct ubi_device *ubi,
>  		ubi->volumes[i] =3D vol;
>  		ubi->vol_count +=3D 1;
>  		vol->ubi =3D ubi;
> -		reserved_pebs +=3D vol->reserved_pebs;
> +		reserved_lebs +=3D vol->reserved_lebs;
> =20
>  		/*
>  		 * In case of dynamic volume UBI knows nothing about how many
>  		 * data is stored there. So assume the whole volume is used.
>  		 */
>  		if (vol->vol_type =3D=3D UBI_DYNAMIC_VOLUME) {
> -			vol->used_ebs =3D vol->reserved_pebs;
> +			vol->used_ebs =3D vol->reserved_lebs;
>  			vol->last_eb_bytes =3D vol->usable_leb_size;
>  			vol->used_bytes =3D
>  				(long long)vol->used_ebs * vol->usable_leb_size;
> @@ -624,14 +640,14 @@ static int init_volumes(struct ubi_device *ubi,
>  	if (!vol)
>  		return -ENOMEM;
> =20
> -	vol->reserved_pebs =3D UBI_LAYOUT_VOLUME_EBS;
> +	vol->reserved_lebs =3D UBI_LAYOUT_VOLUME_EBS;
>  	vol->alignment =3D UBI_LAYOUT_VOLUME_ALIGN;
>  	vol->vol_type =3D UBI_DYNAMIC_VOLUME;
>  	vol->name_len =3D sizeof(UBI_LAYOUT_VOLUME_NAME) - 1;
>  	memcpy(vol->name, UBI_LAYOUT_VOLUME_NAME, vol->name_len + 1);
>  	vol->usable_leb_size =3D ubi->leb_size;
> -	vol->used_ebs =3D vol->reserved_pebs;
> -	vol->last_eb_bytes =3D vol->reserved_pebs;
> +	vol->used_ebs =3D vol->reserved_lebs;
> +	vol->last_eb_bytes =3D vol->reserved_lebs;
>  	vol->used_bytes =3D
>  		(long long)vol->used_ebs * (ubi->leb_size - vol->data_pad);
>  	vol->vol_id =3D UBI_LAYOUT_VOLUME_ID;
> @@ -639,20 +655,21 @@ static int init_volumes(struct ubi_device *ubi,
> =20
>  	ubi_assert(!ubi->volumes[i]);
>  	ubi->volumes[vol_id2idx(ubi, vol->vol_id)] =3D vol;
> -	reserved_pebs +=3D vol->reserved_pebs;
> +	reserved_lebs +=3D vol->reserved_lebs;
>  	ubi->vol_count +=3D 1;
>  	vol->ubi =3D ubi;
> =20
> -	if (reserved_pebs > ubi->avail_pebs) {
> +	reserved_lebs =3D DIV_ROUND_UP(reserved_lebs, ubi->lebs_per_cpeb);
> +	if (reserved_lebs > ubi->avail_pebs) {
>  		ubi_err(ubi, "not enough PEBs, required %d, available %d",
> -			reserved_pebs, ubi->avail_pebs);
> +			reserved_lebs, ubi->avail_pebs);
>  		if (ubi->corr_peb_count)
>  			ubi_err(ubi, "%d PEBs are corrupted and not used",
>  				ubi->corr_peb_count);
>  		return -ENOSPC;
>  	}
> -	ubi->rsvd_pebs +=3D reserved_pebs;
> -	ubi->avail_pebs -=3D reserved_pebs;
> +	ubi->rsvd_pebs +=3D reserved_lebs;
> +	ubi->avail_pebs -=3D reserved_lebs;
> =20
>  	return 0;
>  }
> @@ -670,11 +687,11 @@ static int check_av(const struct ubi_volume *vol,
>  {
>  	int err;
> =20
> -	if (av->highest_lnum >=3D vol->reserved_pebs) {
> +	if (av->highest_lnum >=3D vol->reserved_lebs) {
>  		err =3D 1;
>  		goto bad;
>  	}
> -	if (av->leb_count > vol->reserved_pebs) {
> +	if (av->leb_count > vol->reserved_lebs) {
>  		err =3D 2;
>  		goto bad;
>  	}
> @@ -682,7 +699,7 @@ static int check_av(const struct ubi_volume *vol,
>  		err =3D 3;
>  		goto bad;
>  	}
> -	if (av->used_ebs > vol->reserved_pebs) {
> +	if (av->used_ebs > vol->reserved_lebs) {
>  		err =3D 4;
>  		goto bad;
>  	}
> @@ -740,7 +757,7 @@ static int check_attaching_info(const struct ubi_devi=
ce *ubi,
>  			continue;
>  		}
> =20
> -		if (vol->reserved_pebs =3D=3D 0) {
> +		if (vol->reserved_lebs =3D=3D 0) {
>  			ubi_assert(i < ubi->vtbl_slots);
> =20
>  			if (!av)
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index bf4e6b2..ed1031d 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -302,6 +302,11 @@ static struct ubi_wl_entry *find_mean_wl_entry(struc=
t ubi_device *ubi,
>  {
>  	struct ubi_wl_entry *e, *first, *last;
> =20
> +	ubi_assert(root->rb_node);
> +
> +	if (!root->rb_node)
> +		return NULL;
> +
>  	first =3D rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
>  	last =3D rb_entry(rb_last(root), struct ubi_wl_entry, u.rb);
> =20
> @@ -481,9 +486,8 @@ repeat:
>  static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
>  			int shutdown);
> =20
> -static struct ubi_work *ubi_alloc_erase_work(struct ubi_device *ubi,
> -					     struct ubi_wl_entry *e,
> -					     int torture)
> +struct ubi_work *ubi_alloc_erase_work(struct ubi_device *ubi,
> +				      struct ubi_wl_entry *e, int torture)
>  {
>  	struct ubi_work *wl_wrk;
> =20
> @@ -510,11 +514,12 @@ static struct ubi_work *ubi_alloc_erase_work(struct=
 ubi_device *ubi,
>   * failure.
>   */
>  static int schedule_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
> -			  int torture)
> +			  int torture, bool nested)
>  {
>  	struct ubi_work *wl_wrk;
> =20
>  	ubi_assert(e);
> +	ubi_assert(!ubi->consolidated || !ubi->consolidated[e->pnum]);
> =20
>  	dbg_wl("schedule erasure of PEB %d, EC %d, torture %d",
>  	       e->pnum, e->ec, torture);
> @@ -551,6 +556,7 @@ static int do_sync_erase(struct ubi_device *ubi, stru=
ct ubi_wl_entry *e,
>  	if (!wl_wrk)
>  		return -ENOMEM;
> =20
> +	INIT_LIST_HEAD(&wl_wrk->list);
>  	wl_wrk->e =3D e;
>  	wl_wrk->torture =3D torture;
> =20
> @@ -579,6 +585,7 @@ static int wear_leveling_worker(struct ubi_device *ub=
i, struct ubi_work *wrk,
>  	struct ubi_wl_entry *e1, *e2;
>  	struct ubi_vid_hdr *vid_hdr;
>  	int dst_leb_clean =3D 0;
> +	int nvidh =3D ubi->lebs_per_cpeb;
> =20
>  	if (shutdown)
>  		return 0;
> @@ -680,7 +687,7 @@ static int wear_leveling_worker(struct ubi_device *ub=
i, struct ubi_work *wrk,
>  	 * which is being moved was unmapped.
>  	 */
> =20
> -	err =3D ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
> +	err =3D ubi_io_read_vid_hdrs(ubi, e1->pnum, vid_hdr, &nvidh, 0);
>  	if (err && err !=3D UBI_IO_BITFLIPS) {
>  		dst_leb_clean =3D 1;
>  		if (err =3D=3D UBI_IO_FF) {
> @@ -714,7 +721,11 @@ static int wear_leveling_worker(struct ubi_device *u=
bi, struct ubi_work *wrk,
>  		goto out_error;
>  	}
> =20
> -	err =3D ubi_eba_copy_leb(ubi, e1->pnum, e2->pnum, vid_hdr);
> +	if (ubi->consolidated && ubi->consolidated[e1->pnum])
> +		err =3D ubi_eba_copy_lebs(ubi, e1->pnum, e2->pnum, vid_hdr, nvidh);
> +	else
> +		err =3D ubi_eba_copy_leb(ubi, e1->pnum, e2->pnum, vid_hdr);
> +
>  	if (err) {
>  		if (err =3D=3D MOVE_CANCEL_RACE) {
>  			/*
> @@ -917,7 +928,7 @@ static int ensure_wear_leveling(struct ubi_device *ub=
i)
>  	ubi->wl_scheduled =3D 1;
>  	spin_unlock(&ubi->wl_lock);
> =20
> -	wrk =3D kmalloc(sizeof(struct ubi_work), GFP_NOFS);
> +	wrk =3D ubi_alloc_work(ubi);
>  	if (!wrk) {
>  		err =3D -ENOMEM;
>  		goto out_cancel;
> @@ -982,7 +993,7 @@ static int __erase_worker(struct ubi_device *ubi, str=
uct ubi_work *wl_wrk)
>  		int err1;
> =20
>  		/* Re-schedule the LEB for erasure */
> -		err1 =3D schedule_erase(ubi, e, 0);
> +		err1 =3D schedule_erase(ubi, e, 0, true);
>  		if (err1) {
>  			wl_entry_destroy(ubi, e);
>  			err =3D err1;
> @@ -1092,10 +1103,12 @@ int ubi_wl_put_peb(struct ubi_device *ubi, int pn=
um, int torture)
>  {
>  	int err;
>  	struct ubi_wl_entry *e;
> +	struct ubi_work *wrk;
> =20
>  	dbg_wl("PEB %d", pnum);
>  	ubi_assert(pnum >=3D 0);
>  	ubi_assert(pnum < ubi->peb_count);
> +	ubi_assert(!ubi->consolidated || !ubi->consolidated[pnum]);
> =20
>  	down_read(&ubi->fm_protect);
> =20
> @@ -1158,15 +1171,20 @@ retry:
>  	}
>  	spin_unlock(&ubi->wl_lock);
> =20
> -	err =3D schedule_erase(ubi, e, torture);
> -	if (err) {
> +	wrk =3D ubi_alloc_erase_work(ubi, e, torture);
> +	if (!wrk) {
>  		spin_lock(&ubi->wl_lock);
>  		wl_tree_add(e, &ubi->used);
>  		spin_unlock(&ubi->wl_lock);
>  	}
> -
>  	up_read(&ubi->fm_protect);
> -	return err;
> +
> +	if (!wrk)
> +		return -ENOMEM;
> +
> +	ubi_schedule_work(ubi, wrk);
> +
> +	return 0;
>  }
> =20
>  /**
> @@ -1277,8 +1295,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi=
_attach_info *ai)
>  	int err, i, reserved_pebs, found_pebs =3D 0;
>  	struct rb_node *rb1, *rb2;
>  	struct ubi_ainf_volume *av;
> -	struct ubi_ainf_peb *aeb, *tmp;
> +	struct ubi_ainf_leb *leb;
> +	struct ubi_ainf_peb *peb, *tmp;
>  	struct ubi_wl_entry *e;
> +	struct ubi_leb_desc *clebs;
> =20
>  	ubi->used =3D ubi->erroneous =3D ubi->free =3D ubi->scrub =3D RB_ROOT;
>  	spin_lock_init(&ubi->wl_lock);
> @@ -1294,22 +1314,34 @@ int ubi_wl_init(struct ubi_device *ubi, struct ub=
i_attach_info *ai)
>  	if (!ubi->lookuptbl)
>  		return err;
> =20
> +	if (ubi->lebs_per_cpeb > 1) {
> +		ubi->consolidated =3D kzalloc(ubi->peb_count * sizeof(void *),
> +					    GFP_KERNEL);
> +		if (!ubi->consolidated) {
> +			kfree(ubi->lookuptbl);
> +			return err;
> +		}
> +	}
> +
>  	for (i =3D 0; i < UBI_PROT_QUEUE_LEN; i++)
>  		INIT_LIST_HEAD(&ubi->pq[i]);
>  	ubi->pq_head =3D 0;
> =20
>  	ubi->free_count =3D 0;
> -	list_for_each_entry_safe(aeb, tmp, &ai->erase, u.list) {
> +	list_for_each_entry_safe(peb, tmp, &ai->erase, list) {
>  		cond_resched();
> =20
> +		if (ubi->lookuptbl[peb->pnum])
> +			continue;
> +
>  		e =3D kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
>  		if (!e)
>  			goto out_free;
> =20
> -		e->pnum =3D aeb->pnum;
> -		e->ec =3D aeb->ec;
> +		e->pnum =3D peb->pnum;
> +		e->ec =3D peb->ec;
>  		ubi->lookuptbl[e->pnum] =3D e;
> -		if (schedule_erase(ubi, e, 0)) {
> +		if (schedule_erase(ubi, e, 0, false)) {
>  			wl_entry_destroy(ubi, e);
>  			goto out_free;
>  		}
> @@ -1317,15 +1349,18 @@ int ubi_wl_init(struct ubi_device *ubi, struct ub=
i_attach_info *ai)
>  		found_pebs++;
>  	}
> =20
> -	list_for_each_entry(aeb, &ai->free, u.list) {
> +	list_for_each_entry(peb, &ai->free, list) {
>  		cond_resched();
> =20
> +		if (ubi->lookuptbl[peb->pnum])
> +			continue;
> +
>  		e =3D kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
>  		if (!e)
>  			goto out_free;
> =20
> -		e->pnum =3D aeb->pnum;
> -		e->ec =3D aeb->ec;
> +		e->pnum =3D peb->pnum;
> +		e->ec =3D peb->ec;
>  		ubi_assert(e->ec >=3D 0);
> =20
>  		wl_tree_add(e, &ubi->free);
> @@ -1336,29 +1371,54 @@ int ubi_wl_init(struct ubi_device *ubi, struct ub=
i_attach_info *ai)
>  		found_pebs++;
>  	}
> =20
> -	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
> -		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
> -			cond_resched();
> +	list_for_each_entry(peb, &ai->used, list) {
> +		e =3D kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> +		if (!e)
> +			goto out_free;
> =20
> -			e =3D kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> -			if (!e)
> -				goto out_free;
> +		e->pnum =3D peb->pnum;
> +		e->ec =3D peb->ec;
> +		ubi->lookuptbl[e->pnum] =3D e;
> =20
> -			e->pnum =3D aeb->pnum;
> -			e->ec =3D aeb->ec;
> -			ubi->lookuptbl[e->pnum] =3D e;
> +		if (!peb->scrub) {
> +			dbg_wl("add PEB %d EC %d to the used tree",
> +			       e->pnum, e->ec);
> +			wl_tree_add(e, &ubi->used);
> +		} else {
> +			dbg_wl("add PEB %d EC %d to the scrub tree",
> +			       e->pnum, e->ec);
> +			wl_tree_add(e, &ubi->scrub);
> +		}
> +
> +		if (peb->consolidated) {
> +			int i;
> +
> +			clebs =3D kmalloc(sizeof(*clebs) *
> +					ubi->lebs_per_cpeb,
> +					GFP_KERNEL);
> +			if (!clebs)
> +				goto out_free;
> =20
> -			if (!aeb->scrub) {
> -				dbg_wl("add PEB %d EC %d to the used tree",
> -				       e->pnum, e->ec);
> -				wl_tree_add(e, &ubi->used);
> -			} else {
> -				dbg_wl("add PEB %d EC %d to the scrub tree",
> -				       e->pnum, e->ec);
> -				wl_tree_add(e, &ubi->scrub);
> +			for (i =3D 0; i < ubi->lebs_per_cpeb; i++) {
> +				clebs[i].lnum =3D -1;
> +				clebs[i].vol_id =3D -1;
>  			}
> =20
> -			found_pebs++;
> +			ubi->consolidated[peb->pnum] =3D clebs;
> +		}
> +
> +		found_pebs++;
> +	}
> +
> +	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
> +		ubi_rb_for_each_entry(rb2, leb, &av->root, rb) {
> +			cond_resched();
> +
> +			if (ubi->lebs_per_cpeb > 1) {
> +				clebs =3D ubi->consolidated[leb->peb->pnum];
> +				if (clebs)
> +					clebs[leb->peb_pos] =3D leb->desc;
> +			}
>  		}
>  	}
> =20
> @@ -1403,6 +1463,7 @@ out_free:
>  	tree_destroy(ubi, &ubi->used);
>  	tree_destroy(ubi, &ubi->free);
>  	tree_destroy(ubi, &ubi->scrub);
> +	kfree(ubi->consolidated);
>  	kfree(ubi->lookuptbl);
>  	return err;
>  }
> @@ -1439,6 +1500,7 @@ void ubi_wl_close(struct ubi_device *ubi)
>  	tree_destroy(ubi, &ubi->free);
>  	tree_destroy(ubi, &ubi->scrub);
>  	kfree(ubi->lookuptbl);
> +	kfree(ubi->consolidated);
>  }
> =20
>  /**
> @@ -1536,11 +1598,24 @@ static int self_check_in_pq(const struct ubi_devi=
ce *ubi,
>  	dump_stack();
>  	return -EINVAL;
>  }
> +
> +static bool enough_free_pebs(struct ubi_device *ubi)
> +{
> +	/*
> +	 * Hold back one PEB for the producing case,
> +	 * currently only for consolidation.
> +	 */
> +	return ubi->free_count > UBI_CONSO_RESERVED_PEBS;
> +}
> +
>  #ifndef CONFIG_MTD_UBI_FASTMAP
>  static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
>  {
>  	struct ubi_wl_entry *e;
> =20
> +	if (!enough_free_pebs(ubi))
> +		return NULL;
> +
>  	e =3D find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
>  	self_check_in_wl_tree(ubi, e, &ubi->free);
>  	ubi->free_count--;
> @@ -1563,9 +1638,11 @@ static int produce_free_peb(struct ubi_device *ubi)
>  {
>  	ubi_assert(spin_is_locked(&ubi->wl_lock));
> =20
> -	while (!ubi->free.rb_node) {
> +	while (!enough_free_pebs(ubi)) {
>  		spin_unlock(&ubi->wl_lock);
> =20
> +		ubi_eba_consolidate(ubi);
> +
>  		dbg_wl("do one work synchronously");
>  		if (!ubi_work_join_one(ubi)) {
>  			spin_lock(&ubi->wl_lock);
> @@ -1582,41 +1659,51 @@ static int produce_free_peb(struct ubi_device *ub=
i)
>  /**
>   * ubi_wl_get_peb - get a physical eraseblock.
>   * @ubi: UBI device description object
> + * @producing: true if this function is being called from a context
> + * which is trying to produce more free PEBs but needs a new one to
> + * achieve that. i.e. consolidatation work.
>   *
>   * This function returns a physical eraseblock in case of success and a
>   * negative error code in case of failure.
>   * Returns with ubi->fm_eba_sem held in read mode!
>   */
> -int ubi_wl_get_peb(struct ubi_device *ubi)
> +int ubi_wl_get_peb(struct ubi_device *ubi, bool producing)
>  {
> -	int err;
> +	int err =3D 0;
>  	struct ubi_wl_entry *e;
> =20
>  retry:
>  	down_read(&ubi->fm_eba_sem);
>  	spin_lock(&ubi->wl_lock);
> -	if (!ubi->free.rb_node) {
> -		if (ubi->works_count =3D=3D 0) {
> -			ubi_err(ubi, "no free eraseblocks");
> -			ubi_assert(list_empty(&ubi->works));
> -			spin_unlock(&ubi->wl_lock);
> -			return -ENOSPC;
> -		}
> =20
> +	if (!enough_free_pebs(ubi) && !producing) {
>  		err =3D produce_free_peb(ubi);
>  		if (err < 0) {
> +			ubi_err(ubi, "unable to produce free eraseblocks: %i", err);
>  			spin_unlock(&ubi->wl_lock);
>  			return err;
>  		}
>  		spin_unlock(&ubi->wl_lock);
>  		up_read(&ubi->fm_eba_sem);
>  		goto retry;
> -
>  	}
> +	else if (!ubi->free_count && producing) {
> +		ubi_err(ubi, "no free eraseblocks in producing case");
> +		ubi_assert(0);
> +		spin_unlock(&ubi->wl_lock);
> +		return -ENOSPC;
> +	}
> +
>  	e =3D wl_get_wle(ubi);
> -	prot_queue_add(ubi, e);
> +	if (e)
> +		prot_queue_add(ubi, e);
> +	else
> +		err =3D -ENOSPC;
>  	spin_unlock(&ubi->wl_lock);
> =20
> +	if (err)
> +		return err;
> +
>  	err =3D ubi_self_check_all_ff(ubi, e->pnum, ubi->vid_hdr_aloffset,
>  				    ubi->peb_size - ubi->vid_hdr_aloffset);
>  	if (err) {



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
