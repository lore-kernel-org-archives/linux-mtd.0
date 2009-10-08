Received: from mail-px0-f202.google.com ([209.85.216.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mvuj1-00050c-2M
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 15:16:19 +0000
Received: by pxi40 with SMTP id 40so6368722pxi.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Oct 2009 08:16:12 -0700 (PDT)
To: Hemant Pedanekar <hemantp@ti.com>
Subject: Re: [PATCH] mtd: nand: davinci: fix to use mask_ale from pdata
References: <1254407106-19390-1-git-send-email-hemantp@ti.com>
From: Kevin Hilman <khilman@deeprootsystems.com>
Date: Thu, 08 Oct 2009 08:16:10 -0700
In-Reply-To: <1254407106-19390-1-git-send-email-hemantp@ti.com> (Hemant
	Pedanekar's message of "Thu\, 1 Oct 2009 19\:55\:06 +0530")
Message-ID: <87tyy9dih1.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Artem.Bityutskiy@nokia.com, davinci-linux-open-source@linux.davincidsp.com,
	dbrownell@users.sourceforge.net, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hemant Pedanekar <hemantp@ti.com> writes:

> Correct typo to use mask_ale from platform data when set to non-zero.
>
> Signed-off-by: Hemant Pedanekar <hemantp@ti.com>

Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>

Could this fix be queued for the .32-rc series please?

Thanks,

Kevin

> ---
>  drivers/mtd/nand/davinci_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 0fad648..20b04a2 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -571,7 +571,7 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>  	info->mask_chipsel	= pdata->mask_chipsel;
>  
>  	/* use nandboot-capable ALE/CLE masks by default */
> -	info->mask_ale		= pdata->mask_cle ? : MASK_ALE;
> +	info->mask_ale		= pdata->mask_ale ? : MASK_ALE;
>  	info->mask_cle		= pdata->mask_cle ? : MASK_CLE;
>  
>  	/* Set address of hardware control function */
> -- 
> 1.6.2.4
>
> _______________________________________________
> Davinci-linux-open-source mailing list
> Davinci-linux-open-source@linux.davincidsp.com
> http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source
