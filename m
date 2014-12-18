Received: from mail-qc0-f169.google.com ([209.85.216.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Pjj-0007Th-P5
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 01:18:40 +0000
Received: by mail-qc0-f169.google.com with SMTP id w7so179843qcr.14
 for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2014 17:18:17 -0800 (PST)
Date: Wed, 17 Dec 2014 22:18:07 -0300
From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/6] UBI: Fastmap: Don't allocate new ubi_wl_entry objects
Message-ID: <20141218011807.GA6626@fox>
References: <1417347340-6872-1-git-send-email-richard@nod.at>
 <1417347340-6872-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1417347340-6872-3-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Sun, Nov 30, 2014 at 12:35:36PM +0100, Richard Weinberger wrote:
> There is no need to allocate new ones every time, we can reuse
> the existing ones.
> This makes the code cleaner and more easy to follow.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/fastmap.c | 31 +++++--------------------------
>  drivers/mtd/ubi/wl.c      | 11 +++++++----
>  2 files changed, 12 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index db3defd..9507702 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -1446,19 +1446,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>  	}
>  
>  	new_fm->used_blocks = ubi->fm_size / ubi->leb_size;
> -
> -	for (i = 0; i < new_fm->used_blocks; i++) {
> -		new_fm->e[i] = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> -		if (!new_fm->e[i]) {
> -			while (i--)
> -				kfree(new_fm->e[i]);
> -
> -			kfree(new_fm);
> -			mutex_unlock(&ubi->fm_mutex);
> -			return -ENOMEM;
> -		}
> -	}
> -
>  	old_fm = ubi->fm;
>  	ubi->fm = NULL;
>  
> @@ -1494,12 +1481,9 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>  				ubi_err(ubi, "could not erase old fastmap PEB");
>  				goto err;
>  			}
> -
> -			new_fm->e[i]->pnum = old_fm->e[i]->pnum;
> -			new_fm->e[i]->ec = old_fm->e[i]->ec;
> +			new_fm->e[i] = old_fm->e[i];
>  		} else {
> -			new_fm->e[i]->pnum = tmp_e->pnum;
> -			new_fm->e[i]->ec = tmp_e->ec;
> +			new_fm->e[i] = tmp_e;
>  
>  			if (old_fm)
>  				ubi_wl_put_fm_peb(ubi, old_fm->e[i], i,
> @@ -1524,16 +1508,13 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>  							  i, 0);
>  				goto err;
>  			}
> -
> -			new_fm->e[0]->pnum = old_fm->e[0]->pnum;
> +			new_fm->e[0] = old_fm->e[0];
>  			new_fm->e[0]->ec = ret;
>  		} else {
>  			/* we've got a new anchor PEB, return the old one */
>  			ubi_wl_put_fm_peb(ubi, old_fm->e[0], 0,
>  					  old_fm->to_be_tortured[0]);
> -
> -			new_fm->e[0]->pnum = tmp_e->pnum;
> -			new_fm->e[0]->ec = tmp_e->ec;
> +			new_fm->e[0] = tmp_e;
>  		}
>  	} else {
>  		if (!tmp_e) {
> @@ -1546,9 +1527,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>  			ret = -ENOSPC;
>  			goto err;
>  		}
> -
> -		new_fm->e[0]->pnum = tmp_e->pnum;
> -		new_fm->e[0]->ec = tmp_e->ec;
> +		new_fm->e[0] = tmp_e;
>  	}
>  
>  	down_write(&ubi->work_sem);
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 47b215f..523d8a4 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1014,9 +1014,6 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *fm_e,
>  		e = fm_e;
>  		ubi_assert(e->ec >= 0);
>  		ubi->lookuptbl[pnum] = e;
> -	} else {
> -		e->ec = fm_e->ec;
> -		kfree(fm_e);
>  	}
>  
>  	spin_unlock(&ubi->wl_lock);
> @@ -2008,9 +2005,15 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  
>  	dbg_wl("found %i PEBs", found_pebs);
>  
> -	if (ubi->fm)
> +	if (ubi->fm) {
>  		ubi_assert(ubi->good_peb_count == \
>  			   found_pebs + ubi->fm->used_blocks);
> +
> +		for (i = 0; i < ubi->fm->used_blocks; i++) {
> +			e = ubi->fm->e[i];
> +			ubi->lookuptbl[e->pnum] = e;
> +		}
> +	}
Should this be in a separate patch? The commit log doesn't mention it.

Looks good otherwise!

>  	else
>  		ubi_assert(ubi->good_peb_count == found_pebs);

-- 
Guido Martínez, VanguardiaSur
www.vanguardiasur.com.ar
