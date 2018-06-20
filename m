Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVaBJ-0004RY-Pl
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 10:17:43 +0000
Date: Wed, 20 Jun 2018 12:17:20 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/14] ubi: fastmap: Read PEB numbers more carefully
Message-ID: <20180620121720.22ad75c9@bbrezillon>
In-Reply-To: <20180613212344.11608-2-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
 <20180613212344.11608-2-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 Jun 2018 23:23:31 +0200
Richard Weinberger <richard@nod.at> wrote:

> PEB numbers can be used as indices, make sure that they
> are within bounds.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/fastmap.c | 71 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 58 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 462526a10537..768fa8a76867 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -101,6 +101,29 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi)
>  	return roundup(size, ubi->leb_size);
>  }
>  
> +static bool read_pnum(struct ubi_device *ubi, struct ubi_attach_info *ai,
> +		     __be32 pnum, int *out_pnum)

Why not returning an int here, with negative values meaning that
pnum is invalid and positive values encoding the actual PEB number?
Also, I think check_pnum(), validate_pnum() or decode_pnum() would be
better names than read_pnum().


> +{
> +	int ret = true;
> +	int max_pnum = ubi->peb_count;
> +
> +	pnum = be32_to_cpu(pnum);
> +	if (pnum == UBI_UNKNOWN) {
> +		*out_pnum = pnum;
> +		goto out;
> +	}
> +
> +	if (pnum < 0 || pnum >= max_pnum) {
> +		ubi_err(ubi, "fastmap references PEB out of range: %i", pnum);
> +		ret = false;
> +		goto out;
> +	} else {
> +		*out_pnum = pnum;
> +	}
> +
> +out:
> +	return ret;
> +}
>  
>  /**
>   * new_fm_vhdr - allocate a new volume header for fastmap usage.
> @@ -438,7 +461,10 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  		int scrub = 0;
>  		int image_seq;
>  
> -		pnum = be32_to_cpu(pebs[i]);
> +		if (!read_pnum(ubi, ai, pebs[i], &pnum)) {
> +			ret = UBI_BAD_FASTMAP;
> +			goto out;
> +		}
>  
>  		if (ubi_io_is_bad(ubi, pnum)) {
>  			ubi_err(ubi, "bad PEB in fastmap pool!");
> @@ -565,7 +591,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  	struct ubi_fm_ec *fmec;
>  	struct ubi_fm_volhdr *fmvhdr;
>  	struct ubi_fm_eba *fm_eba;
> -	int ret, i, j, pool_size, wl_pool_size;
> +	int ret, i, j, pool_size, wl_pool_size, pnum;
>  	size_t fm_pos = 0, fm_size = ubi->fm_size;
>  	unsigned long long max_sqnum = 0;
>  	void *fm_raw = ubi->fm_buf;
> @@ -647,8 +673,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  		if (fm_pos >= fm_size)
>  			goto fail_bad;
>  
> -		add_aeb(ai, &ai->free, be32_to_cpu(fmec->pnum),
> -			be32_to_cpu(fmec->ec), 0);
> +		if (!read_pnum(ubi, ai, fmec->pnum, &pnum))
> +			goto fail_bad;
> +
> +		add_aeb(ai, &ai->free, pnum, be32_to_cpu(fmec->ec), 0);
>  	}
>  
>  	/* read EC values from used list */
> @@ -658,8 +686,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  		if (fm_pos >= fm_size)
>  			goto fail_bad;
>  
> -		add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
> -			be32_to_cpu(fmec->ec), 0);
> +		if (!read_pnum(ubi, ai, fmec->pnum, &pnum))
> +			goto fail_bad;
> +
> +		add_aeb(ai, &used, pnum, be32_to_cpu(fmec->ec), 0);
>  	}
>  
>  	/* read EC values from scrub list */
> @@ -669,8 +699,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  		if (fm_pos >= fm_size)
>  			goto fail_bad;
>  
> -		add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
> -			be32_to_cpu(fmec->ec), 1);
> +		if (!read_pnum(ubi, ai, fmec->pnum, &pnum))
> +			goto fail_bad;
> +
> +		add_aeb(ai, &used, pnum, be32_to_cpu(fmec->ec), 1);
>  	}
>  
>  	/* read EC values from erase list */
> @@ -680,8 +712,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  		if (fm_pos >= fm_size)
>  			goto fail_bad;
>  
> -		add_aeb(ai, &ai->erase, be32_to_cpu(fmec->pnum),
> -			be32_to_cpu(fmec->ec), 1);
> +		if (!read_pnum(ubi, ai, fmec->pnum, &pnum))
> +			goto fail_bad;
> +
> +		add_aeb(ai, &ai->erase, pnum, be32_to_cpu(fmec->ec), 1);
>  	}
>  
>  	ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
> @@ -731,7 +765,8 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  		}
>  
>  		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
> -			int pnum = be32_to_cpu(fm_eba->pnum[j]);
> +			if (!read_pnum(ubi, ai, fm_eba->pnum[j], &pnum))
> +				goto fail_bad;
>  
>  			if (pnum < 0)
>  				continue;
> @@ -954,7 +989,10 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  	for (i = 0; i < used_blocks; i++) {
>  		int image_seq;
>  
> -		pnum = be32_to_cpu(fmsb->block_loc[i]);
> +		if (!read_pnum(ubi, ai, fmsb->block_loc[i], &pnum)) {
> +			ret = UBI_BAD_FASTMAP;
> +			goto free_hdr;
> +		}
>  
>  		if (ubi_io_is_bad(ubi, pnum)) {
>  			ret = UBI_BAD_FASTMAP;
> @@ -1068,7 +1106,14 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  			goto free_hdr;
>  		}
>  
> -		e->pnum = be32_to_cpu(fmsb2->block_loc[i]);
> +		if (!read_pnum(ubi, ai, fmsb2->block_loc[i], &e->pnum)) {
> +			while (i--)
> +				kmem_cache_free(ubi_wl_entry_slab, fm->e[i]);
> +
> +			ret = -ENOMEM;
> +			goto free_hdr;
> +		}
> +
>  		e->ec = be32_to_cpu(fmsb2->block_ec[i]);
>  		fm->e[i] = e;
>  	}
