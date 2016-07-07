Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLAmK-0006Nh-PJ
 for linux-mtd@lists.infradead.org; Thu, 07 Jul 2016 14:59:49 +0000
Date: Thu, 7 Jul 2016 16:59:17 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH 4/5] mtd: Don't unconditionally execute remove notifiers
Message-ID: <20160707165917.596dc758@bbrezillon>
In-Reply-To: <1467669983-12105-5-git-send-email-richard@nod.at>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
 <1467669983-12105-5-git-send-email-richard@nod.at>
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

On Tue,  5 Jul 2016 00:06:22 +0200
Richard Weinberger <richard@nod.at> wrote:

> Only call them when we're really removing the MTD.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/mtdcore.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 36e5fb0..f49e103 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -499,16 +499,16 @@ int del_mtd_device(struct mtd_info *mtd)
>  		goto out_error;
>  	}
>  
> -	/* No need to get a refcount on the module containing
> -		the notifier, since we hold the mtd_table_mutex */
> -	list_for_each_entry(not, &mtd_notifiers, list)
> -		not->remove(mtd);
> -
>  	if (mtd->usecount) {
>  		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
>  		       mtd->index, mtd->name, mtd->usecount);
>  		ret = -EBUSY;
>  	} else {
> +		/* No need to get a refcount on the module containing
> +			the notifier, since we hold the mtd_table_mutex */
> +		list_for_each_entry(not, &mtd_notifiers, list)
> +			not->remove(mtd);
> +
>  		device_unregister(&mtd->dev);
>  
>  		idr_remove(&mtd_idr, mtd->index);
