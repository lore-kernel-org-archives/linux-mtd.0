Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmSBi-0001rV-Us
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 22:07:21 +0000
Received: by mail-pf0-x242.google.com with SMTP id r187so1084319pfr.5
 for <linux-mtd@lists.infradead.org>; Mon, 28 Aug 2017 15:06:58 -0700 (PDT)
Date: Mon, 28 Aug 2017 15:06:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mario Rugiero <mrugiero@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the l2-mtd tree
Message-ID: <20170828220654.GA141992@google.com>
References: <20170828121905.36ff8a63@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170828121905.36ff8a63@canb.auug.org.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 28, 2017 at 12:19:05PM +1000, Stephen Rothwell wrote:
> Hi Brian,

Hi Stephen,

> After merging the l2-mtd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/mtd/nand/nandsim.c: In function 'ns_init_module':
> drivers/mtd/nand/nandsim.c:2353:2: error: implicit declaration of function 'nandsim_debugfs_remove' [-Werror=implicit-function-declaration]
>   nandsim_debugfs_remove(nand);
>   ^
> 
> Caused by commit
> 
>   e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")
> 
> interacting with commit
> 
>   b974696da1cf ("mtd: nandsim: remove debugfs entries in error path")
> 
> from Linus' tree.

Yes, this was expected in the divergence between a bugfix merge	for 4.13
vs. a feature change in 4.14. I think Boris has fixed the conflict in
his merges and is uploading that to l2-mtd/master (he's handling MTD for
4.14).

Good to know you catch this too :)

> I applied the following merge fix patch ... please check.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 28 Aug 2017 12:13:42 +1000
> Subject: [PATCH] fix merge of l2-mtd tree
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/mtd/nand/nandsim.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 00635fd738f6..1ddf0b73c246 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -2350,7 +2350,6 @@ static int __init ns_init_module(void)
>          return 0;
>  
>  err_exit:
> -	nandsim_debugfs_remove(nand);
>  	free_nandsim(nand);
>  	nand_release(nsmtd);
>  	for (i = 0;i < ARRAY_SIZE(nand->partitions); ++i)

I think this is right, and it matches what Boris is pushing.

Regards,
Brian
