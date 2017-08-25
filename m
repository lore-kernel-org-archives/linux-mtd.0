Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dl68a-0006lc-EW
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 04:22:30 +0000
Received: by mail-pg0-x242.google.com with SMTP id t3so2133731pgt.5
 for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2017 21:22:07 -0700 (PDT)
Date: Thu, 24 Aug 2017 21:22:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH] mtd: nandsim: remove debugfs entries in error path
Message-ID: <20170825042203.GB68252@google.com>
References: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Aug 23, 2017 at 09:03:04AM +0200, Uwe Kleine-König wrote:
> The debugfs entries must be removed before an error is returned in the
> probe function. Otherwise another try to load the module fails and when
> the debugfs files are accessed without the module loaded, the kernel
> still tries to call a function in that module.
> 
> Fixes: 5346c27c5fed ("mtd: nandsim: Introduce debugfs infrastructure")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/nand/nandsim.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 03a0d057bf2f..e4211c3cc49b 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -2373,6 +2373,7 @@ static int __init ns_init_module(void)
>          return 0;
>  
>  err_exit:
> +	nandsim_debugfs_remove(nand);

The 'err_exit' label is used by error paths that occur before the
debugfs entries are registered. But I guess that's OK, since
debugfs_remove_recursive() handles NULL arguments fine?

We also have the same mismatch with init_nandsim()/free_nandsim(), which
is also similarly safe because of the nature of kfree(), vfree(), and
the fact that most of those are guarded with NULL checks anyway... So
it's just confusing and potentially dangerous for future developers --
but not wrong.

Given this code will promptly go away with the for-4.14 material, I
suppose this isn't that bad.

I'll look to queue this up and send to Linus within a day.

Thanks,
Brian

>  	free_nandsim(nand);
>  	nand_release(nsmtd);
>  	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)
> -- 
> 2.11.0
> 
