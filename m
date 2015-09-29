Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgjpv-0002Ba-Lj
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 01:36:08 +0000
Received: by pablk4 with SMTP id lk4so92842781pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 18:35:47 -0700 (PDT)
Date: Mon, 28 Sep 2015 18:35:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] UBI: Fastmap: Simplify expression
Message-ID: <20150929013544.GX31505@google.com>
References: <1435912576-27878-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435912576-27878-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 03, 2015 at 10:36:14AM +0200, Richard Weinberger wrote:
> There is no need to compute pnum again.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Acked-by: Brian Norris <computersforpeace@gmail.com>

> ---
>  drivers/mtd/ubi/fastmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 24f2cf6..22db594 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -775,7 +775,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
>  			int pnum = be32_to_cpu(fm_eba->pnum[j]);
>  
> -			if ((int)be32_to_cpu(fm_eba->pnum[j]) < 0)
> +			if (pnum < 0)
>  				continue;
>  
>  			aeb = NULL;
> -- 
> 1.8.4.5
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
