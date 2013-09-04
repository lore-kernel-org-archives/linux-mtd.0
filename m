Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VH8L6-0005qU-Uo
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 08:21:26 +0000
Message-ID: <5226ED69.8080506@nod.at>
Date: Wed, 04 Sep 2013 10:20:57 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: fix refill_wl_user_pool()
References: <1377511730-14834-1-git-send-email-richard@nod.at>
In-Reply-To: <1377511730-14834-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: richard.genoud@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.08.2013 12:08, schrieb Richard Weinberger:
> If no free PEBs are available refill_wl_user_pool() must not
> return with -ENOSPC immediately.
> It has to block till produce_free_peb() produced a free PEB.
> 
> Reported-and-Tested-by: Richard Genoud <richard.genoud@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/wl.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index c95bfb1..02317c1 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -599,10 +599,6 @@ static void refill_wl_user_pool(struct ubi_device *ubi)
>  	return_unused_pool_pebs(ubi, pool);
>  
>  	for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
> -		if (!ubi->free.rb_node ||
> -		   (ubi->free_count - ubi->beb_rsvd_pebs < 1))
> -			break;
> -
>  		pool->pebs[pool->size] = __wl_get_peb(ubi);
>  		if (pool->pebs[pool->size] < 0)
>  			break;
> 

Artem, please don't forget do apply this patch.

Thanks,
//richard
