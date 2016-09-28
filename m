Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpLVL-0006Sz-Uq
 for linux-mtd@lists.infradead.org; Wed, 28 Sep 2016 20:31:00 +0000
Received: by mail-pa0-x242.google.com with SMTP id oz2so2462613pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2016 13:30:39 -0700 (PDT)
Date: Wed, 28 Sep 2016 13:30:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 dwmw2@infradead.org
Subject: Re: [PATCH 3/5] mtd: Don't unconditionally unregister reboot notifier
Message-ID: <20160928203036.GC142302@google.com>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
 <1467669983-12105-4-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467669983-12105-4-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 05, 2016 at 12:06:21AM +0200, Richard Weinberger wrote:
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

Is there any kind of race issue with unregistering the notifier *after*
we've deleted the device? I had intentionally unregistered first,
because I didn't want any chance of the driver/module and/or data
structures being freed before we call the notifier.

I can't think of any particular issue yet, but I wanted to ask.

Brian

> +
> +unregister:
> +	if (master->_reboot)
> +		unregister_reboot_notifier(&master->reboot_notifier);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_unregister);
>  
> -- 
> 2.7.3
> 
