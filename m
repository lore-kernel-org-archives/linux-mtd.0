Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecArV-0000ud-8S
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 14:08:19 +0000
Date: Thu, 18 Jan 2018 15:08:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] mtd: ubi: wl: Fix error return code in ubi_wl_init()
Message-ID: <20180118150801.714ecc34@bbrezillon>
In-Reply-To: <1516284305-82544-1-git-send-email-weiyongjun1@huawei.com>
References: <1516284305-82544-1-git-send-email-weiyongjun1@huawei.com>
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

On Thu, 18 Jan 2018 14:05:05 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix to return error code -ENOMEM from the kmem_cache_alloc() error
> handling case instead of 0, as done elsewhere in this function.

I guess you've used a static analysis code to detect this problem, can
you name it in the commit message, and paste the error/warning message
it reported next time you submit this kind of patch.

> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

NAck. I you read the code you'll see that err is initialized to -ENOMEM
here [1], so these changes are actually not needed.

> ---
>  drivers/mtd/ubi/wl.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 77ab49f..2052a64 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1617,8 +1617,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  		cond_resched();
>  
>  		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> -		if (!e)
> +		if (!e) {
> +			err = -ENOMEM;
>  			goto out_free;
> +		}
>  
>  		e->pnum = aeb->pnum;
>  		e->ec = aeb->ec;
> @@ -1637,8 +1639,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
>  			cond_resched();
>  
>  			e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
> -			if (!e)
> +			if (!e) {
> +				err = -ENOMEM;
>  				goto out_free;
> +			}
>  
>  			e->pnum = aeb->pnum;
>  			e->ec = aeb->ec;
> 

[1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mtd/ubi/wl.c?h=next-20180118#n1596
