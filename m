Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKLqr-0003rD-8J
 for linux-mtd@lists.infradead.org; Sun, 08 Feb 2015 07:00:19 +0000
Received: by mail-pa0-f48.google.com with SMTP id eu11so4697399pac.7
 for <linux-mtd@lists.infradead.org>; Sat, 07 Feb 2015 22:59:55 -0800 (PST)
Date: Sat, 7 Feb 2015 22:59:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Niklas Cassel <nks@flawful.org>
Subject: Re: [PATCH] mtd: avoid registering reboot notifier twice
Message-ID: <20150208065952.GC3670@norris-Latitude-E6410>
References: <1422752930-696-1-git-send-email-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1422752930-696-1-git-send-email-nks@flawful.org>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 01, 2015 at 02:08:50AM +0100, Niklas Cassel wrote:
> Calling mtd_device_parse_register with the same mtd_info
> (e.g. registering several partitions on a single device)
> would add the same reboot notifier twice, causing an
> infinte loop in notifier_chain_register during boot up.
> 
> Signed-off-by: Niklas Cassel <nks@flawful.org>

Begrudgingly applied to l2-mtd.git. It's better to fix this bug than for
me just to complain about badly written board files and drivers...

> ---
>  drivers/mtd/mtdcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index de79576..98efc1e 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -556,7 +556,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  			err = -ENODEV;
>  	}
>  

Also added a FIXME comment here to note that some drivers are doing odd
things to require this workaround.

> -	if (mtd->_reboot) {
> +	if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
>  		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
>  		register_reboot_notifier(&mtd->reboot_notifier);
>  	}

Brian
