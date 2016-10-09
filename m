Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bt6XB-00028T-Mf
 for linux-mtd@lists.infradead.org; Sun, 09 Oct 2016 05:20:26 +0000
Received: by mail-pa0-x241.google.com with SMTP id hh10so4916229pac.0
 for <linux-mtd@lists.infradead.org>; Sat, 08 Oct 2016 22:20:05 -0700 (PDT)
Date: Sat, 8 Oct 2016 22:20:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 03/46] mtd: Don't unconditionally unregister reboot
 notifier
Message-ID: <20161009052002.GD10199@brian-ubuntu>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <f83b7dd1edbee967b352aa3c2dab676bafd63a56.1474450295.git.dwalter@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f83b7dd1edbee967b352aa3c2dab676bafd63a56.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I realize I didn't comment on the latest copy of this patch, so copying
my questions here:

On Wed, Sep 21, 2016 at 11:45:12AM +0200, Daniel Walter wrote:
> From: Richard Weinberger <richard@nod.at>
> 
> del_mtd_device() is allowed to fail.
> i.e. when the MTD is busy.
> Unregister the reboot notifier only when we're really
> about to delete the MTD.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/mtdcore.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index e3936b8..36e5fb0 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -654,17 +654,22 @@ int mtd_device_unregister(struct mtd_info *master)
>  {
>  	int err;
>  
> -	if (master->_reboot)
> -		unregister_reboot_notifier(&master->reboot_notifier);
> -
>  	err = del_mtd_partitions(master);
>  	if (err)
>  		return err;
>  
>  	if (!device_is_registered(&master->dev))
> -		return 0;
> +		goto unregister;
>  
> -	return del_mtd_device(master);
> +	err = del_mtd_device(master);
> +	if (err)
> +		return err;
> +
> +unregister:
> +	if (master->_reboot)
> +		unregister_reboot_notifier(&master->reboot_notifier);

Is there any kind of race issue with unregistering the notifier *after*
we've deleted the device? I had intentionally unregistered first,
because I didn't want any chance of the driver/module and/or data
structures being freed before we call the notifier.

I can't think of any particular issue yet, but I wanted to ask.

Brian

> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_unregister);
>  
> -- 
> 2.8.3
> 
