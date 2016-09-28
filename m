Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpLWG-0006X8-4B
 for linux-mtd@lists.infradead.org; Wed, 28 Sep 2016 20:31:56 +0000
Received: by mail-pa0-x242.google.com with SMTP id j3so2459951paj.2
 for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2016 13:31:36 -0700 (PDT)
Date: Wed, 28 Sep 2016 13:31:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 dwmw2@infradead.org
Subject: Re: [PATCH 4/5] mtd: Don't unconditionally execute remove notifiers
Message-ID: <20160928203133.GD142302@google.com>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
 <1467669983-12105-5-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467669983-12105-5-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 05, 2016 at 12:06:22AM +0200, Richard Weinberger wrote:
> Only call them when we're really removing the MTD.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
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

The ordering looks like it was somewhat intentional here:

75c0b84d41c6 mtd: call the remove notifiers before assuming it is in use

Have we fixed or refactored the issues that seem to have prompted that?

Brian


>  		device_unregister(&mtd->dev);
>  
>  		idr_remove(&mtd_idr, mtd->index);
> -- 
> 2.7.3
> 
