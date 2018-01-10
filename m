Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZHBB-0008Dz-0s
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 14:16:35 +0000
Date: Wed, 10 Jan 2018 15:16:17 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] UBI: fastmap: Erase outdated anchor PEBs during attach
Message-ID: <20180110141617.orepk3srb5e6fcbj@pengutronix.de>
References: <20171205150120.26045-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171205150120.26045-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Cc Boris

Hi Boris and all,

I can't find this patch in any tree. Boris, will you take it?

Sascha

On Tue, Dec 05, 2017 at 04:01:20PM +0100, Sascha Hauer wrote:
> The fastmap update code might erase the current fastmap anchor PEB
> in case it doesn't find any new free PEB. When a power cut happens
> in this situation we must not have any outdated fastmap anchor PEB
> on the device, because that would be used to attach during next
> boot.
> The easiest way to make that sure is to erase all outdated fastmap
> anchor PEBs synchronously during attach.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/ubi/wl.c | 77 ++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 57 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index b5b8cd6f481c..668b46202507 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1529,6 +1529,46 @@ static void shutdown_work(struct ubi_device *ubi)
>  }
>  
>  /**
> + * erase_aeb - erase a PEB given in UBI attach info PEB
> + * @ubi: UBI device description object
> + * @aeb: UBI attach info PEB
> + * @sync: If true, erase synchronously. Otherwise schedule for erasure
> + */
> +static int erase_aeb(struct ubi_device *ubi, struct ubi_ainf_peb *aeb, bool sync)
> +{
> +	struct ubi_wl_entry *e;
> +	int err;
> +
> +	e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> +	if (!e)
> +		return -ENOMEM;
> +
> +	e->pnum = aeb->pnum;
> +	e->ec = aeb->ec;
> +	ubi->lookuptbl[e->pnum] = e;
> +
> +	if (sync) {
> +		err = sync_erase(ubi, e, false);
> +		if (err)
> +			goto out_free;
> +
> +		wl_tree_add(e, &ubi->free);
> +		ubi->free_count++;
> +	} else {
> +		err = schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0, false);
> +		if (err)
> +			goto out_free;
> +	}
> +
> +	return 0;
> +
> +out_free:
> +	wl_entry_destroy(ubi, e);
> +
> +	return err;
> +}
> +
> +/**
>   * ubi_wl_init - initialize the WL sub-system using attaching information.
>   * @ubi: UBI device description object
>   * @ai: attaching information
> @@ -1566,18 +1606,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  	list_for_each_entry_safe(aeb, tmp, &ai->erase, u.list) {
>  		cond_resched();
>  
> -		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> -		if (!e)
> +		err = erase_aeb(ubi, aeb, false);
> +		if (err)
>  			goto out_free;
>  
> -		e->pnum = aeb->pnum;
> -		e->ec = aeb->ec;
> -		ubi->lookuptbl[e->pnum] = e;
> -		if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0, false)) {
> -			wl_entry_destroy(ubi, e);
> -			goto out_free;
> -		}
> -
>  		found_pebs++;
>  	}
>  
> @@ -1635,6 +1667,8 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  			ubi_assert(!ubi->lookuptbl[e->pnum]);
>  			ubi->lookuptbl[e->pnum] = e;
>  		} else {
> +			bool sync = false;
> +
>  			/*
>  			 * Usually old Fastmap PEBs are scheduled for erasure
>  			 * and we don't have to care about them but if we face
> @@ -1644,18 +1678,21 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  			if (ubi->lookuptbl[aeb->pnum])
>  				continue;
>  
> -			e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> -			if (!e)
> -				goto out_free;
> +			/*
> +			 * The fastmap update code might not find a free PEB for
> +			 * writing the fastmap anchor to and then reuses the
> +			 * current fastmap anchor PEB. When this PEB gets erased
> +			 * and a power cut happens before it is written again we
> +			 * must make sure that the fastmap attach code doesn't
> +			 * find any outdated fastmap anchors, hence we erase the
> +			 * outdated fastmap anchor PEBs synchronously here.
> +			 */
> +			if (aeb->vol_id == UBI_FM_SB_VOLUME_ID)
> +				sync = true;
>  
> -			e->pnum = aeb->pnum;
> -			e->ec = aeb->ec;
> -			ubi_assert(!ubi->lookuptbl[e->pnum]);
> -			ubi->lookuptbl[e->pnum] = e;
> -			if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum, 0, false)) {
> -				wl_entry_destroy(ubi, e);
> +			err = erase_aeb(ubi, aeb, sync);
> +			if (err)
>  				goto out_free;
> -			}
>  		}
>  
>  		found_pebs++;
> -- 
> 2.11.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
