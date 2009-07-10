Received: from mail.de.keymile.com ([195.8.104.1])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MPFYq-0005yG-FT
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 12:50:51 +0000
Subject: Re: gluebi problems on 2.6.28 backport
From: Holger Brunck <holger.brunck@keymile.com>
To: dedekind@infradead.org
In-Reply-To: <1247228821.20721.368.camel@localhost.localdomain>
References: <1247152762.10521.71.camel@pc005093.de.keymile.net>
	<1247228821.20721.368.camel@localhost.localdomain>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 10 Jul 2009 14:50:29 +0200
Message-Id: <1247230229.28076.1.camel@pc005093.de.keymile.net>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

> The problem is that the mtd_blkdevs module does not open MTD devices
> before working with them. Gluebi changes revealed this problem. Below
> is the patch which should fix the issue. Please, try and let me know
> if it helps.
> 
> ======================================================================
> 
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] mtd: blkdevs: do not for get to get MTD devices
> 
> Nowadays MTD devices have to be "get" before they can be
> used. This has to be done with 'put_mtd_device()'. The
> 'blktrans_open()' function did not do this and instead
> used 'try_module_get()'. Fixe this.
> 
> Since 'put_mtd_device()' already gets the module, extra
> 'try_module_get()' is not needed.
> 
> This fixes oops when one tries to use mtdbloc on tope of
> gluebi.
> 
> Reported-by: Holger Brunck <holger.brunck@keymile.com>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
>  drivers/mtd/mtd_blkdevs.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 1409f01..2f55242 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -139,7 +139,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
>  	struct mtd_blktrans_ops *tr = dev->tr;
>  	int ret = -ENODEV;
>  
> -	if (!try_module_get(dev->mtd->owner))
> +	if (!get_mtd_device(NULL, dev->mtd->index))
>  		goto out;
>  
>  	if (!try_module_get(tr->owner))
> @@ -153,7 +153,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
>  	ret = 0;
>  	if (tr->open && (ret = tr->open(dev))) {
>  		dev->mtd->usecount--;
> -		module_put(dev->mtd->owner);
> +		put_mtd_device(dev->mtd);
>  	out_tr:
>  		module_put(tr->owner);
>  	}
> @@ -172,7 +172,7 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
>  
>  	if (!ret) {
>  		dev->mtd->usecount--;
> -		module_put(dev->mtd->owner);
> +		put_mtd_device(dev->mtd);
>  		module_put(tr->owner);
>  	}
>  
> -- 
> 1.6.0.6
> 
yes this patch solves my problem. 

Thanks a lot.

Regards 
Holger Brunck
