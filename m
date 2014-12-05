Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xwwta-0002YE-Hu
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 17:42:23 +0000
Message-ID: <5481EE65.1090705@codeaurora.org>
Date: Fri, 05 Dec 2014 19:41:57 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 5/6] UBI: Split __wl_get_peb()
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-6-git-send-email-richard@nod.at>
In-Reply-To: <1416835236-25185-6-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/24/2014 3:20 PM, Richard Weinberger wrote:
> Make it two functions, wl_get_wle() and wl_get_peb().
> wl_get_peb() works exactly like __wl_get_peb() but wl_get_wle()
> does not call produce_free_peb().
> While refilling the fastmap user pool we cannot release ubi->wl_lock
> as produce_free_peb() does.
> Hence the fastmap logic uses now wl_get_wle().

hmmm... confused... I don't see fastmap code changed

>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>   drivers/mtd/ubi/wl.c | 61 ++++++++++++++++++++++++++++++++--------------------
>   1 file changed, 38 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 7730b97..f028b68 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -499,13 +499,46 @@ out:
>   #endif
>
>   /**
> - * __wl_get_peb - get a physical eraseblock.
> + * wl_get_wle - get a mean wl entry to be used by wl_get_peb() or
> + * refill_wl_user_pool().
> + * @ubi: UBI device description object
> + *
> + * This function returns a a wear leveling entry in case of success and

If you upload a new version, you have a double "a" here: "returns a a 
wear leveling"

> + * NULL in case of failure.
> + */
> +static struct ubi_wl_entry *wl_get_wle(struct ubi_device *ubi)
> +{
> +	struct ubi_wl_entry *e;
> +
> +	e = find_mean_wl_entry(ubi, &ubi->free);
> +	if (!e) {
> +		ubi_err(ubi, "no free eraseblocks");
> +		return NULL;
> +	}
> +
> +	self_check_in_wl_tree(ubi, e, &ubi->free);
> +
> +	/*
> +	 * Move the physical eraseblock to the protection queue where it will
> +	 * be protected from being moved for some time.
> +	 */

I don't think this comment is valid anymore....

> +	rb_erase(&e->u.rb, &ubi->free);
> +	ubi->free_count--;
> +	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
> +
> +	return e;
> +}
> +
> +/**
> + * wl_get_peb - get a physical eraseblock.
>    * @ubi: UBI device description object
>    *
>    * This function returns a physical eraseblock in case of success and a
>    * negative error code in case of failure.
> + * It is the low level component of ubi_wl_get_peb() in the non-fastmap
> + * case.
>    */
> -static int __wl_get_peb(struct ubi_device *ubi)
> +static int wl_get_peb(struct ubi_device *ubi)
>   {
>   	int err;
>   	struct ubi_wl_entry *e;
> @@ -524,27 +557,9 @@ retry:
>   		goto retry;
>   	}
>
> -	e = find_mean_wl_entry(ubi, &ubi->free);
> -	if (!e) {
> -		ubi_err(ubi, "no free eraseblocks");
> -		return -ENOSPC;
> -	}
> -
> -	self_check_in_wl_tree(ubi, e, &ubi->free);
> -
> -	/*
> -	 * Move the physical eraseblock to the protection queue where it will
> -	 * be protected from being moved for some time.
> -	 */
> -	rb_erase(&e->u.rb, &ubi->free);
> -	ubi->free_count--;
> -	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
> -#ifndef CONFIG_MTD_UBI_FASTMAP
> -	/* We have to enqueue e only if fastmap is disabled,
> -	 * is fastmap enabled prot_queue_add() will be called by
> -	 * ubi_wl_get_peb() after removing e from the pool. */
> +	e = wl_get_wle(ubi);
>   	prot_queue_add(ubi, e);
> -#endif
> +
>   	return e->pnum;
>   }
>
> @@ -704,7 +719,7 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
>   	int peb, err;
>
>   	spin_lock(&ubi->wl_lock);
> -	peb = __wl_get_peb(ubi);
> +	peb = wl_get_peb(ubi);
>   	spin_unlock(&ubi->wl_lock);
>
>   	if (peb < 0)
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
