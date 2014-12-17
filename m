Received: from mail-qg0-f43.google.com ([209.85.192.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Knb-0004P5-8H
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 20:02:21 +0000
Received: by mail-qg0-f43.google.com with SMTP id z107so1408649qgd.30
 for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2014 12:01:57 -0800 (PST)
Date: Wed, 17 Dec 2014 17:01:47 -0300
From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/6] UBI: Fastmap: Fix memory leaks while closing the WL
 sub-system
Message-ID: <20141217200147.GA11301@fox>
References: <1417347340-6872-1-git-send-email-richard@nod.at>
 <1417347340-6872-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1417347340-6872-2-git-send-email-richard@nod.at>
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

On Sun, Nov 30, 2014 at 12:35:35PM +0100, Richard Weinberger wrote:
> Add a ubi_fastmap_close() to free all resources used by fastmap
> at WL shutdown.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Either for this patch, or for a v3 if you move the
-flush_work/+ubi_fastmap_close to shutdown_work:

Tested-by: Guido Martínez <guido@vanguardiasur.com.ar>
Reviewed-by: Guido Martínez <guido@vanguardiasur.com.ar>

> ---
>  drivers/mtd/ubi/wl.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index c2822f7..47b215f 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -2064,6 +2064,23 @@ static void protection_queue_destroy(struct ubi_device *ubi)
>  	}
>  }
>  
> +static void ubi_fastmap_close(struct ubi_device *ubi)
> +{
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +	int i;
> +
> +	flush_work(&ubi->fm_work);
> +	return_unused_pool_pebs(ubi, &ubi->fm_pool);
> +	return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
> +
> +	if (ubi->fm) {
> +		for (i = 0; i < ubi->fm->used_blocks; i++)
> +			kfree(ubi->fm->e[i]);
> +	}
> +	kfree(ubi->fm);
> +#endif
> +}
> +
>  /**
>   * ubi_wl_close - close the wear-leveling sub-system.
>   * @ubi: UBI device description object
> @@ -2071,9 +2088,7 @@ static void protection_queue_destroy(struct ubi_device *ubi)
>  void ubi_wl_close(struct ubi_device *ubi)
>  {
>  	dbg_wl("close the WL sub-system");
> -#ifdef CONFIG_MTD_UBI_FASTMAP
> -	flush_work(&ubi->fm_work);
> -#endif
> +	ubi_fastmap_close(ubi);
>  	shutdown_work(ubi);
>  	protection_queue_destroy(ubi);
>  	tree_destroy(&ubi->used);

-- 
Guido Martínez, VanguardiaSur
www.vanguardiasur.com.ar
